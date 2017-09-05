/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.req_servicos;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Requisitos;
import nosi.webapps.agenda.dao.Servicos;

/*---- End ----*/

public class REQ_SERVICOSController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/						
		REQ_SERVICOS model = new REQ_SERVICOS();
		
		
		
		List<Servicos> list_ser = Servicos.getAllServico();
		Map<Integer, String> ser_map = new HashMap<>();
		Map<String, String> tip_req_map = new HashMap<>();
		ser_map.put(null, "Escolha o serviço");
		for(Servicos s:list_ser) {
			ser_map.put(s.getId(), s.getNome_servico());
		}
		tip_req_map.put(null, "Escolha Tipo Requisito");
		tip_req_map.put("formulario", "FORMULÁRIO");
		tip_req_map.put("custo", "CUSTO");
		tip_req_map.put("descricao", "DESCRIÇÃO");
		tip_req_map.put("documento", "DOCUMENTO");
		
		REQ_SERVICOSView view = new REQ_SERVICOSView(model);
		view.servico.setValue(ser_map);
		view.tipo_requisito.setValue(tip_req_map);
		
		return this.renderView(view);
					/*---- End ----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/				
		REQ_SERVICOS model = new REQ_SERVICOS();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			model.load();
			Collection<Requisitos> req_cole = new LinkedHashSet<>();
			System.out.println("numero " + model.getP_tipo_requisito_fk().length);
			for(int i=0; i< model.getP_tipo_requisito_fk().length; i++ ) {
				Requisitos req = new Requisitos();
				req.setId_servico(model.getServico());
				req.setTipo_requisito(model.getP_tipo_requisito_fk_desc()[i]);
				//req.setId_doc_igrp(model.getP_upload_desc()[i]);
				//req.setNome_doc_igrp(model.getP_upload_desc()[i]);
				req.setDescritivo(model.getP_descritivo_fk()[i]);
				req.setEstado("ATIVO");
				req_cole.add(req);
			}
			boolean x = false;
			for(Requisitos r:req_cole) {
				x = Requisitos.insert(r) == 201;
			}
			if(x) {
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operacao efetuada com sucesso");
			}else {
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operacao falhada");
			}		
		}
		
		
		
		return this.redirect("agenda","REQ_SERVICOS","index");
				/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
