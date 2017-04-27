/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.dominio;
import nosi.core.webapp.Controller;
import java.io.IOException;


public class DominioController extends Controller {		

	public void actionIndex() throws IOException{
		Dominio model = new Dominio();
		DominioView view = new DominioView(model);
		this.renderView(view);
	}

	public void actionPesquisar() throws IOException{
	
		this.redirect("RED","Teste","Action");
	}
	
	public void actionNovo() throws IOException{
		
		this.redirect("RED","Teste","Action");
	}
	
}
