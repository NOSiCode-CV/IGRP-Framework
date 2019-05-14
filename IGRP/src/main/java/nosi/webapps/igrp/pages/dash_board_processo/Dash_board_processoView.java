package nosi.webapps.igrp.pages.dash_board_processo;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Dash_board_processoView extends View {

	public Field sectionheader_1_text;
	public Field nome_processo;
	public Field process_id;
	public Field process_key;
	public IGRPForm sectionheader_1;
	public IGRPTable table_2;

	public IGRPButton btn_iniciar_processo;
	public IGRPButton btn_detalhes_processo;

	public Dash_board_processoView(){

		this.setPageTitle("Dash Board Processo");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		table_2 = new IGRPTable("table_2","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>Lista de Processos</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		nome_processo = new TextField(model,"nome_processo");
		nome_processo.setLabel(gt("Nome Processo"));
		nome_processo.propertie().add("name","p_nome_processo").add("type","text").add("maxlength","30").add("showLabel","true");
		
		process_id = new HiddenField(model,"process_id");
		process_id.setLabel(gt(""));
		process_id.propertie().add("name","p_process_id").add("type","hidden").add("maxlength","30").add("showLabel","true").add("java-type","String").add("tag","process_id");
		
		process_key = new HiddenField(model,"process_key");
		process_key.setLabel(gt(""));
		process_key.propertie().add("name","p_process_key").add("type","hidden").add("maxlength","30").add("showLabel","true").add("java-type","String").add("tag","process_key");
		


		btn_iniciar_processo = new IGRPButton("Iniciar Processo","igrp","Dash_board_processo","iniciar_processo","alert_submit","success|fa-play","","");
		btn_iniciar_processo.propertie.add("type","specific").add("rel","iniciar_processo");

		btn_detalhes_processo = new IGRPButton("Detalhes Processo","igrp","Dash_board_processo","detalhes_processo","mpsubmit","info|fa-tasks","","");
		btn_detalhes_processo.propertie.add("type","specific").add("rel","detalhes_processo");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		table_2.addField(nome_processo);
		table_2.addField(process_id);
		table_2.addField(process_key);

		table_2.addButton(btn_iniciar_processo);
		table_2.addButton(btn_detalhes_processo);
		this.addToPage(sectionheader_1);
		this.addToPage(table_2);
	}
		
	@Override
	public void setModel(Model model) {
		
		nome_processo.setValue(model);
		process_id.setValue(model);
		process_key.setValue(model);	

		table_2.loadModel(((Dash_board_processo) model).getTable_2());
		}
}
