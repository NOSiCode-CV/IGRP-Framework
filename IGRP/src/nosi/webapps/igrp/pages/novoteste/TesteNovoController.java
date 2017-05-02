/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.testenovo;
import nosi.core.webapp.Controller;
import java.io.IOException;

public class TesteNovoController extends Controller {		

	public void actionIndex() throws IOException{
		TesteNovo model = new TesteNovo();
		TesteNovoView view = new TesteNovoView(model);
		this.renderView(view);
	}

}
