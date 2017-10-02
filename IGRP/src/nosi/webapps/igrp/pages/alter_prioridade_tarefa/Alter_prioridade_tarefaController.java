/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.alter_prioridade_tarefa;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- End ----*/

public class Alter_prioridade_tarefaController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		Alter_prioridade_tarefa model = new Alter_prioridade_tarefa();
		Alter_prioridade_tarefaView view = new Alter_prioridade_tarefaView(model);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionSalvar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","Alter_prioridade_tarefa","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
