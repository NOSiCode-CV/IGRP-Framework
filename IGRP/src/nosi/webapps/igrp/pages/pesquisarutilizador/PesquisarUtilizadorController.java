/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarutilizador;
import nosi.core.webapp.Controller;
import java.io.IOException;


public class PesquisarUtilizadorController extends Controller {		

	public void actionIndex() throws IOException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		PesquisarUtilizadorView view = new PesquisarUtilizadorView(model);
		this.renderView(view);
	}

	public void actionNovo() throws IOException{
	}
	
	public void actionPesquisar() throws IOException{
	}
	
}
