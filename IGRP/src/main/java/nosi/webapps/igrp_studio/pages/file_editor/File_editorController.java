
package nosi.webapps.igrp_studio.pages.file_editor;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp_studio.pages.file_editor.FileEditor.ChildFileEditor;
import nosi.core.webapp.helpers.FileHelper;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import com.google.gson.Gson;
import java.io.File;
import nosi.core.config.Config;
import nosi.core.webapp.compiler.helpers.Compiler;
/*----#end-code----*/


public class File_editorController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		File_editor model = new File_editor();
		model.load();
		File_editorView view = new File_editorView();
		/*----#start-code(index)----*/
		model.setJson_data("igrp_studio", "File_editor", "get-json").addParam("task_id", Core.getParam("p_task_id")).addParam("env_fk", Core.getParam("p_env_fk"));
		model.setSave_url("igrp_studio", "File_editor", "save-and-compile-file");
		view.save_url.setLabel("Save");
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	/*----#start-code(custom_actions)----*/
	public Response actionGetJson() {
		String taskName = Core.getParam("task_id");
		Integer envId = Core.getParamInt("env_fk");
		Action ac = new Action().find().andWhere("application", "=",envId).andWhere("page", "=",Config.PREFIX_TASK_NAME+taskName).one();
		DirFileEditor files = new DirFileEditor();		
		files.setDir(this.getDirFiles(ac));
		files.setDefault_file(this.getDefualtFiles(ac));
		this.format = Response.FORMAT_JSON;
		String json = new Gson().toJson(files);
		return this.renderView(json);
	}
	
	private List<FileEditor> getDirFiles(Action ac) {
		List<FileEditor> dir = new ArrayList<>();
		FileEditor dirFiles = new FileEditor();
		dirFiles.setName(ac.getProcessKey().toUpperCase());		
		dirFiles.setChilds(this.getChildFiles(ac));
		dir.add(dirFiles);
		return dir;
	}

	private List<ChildFileEditor> getChildFiles(Action ac) {
		List<ChildFileEditor> childs = new ArrayList<>();
		new Action().find().andWhere("application", "=",ac.getApplication().getId())
						   .andWhere("processKey", "=",ac.getProcessKey())
						   .all()
						   .forEach(a->{
								ChildFileEditor file = new ChildFileEditor();
								file.setId(a.getId());
								file.setName(a.getPage()+"Controller.java");
								file.setPath(this.config.getResolveUrl("igrp_studio", "File_editor", "get-file&fileName="+a.getPage()+"&proccessKey="+a.getProcessKey()+"&dadApp="+a.getApplication().getDad()));
								childs.add(file);
						   });
		return childs;
	}

	private List<ChildFileEditor> getDefualtFiles(Action ac) {
		List<FileEditor.ChildFileEditor> default_file = new ArrayList<>();
		FileEditor.ChildFileEditor defualt = new FileEditor.ChildFileEditor();
		defualt.setId(ac.getId());
		defualt.setName(ac.getPage()+".java");
		default_file.add(defualt);
		return default_file;
	}

	public Response actionSaveAndCompileFile() {
		try {
			Part javaCode = Core.getFile("p_package");
			Integer pageId = Core.getParamInt("p_package_id");
			Action ac = new Action().findOne(pageId);
			String path = this.getBasePath(ac.getApplication().getDad(),ac.getProcessKey());
			String pathW = this.getBasePathWorkspace(ac.getApplication().getDad(),ac.getProcessKey());
			String content = FileHelper.convertToString(javaCode);
			File[] files = new File[]{FileHelper.saveFilesJavaControllerAndReplace(path, ac.getPage(), content)};
			FileHelper.saveFilesJavaControllerAndReplace(pathW, ac.getPage(), content);
			String erros = new Compiler().compile(files);		
			if(Core.isNotNull(erros)) {
				return this.renderView("<messages><message type=\"error\">Ocorreu um erro ao tentar salvar o processo "+erros+ "</message></messages>");
			}
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return this.renderView("<messages><message type=\"success\"> Operação efetuada com sucesso</message></messages>");
		
	}
	
	public Response actionGetFile() {
		String fileName = Core.getParam("fileName");
		String proccessKey = Core.getParam("proccessKey");
		String dadApp = Core.getParam("dadApp");
		String path = this.getBasePath(dadApp,proccessKey);
		String content = FileHelper.readFile(path, fileName+"Controller.java");
		this.format = Response.FORMAT_TEXT;
		return this.renderView(content);
	}
	/*----#end-code----*/

	private String getBasePath(String dadApp,String proccessKey) {
		return this.getConfig().getPathServerClass(dadApp)+"process"+File.separator+proccessKey.toLowerCase();
	}
	
	private String getBasePathWorkspace(String dadApp,String proccessKey) {
		return this.getConfig().getBasePahtClassWorkspace(dadApp)+File.separator+"process"+File.separator+proccessKey.toLowerCase();
	}
}
