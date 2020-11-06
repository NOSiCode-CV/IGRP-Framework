/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.mapaprocesso;


/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import static nosi.core.i18n.Translator.gt;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import nosi.core.gui.components.IGRPMenu;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.activit.rest.entities.FormDataService;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.services.FormDataServiceRest;
import nosi.core.webapp.activit.rest.services.ProcessDefinitionServiceRest;
import nosi.core.webapp.bpmn.BPMNConstants;
import nosi.webapps.igrp.dao.Application;
/*----#END-PRESERVED-AREA----*/

public class MapaProcessoController extends Controller{		


	public Response actionIndex() throws IOException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		MapaProcesso model = new MapaProcesso();
		MapaProcessoView view = new MapaProcessoView(model);
		List<IGRPMenu> listMenus = new ArrayList<>();
		IGRPMenu menus = new IGRPMenu(gt("Lista de Processos"),"webapps?r=");
		IGRPMenu.Menu menu = new IGRPMenu.Menu(gt("Processos Ativos"));
		for(ProcessDefinitionService process:new ProcessDefinitionServiceRest().getProcessDefinitionsAtivos(Core.getCurrentApp().getDad())){
			IGRPMenu.SubMenu submenu = new IGRPMenu.SubMenu(process.getName(), this.getConfig().getResolveUrl("igrp","MapaProcesso","openProcess")+"&p_processId="+process.getId(), process.getId(),process.getSuspended(), "LEFT_MENU");
			menu.addSubMenu(submenu);
		}
		menus.addMenu(menu);
		listMenus.add(menus);
		view.menu.setListMenu(listMenus);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	public Response actionOpenProcess() throws IOException{
		String p_processId = Core.getParam("p_processId");
		FormDataService formData = null;
		ProcessDefinitionService process = null;
		if(p_processId!=null){
			ProcessDefinitionIGRP processRest = new ProcessDefinitionIGRP();
			process = processRest.getProcessDefinitionServiceRest().getProcessDefinition(p_processId);
			if(processRest.filterAccess(process)) {
				formData = new FormDataServiceRest().getFormDataByProcessDefinitionId(p_processId);
			}else {
				return this.redirect("igrp","ExecucaoTarefas","index");
			}
		}
		if(formData != null && process!=null) {
			if(Core.isNotNull(formData.getFormKey())) {		
				Application app = new Application().findByDad(process.getTenantId());
				if(app!=null) {
					String taskDefinition = "Start"+process.getKey();
					this.addQueryString("p_processId",p_processId)
						.addQueryString("appId", app.getId())
						.addQueryString("appDad", app.getDad())
						.addQueryString("formKey", formData.getFormKey())
						.addQueryString("processDefinition", process.getKey())
						.addQueryString("taskDefinition", taskDefinition)
						.addQueryString("taskName","Start Process");					
					return this.call(app.getDad().toLowerCase(),BPMNConstants.PREFIX_TASK+taskDefinition, "index",this.queryString());
				}
			}
			this.addQueryString("process_id", p_processId);
			return this.redirect("igrp","Startprocess","index",this.queryString());
		}
		return null;
	}

	/*----#END-PRESERVED-AREA----*/
}
