/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.novodominio;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class NovoDominioView extends View {		
	
	public Field sectionheader_1_text;
	public Field dominio;
	public Field valor;
	public Field significado;
	public Field tipo;
	public Field tabela_view;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_voltar;
	public NovoDominioView(NovoDominio model){			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Gestão de Dominio - Novo");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		dominio = new TextField(model,"dominio");
		dominio.setLabel("Domínio");
		dominio.propertie().add("name","p_dominio").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		valor = new TextField(model,"valor");
		valor.setLabel("Valor");
		valor.propertie().add("name","p_valor").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		significado = new TextField(model,"significado");
		significado.setLabel("Significado");
		significado.propertie().add("name","p_significado").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		tipo = new ListField(model,"tipo");
		tipo.setLabel("Tipo");
		tipo.propertie().add("name","p_tipo").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		tabela_view = new TextField(model,"tabela_view");
		tabela_view.setLabel("Tabela_view");
		tabela_view.propertie().add("name","p_tabela_view").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","RED","Teste","Action","_self","default|fa-save","default||fa-save|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_voltar = new IGRPButton("Voltar","RED","Teste","Action","_back","default|fa-arrow-left","default||fa-arrow-left|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar");
		
	}
		
	@Override
	public void render(){

		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(dominio);
		form_1.addField(valor);
		form_1.addField(significado);
		form_1.addField(tipo);
		form_1.addField(tabela_view);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_voltar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/