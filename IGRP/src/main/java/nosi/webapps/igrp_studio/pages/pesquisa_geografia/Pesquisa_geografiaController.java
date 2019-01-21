package nosi.webapps.igrp_studio.pages.pesquisa_geografia;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/


/*----#end-code----*/
		
public class Pesquisa_geografiaController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_geografia model = new Pesquisa_geografia();
		model.load();
		Pesquisa_geografiaView view = new Pesquisa_geografiaView();
		/*----#start-code(index)----*/
		
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
