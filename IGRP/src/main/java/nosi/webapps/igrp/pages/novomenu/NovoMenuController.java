
package nosi.webapps.igrp.pages.novomenu;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;

/*----#start-code(packages_import)----*/
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
/*----#end-code----*/

public class NovoMenuController extends Controller {

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException {

		NovoMenu model = new NovoMenu();
		NovoMenuView view = new NovoMenuView();
		model.load();

		/*----#gen-example
		This is an example of how you can implement your code:
		
		
		view.env_fk.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		view.action_fk.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		view.self_id.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		view.target.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		
		----#gen-example */

		/*----#start-code(index)----*/

		String id = Igrp.getInstance().getRequest().getParameter("p_id");

		// If its a update it will enter here and the value p_id is from the GET url
		if (Core.isInt(id) && !id.equals("0")) {
			Menu menu = new Menu().findOne(id);
			if (null != menu.getMenu())
				model.setSelf_id(menu.getMenu().getId());
			model.setStatus(menu.getStatus());
			model.setFlg_base(menu.getFlg_base());
			// Sets the target, Self_, other page, popup...
			model.setTarget(menu.getTarget());
			model.setOrderby(menu.getOrderby());
			model.setDescr(menu.getDescr());
			if (Core.isNotNull(Igrp.getInstance().getRequest().getParameter("ichange"))) {
				model.setEnv_fk(model.getEnv_fk());
			} else {
				model.setEnv_fk(menu.getApplication().getId());
				if (menu.getAction() != null)
					model.setAction_fk(menu.getAction().getId());
			}
		} else {
			String app = Igrp.getInstance().getRequest().getParameter("app");
			if (Core.isInt(app))
				model.setEnv_fk(Integer.parseInt(app));
			// New menu by default opens in the same window
			model.setTarget("_self");
			model.setStatus(1);
		}

		HashMap<String, String> targets = new HashMap<>();
		targets.put(null, gt("-- Selecionar Target --"));
		targets.put("_self", gt("Mesma página"));
		targets.put("_blank", gt("Popup"));
		targets.put("_newtab", gt("New tab"));
		targets.put("modal", gt("Modal"));
		targets.put("submit", gt("Submit"));
		targets.put("confirm", gt("Confirm"));
		view.env_fk.setValue(new Application().getListApps()); // Prompt
		if (Core.isNotNull(model.getEnv_fk())) {
			view.action_fk.setValue(new Action().getListActions(model.getEnv_fk()));
			view.self_id.setValue(new Menu().getListPrincipalMenus(model.getEnv_fk()));
		}
		view.target.setValue(targets); // prompt
		view.link.setVisible(false);

		if (Core.isInt(id) && !id.equals("0")) {
			view.btn_gravar.setLink("gravar&p_id=" + id);
			view.sectionheader_1_text.setValue("Gestão Menu - Atualizar");
		} else
			view.status.setValue(1);

		/*----#end-code----*/

		view.setModel(model);

		return this.renderView(view);

	}

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		
		/*----#start-code(gravar)----*/
		NovoMenu model = new NovoMenu();
		Menu menu;
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			// Update menu will enter here
			if (Core.isInt(id) && !id.equals("0")) {
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
				// else if for the case the son has no parent, to set the parent itself. A son
				// has a page/action
			} else if (model.getAction_fk() != 0)
				menu.setMenu(menu);
			if (Core.isInt(id) && !id.equals("0")) {
				menu = menu.update();
				if (menu != null)
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS,
							"Menu atualizado com sucesso.");
				else {
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Erro ao atualizar menu.");
					return this.redirect("igrp", "NovoMenu", "index", new String[] { "p_id" },
							new String[] { id + "" });
				}
			} else {
				menu = menu.insert();
				if (menu != null) {
					Core.setMessageSuccess( gt("Operação efetuada com sucesso"));
				} else {
					Core.setMessageError(gt("Falha ao tentar efetuar esta operação"));
				}
			}

		}
		if (Core.isInt(id) && !id.equals("0")) {
			// Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Invalid
			// request ...");
			return this.redirect("igrp", "NovoMenu", "index", new String[] { "p_id" }, new String[] { id + "" });
		}else if(Core.isNotNull(model.getEnv_fk())) 
			return this.redirect("igrp","NovoMenu","index", new String[] { "app" }, new String[] {""+ model.getEnv_fk() });
		

		/*----#end-code----*/
		
		
		return this.redirect("igrp","NovoMenu","index");
		
	}

	/*----#start-code(custom_actions)----*/

	/*----#end-code----*/

}
