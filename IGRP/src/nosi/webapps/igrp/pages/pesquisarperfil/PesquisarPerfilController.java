/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.pesquisarperfil;
import nosi.core.webapp.Controller;
import java.io.IOException;



public class PesquisarPerfilController extends Controller {		

	public void actionIndex() throws IOException{
		PesquisarPerfil model = new PesquisarPerfil();
		PesquisarPerfilView view = new PesquisarPerfilView(model);
		this.renderView(view);
	}

	public void actionNovo() throws IOException{
		
		this.redirect("RED","Teste","Action");
	}
	
	public void actionPesquisar() throws IOException{
		
	}
	
}
