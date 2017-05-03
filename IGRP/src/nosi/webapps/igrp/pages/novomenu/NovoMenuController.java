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
		view.env_fk.setValue(new Application().getListApps()); // Prompt
		view.action_fk.setValue(new Action().getListActions());
		view.self_id.setValue(new Menu().getListPrincipalMenus());
		view.target.setValue(targets); // prompt

		this.renderView(view);
	}

	public void actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoMenu model = new NovoMenu();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			Menu menu = new Menu();
			menu.setAction_fk(model.getAction_fk());
			menu.setArea(model.getP_area());
			menu.setCode(model.getCode());
			menu.setDescr(model.getDescr());
			menu.setEnv_fk(model.getEnv_fk());
			menu.setFlg_base(model.getFlg_base());
			menu.setImg_src(model.getP_img_src());
			menu.setLink(model.getLink());
			menu.setOrderby(model.getOrderby());
			menu.setSelf_id(model.getSelf_id());
			menu.setStatus(model.getStatus());
			menu.setTarget(model.getTarget());
			//menu.setAction_fk(model.getPagina());
			if(menu.insert()){
				Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
				this.redirect("igrp", "pesquisar-menu", "index");
				return;
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");				
			}
		}
		this.redirect("igrp", "novo-menu", "index");
	}
	
	public void actionVoltar() throws IOException{
			this.redirect("igrp","ListaEnv","index");
	}
	
}
