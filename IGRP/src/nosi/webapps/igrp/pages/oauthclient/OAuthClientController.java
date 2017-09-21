/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.oauthclient;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- End ----*/

public class OAuthClientController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		OAuthClient model = new OAuthClient();
		OAuthClientView view = new OAuthClientView(model);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionSalvar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","OAuthClient","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
