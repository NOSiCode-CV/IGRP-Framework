/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.agendamentos;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.webapps.agenda.dao.Balcao;
import nosi.webapps.agenda.dao.Entidade;
import nosi.webapps.agenda.dao.Marcacao;
import nosi.webapps.agenda.dao.Servicos;

/*---- End ----*/

public class AgendamentosController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/		
		Agendamentos model = new Agendamentos();
		
		List<Agendamentos.Table_1> dataProvider = new ArrayList<Agendamentos.Table_1>();
		
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("POST")) {
			model.load();
			String filter = "";
			filter += model.getEntidade() != null && !model.getEntidade().isEmpty() ? " and ag_t_servicos.id_entidade = " + model.getEntidade() : "";
			filter += model.getBalcao() != null && !model.getBalcao().isEmpty() ? " and ag_t_balcoes.id = " + model.getBalcao() : "";
			filter += model.getServico() != null && !model.getServico().isEmpty() ? " and ag_t_servicos.id = " + model.getServico() : "";
			filter += model.getDate_de() != null && !model.getDate_de().isEmpty() ? " and ag_t_marcacao.data_marcacao >= '" + Marcacao.convertDate(model.getDate_de(), "dd-MM-yyyy", "yyyy-MM-dd") + "'" : "";
			filter += model.getData_ate() != null && !model.getData_ate().isEmpty() ? " and ag_t_marcacao.data_marcacao <= '" + Marcacao.convertDate(model.getData_ate(), "dd-MM-yyyy", "yyyy-MM-dd") + "'" : "";
			
			for(Marcacao obj : Marcacao.getAllMarcacao(filter)) {
				Agendamentos.Table_1 row = new Agendamentos.Table_1();
				row.setDia(obj.getData_marcacao());
				row.setHora(obj.getHr_marcacao());
				row.setNome(obj.getNome());
				row.setBalcao(obj.getNome_balcao());
				row.setServico(obj.getNome_servico());
				row.setEstado(obj.getEstado());
				dataProvider.add(row);
			}
		}
		
		AgendamentosView view = new AgendamentosView(model);
		
		view.table_1.addData(dataProvider);
		
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
