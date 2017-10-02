/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.detalhes_tarefas;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- End ----*/

public class Detalhes_tarefasController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		Detalhes_tarefas model = new Detalhes_tarefas();
		Detalhes_tarefasView view = new Detalhes_tarefasView(model);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionFechar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","Detalhes_tarefas","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
