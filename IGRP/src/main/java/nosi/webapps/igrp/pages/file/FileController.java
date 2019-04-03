
package nosi.webapps.igrp.pages.file;

import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.CLob;
import javax.servlet.http.Part;
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
	public Response actionGetFile() {
		CLob file = Core.getFile(Core.getParamInt("p_id"));
		return this.xSend(file.getC_lob_content(), file.getName(), file.getMime_type(), false);
	}
	
	public Response actionSaveImage()  throws IOException, ServletException {		
		int id = -1;
		Part part = Core.getFile("p_file_name");
		Properties p = new Properties();
		if(part!=null) {
			id = Core.saveFile(part , part.getName());	
			if(id==0) {
				id = -1;
				p.put("msg", Core.gt("Error saving file"));
			}
		}
		p.put("id", id);
		return this.renderView(Core.toJson(p));
	}
	/*----#end-code----*/
	}
