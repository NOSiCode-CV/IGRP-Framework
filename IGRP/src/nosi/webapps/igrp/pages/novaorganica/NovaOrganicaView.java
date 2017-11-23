/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.novaorganica;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

import static nosi.core.i18n.Translator.gt;

public class NovaOrganicaView extends View {		
	
	public Field sectionheader_1_text;
	public Field codigo;
	public Field nome;
	public Field aplicacao;
	public Field ativo;
	public Field organica_pai;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_voltar;
	public NovaOrganicaView(NovaOrganica model){			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue(gt("Gestão de Orgânica - Novo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Código"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		nome = new LookupField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","lookup").add("action","Action").add("page","Teste").add("app","RED").add("lookup_type","LOOKUP").add("class","default").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","100").add("required","true").add("change","true").add("disabled","false").add("right","false");
		ativo = new CheckBoxField(model,"ativo");
		ativo.setLabel(gt("Ativo"));
		ativo.propertie().add("name","p_ativo").add("type","checkbox").add("maxlength","50").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("right","false").add("check","true");
		organica_pai = new ListField(model,"organica_pai");
		organica_pai.setLabel(gt("Orgânica Pai"));
		organica_pai.propertie().add("name","p_organica_pai").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton(gt("Gravar"),"igrp","nova-organica","index","submit","info|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_voltar = new IGRPButton(gt("Voltar"),"igrp","pesquisar-organica","index","_self","warning|fa-arrow-left","","");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar");
		
	}
		
	@Override
	public void render(){

		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(codigo);
		form_1.addField(nome);
		form_1.addField(aplicacao);
		form_1.addField(ativo);
		form_1.addField(organica_pai);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_voltar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/