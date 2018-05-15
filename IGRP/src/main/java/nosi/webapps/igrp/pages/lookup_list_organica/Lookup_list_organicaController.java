
package nosi.webapps.igrp.pages.lookup_list_organica;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

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
		model.loadTable_1(Core.query(null, " SELECT org.id as id_org, app.name aplicacao, code as code, org.name as organica FROM tbl_organization org join tbl_env app on app.id = org.env_fk "));
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
