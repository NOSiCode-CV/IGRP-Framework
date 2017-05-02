/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novomenu;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import java.io.IOException;
import java.util.HashMap;



public class NovoMenuController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoMenu model = new NovoMenu();
		NovoMenuView view = new NovoMenuView(model);
		HashMap<String,String> targets = new HashMap<>();
		targets.put(null, "--- Selecionar Target ---");
		targets.put("_self", "Mesma página");
		targets.put("target", "Popup");
		targets.put("submit", "Submit");
		targets.put("confirm", "Confirm");
		if(Igrp.getInstance().getRequest().getMethod() == "POST"){
			model.load();
		}
		view.aplicacao.setValue(new Application().getListApps()); // Prompt
		view.pagina.setValue(new Action().getListActions());
		view.menu_principal.setValue(new Menu().getListPrincipalMenus());
		view.target.setValue(targets); // prompt
		this.renderView(view);
	}
	
}
