/*-------------------------*/

/*Create View*/

package cv.nosi.webapps.igrp.pages.mapaprocesso;
import static cv.nosi.core.i18n.Translator.gt;

import cv.nosi.core.gui.components.*;
import cv.nosi.core.webapp.mvc.View;

public class MapaProcessoView extends View {
	
	
	public IGRPFilter filter;
	public IGRPMenu menu;
	
	public MapaProcessoView(MapaProcesso model){
		this.setPageTitle(gt("Mapa de Processo"));
		menu = new IGRPMenu("menus");
		filter = new IGRPFilter("filter",(float)2.1);
	}
		
	@Override
	public void render(){
		
		this.addToPage(menu);
		this.addToPage(filter);
	}
}
/*-------------------------*/