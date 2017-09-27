/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.oauthclientlist;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.OAuthClient;

/*---- End ----*/

public class OAuthClientListController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/		
		OAuthClientList model = new OAuthClientList();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
		}
		
		List<OAuthClientList.Table_1> data = new ArrayList<>();
		
		OAuthClient db_cli = new OAuthClient();
		List<OAuthClient> lista = db_cli.find().andWhere("redirect_uri", "like", model.getUris_()).all();
		
		for(OAuthClient cliente: lista) {
			OAuthClientList.Table_1 tabela = new OAuthClientList.Table_1();
			tabela.setClient_id(cliente.getClient_id());
			tabela.setClient_secret(cliente.getClient_secret());
			tabela.setUris(cliente.getRedirect_uri());
			tabela.setScope(cliente.getScope());
			tabela.setP_id(cliente.getClient_id());
			data.add(tabela);
		}
		
		OAuthClientListView view = new OAuthClientListView(model);
		view.table_1.addData(data);
		view.btn_pesquisar.setLink("index");
		view.p_id.setParam(true);
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("igrp","oauthclientlist","index");
			/*---- End ----*/
	}
	

	public Response actionButton_1() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","OAuthClientList","index");
		/*---- End ----*/
	}
	

	public Response actionApagar() throws IOException{
		/*---- Insert your code here... ----*/		
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id != null && !id.equals("")) {
			OAuthClient cliente = new OAuthClient();
			cliente = cliente.findOne(id);
			boolean status = cliente.delete();
			if(status) 
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operacao efetuada com sucesso");
			else 
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operacao falhada");
		}
		return this.redirect("igrp","OAuthClientList","index");
			/*---- End ----*/
	}
	

	public Response actionRefresh() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","OAuthClientList","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
