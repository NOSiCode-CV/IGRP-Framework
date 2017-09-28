/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.oauthclient;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;

import org.apache.commons.lang.RandomStringUtils;

import nosi.core.webapp.Response;

/*---- End ----*/

public class OAuthClientController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		OAuthClient model = new OAuthClient();
		String id = Igrp.getInstance().getRequest().getParameter("id");
		if(id != null && !id.equals("")) {
			nosi.webapps.igrp.dao.OAuthClient cliente = new nosi.webapps.igrp.dao.OAuthClient();
			cliente = cliente.findOne(id);
			if(cliente != null) {
				model.setUris_de_redirecionamento(cliente.getRedirect_uri());
				model.setScope(cliente.getScope());
			}
		}
		OAuthClientView view = new OAuthClientView(model);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionSalvar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		OAuthClient model = new OAuthClient();
		nosi.webapps.igrp.dao.OAuthClient cliente = new nosi.webapps.igrp.dao.OAuthClient();
		model.load();
		//String id = Igrp.getInstance().getRequest().getParameter("id");
		cliente.setRedirect_uri(model.getUris_de_redirecionamento());
		cliente.setScope(model.getScope());
		
		//if(id != null && !id.equals("")) {
			//cliente.setClient_id(id);
			//cliente = cliente.update();
		//}else {
			cliente.setClient_id(java.util.UUID.randomUUID().toString().replaceAll("-", ""));
			cliente.setClient_secret(RandomStringUtils.randomAlphabetic(40));
			cliente = cliente.insert();
		//}
		
		if(cliente != null) {
			Igrp.getInstance().getFlashMessage().addMessage("success", "Operacao efetuada com sucesso");
		}else{
			Igrp.getInstance().getFlashMessage().addMessage("error", "Operacao falhada");
		}
		return this.redirect("igrp","OAuthClient","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
