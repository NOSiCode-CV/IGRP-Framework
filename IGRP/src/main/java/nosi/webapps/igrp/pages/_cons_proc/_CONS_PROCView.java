package nosi.webapps.igrp.pages._cons_proc;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import java.util.Map;
import java.util.HashMap;

public class _CONS_PROCView extends View {

	public Field aplicacao;
	public Field tipo_processo;
	public Field cbx_utilizador;
	public Field status;
	public Field referencia_pedido;
	public Field requerente;
	public Field num;
	public Field intervalo_entrada;
	public Field dt_ini;
	public Field dt_fim;
	public Field num_processo;
	public Field processo;
	public Field eatapa;
	public Field dt_inicio_etapa;
	public Field dt_fim_etapa;
	public Field atribuido_a;
	public Field estado;
	public Field id_task;
	public IGRPForm form;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;
	public IGRPButton btn_ver_etapa;
	public IGRPButton btn_ver_processo;

	public _CONS_PROCView(){

		this.setPageTitle("Consulta Processo");
			
		form = new IGRPForm("form","");

		table_1 = new IGRPTable("table_1","");

		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		tipo_processo = new ListField(model,"tipo_processo");
		tipo_processo.setLabel(gt("Tipo Processo"));
		tipo_processo.propertie().add("name","p_tipo_processo").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		cbx_utilizador = new ListField(model,"cbx_utilizador");
		cbx_utilizador.setLabel(gt("Utilizador"));
		cbx_utilizador.propertie().add("name","p_cbx_utilizador").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		status = new ListField(model,"status");
		status.setLabel(gt("Estado"));
		status.propertie().add("name","p_status").add("type","select").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("disabled","false").add("java-type","").add("tags","false");
		
		referencia_pedido = new SeparatorField(model,"referencia_pedido");
		referencia_pedido.setLabel(gt("Referencia Pedido"));
		referencia_pedido.propertie().add("type","separator").add("name","p_referencia_pedido").add("maxlength","30").add("desclabel","false");
		
		requerente = new TextField(model,"requerente");
		requerente.setLabel(gt("Requerente"));
		requerente.propertie().add("name","p_requerente").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		num = new TextField(model,"num");
		num.setLabel(gt("N   Processo"));
		num.propertie().add("name","p_num").add("type","text").add("maxlength","150").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		intervalo_entrada = new SeparatorField(model,"intervalo_entrada");
		intervalo_entrada.setLabel(gt("Intervalo Entrada"));
		intervalo_entrada.propertie().add("type","separator").add("name","p_intervalo_entrada").add("maxlength","30").add("desclabel","false");
		
		dt_ini = new DateField(model,"dt_ini");
		dt_ini.setLabel(gt("Data Inicio"));
		dt_ini.propertie().add("name","p_dt_ini").add("type","date").add("maxlength","30").add("range","false").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		dt_fim = new DateField(model,"dt_fim");
		dt_fim.setLabel(gt("Data Fim"));
		dt_fim.propertie().add("name","p_dt_fim").add("type","date").add("maxlength","30").add("range","false").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		num_processo = new TextField(model,"num_processo");
		num_processo.setLabel(gt("Nº"));
		num_processo.propertie().add("name","p_num_processo").add("type","text").add("maxlength","30").add("showLabel","true");
		
		processo = new TextField(model,"processo");
		processo.setLabel(gt("Processo"));
		processo.propertie().add("name","p_processo").add("type","text").add("maxlength","100").add("showLabel","true");
		
		eatapa = new TextField(model,"eatapa");
		eatapa.setLabel(gt("Eatapa"));
		eatapa.propertie().add("name","p_eatapa").add("type","text").add("maxlength","100").add("showLabel","true");
		
		dt_inicio_etapa = new TextField(model,"dt_inicio_etapa");
		dt_inicio_etapa.setLabel(gt("Dt. Inicio Etapa"));
		dt_inicio_etapa.propertie().add("name","p_dt_inicio_etapa").add("type","text").add("maxlength","30").add("showLabel","true");
		
		dt_fim_etapa = new TextField(model,"dt_fim_etapa");
		dt_fim_etapa.setLabel(gt("Dt. Fim Etapa"));
		dt_fim_etapa.propertie().add("name","p_dt_fim_etapa").add("type","text").add("maxlength","30").add("showLabel","true");
		
		atribuido_a = new TextField(model,"atribuido_a");
		atribuido_a.setLabel(gt("Atribuido a"));
		atribuido_a.propertie().add("name","p_atribuido_a").add("type","text").add("maxlength","30").add("showLabel","true");
		
		estado = new ColorField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","color").add("maxlength","30").add("showLabel","true");
		
		id_task = new HiddenField(model,"id_task");
		id_task.setLabel(gt(""));
		id_task.propertie().add("name","p_id_task").add("type","hidden").add("maxlength","100").add("showLabel","true").add("java-type","").add("tag","id_task");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","_CONS_PROC","pesquisar","submit_form","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		btn_ver_etapa = new IGRPButton("Ver Etapa","igrp","_CONS_PROC","ver_etapa","mpsubmit","warning|fa-list-ol","","");
		btn_ver_etapa.propertie.add("type","specific").add("rel","ver_etapa");

		btn_ver_processo = new IGRPButton("Ver Processo","igrp","_CONS_PROC","ver_processo","mpsubmit","primary|fa-sitemap","","");
		btn_ver_processo.propertie.add("type","specific").add("rel","ver_processo");

		
	}
		
	@Override
	public void render(){
		
		form.addField(aplicacao);
		form.addField(tipo_processo);
		form.addField(cbx_utilizador);
		form.addField(status);
		form.addField(referencia_pedido);
		form.addField(requerente);
		form.addField(num);
		form.addField(intervalo_entrada);
		form.addField(dt_ini);
		form.addField(dt_fim);

		table_1.addField(num_processo);
		table_1.addField(processo);
		table_1.addField(eatapa);
		table_1.addField(dt_inicio_etapa);
		table_1.addField(dt_fim_etapa);
		table_1.addField(atribuido_a);
		table_1.addField(estado);
		table_1.addField(id_task);
		/* start table_1 legend colors*/
		Map<Object, Map<String, String>> table_1_colors= new HashMap<>();
		Map<String, String> color_1 = new HashMap<>();
		color_1.put("#ea263e","Terminado");
		table_1_colors.put("1",color_1);
		Map<String, String> color_2 = new HashMap<>();
		color_2.put("#2652ea","Não Atribuido");
		table_1_colors.put("2",color_2);
		Map<String, String> color_3 = new HashMap<>();
		color_3.put("#95c11f","Em Execução");
		table_1_colors.put("3",color_3);
		this.table_1.setLegendColors(table_1_colors);
		/* end table_1 legend colors*/
		form.addButton(btn_pesquisar);
		table_1.addButton(btn_ver_etapa);
		table_1.addButton(btn_ver_processo);
		this.addToPage(form);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		tipo_processo.setValue(model);
		cbx_utilizador.setValue(model);
		status.setValue(model);
		referencia_pedido.setValue(model);
		requerente.setValue(model);
		num.setValue(model);
		intervalo_entrada.setValue(model);
		dt_ini.setValue(model);
		dt_fim.setValue(model);
		num_processo.setValue(model);
		processo.setValue(model);
		eatapa.setValue(model);
		dt_inicio_etapa.setValue(model);
		dt_fim_etapa.setValue(model);
		atribuido_a.setValue(model);
		estado.setValue(model);
		id_task.setValue(model);	

		table_1.loadModel(((_CONS_PROC) model).getTable_1());
		}
}
