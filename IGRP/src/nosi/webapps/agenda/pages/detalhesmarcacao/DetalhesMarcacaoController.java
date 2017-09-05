/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.detalhesmarcacao;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.config.Config;
import java.io.IOException;
import java.util.List;
import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Marcacao;

/*---- End ----*/

public class DetalhesMarcacaoController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		DetalhesMarcacao model = new DetalhesMarcacao();
		String id = Igrp.getInstance().getRequest().getParameter("p_event_id");
		String estado = "";
		if(id!=null && !id.equals("")){
			String filter = " AND ag_t_marcacao.id="+id;
			List<Marcacao> marcacoes = Marcacao.getAllMarcacao(filter);
			for(Marcacao m:marcacoes){
				model.setBalcao(m.getNome_balcao());
				model.setData(Marcacao.convertDate(m.getData_marcacao(),"yyyy-MM-dd","dd-MM-yyyy"));
				model.setEmail(m.getEmail());
				model.setHora(m.getHr_marcacao());
				model.setN_documento(m.getNr_documento());
				model.setNome(m.getNome());
				model.setRequerente(m.getRequerente());
				model.setServico(m.getNome_servico());
				model.setTelefone(m.getTelefone());
				model.setTelemovel(m.getTelemovel());
				model.setTipo_documento(m.getTipo_documento());
				estado = m.getEstado();
			}
		}
		DetalhesMarcacaoView view = new DetalhesMarcacaoView(model);
		Config.target = "_blank";
		if(estado.equalsIgnoreCase("ATIVO")){
			view.btn_cancelar_agenda.setLink("cancelarAgenda&p_id="+id);
			view.btn_confirmar_agenda.setLink("confirmarAgenda&p_id="+id);
			view.toolsbar_1.addButton(view.btn_confirmar_agenda);
			view.toolsbar_1.addButton(view.btn_cancelar_agenda);
		}else if(estado.equalsIgnoreCase("CONFIRMADO")){
			view.btn_cancelar_agenda.setLink("cancelarAgenda&p_id="+id);
			view.btn_confirmar_presenca.setLink("confirmarPresenca&p_id="+id);
			view.toolsbar_1.addButton(view.btn_confirmar_presenca);
			view.toolsbar_1.addButton(view.btn_cancelar_agenda);
		}
		view.servico.setLabel("Serviço");
		view.n_documento.setLabel("Nº Documento");
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionConfirmarAgenda() throws IOException{
		/*---- Insert your code here... ----*/		
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id!=null){
			Marcacao m = Marcacao.getMarcacao(Integer.parseInt(id));
			m.setEstado("CONFIRMADO");
			int s = Marcacao.update(m);
			if(s==200 || s==204){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operação Realizada com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operação Falhada");
			}
		}
		return this.redirect("agenda","DetalhesMarcacao","index");
		/*---- End ----*/
	}
	
	public Response actionConfirmarPresenca() throws IOException{
		/*---- Insert your code here... ----*/		
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id!=null){
			Marcacao m = Marcacao.getMarcacao(Integer.parseInt(id));
			m.setEstado("REALIZADO");
			int s = Marcacao.update(m);
			if(s==200 || s==204){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operação Realizada com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operação Falhada");
			}
		}
		return this.redirect("agenda","DetalhesMarcacao","index");
		/*---- End ----*/
	}
	
	public Response actionCancelarAgenda() throws IOException{
		/*---- Insert your code here... ----*/		
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id!=null){
			Marcacao m = Marcacao.getMarcacao(Integer.parseInt(id));
			m.setEstado("INATIVO");
			int s = Marcacao.update(m);
			if(s==200 || s==204){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operação Realizada com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operação Falhada");
			}
		}
		return this.redirect("agenda","DetalhesMarcacao","index");
		/*---- End ----*/
	}
	
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
