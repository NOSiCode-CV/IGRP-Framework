
package nosi.webapps.igrp.pages.file;

import nosi.core.webapp.Controller;
import java.io.IOException;

import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.CLob;
import java.util.Properties;
/*----#end-code----*/


public class FileController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		File model = new File();
		model.load();
		FileView view = new FileView();
		/*----#start-code(index)----*/
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	/*----#start-code(custom_actions)----*/
	public Response actionGetFile() throws Exception {
		CLob file = Core.getFile(Core.getParamInt("p_id"));
		if(file!=null)
			return this.xSend(file.getC_lob_content(), file.getName(), file.getMime_type(), false);
		throw new Exception("File not find");
	}
	
	public Response actionSaveImage()  throws Exception {		
		int id = -1;
		Properties p = new Properties();
		id = Core.saveFile("p_file_name");
		if(id==0) {
			id = -1;
			p.put("msg", Core.gt("Error saving file"));
		}
		p.put("id", id);
		this.format = Response.FORMAT_JSON;
		return this.renderView(Core.toJson(p));
	}
	/*----#end-code----*/
	}
