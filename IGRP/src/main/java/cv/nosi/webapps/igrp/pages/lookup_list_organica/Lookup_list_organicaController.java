
package cv.nosi.webapps.igrp.pages.lookup_list_organica;

import java.io.IOException;

import cv.nosi.core.config.ConfigDBIGRP;
import cv.nosi.core.webapp.Response;
import cv.nosi.core.webapp.mvc.Controller;
import cv.nosi.core.webapp.util.Core;

/*----#end-code----*/


public class Lookup_list_organicaController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Lookup_list_organica model = new Lookup_list_organica();
		model.load();
		Lookup_list_organicaView view = new Lookup_list_organicaView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadTable_1(Core.query(null,"SELECT 'code' as code,'aplicacao' as aplicacao,'organica' as organica,'id_org' as id_org "));
		
		
		----#gen-example */
		/*----#start-code(index)----*/
		model.loadTable_1(Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG, " SELECT org.id as id_org, app.name aplicacao, code as code, org.name as organica FROM tbl_organization org join tbl_env app on app.id = org.env_fk "));
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}