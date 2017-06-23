/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcao_consulta.pages.listarutente;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.HashMap;

import nosi.webapps.marcao_consulta.dao.Utente;

public class ListarUtenteController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ListarUtente model = new ListarUtente();
		ListarUtenteView view = new ListarUtenteView(model);
		ArrayList<ListarUtente.Table_1> data = new ArrayList<>();
		Utente ut = new Utente();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			ut.setNome(model.getNome());
			ut.setSexo(model.getSexo());
		}
		for(Object obj:ut.getAll()){
			Utente u = (Utente) obj;			
			ListarUtente.Table_1 table_1 = new ListarUtente().new Table_1();
			LocalDate today = LocalDate.now();
			String[] part = u.getData_nascimento().toString().split("-");
			LocalDate birthday = LocalDate.of(Integer.parseInt(part[0]),Integer.parseInt(part[1]),Integer.parseInt(part[2]));			 
			Period p = Period.between(birthday, today);
			table_1.setIdade(p.getYears());
			table_1.setMorada(u.getMorada());
			table_1.setNome(u.getNome());
			table_1.setSexo(u.getSexo()==1?"F":"M");
			table_1.setP_id(u.getId());
			data.add(table_1);
		}
		view.table_1.addData(data);
		view.p_id.setParam(true);
		view.btn_pesquisar.setLink("index");
		HashMap<Integer,String> sexo = new HashMap<>();
		sexo.put(0, "--- Selecionar Sexo ---");
		sexo .put(1, "F");
		sexo.put(2, "M");
		view.sexo.setValue(sexo);
		return this.renderView(view);
	}

	public Response actionNovo_utente() throws IOException{
		return this.redirect("marcao_consulta", "RegistarUtente", "index");
	}
	
	public Response actionPesquisar() throws IOException{
		return this.redirect("marcao_consulta", "ListarUtente", "index");		
	}
	
	public Response actionMarcar_consulta() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		return this.redirect("marcao_consulta", "MarcarConsulta", "index&id="+id);
	}
	
}
