package nosi.webapps.igrp.pages.etapaaccess;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class EtapaaccessView extends View {

	public Field sectionheader_1_text;
	public Field id;
	public Field id_check;
	public Field descricao;
	public Field processid;
	public Field task_id;
	public Field env_fk;
	public IGRPSectionHeader sectionheader_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_associar_etapa_documento;

	public EtapaaccessView(){

		this.setPageTitle("EtapaAccess");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Associar Etapa a Organica/Perfil"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		id = new CheckBoxField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","checkbox").add("maxlength","255").add("switch","false").add("java-type","String").add("showLabel","true").add("group_in","").add("check","true").add("desc","true");
		
		id_check = new CheckBoxField(model,"id_check");
		id_check.propertie().add("name","p_id").add("type","checkbox").add("maxlength","255").add("switch","false").add("java-type","String").add("showLabel","true").add("group_in","").add("check","true").add("desc","true");
		
		descricao = new PlainTextField(model,"descricao");
		descricao.setLabel(gt("Descricao"));
		descricao.propertie().add("name","p_descricao").add("type","plaintext").add("disable_output_escaping","true").add("html_class","ff-fix").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		processid = new HiddenField(model,"processid");
		processid.setLabel(gt(""));
		processid.propertie().add("name","p_processid").add("type","hidden").add("maxlength","30").add("java-type","").add("showLabel","true").add("group_in","").add("tag","processid");
		
		task_id = new HiddenField(model,"task_id");
		task_id.setLabel(gt(""));
		task_id.propertie().add("name","p_task_id").add("type","hidden").add("maxlength","70").add("java-type","").add("showLabel","true").add("group_in","").add("tag","task_id");
		
		env_fk = new HiddenField(model,"env_fk");
		env_fk.setLabel(gt(""));
		env_fk.propertie().add("name","p_env_fk").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","Integer").add("tag","env_fk");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","Etapaaccess","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar").add("refresh_components","");

		btn_associar_etapa_documento = new IGRPButton("Associar Etapa-Documentos","igrp","Etapaaccess","associar_etapa_documento","_blank","black|fa-file","","");
		btn_associar_etapa_documento.propertie.add("id","button_8b47_a7fe").add("type","specific").add("class","black").add("rel","associar_etapa_documento").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		table_1.addField(id);
		table_1.addField(id_check);
		table_1.addField(descricao);
		table_1.addField(processid);
		table_1.addField(task_id);
		table_1.addField(env_fk);

		toolsbar_1.addButton(btn_gravar);
		table_1.addButton(btn_associar_etapa_documento);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		id.setValue(model);
		descricao.setValue(model);
		processid.setValue(model);
		task_id.setValue(model);
		env_fk.setValue(model);	

		table_1.loadModel(((Etapaaccess) model).getTable_1());
		}
}