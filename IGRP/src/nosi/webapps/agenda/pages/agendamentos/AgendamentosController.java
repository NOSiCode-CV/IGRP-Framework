/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.agendamentos;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.webapps.agenda.dao.Balcao;
import nosi.webapps.agenda.dao.Entidade;
import nosi.webapps.agenda.dao.Servicos;

/*---- Import your packages here... ----*//*---- End ----*/

public class AgendamentosController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/		
		Agendamentos model = new Agendamentos();
		
		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("POST")) {
			model.load();
		}
		
		AgendamentosView view = new AgendamentosView(model);
		
		view.entidade.setValue(IgrpHelper.toMap(Entidade.getAllEntidade(), "id", "nome_entidade", "--- Escolher Entidade ---"));
		view.balcao.setValue(IgrpHelper.toMap(Balcao.getAllBalcao(), "id", "localizacao", "--- Escolher Balcão ---"));
		view.servico.setValue(IgrpHelper.toMap(Servicos.getAllServico(), "id", "nome_servico", "--- Escolher Serviço ---"));
		
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionAgendar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	

	public Response actionConfirmar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("","","");
		/*---- End ----*/
	}
	

	public Response actionCancelar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("","","");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
