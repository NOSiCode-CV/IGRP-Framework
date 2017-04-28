/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.env;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;

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
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			Application app = new Application();
			app.setAction_fk(model.getAction_fk());
			app.setApache_dad(model.getApache_dad());
			app.setDad(model.getDad());
			app.setDescription(model.getDescription());
			app.setFlg_external(model.getFlg_external());
			app.setFlg_old(model.getFlg_old());
			app.setHost(model.getHost());
			app.setImg_src(model.getImg_src());
			app.setLink_center(model.getLink_center());
			app.setLink_menu(model.getLink_menu());
			app.setName(model.getName());
			app.setStatus(model.getStatus());
			app.setTemplates(model.getTemplates());
			if(app.insert()){
				System.out.println("saved");
				this.redirect("igrp", "lista-env","index");
			}else{
				System.err.println("failed");
			}
		}
		this.redirect("igrp", "env", "index");
	}
	
	public void actionVoltar() throws IOException{
		this.redirect("igrp", "lista-env","index");
	}
}
