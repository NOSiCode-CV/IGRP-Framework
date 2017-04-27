/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novomenu;
import nosi.core.webapp.Controller;
import java.io.IOException;



public class NovoMenuController extends Controller {		

	public void actionIndex() throws IOException{
		NovoMenu model = new NovoMenu();
		NovoMenuView view = new NovoMenuView(model);
		this.renderView(view);
	}

	public void actionGravar() throws IOException{
	
		this.redirect("RED","Teste","Action");
	}
	
	public void actionVoltar() throws IOException{
		
		this.redirect("RED","Teste","Action");
	}
	
}
