/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.testeima;
import nosi.core.webapp.Controller;
import java.io.IOException;

public class TesteImaController extends Controller {		

	public void actionIndex() throws IOException{
		TesteIma model = new TesteIma();
		TesteImaView view = new TesteImaView(model);
		this.renderView(view);
	}

}
