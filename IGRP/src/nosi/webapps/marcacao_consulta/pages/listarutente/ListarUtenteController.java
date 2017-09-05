/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcacao_consulta.pages.listarutente;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.HashMap;

import nosi.core.webapp.Response;
import nosi.webapps.marcacao_consulta.dao.Utente;

/*---- End ----*/

public class ListarUtenteController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		ListarUtente model = new ListarUtente();
		ListarUtenteView view = new ListarUtenteView(model);
		ArrayList<ListarUtente.Table_1> data = new ArrayList<>();
		Utente ut = new Utente();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			ut.setNome(model.getNome());
			ut.setSexo(model.getSexo());
		}
		for(Utente u:ut.find().andWhere("nome", "like", model.getNome()).andWhere("sexo", "=", model.getSexo()!=0?model.getSexo():null).all()){		
			ListarUtente.Table_1 table_1 = new ListarUtente.Table_1();
			LocalDate today = LocalDate.now();
			String[] part = u.getData_nascimento().toString().split("-");
			LocalDate birthday = LocalDate.of(Integer.parseInt(part[0]),Integer.parseInt(part[1]),Integer.parseInt(part[2]));			 
			Period p = Period.between(birthday, today);
			table_1.setIdade(p.getYears());
			table_1.setMorada(u.getMorada());
			table_1.setNome(u.getNome());
			table_1.setSexo(u.getSexo()==1?"F":"M");
			table_1.setP_id(""+u.getId());
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
		/*---- End ----*/
	}


	public Response actionNovo_utente() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("marcacao_consulta","RegistarUtente","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("marcacao_consulta","ListarUtente","index");
		/*---- End ----*/
	}
	

	public Response actionMarcar_consulta() throws IOException{
		/*---- Insert your code here... ----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		return this.redirect("marcacao_consulta", "MarcarConsulta", "index&id="+id);
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
