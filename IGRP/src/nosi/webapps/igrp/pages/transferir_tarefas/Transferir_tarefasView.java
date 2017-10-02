/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.transferir_tarefas;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class Transferir_tarefasView extends View {
	
	
	public Field sectionheader_1_text;
	public Field numero_processo;
	public Field codigo_processo;
	public Field tipo_processo;
	public Field data_criacao;
	public Field data_inicio;
	public Field data_fim;
	public Field criado_por_;
	public Field atribuido_por;
	public Field utilizador_actual;
	public LookupField novo_utilizador;
	public Field p_id_utilizador;
	public Field p_id;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPButton btn_gravar;
	public Transferir_tarefasView(Transferir_tarefas model){
		this.setPageTitle("Transferir tarefas");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		
		sectionheader_1_text.setValue("Transferêcia de Processos");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		numero_processo = new TextField(model,"numero_processo");
		numero_processo.setLabel("Número Processo");
		
		numero_processo.propertie().add("name","p_numero_processo").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		codigo_processo = new TextField(model,"codigo_processo");
		codigo_processo.setLabel("Código Processo");
		
		codigo_processo.propertie().add("name","p_codigo_processo").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		tipo_processo = new TextField(model,"tipo_processo");
		tipo_processo.setLabel("Tipo Processo");
		
		tipo_processo.propertie().add("name","p_tipo_processo").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		data_criacao = new DateField(model,"data_criacao");
		data_criacao.setLabel("Data Criação");
		
		data_criacao.propertie().add("name","p_data_criacao").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false").add("class","default");
		data_inicio = new DateField(model,"data_inicio");
		data_inicio.setLabel("Data Início");
		
		data_inicio.propertie().add("name","p_data_inicio").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false").add("class","default");
		data_fim = new DateField(model,"data_fim");
		data_fim.setLabel("Data Fim");
		
		data_fim.propertie().add("name","p_data_fim").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false").add("class","default");
		criado_por_ = new TextField(model,"criado_por_");
		criado_por_.setLabel("Criado Por ");
		
		criado_por_.propertie().add("name","p_criado_por_").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		atribuido_por = new TextField(model,"atribuido_por");
		atribuido_por.setLabel("Atribuido Por");
		
		atribuido_por.propertie().add("name","p_atribuido_por").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		utilizador_actual = new TextField(model,"utilizador_actual");
		utilizador_actual.setLabel("Utilizador Actual");
		
		utilizador_actual.propertie().add("name","p_utilizador_actual").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		novo_utilizador = new LookupField(model,"novo_utilizador");
		novo_utilizador.setLabel("Novo Utilizador");
		
		novo_utilizador.propertie().add("name","p_novo_utilizador").add("type","lookup").add("action","index").add("page","Transferir_tarefas").add("app","igrp").add("lookup_type","LOOKUP").add("class","primary").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		p_id_utilizador = new HiddenField(model,"p_id_utilizador");
		p_id_utilizador.setLabel("");
		
		p_id_utilizador.propertie().add("name","p_id_utilizador").add("type","hidden").add("maxlength","30").add("tag","id_utilizador");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","100").add("tag","id");

		btn_gravar = new IGRPButton("Gravar","igrp","Transferir_tarefas","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","form").add("code","").add("class","success").add("rel","gravar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(numero_processo);
		form_1.addField(codigo_processo);
		form_1.addField(tipo_processo);
		form_1.addField(data_criacao);
		form_1.addField(data_inicio);
		form_1.addField(data_fim);
		form_1.addField(criado_por_);
		form_1.addField(atribuido_por);
		form_1.addField(utilizador_actual);
		form_1.addField(novo_utilizador);
		form_1.addField(p_id_utilizador);
		form_1.addField(p_id);

		form_1.addButton(btn_gravar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
	}
}
/*-------------------------*/