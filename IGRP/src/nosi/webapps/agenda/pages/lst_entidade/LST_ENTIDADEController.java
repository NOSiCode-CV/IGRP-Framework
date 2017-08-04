/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.lst_entidade;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- Import your packages here... ----*//*---- End ----*/

public class LST_ENTIDADEController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		LST_ENTIDADE model = new LST_ENTIDADE();
		LST_ENTIDADEView view = new LST_ENTIDADEView(model);
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionNova_entidade() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	

	public Response actionServicos() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("","","");
		/*---- End ----*/
	}
	

	public Response actionBalcoes() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("","","");
		/*---- End ----*/
	}
	

	public Response actionAgenda() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("","","");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
