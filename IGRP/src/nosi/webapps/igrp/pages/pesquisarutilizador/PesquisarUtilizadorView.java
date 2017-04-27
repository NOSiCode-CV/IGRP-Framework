/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.pesquisarutilizador;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class PesquisarUtilizadorView extends View {		
	
	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field organica;
	public Field perfil;
	public Field username;
	public Field email;
	public Field nome;
	public Field nominho;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo;
	public IGRPButton btn_pesquisar;
	public PesquisarUtilizadorView(PesquisarUtilizador model){			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Gestao de utilizador");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("Aplicacao");
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","50").add("required","false").add("change","false").add("disabled","false").add("right","false");
		organica = new ListField(model,"organica");
		organica.setLabel("Organica");
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","100").add("required","false").add("change","false").add("disabled","false").add("right","false");
		perfil = new ListField(model,"perfil");
		perfil.setLabel("Perfil");
		perfil.propertie().add("name","p_perfil").add("type","select").add("multiple","false").add("maxlength","50").add("required","false").add("change","false").add("disabled","false").add("right","false");
		username = new TextField(model,"username");
		username.setLabel("Username");
		username.propertie().add("name","p_username").add("type","text").add("maxlength","50").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		email = new TextField(model,"email");
		email.setLabel("Email");
		email.propertie().add("name","p_email").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		nome = new PlainTextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","plaintext").add("maxlength","100").add("align","left").add("lookup_parser","false");
		nominho = new PlainTextField(model,"nominho");
		nominho.setLabel("Nominho");
		nominho.propertie().add("name","p_nominho").add("type","plaintext").add("maxlength","50").add("align","left").add("lookup_parser","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo = new IGRPButton("Novo","RED","Teste","Action","_self","default|fa-angle-right","default||fa-angle-right|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		btn_pesquisar = new IGRPButton("Pesquisar","RED","Teste","Action","submit","default|fa-angle-right","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){

		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(aplicacao);
		form_1.addField(organica);
		form_1.addField(perfil);
		form_1.addField(username);
		form_1.addField(email);


		table_1.addField(nome);
		table_1.addField(nominho);
		table_1.addField(email);
		table_1.addField(perfil);

		toolsbar_1.addButton(btn_novo);
		form_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/