/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.agenda_presenca;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- Import your packages here... ----*//*---- End ----*/

public class AGENDA_PRESENCAController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		AGENDA_PRESENCA model = new AGENDA_PRESENCA();
		AGENDA_PRESENCAView view = new AGENDA_PRESENCAView(model);
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionConfirmar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	

	public Response actionNotificar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
