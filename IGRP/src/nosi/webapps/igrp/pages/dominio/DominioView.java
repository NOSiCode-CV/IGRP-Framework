/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.dominio;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class DominioView extends View {		
	
	public Field sectionheader_1_text;
	public Field dominio;
	public Field valor;
	public Field significado;
	public Field tabela_view;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPToolsBar toolsbar_2;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_novo;
	public DominioView(Dominio model){			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Getão de Domínio");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		dominio = new TextField(model,"dominio");
		dominio.setLabel("Domínio");
		dominio.propertie().add("name","p_dominio").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		valor = new TextField(model,"valor");
		valor.setLabel("Valor");
		valor.propertie().add("name","p_valor").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		significado = new TextField(model,"significado");
		significado.setLabel("Significado");
		significado.propertie().add("name","p_significado").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		tabela_view = new TextField(model,"tabela_view");
		tabela_view.setLabel("Tabela_View");
		tabela_view.propertie().add("name","p_tabela_view").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		toolsbar_2 = new IGRPToolsBar("toolsbar_2");
		btn_pesquisar = new IGRPButton("Pesquisar","RED","Teste","Action","_self","default|fa-search","default||fa-search|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_pesquisar.propertie.add("type","specific").add("code","").add("rel","pesquisar");
		btn_novo = new IGRPButton("Novo","RED","Teste","Action","_self","success|fa-plus-circle","default||fa-plus-circle|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		
	}
		
	@Override
	public void render(){

		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(dominio);


		table_1.addField(dominio);
		table_1.addField(valor);
		table_1.addField(significado);
		table_1.addField(tabela_view);


		toolsbar_1.addButton(btn_pesquisar);
		toolsbar_2.addButton(btn_novo);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
		this.addToPage(toolsbar_2);
	}
}
/*-------------------------*/