/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novoperfil;
import nosi.core.webapp.Controller;
import java.io.IOException;


public class NovoPerfilController extends Controller {		

	public void actionIndex() throws IOException{
		NovoPerfil model = new NovoPerfil();
		NovoPerfilView view = new NovoPerfilView(model);
		this.renderView(view);
	}

	public void actionGravar() throws IOException{
		
	}
	
	public void actionVoltar() throws IOException{
		
		this.redirect("RED","Teste","Action");
	}
	
}
