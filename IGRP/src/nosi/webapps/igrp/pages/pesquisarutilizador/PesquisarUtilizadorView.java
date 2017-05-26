package nosi.webapps.igrp.pages.pesquisarutilizador;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class PesquisarUtilizadorView extends View {
	public String title = "";		
	
	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field organica;
	public Field perfil;
	public Field username;
	public Field email;
	public Field nome;
	public Field nominho;
	public Field p_id;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_convidar;
	public IGRPButton btn_novo;
	public IGRPButton btn_menu;
	public IGRPButton btn_transacao;
	
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
		nome.setLabel("User Name");
		nome.propertie().add("name","p_nome").add("type","plaintext").add("maxlength","100").add("align","left").add("lookup_parser","false");
		nominho = new PlainTextField(model,"nominho");
		nominho.setLabel("Name");
		nominho.propertie().add("name","p_nominho").add("type","plaintext").add("maxlength","50").add("align","left").add("lookup_parser","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		
		btn_pesquisar = new IGRPButton("Pesquisar","igrp","PesquisarUtilizador","index","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		
		btn_editar = new IGRPButton("Editar","igrp","RegistarUtilizador","editar","_self","default|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","default").add("rel","editar");
		
		btn_eliminar = new IGRPButton("Eliminar","igrp","PesquisarUtilizador","eliminar","confirm","default|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","default").add("rel","eliminar");
		
		btn_convidar = new IGRPButton("Convidar","igrp","PesquisarUtilizador","convidar","submit","default|fa-angle-right","","");
		btn_convidar.propertie.add("type","specific").add("code","").add("class","default").add("rel","convidar");
		

		btn_novo = new IGRPButton("Novo","igrp","RegistarUtilizador","index","_self","default|fa-plus","","");
		btn_novo.propertie.add("type","specific").add("code","").add("class","default").add("rel","novo");
		
		btn_menu = new IGRPButton("Menu","igrp","MenuOrganica","index","_self","default|fa-angle-right","","");
		btn_menu.propertie.add("type","specific").add("code","").add("class","default").add("rel","menu");

		btn_transacao = new IGRPButton("Transacao","igrp","TransacaoOrganica","index","_self","default|fa-angle-right","","");
		btn_transacao.propertie.add("type","specific").add("code","").add("class","default").add("rel","transacao");
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;

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
		table_1.addField(p_id);

		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_convidar);
//		table_1.addButton(btn_menu);
//		table_1.addButton(btn_transacao);
		
		toolsbar_1.addButton(btn_novo);
		toolsbar_1.addButton(btn_convidar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}