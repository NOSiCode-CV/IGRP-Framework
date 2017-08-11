/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.entidade;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Aplicacao;
import nosi.webapps.agenda.dao.Entidade;

/*---- Import your packages here... ----*//*---- End ----*/

public class ENTIDADEController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/	
		List<Aplicacao> apps = Aplicacao.getAllAplicacao();
		HashMap<Integer,String> a = new HashMap<Integer,String>();
		for(Aplicacao app:apps){
			a.put(app.getId(), app.getNome());
		}
		ENTIDADE model = new ENTIDADE();
		ENTIDADEView view = new ENTIDADEView(model);
		view.aplicacao.setLabel("Aplicação");
		view.aplicacao.setValue(a);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/							
		ENTIDADE model = new ENTIDADE();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			Entidade e = new Entidade();
			e.setId_aplicacao(model.getAplicacao());
			e.setEstado("ATIVO");
			e.setNome_entidade(model.getNome());
			int status = Entidade.insert(e);
			if(status == 200 || status == 202){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operacao realizada com sucesso");
			}
			else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operacao falhada");
			}
		}
		return this.redirect("agenda","Entidade","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
