/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novaorganica;
import nosi.core.webapp.Controller;
import java.io.IOException;


public class NovaOrganicaController extends Controller {		

	public void actionIndex() throws IOException{
		NovaOrganica model = new NovaOrganica();
		NovaOrganicaView view = new NovaOrganicaView(model);
		this.renderView(view);
	}

	public void actionGravar() throws IOException{
		Teste model = new Teste();
		TesteView view = new TesteView(model);
		this.renderView(view);
	}
	
	public void actionVoltar() throws IOException{
		Teste model = new Teste();
		TesteView view = new TesteView(model);
		this.redirect("RED","Teste","Action");
	}
	
}
