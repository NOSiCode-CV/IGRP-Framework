package nosi.webapps.igrp_studio.pages.listaenv;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;

public class ListaEnvView extends View {

	public Field sectionheader_1_text;
	public Field status;
	public Field status_check;
	public Field name;
	public Field dad;
	public Field t_page_builder;
	public Field id;
	public IGRPForm sectionheader_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_importar;
	public IGRPButton btn_novo;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_configurar_base_dados;
	public IGRPButton btn_exportar;

	public ListaEnvView(){

		this.setPageTitle("Application builder");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("App builder"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		status = new CheckBoxField(model,"status");
		status.setLabel(gt("Ativo?"));
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("switch","true").add("java-type","").add("check","true").add("desc","true");
		
		status_check = new CheckBoxField(model,"status_check");
		status_check.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("switch","true").add("java-type","").add("check","true").add("desc","true");
		
		name = new LinkField(model,"name");
		name.setLabel(gt("Name"));
		name.setValue(new Config().getResolveUrl("igrp_studio","ListaEnv","index"));

									name.propertie().add("name","p_name").add("type","link").add("target","_self").add("request_fields","").add("maxlength","30").add("show_header","true").add("desc","true");
		
		dad = new TextField(model,"dad");
		dad.setLabel(gt("Código"));
		dad.propertie().add("name","p_dad").add("type","text").add("maxlength","30");
		
		t_page_builder = new LinkField(model,"t_page_builder");
		t_page_builder.setLabel(gt("Page builder"));
		t_page_builder.setValue(new Config().getResolveUrl("igrp_studio","ListaEnv","index"));

									t_page_builder.propertie().add("name","p_t_page_builder").add("type","link").add("target","_self").add("maxlength","30").add("request_fields","").add("show_header","true").add("desc","true");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","id");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_importar = new IGRPButton("Importar","igrp_studio","ListaEnv","importar","modal|refresh","danger|fa-upload","","");
		btn_importar.propertie.add("type","specific").add("rel","importar");

		btn_novo = new IGRPButton("Novo","igrp_studio","ListaEnv","novo","modal|refresh","success|fa-plus","","");
		btn_novo.propertie.add("type","specific").add("rel","novo");

		btn_editar = new IGRPButton("Editar","igrp_studio","ListaEnv","editar","mpsubmit|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("rel","editar");

		btn_eliminar = new IGRPButton("Eliminar","igrp_studio","ListaEnv","eliminar","confirm","danger|fa-trash-o","","");
		btn_eliminar.propertie.add("type","specific").add("rel","eliminar");

		btn_configurar_base_dados = new IGRPButton("Configurar Base Dados","igrp_studio","ListaEnv","configurar_base_dados","modal","grey|fa-database","","");
		btn_configurar_base_dados.propertie.add("type","specific").add("rel","configurar_base_dados");

		btn_exportar = new IGRPButton("Export","igrp_studio","ListaEnv","exportar","confirm","default|fa-download","","");
		btn_exportar.propertie.add("type","specific").add("rel","exportar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		table_1.addField(status);
		table_1.addField(status_check);
		table_1.addField(name);
		table_1.addField(dad);
		table_1.addField(t_page_builder);
		table_1.addField(id);

		toolsbar_1.addButton(btn_importar);
		toolsbar_1.addButton(btn_novo);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_configurar_base_dados);
		table_1.addButton(btn_exportar);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		status.setValue(model);
		name.setValue(model);
		dad.setValue(model);
		t_page_builder.setValue(model);
		id.setValue(model);	

		table_1.loadModel(((ListaEnv) model).getTable_1());
		}
}
