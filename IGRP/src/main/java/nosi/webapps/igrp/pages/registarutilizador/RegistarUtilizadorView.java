package nosi.webapps.igrp.pages.registarutilizador;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class RegistarUtilizadorView extends View {

	public Field titulo_text;
	public Field nome;
	public Field username;
	public Field email;
	public Field telefone;
	public Field telemovel;
	public Field nada;
	public Field password;
	public Field confirmar_password;
	public Field s_ass;
	public Field form_1_img_1;
	public IGRPSectionHeader titulo;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_guardar;

	public RegistarUtilizadorView(){

		this.setPageTitle("Registar Utilizador");
			
		titulo = new IGRPSectionHeader("titulo","");

		form_1 = new IGRPForm("form_1","");

		titulo_text = new TextField(model,"titulo_text");
		titulo_text.setLabel(gt(""));
		titulo_text.setValue(gt("Registar utilizador"));
		titulo_text.propertie().add("type","text").add("name","p_titulo_text").add("maxlength","4000");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		username = new TextField(model,"username");
		username.setLabel(gt("Username"));
		username.propertie().add("name","p_username").add("type","text").add("maxlength","50").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		email = new EmailField(model,"email");
		email.setLabel(gt("Email"));
		email.propertie().add("name","p_email").add("type","email").add("maxlength","100").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		telefone = new TextField(model,"telefone");
		telefone.setLabel(gt("Telefone"));
		telefone.propertie().add("name","p_telefone").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		telemovel = new TextField(model,"telemovel");
		telemovel.setLabel(gt("Telemóvel"));
		telemovel.propertie().add("name","p_telemovel").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		nada = new SeparatorField(model,"nada");
		nada.setLabel(gt(" "));
		nada.propertie().add("name","p_nada").add("type","separator").add("maxlength","30").add("placeholder",gt("")).add("desclabel","false");
		
		password = new PasswordField(model,"password");
		password.setLabel(gt("Password"));
		password.propertie().add("name","p_password").add("type","password").add("maxlength","20").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		confirmar_password = new PasswordField(model,"confirmar_password");
		confirmar_password.setLabel(gt("Confirmar password"));
		confirmar_password.propertie().add("name","p_confirmar_password").add("type","password").add("maxlength","20").add("required","true").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false");
		
		s_ass = new SeparatorField(model,"s_ass");
		s_ass.setLabel(gt(""));
		s_ass.propertie().add("name","p_s_ass").add("type","separator").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false");
		
		form_1_img_1 = new FileField(model,"form_1_img_1");
		form_1_img_1.setLabel(gt("Assinatura"));
		form_1_img_1.propertie().add("name","p_form_1_img_1").add("type","file").add("accept","image/*").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","250").add("required","false").add("disabled","false").add("class","black");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_guardar = new IGRPButton("Guardar","igrp","RegistarUtilizador","guardar","submit_ajax","primary|fa-save","","");
		btn_guardar.propertie.add("type","specific").add("rel","guardar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		titulo.addField(titulo_text);


		form_1.addField(nome);
		form_1.addField(username);
		form_1.addField(email);
		form_1.addField(telefone);
		form_1.addField(telemovel);
		form_1.addField(nada);
		form_1.addField(password);
		form_1.addField(confirmar_password);
		form_1.addField(s_ass);
		form_1.addField(form_1_img_1);

		toolsbar_1.addButton(btn_guardar);
		this.addToPage(titulo);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		nome.setValue(model);
		username.setValue(model);
		email.setValue(model);
		telefone.setValue(model);
		telemovel.setValue(model);
		nada.setValue(model);
		password.setValue(model);
		confirmar_password.setValue(model);
		s_ass.setValue(model);
		form_1_img_1.setValue(model);	

		}
}
