
package nosi.webapps.igrp.pages.gestao_tipo_documento;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;


public class Gestao_tipo_documentoView extends View {

	public Field aplicacao;
	public Field codigo;
	public Field nome;
	public Field descricao;
	public Field ativo;
	public Field ativo_check;
	public Field t_aplicacao;
	public Field t_codigo;
	public Field t_nome;
	public Field t_descricao;
	public Field t_estado;
	public Field id;
	public Field sectionheader_1_text;
	public IGRPForm form_1;
	public IGRPTable table_1;
	public IGRPForm sectionheader_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;

	public Gestao_tipo_documentoView(){

		this.setPageTitle("Gestao Tipo Documento");
			
		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1 = new IGRPForm("sectionheader_1","");

		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("java-type","");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Codigo"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","250").add("required","true");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","250").add("required","true");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","250").add("required","false");
		
		ativo = new CheckBoxField(model,"ativo");
		ativo.setLabel(gt("Ativo?"));
		ativo.propertie().add("name","p_ativo").add("type","checkbox").add("maxlength","250").add("required","false").add("switch","false").add("check","true");
		
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
		
		t_estado = new TextField(model,"t_estado");
		t_estado.setLabel(gt("Estado"));
		t_estado.propertie().add("name","p_t_estado").add("type","text").add("maxlength","30");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão Tipo de Documento"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","Gestao_tipo_documento","gravar","submit_form","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(aplicacao);
		form_1.addField(codigo);
		form_1.addField(nome);
		form_1.addField(descricao);
		form_1.addField(ativo);

		table_1.addField(t_aplicacao);
		table_1.addField(t_codigo);
		table_1.addField(t_nome);
		table_1.addField(t_descricao);
		table_1.addField(t_estado);
		table_1.addField(id);


		sectionheader_1.addField(sectionheader_1_text);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(sectionheader_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		codigo.setValue(model);
		nome.setValue(model);
		descricao.setValue(model);
		ativo.setValue(model);
		t_aplicacao.setValue(model);
		t_codigo.setValue(model);
		t_nome.setValue(model);
		t_descricao.setValue(model);
		t_estado.setValue(model);
		id.setValue(model);	

		table_1.loadModel(((Gestao_tipo_documento) model).getTable_1());
		
	}
}
