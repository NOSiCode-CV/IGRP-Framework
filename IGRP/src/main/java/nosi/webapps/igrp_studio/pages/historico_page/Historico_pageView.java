package nosi.webapps.igrp_studio.pages.historico_page;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Historico_pageView extends View {

	public Field sectionheader_1_text;
	public Field nome;
	public Field descricao;
	public Field data;
	public Field id_page;
	public IGRPSectionHeader sectionheader_1;
	public IGRPTable table_1;


	public Historico_pageView(){

		this.setPageTitle("Histórico Page");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Sectionheader"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		data = new DateField(model,"data");
		data.setLabel(gt("Data"));
		data.propertie().add("name","p_data").add("type","date").add("range","false").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		id_page = new HiddenField(model,"id_page");
		id_page.setLabel(gt(""));
		id_page.propertie().add("name","p_id_page").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","").add("tag","id_page");
		


		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		table_1.addField(nome);
		table_1.addField(descricao);
		table_1.addField(data);
		table_1.addField(id_page);

		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		nome.setValue(model);
		descricao.setValue(model);
		data.setValue(model);
		id_page.setValue(model);	

		table_1.loadModel(((Historico_page) model).getTable_1());
		}
}
