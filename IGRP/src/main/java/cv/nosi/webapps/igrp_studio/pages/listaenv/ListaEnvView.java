package cv.nosi.webapps.igrp_studio.pages.listaenv;

import static cv.nosi.core.i18n.Translator.gt;

import cv.nosi.core.gui.components.*;
import cv.nosi.core.gui.fields.*;
import cv.nosi.core.webapp.mvc.Model;
import cv.nosi.core.webapp.mvc.View;
import cv.nosi.core.webapp.util.Core;

public class ListaEnvView extends View {

	public Field sectionheader_1_text;
	public Field documento;
	public Field status;
	public Field status_check;
	public Field name;
	public Field name_desc;
	public Field dad;
	public Field id;
	public IGRPSectionHeader sectionheader_1;
	public IGRPView view_1;
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
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		view_1 = new IGRPView("view_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("App builder"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		documento = new LinkField(model,"documento");
		documento.setLabel(gt("Help"));
		documento.setValue(gt("https://docs.igrp.cv/IGRP/app/webapps?r=tutorial/Listar_documentos/index&dad=tutorial&target=_blank&isPublic=1&lang=pt_PT;&p_type=new_app"));
		documento.propertie().add("name","p_documento").add("type","link").add("target","_newtab").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","[object Object]").add("img","fa-question-circle").add("maxlength","250").add("showlabel","true");
		
		status = new CheckBoxField(model,"status");
		status.setLabel(gt("Ativo?"));
		status.propertie().add("remote",Core.getIGRPLink("igrp_studio","ListaEnv","changeStatus")).add("name","p_status").add("type","checkbox").add("maxlength","30").add("switch","true").add("java-type","int").add("showLabel","true").add("group_in","").add("check","true").add("desc","true");
		
		status_check = new CheckBoxField(model,"status_check");
		status_check.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("switch","true").add("java-type","int").add("showLabel","true").add("group_in","").add("check","true").add("desc","true");
		
		name = new LinkField(model,"name");
		name.setLabel(gt("Name"));
		name.setValue(Core.getIGRPLink("igrp_studio","Env","index"));

									name_desc = new LinkField(model,"name_desc");
		name_desc.setLabel(gt("Name"));
		name.propertie().add("name","p_name").add("type","link").add("target","_newtab").add("request_fields","").add("class","link").add("img","fa-link").add("maxlength","30").add("show_header","true").add("refresh_submit","false").add("list_source","").add("showLabel","true").add("refresh_components","").add("group_in","").add("desc","true");
		
		dad = new TextField(model,"dad");
		dad.setLabel(gt("Código"));
		dad.propertie().add("name","p_dad").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","").add("showLabel","true").add("group_in","").add("tag","id");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_importar = new IGRPButton("Importar","igrp_studio","ListaEnv","importar","modal|refresh","danger|fa-upload","","");
		btn_importar.propertie.add("type","specific").add("rel","importar").add("refresh_components","");

		btn_novo = new IGRPButton("Novo","igrp_studio","ListaEnv","novo","modal|refresh","success|fa-plus","","");
		btn_novo.propertie.add("type","specific").add("rel","novo").add("refresh_components","");

		btn_editar = new IGRPButton("Editar","igrp_studio","ListaEnv","editar","mpsubmit|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("id","button_c6d1_e0a5").add("type","specific").add("class","warning").add("rel","editar").add("refresh_components","");

		btn_eliminar = new IGRPButton("Eliminar","igrp_studio","ListaEnv","eliminar","confirm","danger|fa-trash-o","","");
		btn_eliminar.propertie.add("id","button_62f1_debb").add("type","specific").add("class","danger").add("rel","eliminar").add("refresh_components","");

		btn_configurar_base_dados = new IGRPButton("Configurar Base Dados","igrp_studio","ListaEnv","configurar_base_dados","modal","black|fa-database","","");
		btn_configurar_base_dados.propertie.add("id","button_81be_6e42").add("type","specific").add("class","black").add("rel","configurar_base_dados").add("refresh_components","");

		btn_exportar = new IGRPButton("Export","igrp_studio","ListaEnv","exportar","confirm","default|fa-download","","");
		btn_exportar.propertie.add("id","button_c71f_27b5").add("type","specific").add("class","default").add("rel","exportar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		view_1.addField(documento);


		table_1.addField(status);
		table_1.addField(status_check);
		table_1.addField(name);
		table_1.addField(name_desc);
		table_1.addField(dad);
		table_1.addField(id);

		toolsbar_1.addButton(btn_importar);
		toolsbar_1.addButton(btn_novo);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_configurar_base_dados);
		table_1.addButton(btn_exportar);
		this.addToPage(sectionheader_1);
		this.addToPage(view_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		status.setValue(model);
		name.setValue(model);
		name_desc.setValue(model);
		dad.setValue(model);
		id.setValue(model);	

		table_1.loadModel(((ListaEnv) model).getTable_1());
		}
}
