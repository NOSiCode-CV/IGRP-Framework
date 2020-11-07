package cv.nosi.webapps.igrp_studio.pages.file_editor;

import static cv.nosi.core.i18n.Translator.gt;

import cv.nosi.core.config.Config;
import cv.nosi.core.gui.components.*;
import cv.nosi.core.gui.fields.*;
import cv.nosi.core.webapp.mvc.Model;
import cv.nosi.core.webapp.mvc.View;

public class File_editorView extends View {

	public Field json_data;
	public Field save_url;
	public Field create_url;
	public IGRPForm form_1;
	public Field link_doc;


	public File_editorView(){

		this.setPageTitle("File Editor");
			
		form_1 = new IGRPForm("form_1","");

		json_data = new LinkField(model,"json_data");
		json_data.setLabel(gt("Json_data"));
		json_data.setValue(new Config().getResolveUrl("undefined","undefined","undefined"));

									json_data.propertie().add("name","p_json_data").add("type","link").add("target","_self").add("request_fields","").add("maxlength","80000");
		
		save_url = new LinkField(model,"save_url");
		save_url.setLabel(gt("Save_url"));
		save_url.setValue(new Config().getResolveUrl("undefined","undefined","undefined"));

									save_url.propertie().add("name","p_save_url").add("type","link").add("target","_self").add("request_fields","").add("maxlength","8000");
		
		create_url = new LinkField(model,"create_url");
		create_url.setLabel(gt("Create_url"));
		create_url.setValue(new Config().getResolveUrl("igrp_studio","File_editor","index"));
		create_url.propertie().add("name","p_create_url").add("type","link").add("target","_self").add("request_fields","").add("maxlength","250");
		
		link_doc = new LinkField(model,"link_doc");
		link_doc.setLabel(gt("Help"));
		link_doc.setValue(new Config().getResolveUrl("tutorial","Listar_documentos","index&p_type=file_editor"));
		link_doc.propertie().add("name","p_link_doc").add("type","link").add("target","modal").add("maxlength","30");
		


		
	}
		
	@Override
	public void render(){
		
		form_1.addField(json_data);
		form_1.addField(save_url);
		form_1.addField(create_url);
		form_1.addField(link_doc);

		this.addToPage(form_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		json_data.setValue(model);
		save_url.setValue(model);
		create_url.setValue(model);	

		}
}
