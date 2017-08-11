/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.lst_serv;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Entidade;
import nosi.webapps.agenda.dao.Servicos;

/*---- Import your packages here... ----*//*---- End ----*/

public class LST_SERVController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		LST_SERV model = new LST_SERV();
		
		List<Entidade> lista_entidade = Entidade.getAllEntidade();
		Map<Integer, String> entidade_map = new HashMap<Integer, String>();
		entidade_map.put(null, "-- Escolha Entidade --");
		for(Entidade e:lista_entidade) {
			entidade_map.put(e.getId(), e.getNome_entidade());
		}
		
		
		
		List<Servicos> lista_servico = Servicos.getAllServico();
		List<LST_SERV.Table_1> data = new ArrayList<>();
		for(Servicos s:lista_servico) {
			LST_SERV.Table_1 tabela = new LST_SERV(). new Table_1();
			tabela.setP_id(s.getId());
			tabela.setServico(s.getNome_servico());
			if(s.getEstado().toUpperCase().equals("ATIVO")) {
				tabela.setCheckbox_1_check(s.getId());
			}
			tabela.setCheckbox_1(s.getId());
			data.add(tabela);
			
		}
		LST_SERVView view = new LST_SERVView(model);
		view.table_1.addData(data);
		view.p_id.setParam(true);
		view.entidade.setValue(entidade_map);
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionNovo() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","LST_SERV","index");
		/*---- End ----*/
	}
	

	public Response actionEditar() throws IOException{
		/*---- Insert your code here... ----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		return this.redirect("agenda","AddServicos","index$p_id="+id);
		/*---- End ----*/
	}
	

	public Response actionDelete() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","LST_SERV","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
