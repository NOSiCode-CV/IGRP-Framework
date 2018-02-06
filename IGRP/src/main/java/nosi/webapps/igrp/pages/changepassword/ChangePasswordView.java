
package nosi.webapps.igrp.pages.changepassword;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class ChangePasswordView extends View {
	
	
	public Field sectionheader_1_text;
	public Field email_1;
	public Field insira;
	public Field old_password;
	public Field password_1;
	public Field confirm_password;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_guardar;
	public ChangePasswordView(ChangePassword model){

		this.setPageTitle("ChangePassword");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Alterar Senha"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		email_1 = new EmailField(model,"email_1");
		email_1.setLabel(gt("Email"));
		email_1.propertie().add("name","p_email_1").add("type","email").add("maxlength","100").add("required","true");
		
		insira = new SeparatorField(model,"insira");
		insira.setLabel(gt("Insira"));
		insira.propertie().add("name","p_insira").add("type","separator").add("maxlength","30");
		
		old_password = new PasswordField(model,"old_password");
		old_password.setLabel(gt("Antiga palavra-passe"));
		old_password.propertie().add("name","p_old_password").add("type","password").add("maxlength","30").add("required","true");
		
		password_1 = new PasswordField(model,"password_1");
		password_1.setLabel(gt("Palavra-passe"));
		password_1.propertie().add("name","p_password_1").add("type","password").add("maxlength","30").add("required","true");
		
		confirm_password = new PasswordField(model,"confirm_password");
		confirm_password.setLabel(gt("Confirme a palavra-passe"));
		confirm_password.propertie().add("name","p_confirm_password").add("type","password").add("maxlength","30").add("required","true");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_guardar = new IGRPButton("Guardar","igrp","ChangePassword","guardar","submit_form","primary|fa-save","","");
		btn_guardar.propertie.add("type","specific").add("rel","guardar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(email_1);
		form_1.addField(insira);
		form_1.addField(old_password);
		form_1.addField(password_1);
		form_1.addField(confirm_password);

		toolsbar_1.addButton(btn_guardar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
