/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarmenu;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.webapps.red.teste.Teste;
import nosi.webapps.red.teste.Teste;


public class PesquisarMenuController extends Controller {		

	public void actionIndex() throws IOException{
		PesquisarMenu model = new PesquisarMenu();
		PesquisarMenuView view = new PesquisarMenuView(model);
		this.renderView(view);
	}

	public void actionNovo() throws IOException{
		Teste model = new Teste();
		TesteView view = new TesteView(model);
		this.redirect("RED","Teste","Action");
	}
	
	public void actionMenu base() throws IOException{
		Teste model = new Teste();
		TesteView view = new TesteView(model);
		this.renderView(view);
	}
	
	public void actionPesquisar() throws IOException{
		Teste model = new Teste();
		TesteView view = new TesteView(model);
		this.renderView(view);
	}
	
}
