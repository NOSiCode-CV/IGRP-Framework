package nosi.webapps.igrp_studio.pages.file_editor;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.io.UnsupportedEncodingException;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export_v2.common.Path;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import org.apache.commons.text.StringEscapeUtils;
import com.google.gson.Gson;
import java.io.File;
import nosi.core.webapp.compiler.helpers.Compiler;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
/*----#end-code----*/
		
public class File_editorController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		File_editor model = new File_editor();
		model.load();
		model.setJson_data("undefined","undefined","undefined");
		model.setSave_url("undefined","undefined","undefined");
		model.setCreate_url("igrp_studio","File_editor","index");
		File_editorView view = new File_editorView();
		/*----#start-code(index)----*/
		model.setJson_data("igrp_studio", "File_editor", "get-json-all-folder").addParam("task_id", Core.getParam("p_task_id")).addParam("env_fk", Core.getParam("p_env_fk"));
		model.setSave_url("igrp_studio", "File_editor", "save-and-compile-file");
		String type = Core.getParam("type");
		String path = Core.getParam("path");
		String name = Core.getParam("name");
		path = URLDecoder.decode(path, "UTF-8");
		
		if(Core.isNotNullMultiple(type,path,name)) {
			return this.saveFolderFile(type,path,name);
		}
		view.save_url.setLabel("Save");
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	

/*----#start-code(custom_actions)----*/
	private Response saveFolderFile(String type, String path, String name) throws IOException {
		Map<String, Object> dirs = new HashMap<>();
		if(type.compareTo("folder")==0) {
			System.out.println("Dir: "+path+File.separator+name);
			FileHelper.createDiretory(path+File.separator+name);
			dirs.put("dir_name", name);
			dirs.put("dir", new Object[0]);
			dirs.put("dir_files", new Object[0]);
			dirs.put("dir_path", path+File.separator+name);
		}
		if(type.compareTo("file")==0) {
			System.out.println("File: "+path+File.separator+ name);
			FileHelper.save(path, name, "");
			dirs.put("name", name);
			dirs.put("path", this.config.getResolveUrl("igrp_studio", "File_editor", "get-file&fileName="+ URLEncoder.encode(path+File.separator+name,"UTF-8")));
			dirs.put("fileName", path+File.separator+name);
		}

		this.format = Response.FORMAT_JSON;
		String json = new Gson().toJson(dirs);
		System.out.println("Json: "+json);
		return this.renderView(json);
	}

	
	public Response actionGetJsonAllFolder() {
		Integer envId = Core.getParamInt("env_fk");
		Application app = new Application().findOne(envId);
		Map<String, Object> dirs = null;
		if(app!=null) {
			String path = Path.getPath(app);
			try {
				dirs = this.listDirectory(new File(path));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String task_id = Core.getParam("task_id");
			if(Core.isNotNull(task_id)) {
				this.addDefaultFile(task_id,dirs,envId);
			}
		}		
		this.format = Response.FORMAT_JSON;
		String json = new Gson().toJson(dirs);
		return this.renderView(json);
	}
	
	private void addDefaultFile(String task_id, Map<String, Object> dirs, Integer envId) {
		Action ac = new Action().find().andWhere("application", "=",envId).andWhere("page", "=",this.config.PREFIX_TASK_NAME+task_id).one();
		FileEditor file = new FileEditor();
		file.setName(ac.getPage()+".java");
		try {
			file.setFileName(URLEncoder.encode(Path.getPath(ac.getApplication())+"process"+File.separator+ac.getProcessKey()+ac.getPage()+".java", "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		file.setPath(this.config.getResolveUrl("igrp_studio", "File_editor", "get-file&fileName="+ file.getFileName()));
		file.setId(null);
		ArrayList<FileEditor> files = new ArrayList<>();
		files.add(file);
		dirs.put("default_file",files);
	}

	public Map<String, Object> listDirectory(File dir) throws UnsupportedEncodingException {
		File[] content = dir.listFiles();
		List<FileEditor> files = new LinkedList<>();
		List<Map<String, Object>> folders = new LinkedList<>();

		for (File f : content) {
			if (f.isDirectory()) {
				Map<String, Object> subList = listDirectory(f);
				folders.add(subList);
			} else {
				if(f.getName().endsWith(".java")) {
					FileEditor file = new FileEditor();
					file.setName(URLEncoder.encode(f.getName(),"UTF-8"));
					file.setFileName(URLEncoder.encode(f.getAbsolutePath(), "UTF-8"));
					file.setPath(this.config.getResolveUrl("igrp_studio", "File_editor", "get-file&fileName="+ file.getFileName()));
					file.setId(null);
					file.setDir_path(URLEncoder.encode(f.getParent(),"UTF-8"));
					files.add(file);
				}
			}
		}
		Map<String, Object> result = new HashMap<>();
		result.put("dir_name", dir.getName());
		result.put("dir_path", URLEncoder.encode(dir.getPath(),"UTF-8"));
		result.put("dir", folders);
		result.put("dir_files", files);
		return result;
	}

	
	public Response actionSaveAndCompileFile() {
		try {
			Part javaCode = Core.getFile("p_package");
			String fileName = Core.getParam("fileName");
			if(Core.isNotNull(fileName) && javaCode!=null) {
				fileName = URLDecoder.decode(fileName, "UTF-8");	
				String content = FileHelper.convertToString(javaCode);
				File[] files = new File[]{new File(fileName)};
				FileHelper.save(fileName, null, content);
				String erros = new Compiler().compile(files);		
				if(Core.isNotNull(erros)) {
					return this.renderView("<messages><message type=\"error\">"+StringEscapeUtils.escapeXml10(erros)+"</message></messages>");
				}
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}	
		return this.renderView("<messages><message type=\"success\">{\"msg\":\""+StringEscapeUtils.escapeXml10(StringEscapeUtils.escapeHtml4("Compilação efetuada com sucesso"))+"\"}</message></messages>");
		
	}
	
	
	public Response actionGetFile() throws UnsupportedEncodingException {
		String content = "";
		String fileName = Core.getParam("fileName");
		fileName = URLDecoder.decode(fileName,"UTF-8");
		content = FileHelper.readFile(fileName,"");
		this.format = Response.FORMAT_TEXT;
		return this.renderView(content);
	}
	/*----#end-code----*/
}
