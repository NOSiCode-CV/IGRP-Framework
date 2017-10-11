/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.import_export;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.HashMap;

import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;

/*---- End ----*/

public class Import_exportController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		Import_export model = new Import_export();
		Import_exportView view = new Import_exportView(model);
		
		HashMap<String, String> tipo = new HashMap<>();
		tipo.put(null, "-- Escolha o tipo --");
		tipo.put("export", "Export");
		tipo.put("import", "Import");
		view.tipo.setValue(tipo);
		
		view.aplicacao.setValue(new Application().getListApps());
		
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionExport() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","Import_export","index");
			/*---- End ----*/
	}
	

	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","Import_export","index");
			/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
