/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcao_consulta.pages.registarmedico;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.marcao_consulta.dao.Medico;

import java.io.IOException;


public class RegistarMedicoController extends Controller {		

	public void actionIndex() throws IOException{
		RegistarMedico model = new RegistarMedico();
		RegistarMedicoView view = new RegistarMedicoView(model);
		this.renderView(view);
	}

	public void actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			RegistarMedico model = new RegistarMedico();
			model.load();
			Medico m = new Medico();
			m.setMorada(model.getMorada());
			m.setNome(model.getNome());
			m.setNum_consulta(model.getN_consulta_por_dia());
			if(m.insert()){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Medico registado com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Erro ao registar Medico");
			}
		}
		this.redirect("marcao_consulta","ListaMedico","index");
	}
	
	public void actionVoltar() throws IOException{
			this.redirect("marcao_consulta","ListaMedico","index");
	}
	
}
