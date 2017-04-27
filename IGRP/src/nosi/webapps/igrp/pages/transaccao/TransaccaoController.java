/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.transaccao;
import nosi.core.webapp.Controller;
import java.io.IOException;

public class TransaccaoController extends Controller {		

	public void actionIndex() throws IOException{
		Transaccao model = new Transaccao();
		TransaccaoView view = new TransaccaoView(model);
		this.renderView(view);
	}

	public void actionPesquisar() throws IOException{
	
		this.redirect("RED","Teste","Action");
	}
	
}
