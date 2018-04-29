
package nosi.webapps.igrp.pages.novomenu;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
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

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		NovoMenu model = new NovoMenu();
		model.load();
		NovoMenuView view = new NovoMenuView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		
		view.env_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.action_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.self_id.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.target.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		
		----#gen-example */
		/*----#start-code(index)----*/

		int id = model.getId();
		
		
		if (id != 0) {
          // If its a update it will enter here and the value p_id is from the GET url
			Menu menu = new Menu().findOne(id);
			if (null != menu.getMenu())
				model.setSelf_id(menu.getMenu().getId());
			model.setStatus(menu.getStatus());
			model.setFlg_base(menu.getFlg_base());
			// Sets the target, Self_, other page, popup...
			model.setTarget(menu.getTarget());
			model.setOrderby(menu.getOrderby());
			model.setTitulo(menu.getDescr());
			if (Core.isNotNull(Core.getParam("ichange"))) {
				model.setEnv_fk(model.getEnv_fk());
              if(Core.isNotNull(model.getAction_fk()))                
                 model.setTitulo(getPageTituleByID(model));
			} else {
				model.setEnv_fk(menu.getApplication().getId());
				if (menu.getAction() != null)
                  	model.setAction_fk(menu.getAction().getId());          
             
			}
		} else {
		
			model.setEnv_fk(Core.getParamInt("app"));
			// New menu by default opens in the same window
			model.setTarget("_self");
			model.setStatus(1);
          if (Core.isNotNull(Core.getParam("ichange")) && Core.isNotNull(model.getAction_fk())) {	
                 model.setTitulo(getPageTituleByID(model));
			} 
		}

		HashMap<String, String> targets = new HashMap<>();
		targets.put(null, gt("-- Selecionar --"));
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

		if (id != 0) {
			//view.btn_gravar.setLink("gravar&p_id=" + id);
			view.sectionheader_1_text.setValue("Gestão Menu - Atualizar");
		} else
			view.status.setValue(1);

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		NovoMenu model = new NovoMenu();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","PesquisarMenu","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(gravar)----*/
		
		Menu menu;
		int id = model.getId();
		if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			
			if (id != 0) {
				// UPDATE menu will enter here
				menu = new Menu().findOne(id);
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
				model.setTitulo(menu.getDescr());

			} else {
				// NEW menu will enter here
				menu = new Menu();
			}

			model.load();

			if (model.getAction_fk() != 0) {
				menu.setAction(new Action().findOne(model.getAction_fk()));
			}
			menu.setDescr(model.getTitulo());
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
			if (id != 0) {
				// UPDATE menu will enter here
				menu = menu.update();
				if (menu != null)
					Core.setMessageSuccess("Menu atualizado com sucesso.");
				else {
					Core.setMessageError("Erro ao atualizar menu.");					
				}
			} else {
				// NEW menu will enter here
				menu = menu.insert();
				if (menu != null) {
					Core.setMessageSuccess();
				} else {
					Core.setMessageError();
				}
			}

		}
		if (id != 0) {			
			return this.forward("igrp", "NovoMenu", "index");
		}else if(Core.isNotNull(model.getEnv_fk())) {
			this.addQueryString("app", model.getEnv_fk());
			return this.redirect("igrp","NovoMenu","index", this.queryString());
		}
			
		

		/*----#end-code----*/
		return this.redirect("igrp","PesquisarMenu","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	private String getPageTituleByID(NovoMenu model) {
		//System.out.println(model.getAction_fk());
		return new Action().find().andWhere("id","=",model.getAction_fk()).one()
				.getPage_descr();
	}
	/*----#end-code----*/
	}
