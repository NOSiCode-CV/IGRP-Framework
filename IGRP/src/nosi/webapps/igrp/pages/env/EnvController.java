/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.env;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;

import java.io.IOException;
/*import nosi.webapps.red.teste.Teste;
import nosi.webapps.red.teste.Teste;
*/

public class EnvController extends Controller {		

	public void actionIndex() throws IOException{
		Env model = new Env();
		EnvView view = new EnvView(model);
		this.renderView(view);
	}

	public void actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Env model = new Env();
		EnvView view = new EnvView(model);
		view.id.setValue(12);
		model.load();
		/*String p_id = Igrp.getInstance().getRequest().getParameter("p_id");
		p_id = p_id.replaceAll("\\D+","");;
		System.out.println("p_id:"+p_id);*/
		this.renderView(view);
	}
}
