package nosi.webapps.igrp.pages.transferir_tarefas;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Transferir_tarefasView extends View {

	public Field sectionheader_1_text;
	public Field detalhes_de_processo;
	public Field numero_processo;
	public Field tipo_processo;
	public Field criado_por_;
	public Field data_inicio;
	public Field detalhes_de_tarefa;
	public Field n_tarefa;
	public Field descricao_de_tarefa;
	public Field atribuido_a;
	public Field novo_utilizador;
	public Field id_utilizador;
	public Field id;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;

	public IGRPButton btn_gravar;

	public Transferir_tarefasView(){

		this.setPageTitle("Transferir tarefas");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Transferêcia de Tarefa"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		detalhes_de_processo = new SeparatorField(model,"detalhes_de_processo");
		detalhes_de_processo.setLabel(gt("Detalhes de Processo"));
		detalhes_de_processo.propertie().add("name","p_detalhes_de_processo").add("type","separator").add("maxlength","250");
		
		numero_processo = new TextField(model,"numero_processo");
		numero_processo.setLabel(gt("Número Processo"));
		numero_processo.propertie().add("name","p_numero_processo").add("type","text").add("maxlength","100").add("required","false").add("readonly","false").add("disabled","true");
		
		tipo_processo = new TextField(model,"tipo_processo");
		tipo_processo.setLabel(gt("Tipo Processo"));
		tipo_processo.propertie().add("name","p_tipo_processo").add("type","text").add("maxlength","100").add("required","false").add("readonly","false").add("disabled","true");
		
		criado_por_ = new TextField(model,"criado_por_");
		criado_por_.setLabel(gt("Criado Por "));
		criado_por_.propertie().add("name","p_criado_por_").add("type","text").add("maxlength","100").add("required","false").add("readonly","false").add("disabled","true");
		
		data_inicio = new DateField(model,"data_inicio");
		data_inicio.setLabel(gt("Data Início"));
		data_inicio.propertie().add("name","p_data_inicio").add("type","date").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","true").add("range","false");
		
		detalhes_de_tarefa = new SeparatorField(model,"detalhes_de_tarefa");
		detalhes_de_tarefa.setLabel(gt("Detalhes de Tarefa"));
		detalhes_de_tarefa.propertie().add("name","p_detalhes_de_tarefa").add("type","separator").add("maxlength","250");
		
		n_tarefa = new TextField(model,"n_tarefa");
		n_tarefa.setLabel(gt("Nº Tarefa"));
		n_tarefa.propertie().add("name","p_n_tarefa").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","true");
		
		descricao_de_tarefa = new TextField(model,"descricao_de_tarefa");
		descricao_de_tarefa.setLabel(gt("Descrição de Tarefa"));
		descricao_de_tarefa.propertie().add("name","p_descricao_de_tarefa").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","true");
		
		atribuido_a = new TextField(model,"atribuido_a");
		atribuido_a.setLabel(gt("Atribuido à"));
		atribuido_a.propertie().add("name","p_atribuido_a").add("type","text").add("maxlength","100").add("required","false").add("readonly","false").add("disabled","true");
		
		novo_utilizador = new LookupField(model,"novo_utilizador");
		novo_utilizador.setLabel(gt("Novo Utilizador"));
		novo_utilizador.setLookup("igrp","Transferir_tarefas","index");
		novo_utilizador.addParam("target","_blank");
		novo_utilizador.propertie().add("name","p_novo_utilizador").add("type","lookup").add("lookup_type","LOOKUP").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false");
		
		id_utilizador = new HiddenField(model,"id_utilizador");
		id_utilizador.setLabel(gt(""));
		id_utilizador.propertie().add("name","p_id_utilizador").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","id_utilizador");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","100").add("java-type","String").add("tag","id");
		


		btn_gravar = new IGRPButton("Gravar","igrp","Transferir_tarefas","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","form").add("rel","gravar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(detalhes_de_processo);
		form_1.addField(numero_processo);
		form_1.addField(tipo_processo);
		form_1.addField(criado_por_);
		form_1.addField(data_inicio);
		form_1.addField(detalhes_de_tarefa);
		form_1.addField(n_tarefa);
		form_1.addField(descricao_de_tarefa);
		form_1.addField(atribuido_a);
		form_1.addField(novo_utilizador);
		form_1.addField(id_utilizador);
		form_1.addField(id);

		form_1.addButton(btn_gravar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		detalhes_de_processo.setValue(model);
		numero_processo.setValue(model);
		tipo_processo.setValue(model);
		criado_por_.setValue(model);
		data_inicio.setValue(model);
		detalhes_de_tarefa.setValue(model);
		n_tarefa.setValue(model);
		descricao_de_tarefa.setValue(model);
		atribuido_a.setValue(model);
		novo_utilizador.setValue(model);
		id_utilizador.setValue(model);
		id.setValue(model);	

		}
}
