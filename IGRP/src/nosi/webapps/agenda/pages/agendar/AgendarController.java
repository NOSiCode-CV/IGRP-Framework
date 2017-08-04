/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.agendar;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- Import your packages here... ----*//*---- End ----*/

public class AgendarController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		Agendar model = new Agendar();
		AgendarView view = new AgendarView(model);
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionAgendar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
