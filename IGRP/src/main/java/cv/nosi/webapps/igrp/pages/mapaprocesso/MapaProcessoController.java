/*-------------------------*/

/*Create Controller*/

package cv.nosi.webapps.igrp.pages.mapaprocesso;


import static cv.nosi.core.i18n.Translator.gt;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import cv.nosi.core.gui.components.IGRPMenu;
import cv.nosi.core.webapp.Response;
import cv.nosi.core.webapp.mvc.Controller;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.workflow.activit.rest.business.ProcessDefinitionIGRP;
import cv.nosi.core.webapp.workflow.activit.rest.entities.FormDataService;
import cv.nosi.core.webapp.workflow.activit.rest.entities.ProcessDefinitionService;
import cv.nosi.core.webapp.workflow.activit.rest.services.FormDataServiceRest;
import cv.nosi.core.webapp.workflow.activit.rest.services.ProcessDefinitionServiceRest;
import cv.nosi.core.webapp.workflow.bpmn.BPMNConstants;
import cv.nosi.webapps.igrp.dao.Application;

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
