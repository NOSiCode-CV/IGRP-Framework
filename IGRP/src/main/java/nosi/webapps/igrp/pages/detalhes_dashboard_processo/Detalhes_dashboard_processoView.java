package nosi.webapps.igrp.pages.detalhes_dashboard_processo;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import java.util.Map;
import java.util.HashMap;

public class Detalhes_dashboard_processoView extends View {

	public Field sectionheader_1_text;
	public Field total_proc_finished_title;
	public Field total_proc_finished_val;
	public Field total_proc_finished_url;
	public Field total_proc_finished_bg;
	public Field total_proc_finished_icn;
	public Field total_proc_em_execucao_title;
	public Field total_proc_em_execucao_val;
	public Field total_proc_em_execucao_url;
	public Field total_proc_em_execucao_bg;
	public Field total_proc_em_execucao_icn;
	public Field n_processo;
	public Field n_processo_desc;
	public Field descricao;
	public Field iniciado_em;
	public Field estado;
	public Field id;
	public Field process_definition;
	public Field process_key;
	public IGRPForm sectionheader_1;
	public IGRPForm total_proc_finished;
	public IGRPForm total_proc_em_execucao;
	public IGRPTable table_1;

	public IGRPButton btn_show_diagram;
	public IGRPButton btn_cancelar_processo;

	public Detalhes_dashboard_processoView(){

		this.setPageTitle("Detalhes Dashboard Processo");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		total_proc_finished = new IGRPQuickButtonBox("total_proc_finished","");

		total_proc_em_execucao = new IGRPQuickButtonBox("total_proc_em_execucao","");

		table_1 = new IGRPTable("table_1","Instancias / Ocorências");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>Detalhes do Processo</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		total_proc_finished_title = new TextField(model,"total_proc_finished_title");
		total_proc_finished_title.setLabel(gt("Title"));
		total_proc_finished_title.propertie().add("name","p_total_proc_finished_title").add("type","text").add("maxlength","4000");
		
		total_proc_finished_val = new TextField(model,"total_proc_finished_val");
		total_proc_finished_val.setLabel(gt("Value"));
		total_proc_finished_val.propertie().add("name","p_total_proc_finished_val").add("type","text").add("maxlength","4000");
		
		total_proc_finished_url = new TextField(model,"total_proc_finished_url");
		total_proc_finished_url.setLabel(gt(""));
		total_proc_finished_url.setValue(new Config().getResolveUrl("undefined","undefined","undefined"));
		total_proc_finished_url.propertie().add("name","p_total_proc_finished_url").add("type","text").add("maxlength","4000");
		
		total_proc_finished_bg = new TextField(model,"total_proc_finished_bg");
		total_proc_finished_bg.setLabel(gt("Background"));
		total_proc_finished_bg.propertie().add("name","p_total_proc_finished_bg").add("type","text").add("maxlength","4000");
		
		total_proc_finished_icn = new TextField(model,"total_proc_finished_icn");
		total_proc_finished_icn.setLabel(gt("Icon"));
		total_proc_finished_icn.propertie().add("name","p_total_proc_finished_icn").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_title = new TextField(model,"total_proc_em_execucao_title");
		total_proc_em_execucao_title.setLabel(gt("Title"));
		total_proc_em_execucao_title.propertie().add("name","p_total_proc_em_execucao_title").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_val = new TextField(model,"total_proc_em_execucao_val");
		total_proc_em_execucao_val.setLabel(gt("Value"));
		total_proc_em_execucao_val.propertie().add("name","p_total_proc_em_execucao_val").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_url = new TextField(model,"total_proc_em_execucao_url");
		total_proc_em_execucao_url.setLabel(gt(""));
		total_proc_em_execucao_url.setValue(new Config().getResolveUrl("undefined","undefined","undefined"));
		total_proc_em_execucao_url.propertie().add("name","p_total_proc_em_execucao_url").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_bg = new TextField(model,"total_proc_em_execucao_bg");
		total_proc_em_execucao_bg.setLabel(gt("Background"));
		total_proc_em_execucao_bg.propertie().add("name","p_total_proc_em_execucao_bg").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_icn = new TextField(model,"total_proc_em_execucao_icn");
		total_proc_em_execucao_icn.setLabel(gt("Icon"));
		total_proc_em_execucao_icn.propertie().add("name","p_total_proc_em_execucao_icn").add("type","text").add("maxlength","4000");
		
		n_processo = new LinkField(model,"n_processo");
		n_processo.setLabel(gt("Nº processo"));
		n_processo.setValue(new Config().getResolveUrl("igrp","Lista_terfa_de_processo","index"));

									n_processo_desc = new LinkField(model,"n_processo_desc");
		n_processo_desc.setLabel(gt("Nº processo"));
		n_processo.propertie().add("name","p_n_processo").add("type","link").add("target","submit").add("request_fields","").add("maxlength","30").add("refresh_submit","false").add("showLabel","true").add("show_header","true").add("desc","true");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descricao"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("showLabel","true");
		
		iniciado_em = new TextField(model,"iniciado_em");
		iniciado_em.setLabel(gt("Iniciado em"));
		iniciado_em.propertie().add("name","p_iniciado_em").add("type","text").add("maxlength","30").add("showLabel","true");
		
		estado = new ColorField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","color").add("maxlength","30").add("showLabel","true");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("showLabel","true").add("java-type","").add("tag","id");
		
		process_definition = new HiddenField(model,"process_definition");
		process_definition.setLabel(gt(""));
		process_definition.propertie().add("name","p_process_definition").add("type","hidden").add("maxlength","30").add("showLabel","true").add("java-type","").add("tag","process_definition");
		
		process_key = new HiddenField(model,"process_key");
		process_key.setLabel(gt(""));
		process_key.propertie().add("name","p_process_key").add("type","hidden").add("maxlength","30").add("showLabel","true").add("java-type","").add("tag","process_key");
		


		btn_show_diagram = new IGRPButton("Show diagram","igrp","Detalhes_dashboard_processo","show_diagram","mpsubmit","info|fa-eye","","");
		btn_show_diagram.propertie.add("type","specific").add("rel","show_diagram");

		btn_cancelar_processo = new IGRPButton("Cancelar processo","igrp","Detalhes_dashboard_processo","cancelar_processo","confirm","danger|fa-times","","");
		btn_cancelar_processo.propertie.add("type","specific").add("flg_transaction","true").add("rel","cancelar_processo");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		total_proc_finished.addField(total_proc_finished_title);
		total_proc_finished.addField(total_proc_finished_val);
		total_proc_finished.addField(total_proc_finished_url);
		total_proc_finished.addField(total_proc_finished_bg);
		total_proc_finished.addField(total_proc_finished_icn);

		total_proc_em_execucao.addField(total_proc_em_execucao_title);
		total_proc_em_execucao.addField(total_proc_em_execucao_val);
		total_proc_em_execucao.addField(total_proc_em_execucao_url);
		total_proc_em_execucao.addField(total_proc_em_execucao_bg);
		total_proc_em_execucao.addField(total_proc_em_execucao_icn);

		table_1.addField(n_processo);
		table_1.addField(n_processo_desc);
		table_1.addField(descricao);
		table_1.addField(iniciado_em);
		table_1.addField(estado);
		table_1.addField(id);
		table_1.addField(process_definition);
		table_1.addField(process_key);
		/* start table_1 legend colors*/
		Map<Object, Map<String, String>> table_1_colors= new HashMap<>();
		Map<String, String> color_1 = new HashMap<>();
		color_1.put("#dc2b4c","Terminado");
		table_1_colors.put("1",color_1);
		Map<String, String> color_2 = new HashMap<>();
		color_2.put("#1eed57","Em execucao");
		table_1_colors.put("2",color_2);
		this.table_1.setLegendColors(table_1_colors);
		/* end table_1 legend colors*/
		table_1.addButton(btn_show_diagram);
		table_1.addButton(btn_cancelar_processo);
		this.addToPage(sectionheader_1);
		this.addToPage(total_proc_finished);
		this.addToPage(total_proc_em_execucao);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		total_proc_finished_title.setValue(model);
		total_proc_finished_val.setValue(model);
		total_proc_finished_bg.setValue(model);
		total_proc_finished_icn.setValue(model);
		total_proc_em_execucao_title.setValue(model);
		total_proc_em_execucao_val.setValue(model);
		total_proc_em_execucao_bg.setValue(model);
		total_proc_em_execucao_icn.setValue(model);
		n_processo.setValue(model);
		n_processo_desc.setValue(model);
		descricao.setValue(model);
		iniciado_em.setValue(model);
		estado.setValue(model);
		id.setValue(model);
		process_definition.setValue(model);
		process_key.setValue(model);	

		table_1.loadModel(((Detalhes_dashboard_processo) model).getTable_1());
		}
}
