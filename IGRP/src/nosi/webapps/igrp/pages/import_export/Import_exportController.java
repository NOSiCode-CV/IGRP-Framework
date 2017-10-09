/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.import_export;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- End ----*/

public class Import_exportController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		Import_export model = new Import_export();
		Import_exportView view = new Import_exportView(model);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionExport() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","Import_export","index");
		/*---- End ----*/
	}
	

	public Response actionImport() throws IOException{
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
