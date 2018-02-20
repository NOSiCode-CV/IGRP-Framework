
package nosi.webapps.igrp.pages.settings;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class SettingsView extends View {
	
	
	public Field sectionheader_1_text;
	public Field nome;
	public Field email;
	public Field username;
	public Field telefone;
	public Field telemovel;
	public Field ultimo_acesso_igrp;
	public Field ultimo_acesso_rede_estado;
	public Field password_expira_em;
	public Field view_1_img;
	public Field idioma;
	public Field separator_1;
	public Field organica;
	public Field perfil;
	public IGRPForm sectionheader_1;
	public IGRPView view_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_alterar_senha;
	public IGRPButton btn_aplicar;
	public SettingsView(Settings model){

		this.setPageTitle("Área pessoal");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");
		view_1 = new IGRPView("view_1","");
		form_1 = new IGRPForm("form_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Área pessoal"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100");
		
		email = new TextField(model,"email");
		email.setLabel(gt("Email"));
		email.propertie().add("name","p_email").add("type","text").add("maxlength","100");
		
		username = new TextField(model,"username");
		username.setLabel(gt("Username"));
		username.propertie().add("name","p_username").add("type","text").add("maxlength","30");
		
		telefone = new TextField(model,"telefone");
		telefone.setLabel(gt("Telefone"));
		telefone.propertie().add("name","p_telefone").add("type","text").add("maxlength","30");
		
		telemovel = new TextField(model,"telemovel");
		telemovel.setLabel(gt("Telemóvel"));
		telemovel.propertie().add("name","p_telemovel").add("type","text").add("maxlength","30");
		
		ultimo_acesso_igrp = new TextField(model,"ultimo_acesso_igrp");
		ultimo_acesso_igrp.setLabel(gt("Ultimo Acesso IGRP"));
		ultimo_acesso_igrp.propertie().add("name","p_ultimo_acesso_igrp").add("type","text").add("maxlength","30");
		
		ultimo_acesso_rede_estado = new TextField(model,"ultimo_acesso_rede_estado");
		ultimo_acesso_rede_estado.setLabel(gt("Ultimo Acesso Rede Estado"));
		ultimo_acesso_rede_estado.propertie().add("name","p_ultimo_acesso_rede_estado").add("type","text").add("maxlength","30");
		
		password_expira_em = new TextField(model,"password_expira_em");
		password_expira_em.setLabel(gt("Password Expira em"));
		password_expira_em.propertie().add("name","p_password_expira_em").add("type","text").add("maxlength","30");
		
		view_1_img = new TextField(model,"view_1_img");
		view_1_img.setLabel(gt(""));
		view_1_img.propertie().add("type","text").add("name","p_view_1_img").add("maxlength","300");
		
		idioma = new ListField(model,"idioma");
		idioma.setLabel(gt(" Idioma"));
		idioma.propertie().add("name","p_idioma").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("domain","").add("java-type","");
		
		separator_1 = new SeparatorField(model,"separator_1");
		separator_1.setLabel(gt("Acesso"));
		separator_1.propertie().add("name","p_separator_1").add("type","separator").add("maxlength","30");
		
		organica = new ListField(model,"organica");
		organica.setLabel(gt("Organização"));
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("domain","").add("java-type","");
		
		perfil = new ListField(model,"perfil");
		perfil.setLabel(gt("Perfil"));
		perfil.propertie().add("name","p_perfil").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("domain","").add("java-type","");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_alterar_senha = new IGRPButton("Alterar senha","igrp","Settings","alterar_senha","right_panel","warning|fa-lock","","");
		btn_alterar_senha.propertie.add("type","specific").add("rel","alterar_senha");

		btn_aplicar = new IGRPButton("Aplicar","igrp","Settings","aplicar","submit_form","success|fa-check","","");
		btn_aplicar.propertie.add("type","specific").add("rel","aplicar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		view_1.addField(nome);
		view_1.addField(email);
		view_1.addField(username);
		view_1.addField(telefone);
		view_1.addField(telemovel);
		view_1.addField(ultimo_acesso_igrp);
		view_1.addField(ultimo_acesso_rede_estado);
		view_1.addField(password_expira_em);
		view_1.addField(view_1_img);


		form_1.addField(idioma);
		form_1.addField(separator_1);
		form_1.addField(organica);
		form_1.addField(perfil);

		toolsbar_1.addButton(btn_alterar_senha);
		toolsbar_1.addButton(btn_aplicar);
		this.addToPage(sectionheader_1);
		this.addToPage(view_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
