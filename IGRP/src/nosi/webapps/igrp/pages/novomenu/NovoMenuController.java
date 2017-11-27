/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novomenu;
 
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/ 
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import java.io.IOException;
import java.util.HashMap;

import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class NovoMenuController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		NovoMenu model = new NovoMenu();
		model.load();
		NovoMenuView view = new NovoMenuView(model);
		HashMap<String,String> targets = new HashMap<>();
		targets.put(null, gt("-- Selecionar Target --")); 
		targets.put("_self", gt("Mesma página"));
		targets.put("target", gt("Popup"));
		targets.put("submit", gt("Submit"));
		targets.put("confirm", gt("Confirm"));
		view.env_fk.setValue(new Application().getListApps()); // Prompt 
		view.action_fk.setValue(new Action().getListActions(model.getEnv_fk()));
		view.self_id.setValue(new Menu().getListPrincipalMenus(model.getEnv_fk()));
		view.target.setValue(targets); // prompt
		
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/ 
	}

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		NovoMenu model = new NovoMenu();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			Menu menu = new Menu();
			if(model.getAction_fk()!=0){
				menu.setAction(new Action().findOne(model.getAction_fk()));
			}
//			menu.setArea(model.getP_area());
//			menu.setCode(model.getCode());
			menu.setDescr(model.getDescr());
			menu.setApplication(new Application().findOne(model.getEnv_fk()));
			menu.setFlg_base(model.getFlg_base());
//			menu.setImg_src(model.getP_img_src()); 
//			menu.setLink(model.getLink());
			menu.setOrderby(model.getOrderby());
			if(model.getSelf_id()!=0){
				menu.setMenu(new Menu().findOne(model.getSelf_id()));
			}
			menu.setStatus(model.getStatus());
			menu.setTarget(model.getTarget());
			//menu.setAction_fk(model.getPagina());
			menu = menu.insert();
			if(menu!=null){
				Igrp.getInstance().getFlashMessage().addMessage("success",gt("Operação efetuada com sucesso"));
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");				
			}
		}
		return this.redirect("igrp", "novo-menu", "index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	public Response actionEditar(@RParam(rParamName = "p_id") String id_menu) throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(EDITAR)----*/
			
			Menu menu = new Menu().findOne(Integer.parseInt(id_menu));			
			NovoMenu model = new NovoMenu();			
//			model.setCode(menu_db.getCode());
			if(menu.getMenu()!=null){
				model.setSelf_id(menu.getMenu().getId());
			}
			model.setStatus(menu.getStatus());
			model.setFlg_base(menu.getFlg_base());
			model.setEnv_fk(menu.getApplication().getId());
			model.setTarget(menu.getTarget());
			if(menu.getAction()!=null){
				model.setAction_fk(menu.getAction().getId());
			}
			model.setOrderby(menu.getOrderby());
			model.setDescr(menu.getDescr());		
			
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
			view.btn_gravar.setLink("editar_&p_id="+id_menu);
			view.sectionheader_1_text.setValue("Gestão Menu - Atualizar");
			
			return this.renderView(view);
			/*----#END-PRESERVED-AREA----*/
	}
	
	public Response actionEditar_(@RParam(rParamName = "p_id") String id_menu) throws IOException, IllegalArgumentException, IllegalAccessException{
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			
			Menu menu = new Menu().findOne(Integer.parseInt(id_menu));			
			NovoMenu model = new NovoMenu();			
//			model.setCode(menu_db.getCode());
			if(menu.getMenu()!=null){
				model.setSelf_id(menu.getMenu().getId());
			}
			model.setStatus(menu.getStatus());
			model.setFlg_base(menu.getFlg_base());
			model.setEnv_fk(menu.getApplication().getId());
			model.setTarget(menu.getTarget());
			if(menu.getAction()!=null){
				model.setAction_fk(menu.getAction().getId());
			}
			model.setOrderby(menu.getOrderby());
			model.setDescr(menu.getDescr());
			
			model.load();
			
			if(model.getAction_fk()!=0){
				menu.setAction(new Action().findOne(model.getAction_fk()));
			}
//			menu.setArea(model.getP_area());
//			menu.setCode(model.getCode());
			menu.setDescr(model.getDescr());
			menu.setApplication(new Application().findOne(model.getEnv_fk()));
			menu.setFlg_base(model.getFlg_base());
//			menu.setImg_src(model.getP_img_src());
//			menu.setLink(model.getLink());
			menu.setOrderby(model.getOrderby());
			if(model.getSelf_id()!=0){
				menu.setMenu(new Menu().findOne(model.getSelf_id()));
			}
			menu.setStatus(model.getStatus());
			menu.setTarget(model.getTarget());
			//menu.setAction_fk(model.getPagina());
			menu = menu.update();
			if(menu!=null)
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Menu atualizado com sucesso.");
			else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Erro ao atualizar menu.");
			return this.redirect("igrp", "novo-menu", "editar", new String[]{"p_id"}, new String[]{menu.getId() + ""});
		}
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Invalid request ...");
		return this.redirect("igrp", "novo-menu", "editar", new String[]{"p_id"}, new String[]{id_menu + ""});
	}
	
	public Response actionVoltar() throws IOException{
		/*----#START-PRESERVED-AREA(VOLTAR)----*/
		return this.redirect("igrp","pesquisar-menu","index");
		/*----#END-PRESERVED-AREA----*/
	}

	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
