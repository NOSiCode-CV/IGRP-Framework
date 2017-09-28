/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.mapaprocesso;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class MapaProcessoView extends View {
	
	
	public Field mapa_processo_text;
	public IGRPSectionHeader mapa_processo;
	public IGRPMenu menu;
	
	public MapaProcessoView(MapaProcesso model){
		this.setPageTitle("Mapa de Processo");
		menu = new IGRPMenu("menus");
		mapa_processo = new IGRPSectionHeader("mapa_processo","");
		mapa_processo_text = new TextField(model,"mapa_processo_text");
		mapa_processo_text.setLabel("");
		
		mapa_processo_text.setValue("Mapa de Processo");
		mapa_processo_text.propertie().add("type","text").add("name","p_mapa_processo_text").add("persist","true").add("maxlength","4000");

		
	}
		
	@Override
	public void render(){
		
		mapa_processo.addField(mapa_processo_text);
		this.addToPage(menu);
		this.addToPage(mapa_processo);
	}
}
/*-------------------------*/