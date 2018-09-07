package nosi.webapps.igrp.pages.lista_terfa_de_processo;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import java.util.Map;
import java.util.HashMap;

public class Lista_terfa_de_processoView extends View {

	public Field n_tarefa;
	public Field descricao_tarefa;
	public Field data_inicio;
	public Field data_fim;
	public Field estado;
	public IGRPTable table_1;


	public Lista_terfa_de_processoView(){

		this.setPageTitle("Lista Terfa de Processo");
			
		table_1 = new IGRPTable("table_1","");

		n_tarefa = new TextField(model,"n_tarefa");
		n_tarefa.setLabel(gt("Nº Tarefa"));
		n_tarefa.propertie().add("name","p_n_tarefa").add("type","text").add("maxlength","30");
		
		descricao_tarefa = new TextField(model,"descricao_tarefa");
		descricao_tarefa.setLabel(gt("Descricao Tarefa"));
		descricao_tarefa.propertie().add("name","p_descricao_tarefa").add("type","text").add("maxlength","30");
		
		data_inicio = new TextField(model,"data_inicio");
		data_inicio.setLabel(gt("Data Inicio"));
		data_inicio.propertie().add("name","p_data_inicio").add("type","text").add("maxlength","30");
		
		data_fim = new TextField(model,"data_fim");
		data_fim.setLabel(gt("Data Fim"));
		data_fim.propertie().add("name","p_data_fim").add("type","text").add("maxlength","30");
		
		estado = new ColorField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","color").add("maxlength","30");
		


		
	}
		
	@Override
	public void render(){
		
		table_1.addField(n_tarefa);
		table_1.addField(descricao_tarefa);
		table_1.addField(data_inicio);
		table_1.addField(data_fim);
		table_1.addField(estado);
		/* start table_1 legend colors*/
		Map<Object, Map<String, String>> table_1_colors= new HashMap<>();
		Map<String, String> color_1 = new HashMap<>();
		color_1.put("#dc2b4c","Terminado");
		table_1_colors.put("1",color_1);
		Map<String, String> color_2 = new HashMap<>();
		color_2.put("#95c11f","Em execucao");
		table_1_colors.put("2",color_2);
		this.table_1.setLegendColors(table_1_colors);
		/* end table_1 legend colors*/
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		n_tarefa.setValue(model);
		descricao_tarefa.setValue(model);
		data_inicio.setValue(model);
		data_fim.setValue(model);
		estado.setValue(model);	

		table_1.loadModel(((Lista_terfa_de_processo) model).getTable_1());
		}
}
