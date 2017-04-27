/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.example;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class ExampleView extends View {		
	
	public Field select_1;
	public Field email_1;
	public Field password_1;
	public Field plaintext_1;
	public Field plaintext_2;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_button;
	public ExampleView(Example model){			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		select_1 = new ListField(model,"select_1");
		select_1.setLabel("Select");
		select_1.propertie().add("name","p_select_1").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		email_1 = new EmailField(model,"email_1");
		email_1.setLabel("Email");
		email_1.propertie().add("name","p_email_1").add("type","email").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		password_1 = new PasswordField(model,"password_1");
		password_1.setLabel("Password");
		password_1.propertie().add("name","p_password_1").add("type","password").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		plaintext_1 = new PlainTextField(model,"plaintext_1");
		plaintext_1.setLabel("Plaintext");
		plaintext_1.propertie().add("name","p_plaintext_1").add("type","plaintext").add("maxlength","30").add("align","left").add("lookup_parser","false");
		plaintext_2 = new PlainTextField(model,"plaintext_2");
		plaintext_2.setLabel("Plaintext");
		plaintext_2.propertie().add("name","p_plaintext_2").add("type","plaintext").add("maxlength","30").add("align","left").add("lookup_parser","false");

		btn_button = new IGRPButton("Button","igrp","example","index","submit","default|fa-angle-right","","");
		btn_button.propertie.add("type","form").add("code","").add("class","default").add("rel","button");
	}
		
	@Override
	public void render(){

		form_1.addField(select_1);
		form_1.addField(email_1);
		form_1.addField(password_1);

		table_1.addField(plaintext_1);
		table_1.addField(plaintext_2);

		form_1.addButton(btn_button);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
/*-------------------------*/