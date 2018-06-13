
package nosi.webapps.igrp_studio.pages.file_editor;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;



public class File_editorView extends View {

	public Field json_data;
	public Field save_url;
	public IGRPForm form_1;


	public File_editorView(){

		this.setPageTitle("File Editor");
			
		form_1 = new IGRPForm("form_1","");

		json_data = new LinkField(model,"json_data");
		json_data.setLabel(gt("Json_data"));
		json_data.setValue(new Config().getResolveUrl("igrp_studio","File_editor","index"));
		json_data.propertie().add("name","p_json_data").add("type","link").add("target","_self").add("request_fields","").add("maxlength","80000");
		
		save_url = new LinkField(model,"save_url");
		save_url.setLabel(gt("Save_url"));
		save_url.setValue(new Config().getResolveUrl("igrp_studio","File_editor","index"));
		save_url.propertie().add("name","p_save_url").add("type","link").add("target","_self").add("request_fields","").add("maxlength","8000");
		


		
	}
		
	@Override
	public void render(){
		
		form_1.addField(json_data);
		form_1.addField(save_url);

		this.addToPage(form_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		json_data.setValue(model);
		save_url.setValue(model);	

		
	}
}
