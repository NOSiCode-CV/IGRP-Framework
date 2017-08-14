/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.agenda_presenca;
import nosi.core.config.Config;
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

/*---- Import your packages here... ----*//*---- End ----*/

public class AGENDA_PRESENCAController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/				
		AGENDA_PRESENCA model = new AGENDA_PRESENCA();
		ArrayList<AGENDA_PRESENCA.Table_1> data = new ArrayList<>();	
		String filter = " AND ag_t_marcacao.estado='ATIVO' ";	
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			filter += model.getEntidade()!=null && !model.getEntidade().equals("")? " AND ag_t_marcacao.id_entidade="+model.getEntidade():"";
			filter += model.getBalcao()!=null && !model.getBalcao().equals("")? " AND ag_t_marcacao.id_balcao="+model.getBalcao():"";
			filter += model.getDate_de()!=null && !model.getDate_de().equals("")? " AND ag_t_marcacao.data_marcacao>='"+Marcacao.convertDate(model.getDate_de(), "dd-MM-yyyy", "yyyy-MM-dd")+"'":"";
			filter += model.getData_ate()!=null && !model.getData_ate().equals("")? " AND ag_t_marcacao.data_marcacao<='"+Marcacao.convertDate(model.getData_ate(), "dd-MM-yyyy", "yyyy-MM-dd")+"'":"";
		}
		
		List<Marcacao> marcacoes = Marcacao.getAllMarcacao(filter);
		for(Marcacao m:marcacoes){
			AGENDA_PRESENCA.Table_1 t = new AGENDA_PRESENCA.Table_1();
			t.setBalcao(m.getLocalizacao());
			t.setEstado(m.getEstado());
			t.setNome(m.getNome());
			t.setServico(m.getNome_servico());
			t.setId(m.getId());
			t.setId_check(m.getId());
			t.setHora(m.getHr_marcacao());
			t.setDia(Marcacao.convertDate(m.getData_marcacao(),"yyyy-MM-dd","dd-MM-yyyy"));
			data.add(t);
		}
		AGENDA_PRESENCAView view = new AGENDA_PRESENCAView(model);
		view.table_1.addData(data);
		view.btn_pesquisar.setLink("index");
		view.balcao.setValue(IgrpHelper.toMap(Balcao.getAllBalcao(), "id", "localizacao","--- Filtrar por Balcao ---"));
		view.entidade.setValue(IgrpHelper.toMap(Entidade.getAllEntidade(), "id", "nome_entidade","--- Filtrar por Entidade ---"));
		view.id.setParam(true);
		view.id_check.setParam(true);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AGENDA_PRESENCA","index");
		/*---- End ----*/
	}
	

	public Response actionConfirmar() throws IOException{
		/*---- Insert your code here... ----*/		
		String [] p_ids = Igrp.getInstance().getRequest().getParameterValues("p_id");
		if(p_ids!=null){
			boolean x = false;
			for(String id:p_ids){
				Marcacao m = Marcacao.getMarcacao(Integer.parseInt(id));
				m.setEstado("Realizado");
				int s = Marcacao.update(m);
				x = s==200 || s==202;
			}
			if(x){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operação Realizada com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operação Falhada");
			}
		}
		return this.redirect("agenda","AGENDA_PRESENCA","index");
		/*---- End ----*/
	}
	

	public Response actionNotificar() throws IOException{
		/*---- Insert your code here... ----*/		
		return this.redirect("agenda","AddServicos","index");
			/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
