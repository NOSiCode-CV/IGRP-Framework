/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novomenu;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
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
	
	public void actionEditar(@RParam(rParamName = "p_id") String id_menu) throws IOException, IllegalArgumentException, IllegalAccessException{
			
			Menu menu_db = new Menu();
			menu_db.setId(Integer.parseInt(id_menu));
			menu_db = (Menu) menu_db.getOne();
			
			NovoMenu model = new NovoMenu();
			
			model.setCode(menu_db.getCode());
			model.setSelf_id(menu_db.getSelf_id());
			model.setStatus(menu_db.getStatus());
			model.setFlg_base(menu_db.getFlg_base());
			model.setEnv_fk(menu_db.getEnv_fk());
			model.setTarget(menu_db.getTarget());
			model.setAction_fk(menu_db.getAction_fk());
			model.setOrderby(menu_db.getOrderby());
			model.setDescr(menu_db.getDescr());
			
			//System.out.println(menu_db);
			
			if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
				model.load();
				menu_db.setCode(model.getCode());
				menu_db.setSelf_id(model.getSelf_id());
				menu_db.setStatus(model.getStatus());
				menu_db.setFlg_base(model.getFlg_base());
				menu_db.setEnv_fk(model.getEnv_fk());
				menu_db.setTarget(model.getTarget());
				menu_db.setAction_fk(model.getAction_fk());
				menu_db.setOrderby(model.getOrderby());
				menu_db.setDescr(model.getDescr());
				
				if(menu_db.update()){
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Menu atualizado com sucesso.");
					this.redirect("igrp", "novo-menu", "editar", new String[]{"p_id"}, new String[]{menu_db.getId() + ""});
					return;
				}
				else
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Erro ao atualizar menu.");
				
			}
			
			
			NovoMenuView view = new NovoMenuView(model);
			
			
			HashMap<String,String> targets = new HashMap<>();
			targets.put(null, "--- Selecionar Target ---");
			targets.put("_self", "Mesma página");
			targets.put("target", "Popup");
			targets.put("submit", "Submit");
			targets.put("confirm", "Confirm");
			view.target.setValue(targets);
			
			//view.env_fk.setValue(new Application().getListAppsOne(Integer.parseInt(id_menu)));
			
			view.env_fk.setValue(new Application().getListApps());
			view.action_fk.setValue(new Action().getListActions());
			view.self_id.setValue(new Menu().getListPrincipalMenus());
			
			view.sectionheader_1_text.setValue("Gestão Menu - Atualizar");
			
			this.renderView(view);
		
	}
	
	public void actionVoltar() throws IOException{
			this.redirect("igrp","pesquisar-menu","index");
	}
	
}
