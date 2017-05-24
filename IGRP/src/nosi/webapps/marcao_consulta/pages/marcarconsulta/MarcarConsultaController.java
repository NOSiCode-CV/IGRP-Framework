/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcao_consulta.pages.marcarconsulta;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.marcao_consulta.dao.Consulta;
import nosi.webapps.marcao_consulta.dao.Medico;
import nosi.webapps.marcao_consulta.dao.Utente;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class MarcarConsultaController extends Controller {		

	public void actionIndex() throws IOException{
		MarcarConsulta model = new MarcarConsulta();
		if(Igrp.getInstance().getRequest().getParameter("id")!=null){
			model.setUtente(Integer.parseInt(Igrp.getInstance().getRequest().getParameter("id")));
		}
		MarcarConsultaView view = new MarcarConsultaView(model);
		view.utente.setValue(new Utente().getListUtente());
		view.medico.setValue(new Medico().getListMedico());
		this.renderView(view);
	}

	public void actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException, ParseException{
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			MarcarConsulta model = new MarcarConsulta();
			model.load();
			Consulta c = new Consulta();
			SimpleDateFormat format = new SimpleDateFormat("dd-mm-yyyy");
			Date data_consulta = new Date(format.parse(model.getData_consulta()).getTime());
			c.setData_consulta(data_consulta);
			c.setEstado(0);
			Medico medico = new Medico();
			Utente utente = new Utente();
			medico.setId(model.getMedico());
			utente.setId(model.getUtente());
			c.setMedico(medico);
			c.setUtente(utente);
			if(!c.disponibilidade()){
				Igrp.getInstance().getFlashMessage().addMessage("warning", "Esgotau o limite de consulta para este medico. Nao pode marcar consulta neste medico");	
				this.redirect("marcao_consulta","MarcarConsulta","index");		
				return;
			}
			if(c.disponibilidade() && c.insert()){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Consulta registado com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Erro ao registar Consulta");
			}
		}
		this.redirect("marcao_consulta","ConsultaPendente","index");
	}
	
	public void actionVoltar() throws IOException{
			this.redirect("marcao_consulta","ConsultaPendente","index");
	}
	
}
