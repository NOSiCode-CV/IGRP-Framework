/*-------------------------*/

/*Create Controller*/
package nosi.webapps.marcacao_consulta.pages.marcarconsulta;

/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.webapps.marcacao_consulta.dao.Consulta;
import nosi.webapps.marcacao_consulta.dao.Especialidade;
import nosi.webapps.marcacao_consulta.dao.Medico;
import nosi.webapps.marcacao_consulta.dao.Utente;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.DateHelper;
/*---- End ----*/

public class MarcarConsultaController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		MarcarConsulta model = new MarcarConsulta();
		MarcarConsultaView view = new MarcarConsultaView(model);
		String id_ut = Igrp.getInstance().getRequest().getParameter("p_id");
		model.setUtente(id_ut);
		view.utente.setValue(IgrpHelper.toMap(new Utente().findAll(), "id", "nome"));
		view.medico.setValue(IgrpHelper.toMap(new Medico().findAll(), "id", "nome"));
		view.especialidade.setValue(IgrpHelper.toMap(new Especialidade().findAll(), "id", "descricao"));
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/		
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			MarcarConsulta model = new MarcarConsulta();
			model.load();
			Consulta c = new Consulta();			
			Medico medico = new Medico().findOne(model.getMedico());
			Utente utente = new Utente().findOne(model.getUtente());
			Especialidade esp = new Especialidade().findOne(model.getEspecialidade());
			c.setMedico(medico);
			c.setUtente(utente);
			c.setEspecialidade(esp);
			c.setData_consulta(model.getData_consulta());
			c.setEstado(0);
			if(model.getData_consulta()!=null){
				model.setData_consulta(DateHelper.convertDate(model.getData_consulta(), "dd-MM-yyyy", "yyyy-MM-dd"));
			}
			boolean check = c.disponibilidade(model.getData_consulta(),medico.getId(),c.getEspecialidade().getId());
			if(!check){
				Igrp.getInstance().getFlashMessage().addMessage("warning", "Esgotau o limite de consulta para este medico. Nao pode marcar consulta neste medico");	
				return this.redirect("marcao_consulta","MarcarConsulta","index");	
			}
			c = c.insert();
			if(check && c!=null){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Consulta registado com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Erro ao registar Consulta");
			}
		}
		return this.redirect("marcacao_consulta","ConsultaPendente","index");
			/*---- End ----*/
	}
	

	public Response actionListar_medico() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("marcacao_consulta","ConsultaPendente","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
