
package nosi.webapps.igrp.pages.novomenu;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import java.io.IOException;
import java.util.HashMap;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Core;
/*----#END-PRESERVED-AREA----*/

public class NovoMenuController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		NovoMenu model = new NovoMenu();
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (Core.isInteger(id)  && !id.equals("0")) {
			// If its a update it will enter here and the value p_id is from the GET url
			Menu menu = new Menu().findOne(id);
			if (null != menu.getMenu())
				model.setSelf_id(menu.getMenu().getId());
			model.setStatus(menu.getStatus());
			model.setFlg_base(menu.getFlg_base());
			// Sets the Application combo
			model.setEnv_fk(menu.getApplication().getId());
			// Sets the target, Self_, other page, popup...
			model.setTarget(menu.getTarget());
			// Sets the page to open
			if (menu.getAction() != null)
				model.setAction_fk(menu.getAction().getId());
			model.setOrderby(menu.getOrderby());
			model.setDescr(menu.getDescr());
		} else {
			model.load();
			String app = Igrp.getInstance().getRequest().getParameter("app");
			if (Core.isInteger(app))
				model.setEnv_fk(Integer.parseInt(app));			
			// New menu by default opens in the same window
			model.setTarget("_self");
		}

		NovoMenuView view = new NovoMenuView(model);
		HashMap<String, String> targets = new HashMap<>();
		targets.put(null, gt("-- Selecionar Target --"));
		targets.put("_self", gt("Mesma página"));
		targets.put("_blank", gt("Popup"));
		targets.put("_newtab", gt("New tab"));
		targets.put("modal", gt("Modal"));
		targets.put("submit", gt("Submit"));
		targets.put("confirm", gt("Confirm"));
		view.env_fk.setValue(new Application().getListApps()); // Prompt
		view.action_fk.setValue(new Action().getListActions(model.getEnv_fk()));
		view.self_id.setValue(new Menu().getListPrincipalMenus(model.getEnv_fk()));
		view.target.setValue(targets); // prompt	
		view.link.setVisible(false);

		if (Core.isInteger(id) && !id.equals("0")) {
			view.btn_gravar.setLink("gravar&p_id=" + id);
			view.sectionheader_1_text.setValue("Gestão Menu - Atualizar");
		}

		else
			view.status.setValue(1);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		NovoMenu model = new NovoMenu();
		Menu menu;
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			//Update menu will enter here
			if (Core.isInteger(id) && !id.equals("0")) {
				menu = new Menu().findOne(Integer.parseInt(id));
				if (menu.getMenu() != null) {
					model.setSelf_id(menu.getMenu().getId());
				}
				model.setStatus(menu.getStatus());
				model.setFlg_base(menu.getFlg_base());
				model.setEnv_fk(menu.getApplication().getId());
				model.setTarget(menu.getTarget());
				if (menu.getAction() != null) {
					model.setAction_fk(menu.getAction().getId());
				}
				model.setOrderby(menu.getOrderby());
				model.setDescr(menu.getDescr());

			} else {
				menu = new Menu();
			}

			model.load();

			if (model.getAction_fk() != 0) {
				menu.setAction(new Action().findOne(model.getAction_fk()));
			}
			menu.setDescr(model.getDescr());
			menu.setApplication(new Application().findOne(model.getEnv_fk()));
			menu.setFlg_base(model.getFlg_base());
			menu.setOrderby(model.getOrderby());
			menu.setStatus(model.getStatus());
			menu.setTarget(model.getTarget());
			if (model.getSelf_id() != 0) {
				menu.setMenu(new Menu().findOne(model.getSelf_id()));
				// else if for the case the son has no parent, to set the parent itself. A son has a page/action
			} else if (model.getAction_fk() != 0)
				menu.setMenu(menu);
			if (Core.isInteger(id) && !id.equals("0")) {
				menu = menu.update();
				if (menu != null)
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS,
							"Menu atualizado com sucesso.");
				else {
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Erro ao atualizar menu.");
					return this.redirect("igrp", "novo-menu", "index", new String[] { "p_id" },
							new String[] { id + "" });
				}
			} else {
				menu = menu.insert();
				if (menu != null) {
					Igrp.getInstance().getFlashMessage().addMessage("success", gt("Operação efetuada com sucesso"));
				} else {
					Igrp.getInstance().getFlashMessage().addMessage("error", "Falha ao tentar efetuar esta operação");
				}
			}

		}
		if (Core.isInteger(id) && !id.equals("0")) {
			// Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Invalid
			// request ...");
			return this.redirect("igrp", "novo-menu", "index", new String[] { "p_id" }, new String[] { id + "" });
		} else {
			return this.redirect("igrp", "novo-menu", "index");
		}

		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
		
	/*----#END-PRESERVED-AREA----*/
}
