/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.config_balcao;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- Import your packages here... ----*//*---- End ----*/

public class CONFIG_BALCAOController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/				
		CONFIG_BALCAO model = new CONFIG_BALCAO();
		CONFIG_BALCAOView view = new CONFIG_BALCAOView(model);
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
