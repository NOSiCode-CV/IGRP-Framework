/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcacao_consulta.pages.registarutente;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;
import nosi.webapps.marcacao_consulta.dao.Utente;
import java.util.HashMap;

/*---- End ----*/

public class RegistarUtenteController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		RegistarUtente model = new RegistarUtente();
		RegistarUtenteView view = new RegistarUtenteView(model);
		HashMap<Integer, String> sexo = new HashMap<>();
		sexo.put(1, "F");
		sexo.put(2, "M");
		view.sexo.setValue(sexo);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			RegistarUtente model = new RegistarUtente();
			model.load();
			Utente u = new Utente();
			u.setMorada(model.getMorada());
			u.setNome(model.getNome());
			u.setSexo(model.getSexo());
			u.setData_nascimento(model.getData_nascimento());
			u = u.insert();
			if(u!=null){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Cliente registado com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Erro ao registar Cliente");
			}
		}
		return this.redirect("marcacao_consulta","RegistarUtente","index");
		/*---- End ----*/
	}
	

	public Response actionVoltar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("marcacao_consulta","ListarUtente","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
