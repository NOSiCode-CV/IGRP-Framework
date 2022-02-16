package nosi.webapps.igrp.pages._cons_proc;

import java.util.Map;

import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;

import static nosi.core.i18n.Translator.gt;

import java.util.LinkedHashMap;

public class _CONS_PROCView extends View {

	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field tipo_processo;
	public Field cbx_utilizador;
	public Field referencia_pedido;
	public Field requerente;
	public Field num;
	public Field status;
	public Field intervalo_entrada;
	public Field dt_ini;
	public Field dt_fim;
	public Field estado;
	public Field num_processo;
	public Field processo;
	public Field eatapa;
	public Field dt_inicio_etapa;
	public Field dt_fim_etapa;
	public Field atribuido_a;
	public Field id_task;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;
	public IGRPButton btn_ver_etapa;
	public IGRPButton btn_ver_processo;

	public _CONS_PROCView(){

		this.setPageTitle("Consulta Processo");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		form = new IGRPForm("form","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>Consultar Processo</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		tipo_processo = new ListField(model,"tipo_processo");
		tipo_processo.setLabel(gt("Processo"));
		tipo_processo.propertie().add("name","p_tipo_processo").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		cbx_utilizador = new ListField(model,"cbx_utilizador");
		cbx_utilizador.setLabel(gt("Utilizador"));
		cbx_utilizador.propertie().add("name","p_cbx_utilizador").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		referencia_pedido = new SeparatorField(model,"referencia_pedido");
		referencia_pedido.setLabel(gt("Referencia Pedido"));
		referencia_pedido.propertie().add("type","separator").add("name","p_referencia_pedido").add("maxlength","30").add("placeholder",gt("")).add("desclabel","false");
		
		requerente = new TextField(model,"requerente");
		requerente.setLabel(gt("Requerente"));
		requerente.propertie().add("name","p_requerente").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		num = new TextField(model,"num");
		num.setLabel(gt("Nº Processo"));
		num.propertie().add("name","p_num").add("type","text").add("maxlength","150").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		status = new ListField(model,"status");
		status.setLabel(gt("Estado"));
		status.propertie().add("name","p_status").add("type","select").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("disabled","false").add("java-type","").add("tags","false");
		
		intervalo_entrada = new SeparatorField(model,"intervalo_entrada");
		intervalo_entrada.setLabel(gt("Intervalo Entrada"));
		intervalo_entrada.propertie().add("type","separator").add("name","p_intervalo_entrada").add("maxlength","30").add("placeholder",gt("")).add("desclabel","false");
		
		dt_ini = new DateField(model,"dt_ini");
		dt_ini.setLabel(gt("Data Inicio"));
		dt_ini.propertie().add("name","p_dt_ini").add("type","date").add("maxlength","30").add("range","false").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("class","success").add("desclabel","false");
		
		dt_fim = new DateField(model,"dt_fim");
		dt_fim.setLabel(gt("Data Fim"));
		dt_fim.propertie().add("name","p_dt_fim").add("type","date").add("maxlength","30").add("range","false").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("class","danger").add("desclabel","false");
		
		estado = new ColorField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","color").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		num_processo = new TextField(model,"num_processo");
		num_processo.setLabel(gt("Nº"));
		num_processo.propertie().add("name","p_num_processo").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		processo = new TextField(model,"processo");
		processo.setLabel(gt("Processo"));
		processo.propertie().add("name","p_processo").add("type","text").add("maxlength","100").add("showLabel","true").add("group_in","");
		
		eatapa = new TextField(model,"eatapa");
		eatapa.setLabel(gt("Etapa"));
		eatapa.propertie().add("name","p_eatapa").add("type","text").add("maxlength","100").add("showLabel","true").add("group_in","");
		
		dt_inicio_etapa = new TextField(model,"dt_inicio_etapa");
		dt_inicio_etapa.setLabel(gt("Dt. Inicio Etapa"));
		dt_inicio_etapa.propertie().add("name","p_dt_inicio_etapa").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		dt_fim_etapa = new TextField(model,"dt_fim_etapa");
		dt_fim_etapa.setLabel(gt("Dt. Fim Etapa"));
		dt_fim_etapa.propertie().add("name","p_dt_fim_etapa").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		atribuido_a = new TextField(model,"atribuido_a");
		atribuido_a.setLabel(gt("Atribuido a"));
		atribuido_a.propertie().add("name","p_atribuido_a").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		id_task = new HiddenField(model,"id_task");
		id_task.setLabel(gt(""));
		id_task.propertie().add("name","p_id_task").add("type","hidden").add("maxlength","100").add("showLabel","true").add("java-type","").add("group_in","").add("tag","id_task");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","_CONS_PROC","pesquisar","submit_ajax","primary|fa-search","","");
		btn_pesquisar.propertie.add("id","button_433f_034e").add("type","form").add("class","primary").add("rel","pesquisar").add("refresh_components","table_1");

		btn_ver_etapa = new IGRPButton("Detalhes da Tarefa","igrp","_CONS_PROC","ver_etapa","mpsubmit","warning|fa-file-text","","");
		btn_ver_etapa.propertie.add("id","button_8d65_c46a").add("type","specific").add("class","warning").add("rel","ver_etapa").add("refresh_components","");

		btn_ver_processo = new IGRPButton("Detalhes de Processo","igrp","_CONS_PROC","ver_processo","mpsubmit","primary|fa-sitemap","","");
		btn_ver_processo.propertie.add("id","button_893d_357f").add("type","specific").add("class","primary").add("rel","ver_processo").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form.addField(aplicacao);
		form.addField(tipo_processo);
		form.addField(cbx_utilizador);
		form.addField(referencia_pedido);
		form.addField(requerente);
		form.addField(num);
		form.addField(status);
		form.addField(intervalo_entrada);
		form.addField(dt_ini);
		form.addField(dt_fim);

		table_1.addField(estado);
		table_1.addField(num_processo);
		table_1.addField(processo);
		table_1.addField(eatapa);
		table_1.addField(dt_inicio_etapa);
		table_1.addField(dt_fim_etapa);
		table_1.addField(atribuido_a);
		table_1.addField(id_task);
		/* start table_1 legend colors*/
		Map<Object, Map<String, String>> table_1_colors= new LinkedHashMap<>();
		Map<String, String> color_ea263e_table_1 = new LinkedHashMap<>();
		color_ea263e_table_1.put("#ea263e","Terminado");
		table_1_colors.put("1",color_ea263e_table_1);
		Map<String, String> color_2652ea_table_1 = new LinkedHashMap<>();
		color_2652ea_table_1.put("#2652ea","Não Atribuido");
		table_1_colors.put("2",color_2652ea_table_1);
		Map<String, String> color_95c11f_table_1 = new LinkedHashMap<>();
		color_95c11f_table_1.put("#95c11f","Em Execução");
		table_1_colors.put("3",color_95c11f_table_1);
		this.table_1.setLegendColors(table_1_colors);
		/* end table_1 legend colors*/
		form.addButton(btn_pesquisar);
		table_1.addButton(btn_ver_etapa);
		table_1.addButton(btn_ver_processo);
		this.addToPage(sectionheader_1);
		this.addToPage(form);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		tipo_processo.setValue(model);
		cbx_utilizador.setValue(model);
		referencia_pedido.setValue(model);
		requerente.setValue(model);
		num.setValue(model);
		status.setValue(model);
		intervalo_entrada.setValue(model);
		dt_ini.setValue(model);
		dt_fim.setValue(model);
		estado.setValue(model);
		num_processo.setValue(model);
		processo.setValue(model);
		eatapa.setValue(model);
		dt_inicio_etapa.setValue(model);
		dt_fim_etapa.setValue(model);
		atribuido_a.setValue(model);
		id_task.setValue(model);	

		table_1.loadModel(((_CONS_PROC) model).getTable_1());
		}
}
