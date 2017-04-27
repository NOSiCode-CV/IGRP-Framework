/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novodominio;
import nosi.core.webapp.Controller;
import java.io.IOException;



public class NovoDominioController extends Controller {		

	public void actionIndex() throws IOException{
		NovoDominio model = new NovoDominio();
		NovoDominioView view = new NovoDominioView(model);
		this.renderView(view);
	}

	public void actionGravar() throws IOException{
	
		this.redirect("RED","Teste","Action");
	}
	
	public void actionVoltar() throws IOException{
	
		this.redirect("RED","Teste","Action");
	}
	
}
