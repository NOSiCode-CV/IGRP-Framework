package cv.nosi.webapps.igrp.pages.locketapa;

import static cv.nosi.core.i18n.Translator.gt;

import cv.nosi.core.gui.components.*;
import cv.nosi.core.gui.fields.*;
import cv.nosi.core.webapp.mvc.Model;
import cv.nosi.core.webapp.mvc.View;

public class LocketapaView extends View {

	public Field sectionheader_1_text;
	public Field codigo;
	public Field codigo_check;
	public Field organica;
	public Field perfil;
	public Field processid;
	public Field taskid;
	public IGRPSectionHeader sectionheader_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_desbloquear;

	public LocketapaView(){

		this.setPageTitle("LockEtapa");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>Lista Bloqueio Etapas</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		codigo = new CheckBoxField(model,"codigo");
		codigo.setLabel(gt(""));
		codigo.propertie().add("name","p_codigo").add("type","checkbox").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","int").add("switch","false").add("check","true").add("desc","true");
		
		codigo_check = new CheckBoxField(model,"codigo_check");
		codigo_check.propertie().add("name","p_codigo").add("type","checkbox").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","int").add("switch","false").add("check","true").add("desc","true");
		
		organica = new PlainTextField(model,"organica");
		organica.setLabel(gt("Orgânica"));
		organica.propertie().add("name","p_organica").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","100").add("showLabel","true").add("group_in","");
		
		perfil = new PlainTextField(model,"perfil");
		perfil.setLabel(gt("Perfil"));
		perfil.propertie().add("name","p_perfil").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","100").add("showLabel","true").add("group_in","");
		
		processid = new HiddenField(model,"processid");
		processid.setLabel(gt(""));
		processid.propertie().add("name","p_processid").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","").add("tag","processid");
		
		taskid = new HiddenField(model,"taskid");
		taskid.setLabel(gt(""));
		taskid.propertie().add("name","p_taskId").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","").add("tag","taskid");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_desbloquear = new IGRPButton("Desbloquear","igrp","Locketapa","desbloquear","submit","success|fa-unlock","","");
		btn_desbloquear.propertie.add("type","specific").add("rel","desbloquear").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		table_1.addField(codigo);
		table_1.addField(codigo_check);
		table_1.addField(organica);
		table_1.addField(perfil);
		table_1.addField(processid);
		table_1.addField(taskid);


		toolsbar_1.addButton(btn_desbloquear);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		codigo.setValue(model);
		organica.setValue(model);
		perfil.setValue(model);
		processid.setValue(model);
		taskid.setValue(model);	

		table_1.loadModel(((Locketapa) model).getTable_1());
		}
}
