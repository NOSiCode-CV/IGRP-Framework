/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarorganica;
import nosi.core.webapp.Controller;
import java.io.IOException;


public class PesquisarOrganicaController extends Controller {		

	public void actionIndex() throws IOException{
		PesquisarOrganica model = new PesquisarOrganica();
		PesquisarOrganicaView view = new PesquisarOrganicaView(model);
		this.renderView(view);
	}

	public void actionNovo() throws IOException{
	}
	
	public void actionPesquisar() throws IOException{
	}
	
}
