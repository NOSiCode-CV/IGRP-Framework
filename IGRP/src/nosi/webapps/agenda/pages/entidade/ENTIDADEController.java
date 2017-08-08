/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.entidade;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- Import your packages here... ----*//*---- End ----*/

public class ENTIDADEController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/				
		ENTIDADE model = new ENTIDADE();
		ENTIDADEView view = new ENTIDADEView(model);
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
