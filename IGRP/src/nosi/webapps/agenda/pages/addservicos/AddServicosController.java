/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.addservicos;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Entidade;
import nosi.webapps.agenda.dao.Servicos;

/*---- Import your packages here... ----*//*---- End ----*/

public class AddServicosController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/						
		AddServicos model = new AddServicos();
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id != null) {
			Servicos ser = Servicos.getServicoById(Integer.parseInt(id));
			if(ser != null) {
				model.setEntidade(ser.getId_entidade());
				model.setNome_do_servico(ser.getNome_servico());
				model.setCodigo_do_servico(ser.getCodigo_servico());
				model.setEstado(ser.getEstado());
				model.setAssunto(ser.getAssunto());
			}
		}
		
		//preencher Combobox
		List<Entidade> listaEntidade = Entidade.getAllEntidade();
		Map<Integer, String > entidadeMap = new HashMap<Integer, String>();
		Map<String, String> estadoMap = new HashMap<>();
		entidadeMap.put(null, "-- Escolha Entidade --");
		for(Entidade e:listaEntidade) {
			entidadeMap.put(e.getId(), e.getNome_entidade());
		}
		estadoMap.put(null, "-- Escolha o Estado --");
		estadoMap.put("ATIVO", "ATIVO");
		estadoMap.put("INATIVO", "INATIVO");
		AddServicosView view = new AddServicosView(model);
		view.entidade.setValue(entidadeMap);
		view.estado.setValue(estadoMap);
		if(id != null) {
			view.btn_gravar.setLink("gravar&p_id="+id);
		}
		return this.renderView(view);
		
					/*---- End ----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/	
		AddServicos model = new AddServicos();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			model.load();
			Servicos ser_bd = new Servicos();
			ser_bd.setId_entidade(model.getEntidade());
			ser_bd.setNome_servico(model.getNome_do_servico());
			ser_bd.setCodigo_servico(model.getCodigo_do_servico());
			ser_bd.setEstado(model.getEstado());
			ser_bd.setAssunto(model.getAssunto());
			String id = Igrp.getInstance().getRequest().getParameter("p_id");
			if(id != null && !id.equals("")) {
				ser_bd.setId(Integer.parseInt(id));
			}
			int status = ser_bd.getId()!=null ?  Servicos.update(ser_bd) : Servicos.insert(ser_bd);
			if(status == 200 || status == 202) {
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operacao efetuada com sucesso");
			}else {
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operacao falhada");
			}
		}
		return this.redirect("agenda","AddServicos","index");
				/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
