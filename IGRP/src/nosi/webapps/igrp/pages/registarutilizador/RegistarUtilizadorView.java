/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.registarutilizador;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class RegistarUtilizadorView extends View {
	public String title = "Detalhe App";		
	
	public Field sectionheader_1_text;
	public Field nome;
	public Field username;
	public Field email;
	public Field password;
	public Field confirmar_password;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_guardar;
	public IGRPButton btn_voltar;
	
	public RegistarUtilizadorView(RegistarUtilizador model){			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Registar utilizador");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		username = new TextField(model,"username");
		username.setLabel("Username");
		username.propertie().add("name","p_username").add("type","text").add("maxlength","50").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		email = new TextField(model,"email");
		email.setLabel("Email");
		email.propertie().add("name","p_email").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		password = new PasswordField(model,"password");
		password.setLabel("Password");
		password.propertie().add("name","p_password").add("type","password").add("maxlength","20").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		confirmar_password = new PasswordField(model,"confirmar_password");
		confirmar_password.setLabel("Confirmar password");
		confirmar_password.propertie().add("name","p_confirmar_password").add("type","password").add("maxlength","20").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_guardar = new IGRPButton("Gravar","igrp","registar-utilizador","index","submit","success|fa-save","","");
		btn_guardar.propertie.add("type","specific").add("code","").add("rel","guardar");
		btn_voltar = new IGRPButton("Voltar","igrp","pesquisar-utilizador","index","_self","warning|fa-arrow-left","","");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar");
		
		
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;

		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(nome);
		form_1.addField(username);
		form_1.addField(email);
		form_1.addField(password);
		form_1.addField(confirmar_password);

		toolsbar_1.addButton(btn_guardar);
		toolsbar_1.addButton(btn_voltar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
		this.addToPage(new IGRPMessage());
	}
}
/*-------------------------*/