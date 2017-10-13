/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.importarquivo;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- End ----*/

public class ImportArquivoController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		ImportArquivo model = new ImportArquivo();
		ImportArquivoView view = new ImportArquivoView(model);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionImport() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","ImportArquivo","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
