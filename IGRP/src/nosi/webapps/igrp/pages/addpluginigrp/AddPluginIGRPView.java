
package nosi.webapps.igrp.pages.addpluginigrp;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class AddPluginIGRPView extends View {
	
	
	public Field file;
	public Field import_plugin_title_text;
	public IGRPForm form_1;
	public IGRPSectionHeader import_plugin_title;

	public IGRPButton btn_importar;
	public AddPluginIGRPView(AddPluginIGRP model){
		this.setPageTitle("Importar Plugin IGRP");
			
		form_1 = new IGRPForm("form_1","");
		import_plugin_title = new IGRPSectionHeader("import_plugin_title","");
		file = new FileField(model,"file");
		file.setLabel("File");
		
		file.propertie().add("name","p_file").add("type","file").add("accept","").add("targetrend","").add("multiple","true").add("rendvalue","false").add("maxlength","30").add("required","true").add("disabled","false").add("right","false").add("class","default");
		import_plugin_title_text = new TextField(model,"import_plugin_title_text");
		import_plugin_title_text.setLabel("");
		
		import_plugin_title_text.setValue("Importar Plugin IGRP");
		import_plugin_title_text.propertie().add("type","text").add("name","p_import_plugin_title_text").add("persist","true").add("maxlength","4000");

		btn_importar = new IGRPButton("Importar","igrp","AddPluginIGRP","importar","submit","success|fa-upload","","");
		btn_importar.propertie.add("type","form").add("code","").add("class","success").add("rel","importar");
		
	}
		
	@Override
	public void render(){
		
		form_1.addField(file);

		import_plugin_title.addField(import_plugin_title_text);

		form_1.addButton(btn_importar);
		this.addToPage(form_1);
		this.addToPage(import_plugin_title);
	}
}
