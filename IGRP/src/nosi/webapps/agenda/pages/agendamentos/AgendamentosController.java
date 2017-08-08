/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.agendamentos;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- Import your packages here... ----*//*---- End ----*/

public class AgendamentosController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		Agendamentos model = new Agendamentos();
		AgendamentosView view = new AgendamentosView(model);
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionAgendar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	

	public Response actionConfirmar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("","","");
		/*---- End ----*/
	}
	

	public Response actionCancelar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("","","");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
