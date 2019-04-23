package nosi.webapps.igrp.pages.gestao_tipo_documento;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import java.util.Map;
import java.util.HashMap;

public class Gestao_tipo_documentoView extends View {

	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field ativo;
	public Field ativo_check;
	public Field nada;
	public Field nome;
	public Field codigo;
	public Field descricao;
	public Field t_estado;
	public Field t_aplicacao;
	public Field t_codigo;
	public Field t_nome;
	public Field t_descricao;
	public Field id;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;

	public Gestao_tipo_documentoView(){

		this.setPageTitle("Gestao Tipo Documento");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão Tipo de Documento"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","");
		
		ativo = new CheckBoxField(model,"ativo");
		ativo.setLabel(gt("Ativo?"));
		ativo.propertie().add("name","p_ativo").add("type","checkbox").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("switch","false").add("java-type","").add("check","true");
		
		nada = new SeparatorField(model,"nada");
		nada.setLabel(gt(" "));
		nada.propertie().add("name","p_nada").add("type","separator").add("maxlength","250");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","250").add("required","true").add("readonly","false").add("disabled","false");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Codigo"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","250").add("required","true").add("readonly","false").add("disabled","false");
		
		descricao = new TextAreaField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		descricao.propertie().add("name","p_descricao").add("type","textarea").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false");
		
		t_estado = new ColorField(model,"t_estado");
		t_estado.setLabel(gt("Estado"));
		t_estado.propertie().add("name","p_t_estado").add("type","color").add("maxlength","30");
		
		t_aplicacao = new TextField(model,"t_aplicacao");
		t_aplicacao.setLabel(gt("Aplicação"));
		t_aplicacao.propertie().add("name","p_t_aplicacao").add("type","text").add("maxlength","30");
		
		t_codigo = new TextField(model,"t_codigo");
		t_codigo.setLabel(gt("Codigo"));
		t_codigo.propertie().add("name","p_t_codigo").add("type","text").add("maxlength","30");
		
		t_nome = new TextField(model,"t_nome");
		t_nome.setLabel(gt("Nome"));
		t_nome.propertie().add("name","p_t_nome").add("type","text").add("maxlength","30");
		
		t_descricao = new TextField(model,"t_descricao");
		t_descricao.setLabel(gt("Descrição"));
		t_descricao.propertie().add("name","p_t_descricao").add("type","text").add("maxlength","30");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","id");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","Gestao_tipo_documento","gravar","submit_form","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");

		btn_editar = new IGRPButton("Editar","igrp","Gestao_tipo_documento","editar","mpsubmit|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("rel","editar");

		btn_eliminar = new IGRPButton("Eliminar","igrp","Gestao_tipo_documento","eliminar","alert_submit","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("rel","eliminar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(aplicacao);
		form_1.addField(ativo);
		form_1.addField(nada);
		form_1.addField(nome);
		form_1.addField(codigo);
		form_1.addField(descricao);

		table_1.addField(t_estado);
		table_1.addField(t_aplicacao);
		table_1.addField(t_codigo);
		table_1.addField(t_nome);
		table_1.addField(t_descricao);
		table_1.addField(id);
		/* start table_1 legend colors*/
		Map<Object, Map<String, String>> table_1_colors= new HashMap<>();
		Map<String, String> color_1 = new HashMap<>();
		color_1.put("#37dc2b","Ativo");
		table_1_colors.put("1",color_1);
		Map<String, String> color_2 = new HashMap<>();
		color_2.put("#ff0025","Desativo");
		table_1_colors.put("2",color_2);
		this.table_1.setLegendColors(table_1_colors);
		/* end table_1 legend colors*/
		toolsbar_1.addButton(btn_gravar);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		ativo.setValue(model);
		nada.setValue(model);
		nome.setValue(model);
		codigo.setValue(model);
		descricao.setValue(model);
		t_estado.setValue(model);
		t_aplicacao.setValue(model);
		t_codigo.setValue(model);
		t_nome.setValue(model);
		t_descricao.setValue(model);
		id.setValue(model);	

		table_1.loadModel(((Gestao_tipo_documento) model).getTable_1());
		}
}
