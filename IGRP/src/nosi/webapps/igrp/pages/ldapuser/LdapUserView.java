
package nosi.webapps.igrp.pages.ldapuser;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class LdapUserView extends View {
	
	
	public Field common_name;
	public Field surname;
	public Field email_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public LdapUserView(LdapUser model){
		this.setPageTitle("LdapUser");
			
		form_1 = new IGRPForm("form_1","");
		common_name = new TextField(model,"common_name");
		common_name.setLabel(gt("Common Name"));
		
		common_name.propertie().add("name","p_common_name").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		surname = new TextField(model,"surname");
		surname.setLabel(gt("Surname"));
		
		surname.propertie().add("name","p_surname").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		email_1 = new EmailField(model,"email_1");
		email_1.setLabel(gt("Email"));
		
		email_1.propertie().add("name","p_email_1").add("type","email").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","igrp","LdapUser","gravar","submit_form","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		
	}
		
	@Override
	public void render(){
		
		form_1.addField(common_name);
		form_1.addField(surname);
		form_1.addField(email_1);


		toolsbar_1.addButton(btn_gravar);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
