/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.req_servicos;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- Import your packages here... ----*//*---- End ----*/

public class REQ_SERVICOSController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		REQ_SERVICOS model = new REQ_SERVICOS();
		REQ_SERVICOSView view = new REQ_SERVICOSView(model);
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
