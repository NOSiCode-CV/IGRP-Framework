
package nosi.webapps.igrp.pages.page;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class PageController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/

		Page model = new Page();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		PageView view = new PageView(model);

		view.env_fk.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		view.version.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");

		return this.renderView(view);
		
		/*----#END-PRESERVED-AREA----*/

		/*

		view.env_fk.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		view.version.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		Page model = new Page();
		if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			model.load();
			int idPage = Core.isInteger(model.getP_id()) ? Integer.parseInt(model.getP_id()) : 0;
			Application app = new Application();
			Action action = new Action();
			
			action.setApplication(app.findOne(Integer.parseInt(model.getEnv_fk())));
			action.setAction_descr(model.getAction_descr());
			action.setPage_descr(model.getAction_descr());			
			action.setStatus(model.getStatus());
			action.setPage(nosi.core.gui.page.Page.getPageName(model.getPage()));
			action.setPackage_name("nosi.webapps." + action.getApplication().getDad().toLowerCase() + ".pages."+ action.getPage().toLowerCase());	
			action.setVersion(model.getVersion() == null?"2.3":model.getVersion());
			
			if (idPage != 0) {
				//Edit/update page
				action.setAction(model.getP_action());
				action.setXsl_src(model.getP_xsl_src());			
				if (!nosi.core.gui.page.Page.validatePage(action.getPage())) {					
						Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING,FlashMessage.MESSAGE_ERROR_VALID_PAGE);
						return this.redirect("igrp", "page", "index", new String[] { "p_id" }, new String[] { idPage +""});
				}
				action.setId(idPage);
				action = action.update();
				if (action != null)
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, gt("Página atualizada com sucesso."));
				else
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, FlashMessage.MESSAGE_ERROR);
				return this.redirect("igrp", "page", "index", new String[] { "p_id" }, new String[] {idPage+"" });
			} else {
				//Ñew page
				action.setAction("index");				
					if (!nosi.core.gui.page.Page.validatePage(action.getPage())) {
						Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING,
								FlashMessage.WARNING_PAGE_INVALID);
						return this.forward("igrp", "page", "index");					
				}		
				action = action.insert();
				if (action != null) {
					String json = "{\"rows\":[{\"columns\":[{\"size\":\"col-md-12\",\"containers\":[]}]}],\"plsql\":{\"instance\":\"\",\"table\":\"\",\"package\":\"nosi.webapps."
							+ action.getApplication().getDad().toLowerCase() + ".pages\",\"html\":\"" + action.getPage()
							+ "\",\"replace\":false,\"label\":false,\"biztalk\":false,\"subversionpath\":\"\"},\"css\":\"\",\"js\":\"\"}";
					String path_xsl = Config.getBaseServerPahtXsl(action);
					FileHelper.save(path_xsl, action.getPage() + ".json", json);
					if (FileHelper.fileExists(Config.getWorkspace())) {
						FileHelper.save(Config.getWorkspace() + "/WebContent/images" + "/" + "IGRP/IGRP"
								+ action.getVersion() + "/app/" + action.getApplication().getDad().toLowerCase() + "/"
								+ action.getPage().toLowerCase(), action.getPage() + ".json", json);
					}
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, FlashMessage.MSG_SUCCESS);
				} else {
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, FlashMessage.MSG_ERROR);
					return this.forward("igrp", "page", "index");
				}
			}

		}
		return this.redirect("igrp", "page", "index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/

	
	/*----#END-PRESERVED-AREA----*/
}
