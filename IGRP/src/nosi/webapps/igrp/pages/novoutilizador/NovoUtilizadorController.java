/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novoutilizador;
import nosi.core.webapp.Controller;
import java.io.IOException;


public class NovoUtilizadorController extends Controller {		

	public void actionIndex() throws IOException{
		NovoUtilizador model = new NovoUtilizador();
		NovoUtilizadorView view = new NovoUtilizadorView(model);
		this.renderView(view);
	}

	public void actionGravar() throws IOException{
	}
	
	public void actionVoltar() throws IOException{
	}
	
}
