
package nosi.webapps.igrp.pages.changepassword;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class ChangePasswordView extends View {
	
	
	public Field email_1;
	public Field password_1;
	public Field confirm_password;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public ChangePasswordView(ChangePassword model){
		this.setPageTitle("ChangePassword");
			
		form_1 = new IGRPForm("form_1","");
		email_1 = new EmailField(model,"email_1");
		email_1.setLabel(gt("Email"));
		
		email_1.propertie().add("name","p_email_1").add("type","email").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","true").add("placeholder","").add("right","false");
		password_1 = new PasswordField(model,"password_1");
		password_1.setLabel(gt("Senha"));
		
		password_1.propertie().add("name","p_password_1").add("type","password").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		confirm_password = new PasswordField(model,"confirm_password");
		confirm_password.setLabel(gt("Confirmar senha"));
		
		confirm_password.propertie().add("name","p_confirm_password").add("type","password").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton(gt("Gravar"),"igrp","ChangePassword","gravar","submit_form","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		
	}
		
	@Override
	public void render(){
		
		form_1.addField(email_1);
		form_1.addField(password_1);
		form_1.addField(confirm_password);


		toolsbar_1.addButton(btn_gravar);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
