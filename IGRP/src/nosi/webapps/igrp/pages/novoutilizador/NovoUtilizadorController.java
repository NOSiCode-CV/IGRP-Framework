/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novoutilizador;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;

import java.io.IOException;


public class NovoUtilizadorController extends Controller {		

	public void actionIndex() throws IOException{
		
		FlashMessage msg = Igrp.getInstance().getFlashMessage();
		msg.addMessage("success", "Everthing is all right");
		msg.addMessage("success", "Everthing is all right 2");
		msg.addMessage("error", "Not so bad");
		msg.addMessage("warning", "Everthing is all warning 1");
		
		NovoUtilizador model = new NovoUtilizador();
		NovoUtilizadorView view = new NovoUtilizadorView(model);
		this.renderView(view);
	}

	public void actionGravar() throws IOException{
	}
	
	public void actionVoltar() throws IOException{
	}
	
}
