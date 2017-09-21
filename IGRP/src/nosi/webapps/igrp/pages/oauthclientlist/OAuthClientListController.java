/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.oauthclientlist;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- End ----*/

public class OAuthClientListController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		OAuthClientList model = new OAuthClientList();
		OAuthClientListView view = new OAuthClientListView(model);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","OAuthClientList","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
