package nosi.webapps.igrp.pages.resetbyemail;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Core;

public class ResetbyemailView extends View {

	public Field sectionheader_1_text;
	public Field form_1_email_1;
	public Field sign_in;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPForm form_2;

	public IGRPButton btn_enviar;

	public ResetbyemailView(){

		this.setPageTitle("Reset by email");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		form_2 = new IGRPForm("form_2","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Recuperar Conta"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		form_1_email_1 = new EmailField(model,"form_1_email_1");
		form_1_email_1.setLabel(gt("Email"));
		form_1_email_1.propertie().add("name","p_form_1_email_1").add("type","email").add("maxlength","250").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("tooltip","false").add("disable_copy_paste","false");
		
		sign_in = new LinkField(model,"sign_in");
		sign_in.setLabel(gt("Sign in"));
		sign_in.setValue(Core.getIGRPLink("igrp","Dominio","index"));

									sign_in.propertie().add("name","p_sign_in").add("type","link").add("target","_self").add("request_fields","").add("class","link").add("img","fa-sign-in").add("maxlength","250").add("placeholder",gt("")).add("refresh_submit","false").add("desclabel","false").add("refresh_components","").add("adbcli","").add("tooltip","false").add("disable_copy_paste","false");
		


		btn_enviar = new IGRPButton("Enviar","igrp","Resetbyemail","enviar","submit_form","warning|fa-send-o","","");
		btn_enviar.propertie.add("id","button_8e01_0cf1").add("type","form").add("class","warning").add("rel","enviar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(form_1_email_1);

		form_2.addField(sign_in);

		form_1.addButton(btn_enviar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(form_2);
	}
		
	@Override
	public void setModel(Model model) {
		
		form_1_email_1.setValue(model);
		sign_in.setValue(model);	

		}
}
