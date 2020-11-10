package cv.nosi.webapps.igrp.pages.alter_prioridade_tarefa;

import static cv.nosi.core.i18n.Translator.gt;

import cv.nosi.core.gui.components.*;
import cv.nosi.core.gui.fields.*;
import cv.nosi.core.webapp.mvc.Model;
import cv.nosi.core.webapp.mvc.View;

public class Alter_prioridade_tarefaView extends View {

	public Field sectionheader_1_text;
	public Field nova_prioridade;
	public Field id;
	public Field detalhes_do_processo;
	public Field tipo_de_processo;
	public Field numero_de_processo;
	public Field data_inicio_do_processo;
	public Field detalhes_da_tarefa;
	public Field descricao_da_tarefa;
	public Field data_inicio_da_tarefa;
	public Field prioridade_da_tarefa;
	public Field tarefa_atribuida_por;
	public Field tarefa_atribuida_a;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPView view_1;

	public IGRPButton btn_salvar;

	public Alter_prioridade_tarefaView(){

		this.setPageTitle("Alter prioridade tarefa");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		view_1 = new IGRPView("view_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Alterar prioridade da Tarefa"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		nova_prioridade = new RadioListField(model,"nova_prioridade");
		nova_prioridade.setLabel(gt("Nova Prioridade"));
		nova_prioridade.propertie().add("name","p_nova_prioridade").add("type","radiolist").add("domain","").add("maxlength","30").add("required","true").add("readonly","false").add("disabled","false").add("child_size","12").add("java-type","");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","id");
		
		detalhes_do_processo = new SeparatorField(model,"detalhes_do_processo");
		detalhes_do_processo.setLabel(gt("Detalhes do Processo"));
		detalhes_do_processo.propertie().add("name","p_detalhes_do_processo").add("type","separator").add("maxlength","250").add("class","default").add("img","").add("showlabel","true");
		
		tipo_de_processo = new TextField(model,"tipo_de_processo");
		tipo_de_processo.setLabel(gt("Tipo de Processo"));
		tipo_de_processo.propertie().add("name","p_tipo_de_processo").add("type","text").add("maxlength","250").add("class","default").add("img","").add("showlabel","true");
		
		numero_de_processo = new TextField(model,"numero_de_processo");
		numero_de_processo.setLabel(gt("Número de Processo"));
		numero_de_processo.propertie().add("name","p_numero_de_processo").add("type","text").add("maxlength","250").add("class","default").add("img","").add("showlabel","true");
		
		data_inicio_do_processo = new DateField(model,"data_inicio_do_processo");
		data_inicio_do_processo.setLabel(gt("Data Início do Processo"));
		data_inicio_do_processo.propertie().add("name","p_data_inicio_do_processo").add("type","date").add("range","false").add("maxlength","250").add("class","default").add("img","").add("showlabel","true");
		
		detalhes_da_tarefa = new SeparatorField(model,"detalhes_da_tarefa");
		detalhes_da_tarefa.setLabel(gt("Detalhes da Tarefa"));
		detalhes_da_tarefa.propertie().add("name","p_detalhes_da_tarefa").add("type","separator").add("maxlength","250").add("class","default").add("img","").add("showlabel","true");
		
		descricao_da_tarefa = new TextAreaField(model,"descricao_da_tarefa");
		descricao_da_tarefa.setLabel(gt("Descrição da Tarefa"));
		descricao_da_tarefa.propertie().add("name","p_descricao_da_tarefa").add("type","textarea").add("maxlength","250").add("class","default").add("img","").add("showlabel","true");
		
		data_inicio_da_tarefa = new DateField(model,"data_inicio_da_tarefa");
		data_inicio_da_tarefa.setLabel(gt("Data Início da Tarefa"));
		data_inicio_da_tarefa.propertie().add("name","p_data_inicio_da_tarefa").add("type","date").add("range","false").add("maxlength","250").add("class","default").add("img","").add("showlabel","true");
		
		prioridade_da_tarefa = new TextField(model,"prioridade_da_tarefa");
		prioridade_da_tarefa.setLabel(gt("Prioridade da Tarefa"));
		prioridade_da_tarefa.propertie().add("name","p_prioridade_da_tarefa").add("type","text").add("maxlength","250").add("class","default").add("img","").add("showlabel","true");
		
		tarefa_atribuida_por = new TextField(model,"tarefa_atribuida_por");
		tarefa_atribuida_por.setLabel(gt("Tarefa Atribuida Por"));
		tarefa_atribuida_por.propertie().add("name","p_tarefa_atribuida_por").add("type","text").add("maxlength","250").add("class","default").add("img","").add("showlabel","true");
		
		tarefa_atribuida_a = new TextField(model,"tarefa_atribuida_a");
		tarefa_atribuida_a.setLabel(gt("Tarefa Atribuida A"));
		tarefa_atribuida_a.propertie().add("name","p_tarefa_atribuida_a").add("type","text").add("maxlength","250").add("class","default").add("img","").add("showlabel","true");
		


		btn_salvar = new IGRPButton("Salvar","igrp","Alter_prioridade_tarefa","salvar","submit","primary|fa-save","","");
		btn_salvar.propertie.add("id","button_6990_5041").add("type","form").add("class","primary").add("rel","salvar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(nova_prioridade);
		form_1.addField(id);

		view_1.addField(detalhes_do_processo);
		view_1.addField(tipo_de_processo);
		view_1.addField(numero_de_processo);
		view_1.addField(data_inicio_do_processo);
		view_1.addField(detalhes_da_tarefa);
		view_1.addField(descricao_da_tarefa);
		view_1.addField(data_inicio_da_tarefa);
		view_1.addField(prioridade_da_tarefa);
		view_1.addField(tarefa_atribuida_por);
		view_1.addField(tarefa_atribuida_a);

		form_1.addButton(btn_salvar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(view_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		nova_prioridade.setValue(model);
		id.setValue(model);
		detalhes_do_processo.setValue(model);
		tipo_de_processo.setValue(model);
		numero_de_processo.setValue(model);
		data_inicio_do_processo.setValue(model);
		detalhes_da_tarefa.setValue(model);
		descricao_da_tarefa.setValue(model);
		data_inicio_da_tarefa.setValue(model);
		prioridade_da_tarefa.setValue(model);
		tarefa_atribuida_por.setValue(model);
		tarefa_atribuida_a.setValue(model);	

		}
}
