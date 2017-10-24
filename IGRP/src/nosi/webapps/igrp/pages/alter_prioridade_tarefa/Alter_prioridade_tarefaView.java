/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.alter_prioridade_tarefa;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class Alter_prioridade_tarefaView extends View {
	
	
	public Field sectionheader_1_text;
	public Field tipo_da_tarefa;
	public Field data_criacao_da_tarefa;
	public Field data_inicio_da_tarefa;
	public Field data_fim_da_tarefa;
	public Field prioridade_da_tarefa;
	public Field tarefa_atribuida_por;
	public Field tarefa_atribuida_a;
	public Field tipo_de_processo;
	public Field numero_de_processo;
	public Field data_criacao_do_processo;
	public Field data_inicio_do_processo;
	public Field data_fim_do_processo;
	public Field nova_prioridade;
	public Field descricao_da_tarefa;
	public Field p_id;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPButton btn_salvar;
	public Alter_prioridade_tarefaView(Alter_prioridade_tarefa model){
		this.setPageTitle("Alter prioridade tarefa");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		
		sectionheader_1_text.setValue("Alterar prioridade da Tarefa");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		tipo_da_tarefa = new TextField(model,"tipo_da_tarefa");
		tipo_da_tarefa.setLabel("Tipo da Tarefa");
		
		tipo_da_tarefa.propertie().add("name","p_tipo_da_tarefa").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		data_criacao_da_tarefa = new DateField(model,"data_criacao_da_tarefa");
		data_criacao_da_tarefa.setLabel("Data Criação da Tarefa");
		
		data_criacao_da_tarefa.propertie().add("name","p_data_criacao_da_tarefa").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false").add("class","default");
		data_inicio_da_tarefa = new DateField(model,"data_inicio_da_tarefa");
		data_inicio_da_tarefa.setLabel("Data Início da Tarefa");
		
		data_inicio_da_tarefa.propertie().add("name","p_data_inicio_da_tarefa").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false").add("class","default");
		data_fim_da_tarefa = new DateField(model,"data_fim_da_tarefa");
		data_fim_da_tarefa.setLabel("Data Fim da Tarefa");
		
		data_fim_da_tarefa.propertie().add("name","p_data_fim_da_tarefa").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false").add("class","default");
		prioridade_da_tarefa = new TextField(model,"prioridade_da_tarefa");
		prioridade_da_tarefa.setLabel("Prioridade da Tarefa");
		
		prioridade_da_tarefa.propertie().add("name","p_prioridade_da_tarefa").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		tarefa_atribuida_por = new TextField(model,"tarefa_atribuida_por");
		tarefa_atribuida_por.setLabel("Tarefa Atribuida Por");
		
		tarefa_atribuida_por.propertie().add("name","p_tarefa_atribuida_por").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		tarefa_atribuida_a = new TextField(model,"tarefa_atribuida_a");
		tarefa_atribuida_a.setLabel("Tarefa Atribuida A");
		
		tarefa_atribuida_a.propertie().add("name","p_tarefa_atribuida_a").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		tipo_de_processo = new TextField(model,"tipo_de_processo");
		tipo_de_processo.setLabel("Tipo de Processo");
		
		tipo_de_processo.propertie().add("name","p_tipo_de_processo").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		numero_de_processo = new TextField(model,"numero_de_processo");
		numero_de_processo.setLabel("Número de Processo");
		
		numero_de_processo.propertie().add("name","p_numero_de_processo").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		data_criacao_do_processo = new DateField(model,"data_criacao_do_processo");
		data_criacao_do_processo.setLabel("Data Criação do Processo");
		
		data_criacao_do_processo.propertie().add("name","p_data_criacao_do_processo").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false").add("class","default");
		data_inicio_do_processo = new DateField(model,"data_inicio_do_processo");
		data_inicio_do_processo.setLabel("Data Início do Processo");
		
		data_inicio_do_processo.propertie().add("name","p_data_inicio_do_processo").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false").add("class","default");
		data_fim_do_processo = new DateField(model,"data_fim_do_processo");
		data_fim_do_processo.setLabel("Data Fim do Processo");
		
		data_fim_do_processo.propertie().add("name","p_data_fim_do_processo").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false").add("class","default");
		nova_prioridade = new ListField(model,"nova_prioridade");
		nova_prioridade.setLabel("Nova Prioridade");
		
		nova_prioridade.propertie().add("name","p_nova_prioridade").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		descricao_da_tarefa = new TextAreaField(model,"descricao_da_tarefa");
		descricao_da_tarefa.setLabel("Descrição da Tarefa");
		
		descricao_da_tarefa.propertie().add("name","p_descricao_da_tarefa").add("type","textarea").add("maxlength","2000").add("required","false").add("change","false").add("readonly","true").add("disabled","false").add("placeholder","").add("right","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		btn_salvar = new IGRPButton("Gravar","igrp","Alter_prioridade_tarefa","salvar","submit","info|fa-save","","");
		btn_salvar.propertie.add("type","form").add("code","").add("class","primary").add("rel","salvar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(tipo_da_tarefa);
		form_1.addField(data_criacao_da_tarefa);
		form_1.addField(data_inicio_da_tarefa);
		form_1.addField(data_fim_da_tarefa);
		form_1.addField(prioridade_da_tarefa);
		form_1.addField(tarefa_atribuida_por);
		form_1.addField(tarefa_atribuida_a);
		form_1.addField(tipo_de_processo);
		form_1.addField(numero_de_processo);
		form_1.addField(data_criacao_do_processo);
		form_1.addField(data_inicio_do_processo);
		form_1.addField(data_fim_do_processo);
		form_1.addField(nova_prioridade);
		form_1.addField(descricao_da_tarefa);
		form_1.addField(p_id);

		form_1.addButton(btn_salvar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
	}
}
/*-------------------------*/