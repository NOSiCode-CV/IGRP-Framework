package nosi.webapps.igrp.pages.lista_terfa_de_processo;

import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.webapp.mvc.Model;
import nosi.core.webapp.mvc.View;

import static nosi.core.i18n.Translator.gt;
import java.util.Map;
import java.util.LinkedHashMap;

public class Lista_terfa_de_processoView extends View {

	public Field estado;
	public Field descricao_tarefa;
	public Field data_inicio;
	public Field data_fim;
	public Field n_tarefa;
	public Field atribuido_a;
	public Field processdefinitionkey;
	public Field taskdefinitionkey;
	public Field prm_taskid;
	public IGRPTable table_1;

	public IGRPButton btn_ver_detalhes;

	public Lista_terfa_de_processoView(){

		this.setPageTitle("Lista Terfa de Processo");
			
		table_1 = new IGRPTable("table_1","Lista das etapas");

		estado = new ColorField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","color").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		descricao_tarefa = new TextField(model,"descricao_tarefa");
		descricao_tarefa.setLabel(gt("Descrição"));
		descricao_tarefa.propertie().add("name","p_descricao_tarefa").add("type","text").add("maxlength","255").add("showLabel","true").add("group_in","");
		
		data_inicio = new TextField(model,"data_inicio");
		data_inicio.setLabel(gt("Data Inicio"));
		data_inicio.propertie().add("name","p_data_inicio").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		data_fim = new TextField(model,"data_fim");
		data_fim.setLabel(gt("Data Fim"));
		data_fim.propertie().add("name","p_data_fim").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		n_tarefa = new TextField(model,"n_tarefa");
		n_tarefa.setLabel(gt("Nº Etapa"));
		n_tarefa.propertie().add("name","p_n_tarefa").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		atribuido_a = new TextField(model,"atribuido_a");
		atribuido_a.setLabel(gt("Atribuído a"));
		atribuido_a.propertie().add("name","p_atribuido_a").add("type","text").add("maxlength","255").add("showLabel","true").add("group_in","");
		
		processdefinitionkey = new HiddenField(model,"processdefinitionkey");
		processdefinitionkey.setLabel(gt(""));
		processdefinitionkey.propertie().add("name","p_processdefinitionkey").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","String").add("tag","processdefinitionkey");
		
		taskdefinitionkey = new HiddenField(model,"taskdefinitionkey");
		taskdefinitionkey.setLabel(gt(""));
		taskdefinitionkey.propertie().add("name","p_taskDefinitionKey").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","String").add("tag","taskdefinitionkey");
		
		prm_taskid = new HiddenField(model,"prm_taskid");
		prm_taskid.setLabel(gt(""));
		prm_taskid.propertie().add("name","p_prm_taskid").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","String").add("tag","prm_taskid");
		


		btn_ver_detalhes = new IGRPButton("Ver detalhes","igrp","Lista_terfa_de_processo","ver_detalhes","mpsubmit","info|fa-eye","","");
		btn_ver_detalhes.propertie.add("id","button_32f7_03fc").add("type","specific").add("class","info").add("rel","ver_detalhes").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		table_1.addField(estado);
		table_1.addField(descricao_tarefa);
		table_1.addField(data_inicio);
		table_1.addField(data_fim);
		table_1.addField(n_tarefa);
		table_1.addField(atribuido_a);
		table_1.addField(processdefinitionkey);
		table_1.addField(taskdefinitionkey);
		table_1.addField(prm_taskid);
		/* start table_1 legend colors*/
		Map<Object, Map<String, String>> table_1_colors= new LinkedHashMap<>();
		Map<String, String> color_dc2b4c_table_1 = new LinkedHashMap<>();
		color_dc2b4c_table_1.put("#dc2b4c","Terminado");
		table_1_colors.put("1",color_dc2b4c_table_1);
		Map<String, String> color_95c11f_table_1 = new LinkedHashMap<>();
		color_95c11f_table_1.put("#95c11f","Em execucao");
		table_1_colors.put("2",color_95c11f_table_1);
		this.table_1.setLegendColors(table_1_colors);
		/* end table_1 legend colors*/
		table_1.addButton(btn_ver_detalhes);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		estado.setValue(model);
		descricao_tarefa.setValue(model);
		data_inicio.setValue(model);
		data_fim.setValue(model);
		n_tarefa.setValue(model);
		atribuido_a.setValue(model);
		processdefinitionkey.setValue(model);
		taskdefinitionkey.setValue(model);
		prm_taskid.setValue(model);	

		table_1.loadModel(((Lista_terfa_de_processo) model).getTable_1());
		}
}
