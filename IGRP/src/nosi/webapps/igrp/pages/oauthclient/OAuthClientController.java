/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.oauthclient;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;

import org.apache.commons.lang.RandomStringUtils;

import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.OAuthScope;

/*---- End ----*/

public class OAuthClientController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/				
		OAuthClient model = new OAuthClient();
		
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id != null && !id.equals("")) {
			nosi.webapps.igrp.dao.OAuthClient cliente = new nosi.webapps.igrp.dao.OAuthClient();
			cliente = cliente.findOne(id);
			if(cliente != null) {
				model.setUris_de_redirecionamento(cliente.getRedirect_uri());
				model.setScope(cliente.getScope());
			}
		}
		OAuthClientView view = new OAuthClientView(model);
		view.scope.setValue(new OAuthScope().getListScope());
		if(id != null && !id.equals("")) 
			view.btn_salvar.setLink("salvar&p_id="+id);
		return this.renderView(view);
				/*---- End ----*/
	}


	public Response actionListar_oauth_client() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","OAuthClient","index");
		/*---- End ----*/
	}
	

	public Response actionSalvar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/				
		OAuthClient model = new OAuthClient();
		nosi.webapps.igrp.dao.OAuthClient cliente = new nosi.webapps.igrp.dao.OAuthClient();
		model.load();
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
				
		if(id != null && !id.equals("")) {
			cliente.setId(Integer.parseInt(id));
			cliente = cliente.findOne(id);
			cliente.setClient_id(cliente.getClient_id());
			cliente.setRedirect_uri(model.getUris_de_redirecionamento());
			cliente.setScope(model.getScope());
			cliente.setClient_secret(cliente.getClient_secret());
			cliente = cliente.update();
		}else {
			cliente.setClient_id(java.util.UUID.randomUUID().toString().replaceAll("-", ""));
			cliente.setClient_secret(RandomStringUtils.randomAlphabetic(40));
			cliente.setRedirect_uri(model.getUris_de_redirecionamento());
			cliente.setScope(model.getScope());
			cliente = cliente.insert();
		}
		
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
