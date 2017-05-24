/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcao_consulta.pages.registarutente;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.marcao_consulta.dao.Utente;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;


public class RegistarUtenteController extends Controller {		

	public void actionIndex() throws IOException{
		RegistarUtente model = new RegistarUtente();
		RegistarUtenteView view = new RegistarUtenteView(model);
		HashMap<Integer, String> sexo = new HashMap<>();
		sexo.put(1, "F");
		sexo.put(2, "M");
		view.sexo.setValue(sexo);
		this.renderView(view);
	}

	public void actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException, ParseException{
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			RegistarUtente model = new RegistarUtente();
			model.load();
			Utente u = new Utente();
			u.setMorada(model.getMorada());
			u.setNome(model.getNome());
			u.setSexo(model.getSexo());
			SimpleDateFormat format = new SimpleDateFormat("dd-mm-yyyy");
			Date date = new Date(format.parse(model.getData_nascimento()).getTime());
			u.setData_nascimento(date);
			if(u.insert()){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Cliente registado com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Erro ao registar Cliente");
			}
		}
		this.redirect("marcao_consulta","RegistarUtente","index");
	}
	
	public void actionVoltar() throws IOException{
			this.redirect("marcao_consulta","ListarUtente","index");
	}
	
}
