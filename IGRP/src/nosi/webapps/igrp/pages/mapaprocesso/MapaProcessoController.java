/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.mapaprocesso;
import nosi.core.gui.components.IGRPMenu;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;

/*---- End ----*/

public class MapaProcessoController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		MapaProcesso model = new MapaProcesso();
		MapaProcessoView view = new MapaProcessoView(model);
		List<IGRPMenu> listMenus = new ArrayList<>();
		IGRPMenu menus = new IGRPMenu("Lista de Processos","webapps?r=");
		IGRPMenu.Menu menu = new IGRPMenu.Menu("Processos Ativos");
		for(ProcessDefinitionService process:new ProcessDefinitionService().getProcessDefinitionsAtivos()){
			IGRPMenu.SubMenu submenu = new IGRPMenu.SubMenu(process.getName(), "webapps?r=igrp/MapaProcesso/openProcess&amp;p_processId="+process.getId(), process.getId(),process.getSuspended(), "LEFT_MENU");
			menu.addSubMenu(submenu);
		}
		menus.addMenu(menu);
		listMenus.add(menus);
		view.menu.setListMenu(listMenus);
		return this.renderView(view);
		/*---- End ----*/
	}

	/*---- Insert your actions here... ----*/
	public Response actionOpenProcess(){
		Response resp = new Response();
		return resp;
	}
	/*---- End ----*/
}
