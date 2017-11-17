/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.detalhes_tarefas;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*----#END-PRESERVED-AREA----*/

public class Detalhes_tarefasController extends Controller {		


	public Response actionIndex() throws IOException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		Detalhes_tarefas model = new Detalhes_tarefas();
		Detalhes_tarefasView view = new Detalhes_tarefasView(model);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionFechar() throws IOException{
		/*----#START-PRESERVED-AREA(FECHAR)----*/
		return this.redirect("igrp","ListaPage","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	/*----#END-PRESERVED-AREA----*/
}
