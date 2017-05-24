/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcao_consulta.pages.consultapendente;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.marcao_consulta.dao.Consulta;
import nosi.webapps.marcao_consulta.dao.Utente;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;


public class ConsultaPendenteController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException, ParseException{
		ConsultaPendente model = new ConsultaPendente();
		ConsultaPendenteView view = new ConsultaPendenteView(model);
		ArrayList<ConsultaPendente.Table_1> data = new ArrayList<>();
		Consulta cons = new Consulta();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			if(model.getData_consulta()!=null && !model.getData_consulta().equals("")){
				SimpleDateFormat f = new SimpleDateFormat("dd-mm-yyyy");
				Date d = new Date(f.parse(model.getData_consulta()).getTime());
				cons.setData_consulta(d);
			}
			Utente ut = new Utente();
			ut.setNome(model.getNome_utente());
			cons.setUtente(ut);
		}
		for(Object obj:cons.getAll()){
			Consulta u = (Consulta) obj;			
			ConsultaPendente.Table_1 table_1 = new ConsultaPendente().new Table_1();
			table_1.setData_da_consulta(u.getData_consulta().toString());
			table_1.setMedico_a_consultar(u.getMedico().getNome());
			table_1.setNome_utente(u.getUtente().getNome());
			table_1.setP_id(u.getId());
			data.add(table_1);
		}
		view.table_1.addData(data);
		view.p_id.setParam(true);
		view.btn_pesquisar.setLink("index");
		this.renderView(view);
	}

	public void actionNova_consulta() throws IOException{
			this.redirect("marcao_consulta","MarcarConsulta","index");
	}
	
	public void actionPesquisar() throws IOException{
		ConsultaPendente model = new ConsultaPendente();
		ConsultaPendenteView view = new ConsultaPendenteView(model);
		this.renderView(view);
	}
	
	public void actionCancelar_consulta() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id!=null){
			Consulta c = new Consulta();
			c.setId(Integer.parseInt(id));
			if(c.updateStatus(-1)){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Consulta cancelado com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("erro", "Erro ao cancelar Consulta");
			}
		}
		this.redirect("marcao_consulta","ConsultaPendente","index");
	}
	
	public void actionConfirmar_consulta() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if(id!=null){
			Consulta c = new Consulta();
			c.setId(Integer.parseInt(id));
			if(c.updateStatus(1)){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Consulta confirmado com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("erro", "Erro ao confirmar Consulta");
			}
		}
		this.redirect("marcao_consulta","ConsultaPendente","index");
	}
	
}
