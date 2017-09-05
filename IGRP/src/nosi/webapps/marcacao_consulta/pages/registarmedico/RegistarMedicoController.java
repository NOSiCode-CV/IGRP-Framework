/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcacao_consulta.pages.registarmedico;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.Igrp;
import java.util.ArrayList;
import java.util.List;
import nosi.webapps.marcacao_consulta.dao.Especialidade;
import nosi.webapps.marcacao_consulta.dao.Medico;

/*---- End ----*/

public class RegistarMedicoController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		RegistarMedico model = new RegistarMedico();
		RegistarMedicoView view = new RegistarMedicoView(model);
		view.especialidades.setValue(IgrpHelper.toMap(new Especialidade().findAll(), "id", "descricao"));
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			RegistarMedico model = new RegistarMedico();
			model.load();
			Medico m = new Medico();
			m.setMorada(model.getMorada());
			m.setNome(model.getNome());
			m.setNum_consulta(model.getN_consulta_por_dia());
			List<Especialidade> esp = new ArrayList<>();
			model.setEspecialidades(Igrp.getInstance().getRequest().getParameterValues("p_especialidades"));
			if(model.getEspecialidades()!=null){
				for(String id:model.getEspecialidades()){
					Especialidade e = new Especialidade().findOne(id);
					esp.add(e);
				}
			}
			m.setEspecialidades(esp);
			m = m.insert();
			if(m!=null){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Medico registado com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Erro ao registar Medico");
			}
		}
		return this.redirect("marcacao_consulta","RegistarMedico","index");
		/*---- End ----*/
	}
	

	public Response actionVoltar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("marcacao_consulta","ListaMedico","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
