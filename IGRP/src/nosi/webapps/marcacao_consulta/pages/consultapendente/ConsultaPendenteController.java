/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcacao_consulta.pages.consultapendente;

/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import java.util.ArrayList;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.DateHelper;
import nosi.webapps.marcacao_consulta.dao.Consulta;
import nosi.webapps.marcacao_consulta.dao.Utente;

/*---- End ----*/

public class ConsultaPendenteController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		ConsultaPendente model = new ConsultaPendente();
		ConsultaPendenteView view = new ConsultaPendenteView(model);
		ArrayList<ConsultaPendente.Table_1> data = new ArrayList<>();
		Consulta cons = new Consulta();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			if(model.getData_consulta()!=null){
				model.setData_consulta(DateHelper.convertDate(model.getData_consulta(), "dd-MM-yyyy", "yyyy-MM-dd"));
			}
			Utente ut = new Utente();
			ut.setNome(model.getNome_utente());
			cons.setUtente(ut);
		}
		for(Consulta c:cons.find().andWhere("estado", "=", 0).andWhere("utente.nome", "=", model.getNome_utente()).andWhere("data_consulta", "=", model.getData_consulta()).all()){			
			ConsultaPendente.Table_1 table_1 = new ConsultaPendente.Table_1();
			table_1.setData_da_consulta(c.getData_consulta().toString());
			table_1.setMedico_a_consultar(c.getMedico().getNome());
			table_1.setNome_utente(c.getUtente().getNome());
			table_1.setP_id(""+c.getId());
			data.add(table_1);
		}
		view.table_1.addData(data);
		view.p_id.setParam(true);
		view.btn_pesquisar.setLink("index");
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionNova_consulta() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("marcacao_consulta","MarcarConsulta","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("marcacao_consulta","ConsultaPendente","index");
		/*---- End ----*/
	}
	

	public Response actionConfirmar_consulta() throws IOException{
		/*---- Insert your code here... ----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id!=null){
			Consulta c = new Consulta().findOne(id);
			c.setEstado(1);
			c = c.update();
			if(c!=null){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Consulta confirmado com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("erro", "Erro ao confirmar Consulta");
			}
		}
		return this.redirect("marcacao_consulta","ConsultaPendente","index");
		/*---- End ----*/
	}
	

	public Response actionCancelar_consulta() throws IOException{
		/*---- Insert your code here... ----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id!=null){
			Consulta c = new Consulta().findOne(id);
			c.setEstado(-1);
			c = c.update();
			if(c!=null){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Consulta cancelado com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("erro", "Erro ao cancelar Consulta");
			}
		}
		return this.redirect("marcacao_consulta","ConsultaPendente","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
