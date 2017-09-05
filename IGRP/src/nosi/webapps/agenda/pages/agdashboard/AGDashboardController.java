/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.agdashboard;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- End ----*/

public class AGDashboardController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		AGDashboard model = new AGDashboard();
		AGDashboardView view = new AGDashboardView(model);
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
