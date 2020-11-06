/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.mapaprocesso;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class MapaProcesso extends Model{		
	@RParam(rParamName = "p_mapa_processo_text")
	private String mapa_processo_text;
	
	public void setMapa_processo_text(String mapa_processo_text){
		this.mapa_processo_text = mapa_processo_text;
	}
	public String getMapa_processo_text(){
		return this.mapa_processo_text;
	}


}
/*-------------------------*/