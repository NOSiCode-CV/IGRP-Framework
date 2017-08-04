/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.agenda;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- Import your packages here... ----*//*---- End ----*/

public class AgendaController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		Agenda model = new Agenda();
		AgendaView view = new AgendaView(model);
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionGravar() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("agenda","AddServicos","index");
			/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
