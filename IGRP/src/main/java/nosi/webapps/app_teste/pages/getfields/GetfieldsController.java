package nosi.webapps.app_teste.pages.getfields;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

import java.lang.reflect.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.File;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.app_teste.dao.Exame;
import nosi.webapps.app_teste.dao.User;
import nosi.webapps.app_teste.helpers.GetFieldsDAO;

/*----#end-code----*/
		
public class GetfieldsController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Getfields model = new Getfields();
		model.load();
		GetfieldsView view = new GetfieldsView();
		/*----#start-code(index)----*/
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
/*----#start-code(custom_actions)----*/
	

	public Response actionRetornarxml() throws IOException, IllegalArgumentException, IllegalAccessException{
	
		String app = Core.getParam("app_name");
		String xml = new GetFieldsDAO().GerarXML(this.config, app); 
		this.format = Response.FORMAT_XML;
		return this.renderView(xml);
	}
	
/*----#end-code----*/
}
