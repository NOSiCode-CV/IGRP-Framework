/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.lst_serv;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- Import your packages here... ----*//*---- End ----*/

public class LST_SERVController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		LST_SERV model = new LST_SERV();
		LST_SERVView view = new LST_SERVView(model);
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionNovo() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	

	public Response actionEditar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	

	public Response actionRemover() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
