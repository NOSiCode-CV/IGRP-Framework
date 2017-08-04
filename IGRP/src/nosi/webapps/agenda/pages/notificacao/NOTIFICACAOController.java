/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.notificacao;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- Import your packages here... ----*//*---- End ----*/

public class NOTIFICACAOController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		NOTIFICACAO model = new NOTIFICACAO();
		NOTIFICACAOView view = new NOTIFICACAOView(model);
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionNotificar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
