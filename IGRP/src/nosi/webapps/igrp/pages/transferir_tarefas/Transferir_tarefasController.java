/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.transferir_tarefas;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- End ----*/

public class Transferir_tarefasController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		Transferir_tarefas model = new Transferir_tarefas();
		Transferir_tarefasView view = new Transferir_tarefasView(model);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionGravar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","Transferir_tarefas","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
