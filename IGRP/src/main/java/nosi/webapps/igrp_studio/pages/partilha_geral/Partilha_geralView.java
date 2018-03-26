
package nosi.webapps.igrp_studio.pages.partilha_geral;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Model;import java.sql.Date;
import nosi.core.config.Config;

public class Partilha_geralView extends View {
	
	
	public Field sectionheader_1_text;
	public Field aplicacao_origem;
	public Field elemento;
	public Field aplicacao_destino;
	public Field estado;
	public Field estado_check;
	public Field descricao;
	public Field p_hidden_1;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_partilhar;
	public Partilha_geralView(){

		this.setPageTitle("Partilha Geral");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Partilha Geral - Inter Aplicações (Páginas)"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		aplicacao_origem = new ListField(model,"aplicacao_origem");
		aplicacao_origem.setLabel(gt("Aplicação Origem"));
		aplicacao_origem.propertie().add("name","p_aplicacao_origem").add("type","select").add("multiple","false").add("domain","").add("maxlength","50").add("required","true").add("java-type","");
		
		elemento = new ListField(model,"elemento");
		elemento.setLabel(gt("Elemento"));
		elemento.propertie().add("name","p_elemento").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("java-type","");
		
		aplicacao_destino = new ListField(model,"aplicacao_destino");
		aplicacao_destino.setLabel(gt("Aplicação Destino"));
		aplicacao_destino.propertie().add("name","p_aplicacao_destino").add("type","select").add("multiple","false").add("domain","").add("maxlength","50").add("required","true").add("java-type","");
		
		estado = new CheckBoxField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","checkbox").add("maxlength","30").add("switch","false").add("check","true").add("desc","true");
		
		estado_check = new CheckBoxField
		(model,"estado_check");
		estado_check.propertie().add("name","p_estado").add("type","checkbox").add("maxlength","30").add("switch","false").add("check","true").add("desc","true");
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","100");
		
		p_hidden_1 = new HiddenField(model,"p_hidden_1");
		p_hidden_1.setLabel(gt(""));
		p_hidden_1.propertie().add("name","p_hidden_1").add("type","hidden").add("maxlength","30").add("tag","hidden_1");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_partilhar = new IGRPButton("Partilhar","igrp_studio","Partilha_geral","partilhar","submit","success|fa-share-alt","","");
		btn_partilhar.propertie.add("type","specific").add("rel","partilhar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(aplicacao_origem);
		form_1.addField(elemento);
		form_1.addField(aplicacao_destino);

		table_1.addField(estado);
		table_1.addField(estado_check);
		table_1.addField(descricao);
		table_1.addField(p_hidden_1);

		toolsbar_1.addButton(btn_partilhar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	public void setModel(Partilha_geral model) {
		
		aplicacao_origem.setValue(model);

		elemento.setValue(model);

		aplicacao_destino.setValue(model);

		estado.setValue(model);

		descricao.setValue(model);

		p_hidden_1.setValue(model);
	
		table_1.loadModel(model.getTable_1());

	}
}
