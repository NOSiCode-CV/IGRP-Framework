
package nosi.webapps.igrp.pages.lookup_list_organica;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;



public class Lookup_list_organicaView extends View {

	public Field sectionheader_1_text;
	public Field code;
	public Field aplicacao;
	public Field organica;
	public Field id_org;
	public IGRPForm sectionheader_1;
	public IGRPTable table_1;


	public Lookup_list_organicaView(){

		this.setPageTitle("Lookup list organica");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Escolhe a Orgânica"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		code = new TextField(model,"code");
		code.setLabel(gt("Code"));
		code.propertie().add("name","p_code").add("type","text").add("maxlength","30");
		
		aplicacao = new TextField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","text").add("maxlength","30");
		
		organica = new TextField(model,"organica");
		organica.setLabel(gt("Orgânica"));
		organica.propertie().add("name","p_organica").add("type","text").add("maxlength","30");
		
		id_org = new HiddenField(model,"id_org");
		id_org.setLabel(gt(""));
		id_org.propertie().add("name","p_id_org").add("type","hidden").add("maxlength","30").add("tag","id_org");
		


		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		table_1.addField(code);
		table_1.addField(aplicacao);
		table_1.addField(organica);
		table_1.addField(id_org);

		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
	}
		
	public void setModel(Lookup_list_organica model) {
		
		code.setValue(model);
		aplicacao.setValue(model);
		organica.setValue(model);
		id_org.setValue(model);	

		table_1.loadModel(model.getTable_1());
		
	}
}
