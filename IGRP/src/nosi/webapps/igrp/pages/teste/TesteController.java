/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.teste;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;

import java.io.IOException;

public class TesteController extends Controller {		

	public void actionIndex() throws IOException{
		Teste model = new Teste();
		TesteView view = new TesteView(model);
		this.renderView(view);
	}
}
