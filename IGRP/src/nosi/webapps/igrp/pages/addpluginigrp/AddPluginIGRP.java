package nosi.webapps.igrp.pages.addpluginigrp;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class AddPluginIGRP extends Model{		
	@RParam(rParamName = "p_file")
	private String file;
	@RParam(rParamName = "p_import_plugin_title_text")
	private String import_plugin_title_text;
	
	public void setFile(String file){
		this.file = file;
	}
	public String getFile(){
		return this.file;
	}
	
	public void setImport_plugin_title_text(String import_plugin_title_text){
		this.import_plugin_title_text = import_plugin_title_text;
	}
	public String getImport_plugin_title_text(){
		return this.import_plugin_title_text;
	}


}
