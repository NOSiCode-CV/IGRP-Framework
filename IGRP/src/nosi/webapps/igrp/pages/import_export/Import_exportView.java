/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.import_export;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

import static nosi.core.i18n.Translator.gt;

public class Import_exportView extends View {
	
	
	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field tipo;
	public Field aplicacao_tabela;
	public Field utilizador;
	public Field data;
	public Field tipo_tabela;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;
	public Import_exportView(Import_export model){
		this.setPageTitle(gt("Import export"));
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		
		sectionheader_1_text.setValue(gt("Lista dos Import/Export de uma Aplicação"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Nome Aplicação/Página"));
		
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		tipo = new ListField(model,"tipo");
		tipo.setLabel(gt("Tipo"));
		
		tipo.propertie().add("name","p_tipo").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		aplicacao_tabela = new TextField(model,"aplicacao_tabela");
		aplicacao_tabela.setLabel(gt("Nome Aplicação/Página"));
		
		aplicacao_tabela.propertie().add("name","p_aplicacao_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		utilizador = new TextField(model,"utilizador");
		utilizador.setLabel(gt("Utilizador"));
		
		utilizador.propertie().add("name","p_utilizador").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		data = new TextField(model,"data");
		data.setLabel(gt("Data"));
		
		data.propertie().add("name","p_data").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		tipo_tabela = new TextField(model,"tipo_tabela");
		tipo_tabela.setLabel(gt("Tipo"));
		
		tipo_tabela.propertie().add("name","p_tipo_tabela").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		
		btn_pesquisar = new IGRPButton(gt("Pesquisar"),"igrp","Import_export","index","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);
		form_1.addField(tipo);

		table_1.addField(aplicacao_tabela);
		table_1.addField(utilizador);
		table_1.addField(data);
		table_1.addField(tipo_tabela);

		form_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
/*-------------------------*/