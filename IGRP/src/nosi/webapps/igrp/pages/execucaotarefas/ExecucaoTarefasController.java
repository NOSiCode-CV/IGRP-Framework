/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.execucaotarefas;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- End ----*/

public class ExecucaoTarefasController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		ExecucaoTarefas model = new ExecucaoTarefas();
		ExecucaoTarefasView view = new ExecucaoTarefasView(model);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionPesquisar_tarefa() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar_colaborador() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar_button_minhas_tarefas() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar_button_disponiveis() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionPesquisar_estatistica() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionTransferir_tarefa() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionDetalhes_tarefa() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionDetalhes_processo() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionAlterar_prioridade_tarefa() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionAssumir_button_tabela() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionVer_estatistica() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionVer_detalhes() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionEnviar_msg() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionExecutar_button_minha_tarefas() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionDetalhes_processos_button_minha_tarefas() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	

	public Response actionLeberar_tarefa_button_minha_tarefas() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","execucaotarefas","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
