
package nosi.webapps.igrp.pages.changepassword;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class ChangePasswordView extends View {
	
	
	public Field email_1;
	public Field old_password;
	public Field password_1; 
	public Field confirm_password;
	public Field sectionheader_1_text;
	public IGRPForm form_1;
	public IGRPSectionHeader sectionheader_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public ChangePasswordView(ChangePassword model){
		this.setPageTitle("ChangePassword");
			
		form_1 = new IGRPForm("form_1","");
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		email_1 = new EmailField(model,"email_1");
		email_1.setLabel(gt("Email"));
		
		email_1.propertie().add("name","p_email_1").add("type","email").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		old_password = new PasswordField(model,"old_password");
		old_password.setLabel(gt("Senha Actual"));
		
		old_password.propertie().add("name","p_old_password").add("type","password").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		password_1 = new PasswordField(model,"password_1");
		password_1.setLabel(gt("Nova Senha"));
		
		password_1.propertie().add("name","p_password_1").add("type","password").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		confirm_password = new PasswordField(model,"confirm_password");
		confirm_password.setLabel(gt("Confirmar Nova Senha"));
		
		confirm_password.propertie().add("name","p_confirm_password").add("type","password").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		
		sectionheader_1_text.setValue(gt("Alterar Senha"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton(gt("Gravar"),"igrp","ChangePassword","gravar","submit_form","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		
	}
		
	@Override
	public void render(){
		form_1.addField(email_1);
		form_1.addField(old_password);
		form_1.addField(password_1);
		form_1.addField(confirm_password);
 
		sectionheader_1.addField(sectionheader_1_text);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(form_1);
		this.addToPage(sectionheader_1);
		this.addToPage(toolsbar_1);
	}
}