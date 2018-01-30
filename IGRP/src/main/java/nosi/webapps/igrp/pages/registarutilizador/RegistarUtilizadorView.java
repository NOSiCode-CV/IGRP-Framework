
package nosi.webapps.igrp.pages.registarutilizador;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class RegistarUtilizadorView extends View {
	
	
	public Field titulo_text;
	public Field nome;
	public Field username;
	public Field email;
	public Field nada;
	public Field password;
	public Field confirmar_password;
	public IGRPForm titulo;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_guardar;
	public RegistarUtilizadorView(RegistarUtilizador model){
		this.setPageTitle("Registar Utilizador");
			
		titulo = new IGRPForm("titulo","");
		form_1 = new IGRPForm("form_1","");
		titulo_text = new TextField(model,"titulo_text");
		titulo_text.setLabel(gt(""));
		titulo_text.setValue(gt("Registar utilizador"));
		titulo_text.propertie().add("type","text").add("name","p_titulo_text").add("persist","true").add("maxlength","4000");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		
		username = new TextField(model,"username");
		username.setLabel(gt("Username"));
		username.propertie().add("name","p_username").add("type","text").add("maxlength","50").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		
		email = new TextField(model,"email");
		email.setLabel(gt("Email"));
		email.propertie().add("name","p_email").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		
		nada = new SeparatorField(model,"nada");
		nada.setLabel(gt(" "));
		nada.propertie().add("name","p_nada").add("type","separator").add("maxlength","30").add("placeholder","").add("right","false");
		
		password = new PasswordField(model,"password");
		password.setLabel(gt("Password"));
		password.propertie().add("name","p_password").add("type","password").add("maxlength","20").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		
		confirmar_password = new PasswordField(model,"confirmar_password");
		confirmar_password.setLabel(gt("Confirmar password"));
		confirmar_password.propertie().add("name","p_confirmar_password").add("type","password").add("maxlength","20").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_guardar = new IGRPButton("Guardar","igrp","registar-utilizador","index","submit","primary|fa-save","","");
		btn_guardar.propertie.add("type","specific").add("code","").add("rel","guardar");
		
	}
		
	@Override
	public void render(){
		
		titulo.addField(titulo_text);


		form_1.addField(nome);
		form_1.addField(username);
		form_1.addField(email);
		form_1.addField(nada);
		form_1.addField(password);
		form_1.addField(confirmar_password);

		toolsbar_1.addButton(btn_guardar);
		this.addToPage(titulo);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
