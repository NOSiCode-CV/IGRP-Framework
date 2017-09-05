/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcacao_consulta.pages.especialidade;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- End ----*/

public class EspecialidadeController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		Especialidade model = new Especialidade();
		EspecialidadeView view = new EspecialidadeView(model);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		Especialidade model = new Especialidade();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			nosi.webapps.marcacao_consulta.dao.Especialidade esp = new nosi.webapps.marcacao_consulta.dao.Especialidade();
			esp.setCodigo(model.getCodigo());
			esp.setDescricao(model.getDescricao());
			esp = esp.insert();
			if(esp!=null){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operação realizada com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operação falhada");
			}
		}
		return this.redirect("marcacao_consulta","Especialidade","index");
		/*---- End ----*/
	}
	

	public Response actionListar_epecialidade() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("marcacao_consulta","ListaEspecialidade","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
