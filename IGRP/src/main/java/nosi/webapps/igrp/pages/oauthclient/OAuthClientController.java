/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.oauthclient;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import org.apache.commons.lang3.RandomStringUtils;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.OAuthScope;
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class OAuthClientController extends Controller {		


	public Response actionIndex() throws IOException{
		/*----#START-PRESERVED-AREA(INDEX)----*/				
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
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionListar_oauth_client() throws IOException{
		/*----#START-PRESERVED-AREA(LISTAR_OAUTH_CLIENT)----*/
		return this.redirect("igrp","OAuthClient","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionSalvar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(SALVAR)----*/				
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
			Igrp.getInstance().getFlashMessage().addMessage("success", gt("Operacao efetuada com sucesso"));
		}else{
			Igrp.getInstance().getFlashMessage().addMessage("error", gt("Operacao falhada"));
		}
		return this.redirect("igrp","OAuthClient","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
