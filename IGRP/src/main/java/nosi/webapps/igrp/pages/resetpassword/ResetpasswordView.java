package nosi.webapps.igrp.pages.resetpassword;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;

public class ResetpasswordView extends View {

	public Field sectionheader_1_text;
	public Field username;
	public Field nafa;
	public Field nova_senha;
	public Field confirmar_nova_senha;
	public Field sign_in;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPForm form_2;

	public IGRPButton btn_guardar;

	public ResetpasswordView(){

		this.setPageTitle("Reset password");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		form_2 = new IGRPForm("form_2","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Recompor Senha"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		username = new TextField(model,"username");
		username.setLabel(gt("Username"));
		username.propertie().add("name","p_username").add("type","text").add("maxlength","250").add("required","true").add("readonly","false").add("disabled","true").add("desclabel","false");
		
		nafa = new SeparatorField(model,"nafa");
		nafa.setLabel(gt(""));
		nafa.propertie().add("name","p_nafa").add("type","separator").add("maxlength","250").add("desclabel","false");
		
		nova_senha = new PasswordField(model,"nova_senha");
		nova_senha.setLabel(gt("Nova Senha"));
		nova_senha.propertie().add("name","p_nova_senha").add("type","password").add("maxlength","50").add("required","true").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		confirmar_nova_senha = new PasswordField(model,"confirmar_nova_senha");
		confirmar_nova_senha.setLabel(gt("Confirmar Nova Senha"));
		confirmar_nova_senha.propertie().add("name","p_confirmar_nova_senha").add("type","password").add("maxlength","50").add("required","true").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		sign_in = new LinkField(model,"sign_in");
		sign_in.setLabel(gt("Sign in"));
		sign_in.setValue(new Config().getResolveUrl("igrp","Dominio","index"));

									sign_in.propertie().add("name","p_sign_in").add("type","link").add("target","_self").add("request_fields","").add("maxlength","250").add("refresh_submit","false").add("desclabel","false");
		


		btn_guardar = new IGRPButton("Guardar","igrp","Resetpassword","guardar","submit_form","primary|fa-save","","");
		btn_guardar.propertie.add("type","form").add("rel","guardar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(username);
		form_1.addField(nafa);
		form_1.addField(nova_senha);
		form_1.addField(confirmar_nova_senha);

		form_2.addField(sign_in);

		form_1.addButton(btn_guardar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(form_2);
	}
		
	@Override
	public void setModel(Model model) {
		
		username.setValue(model);
		nafa.setValue(model);
		nova_senha.setValue(model);
		confirmar_nova_senha.setValue(model);
		sign_in.setValue(model);	

		}
}
