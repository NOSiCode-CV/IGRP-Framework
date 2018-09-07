package nosi.webapps.igrp.pages.dash_board_processo;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import java.util.Map;
import java.util.HashMap;

public class Dash_board_processoView extends View {

	public Field nome_processo;
	public Field process_id;
	public Field detalhes_processo;
	public Field instanciasocorencias;
	public Field sectionheader_1_text;
	public Field n_processo;
	public Field descricao;
	public Field iniciado_em;
	public Field estado;
	public Field id;
	public Field process_definition;
	public Field process_key;
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
	public IGRPTable table_2;
	public IGRPForm tabcontent_1;
	public IGRPForm sectionheader_1;
	public IGRPTable table_1;
	public IGRPForm total_proc_finished;
	public IGRPForm total_proc_em_execucao;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_iniciar_novo_processo;
	public IGRPButton btn_show_diagram;
	public IGRPButton btn_cancelar_processo;

	public Dash_board_processoView(){

		this.setPageTitle("Dash Board Processo");
			
		table_2 = new IGRPTable("table_2","Lista de processos");

		tabcontent_1 = new IGRPForm("tabcontent_1","");

		sectionheader_1 = new IGRPForm("sectionheader_1","");

		table_1 = new IGRPTable("table_1","Instancias");

		total_proc_finished = new IGRPQuickButtonBox("total_proc_finished","");

		total_proc_em_execucao = new IGRPQuickButtonBox("total_proc_em_execucao","");

		nome_processo = new LinkField(model,"nome_processo");
		nome_processo.setLabel(gt("Nome Processo"));
		nome_processo.setValue(new Config().getResolveUrl("igrp","Dash_board_processo","index"));

									nome_processo.propertie().add("name","p_nome_processo").add("type","link").add("target","_self").add("request_fields","").add("maxlength","30").add("desc","true");
		
		process_id = new HiddenField(model,"process_id");
		process_id.setLabel(gt(""));
		process_id.propertie().add("name","p_process_id").add("type","hidden").add("maxlength","30").add("tag","process_id");
		
		detalhes_processo = new TextField(model,"detalhes_processo");
		detalhes_processo.setLabel(gt("Detalhes Processo"));
		detalhes_processo.propertie().add("name","p_detalhes_processo").add("type","button").add("request_fields","").add("maxlength","50");
		
		instanciasocorencias = new TextField(model,"instanciasocorencias");
		instanciasocorencias.setLabel(gt("Instancias/Ocorencias"));
		instanciasocorencias.propertie().add("name","p_instanciasocorencias").add("type","button").add("request_fields","").add("maxlength","50");
		
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Title process"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		n_processo = new LinkField(model,"n_processo");
		n_processo.setLabel(gt("Nº processo"));
		n_processo.setValue(new Config().getResolveUrl("igrp","Dash_board_processo","index"));

									n_processo.propertie().add("name","p_n_processo").add("type","link").add("target","mpsubmit").add("request_fields","").add("maxlength","30").add("desc","true");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descricao"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30");
		
		iniciado_em = new TextField(model,"iniciado_em");
		iniciado_em.setLabel(gt("Iniciado em"));
		iniciado_em.propertie().add("name","p_iniciado_em").add("type","text").add("maxlength","30");
		
		estado = new ColorField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","color").add("maxlength","30");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		
		process_definition = new HiddenField(model,"process_definition");
		process_definition.setLabel(gt(""));
		process_definition.propertie().add("name","p_process_definition").add("type","hidden").add("maxlength","30").add("tag","process_definition");
		
		process_key = new HiddenField(model,"process_key");
		process_key.setLabel(gt(""));
		process_key.propertie().add("name","p_process_key").add("type","hidden").add("maxlength","30").add("tag","process_key");
		
		total_proc_finished_title = new TextField(model,"total_proc_finished_title");
		total_proc_finished_title.setLabel(gt("Title"));
		total_proc_finished_title.setValue(gt("Box Title"));
		total_proc_finished_title.propertie().add("name","p_total_proc_finished_title").add("type","text").add("maxlength","4000");
		
		total_proc_finished_val = new TextField(model,"total_proc_finished_val");
		total_proc_finished_val.setLabel(gt("Value"));
		total_proc_finished_val.setValue(gt("528"));
		total_proc_finished_val.propertie().add("name","p_total_proc_finished_val").add("type","text").add("maxlength","4000");
		
		total_proc_finished_url = new TextField(model,"total_proc_finished_url");
		total_proc_finished_url.setLabel(gt(""));
		total_proc_finished_url.setValue(new Config().getResolveUrl("igrp","Dash_board_processo","index"));
		total_proc_finished_url.propertie().add("name","p_total_proc_finished_url").add("type","text").add("maxlength","4000");
		
		total_proc_finished_bg = new TextField(model,"total_proc_finished_bg");
		total_proc_finished_bg.setLabel(gt("Background"));
		total_proc_finished_bg.setValue(gt("cp-cyan"));
		total_proc_finished_bg.propertie().add("name","p_total_proc_finished_bg").add("type","text").add("maxlength","4000");
		
		total_proc_finished_icn = new TextField(model,"total_proc_finished_icn");
		total_proc_finished_icn.setLabel(gt("Icon"));
		total_proc_finished_icn.setValue(gt("fa-check"));
		total_proc_finished_icn.propertie().add("name","p_total_proc_finished_icn").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_title = new TextField(model,"total_proc_em_execucao_title");
		total_proc_em_execucao_title.setLabel(gt("Title"));
		total_proc_em_execucao_title.setValue(gt("Box Title"));
		total_proc_em_execucao_title.propertie().add("name","p_total_proc_em_execucao_title").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_val = new TextField(model,"total_proc_em_execucao_val");
		total_proc_em_execucao_val.setLabel(gt("Value"));
		total_proc_em_execucao_val.setValue(gt("537"));
		total_proc_em_execucao_val.propertie().add("name","p_total_proc_em_execucao_val").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_url = new TextField(model,"total_proc_em_execucao_url");
		total_proc_em_execucao_url.setLabel(gt(""));
		total_proc_em_execucao_url.setValue(new Config().getResolveUrl("igrp","Dash_board_processo","index"));
		total_proc_em_execucao_url.propertie().add("name","p_total_proc_em_execucao_url").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_bg = new TextField(model,"total_proc_em_execucao_bg");
		total_proc_em_execucao_bg.setLabel(gt("Background"));
		total_proc_em_execucao_bg.setValue(gt("cp-electric"));
		total_proc_em_execucao_bg.propertie().add("name","p_total_proc_em_execucao_bg").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_icn = new TextField(model,"total_proc_em_execucao_icn");
		total_proc_em_execucao_icn.setLabel(gt("Icon"));
		total_proc_em_execucao_icn.setValue(gt("fa-check"));
		total_proc_em_execucao_icn.propertie().add("name","p_total_proc_em_execucao_icn").add("type","text").add("maxlength","4000");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_iniciar_novo_processo = new IGRPButton("Iniciar processo","igrp","Dash_board_processo","iniciar_novo_processo","_self","success|fa-play","","");
		btn_iniciar_novo_processo.propertie.add("type","specific").add("rel","iniciar_novo_processo");

		btn_show_diagram = new IGRPButton("Show diagram","igrp","Dash_board_processo","show_diagram","mpsubmit","info|fa-eye","","");
		btn_show_diagram.propertie.add("type","specific").add("rel","show_diagram");

		btn_cancelar_processo = new IGRPButton("Cancelar processo","igrp","Dash_board_processo","cancelar_processo","confirm","danger|fa-times","","");
		btn_cancelar_processo.propertie.add("type","specific").add("rel","cancelar_processo");

		
	}
		
	@Override
	public void render(){
		
		table_2.addField(nome_processo);
		table_2.addField(process_id);


		tabcontent_1.addField(detalhes_processo);
		tabcontent_1.addField(instanciasocorencias);

		sectionheader_1.addField(sectionheader_1_text);

		table_1.addField(n_processo);
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

		toolsbar_1.addButton(btn_iniciar_novo_processo);
		table_1.addButton(btn_show_diagram);
		table_1.addButton(btn_cancelar_processo);
		this.addToPage(table_2);
		this.addToPage(tabcontent_1);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
		this.addToPage(total_proc_finished);
		this.addToPage(total_proc_em_execucao);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		nome_processo.setValue(model);
		process_id.setValue(model);
		detalhes_processo.setValue(model);
		instanciasocorencias.setValue(model);
		n_processo.setValue(model);
		descricao.setValue(model);
		iniciado_em.setValue(model);
		estado.setValue(model);
		id.setValue(model);
		process_definition.setValue(model);
		process_key.setValue(model);	

		table_2.loadModel(((Dash_board_processo) model).getTable_2());
		table_1.loadModel(((Dash_board_processo) model).getTable_1());
		}
}
