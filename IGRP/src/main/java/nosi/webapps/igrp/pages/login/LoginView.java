/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.login;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

import static nosi.core.i18n.Translator.gt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import nosi.core.config.Config;

public class LoginView extends View {
	
	public Field user;
	public Field password;
	public Field button;
	public Field button2;
	public Field buttontoken;
	public Field sam_message;
	public Field sam_message_digest;
	public Field sam_certificate;
	public Field p_env_procedure;
	public Field p_env_dml;
	public IGRPLogin form_1;

	public LoginView(Login model){
		form_1 = new IGRPLogin("form_1");
		user = new TextField(model,"user");
		user.setLabel(gt("Utilizador"));
		user.propertie().add("name","p_user").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		password = new PasswordField(model,"password");
		password.setLabel(gt("Senha"));
		password.propertie().add("name","p_password").add("type","password").add("maxlength","200").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		button = new TextField(model,"button");
		button.setLabel(gt("Entrar"));
		button.propertie().add("name","p_button").add("type","text").add("maxlength","50").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		
		button2 = new TextField(model,"button2");
		button2.setLabel(gt("Recuperar conta"));
		button2.propertie().add("name","p_button2").add("type","text").add("maxlength","50").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
	
		buttontoken = new TextField(model,"buttontoken");
		buttontoken.setLabel("Login com Token");
		buttontoken.propertie().add("name","p_buttontoken").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		sam_message = new HiddenField(model,"sam_message");
		sam_message.setLabel("Message");;
		sam_message.propertie().add("name","p_sam_message").add("type","hidden").add("maxlength","100").add("tag","sam_message");
		sam_message_digest = new HiddenField(model,"sam_message_digest");
		sam_message_digest.setLabel("Message Digest");
		sam_message_digest.propertie().add("name","p_sam_message_digest").add("type","hidden").add("maxlength","100").add("tag","sam_message_digest");
		sam_certificate = new HiddenField(model,"sam_certificate");
		sam_certificate.setLabel("Certificate");
		sam_certificate.propertie().add("name","p_sam_certificate").add("type","hidden").add("maxlength","100").add("tag","sam_certificate");
		p_env_procedure = new HiddenField(model,"p_env_procedure");
		p_env_procedure.propertie().add("name","p_p_env_procedure").add("type","hidden").add("maxlength","100").add("tag","p_env_procedure");
		p_env_dml = new HiddenField(model,"p_env_dml");
		p_env_dml.propertie().add("name","p_p_env_dml").add("type","hidden").add("maxlength","100").add("tag","p_env_dml");

	}
		
	@Override
	public void render(){
		form_1.addField(user);
		form_1.addField(password);
		form_1.addField(button);
		
		
		Properties p = this.loadConfig("sso", "oauth2.xml"); 
		if(p != null && p.getProperty("igrp.pwdRecover") != null && p.getProperty("igrp.pwdRecover").equals("true")) 
			form_1.addField(button2); 
		
		form_1.addField(buttontoken);
		form_1.addField(sam_message);
		form_1.addField(sam_message_digest);
		form_1.addField(sam_certificate);
		form_1.addField(p_env_procedure);
		form_1.addField(p_env_dml);

		this.addToPage(form_1);
	}
	
	private Properties loadConfig(String filePath, String fileName) {
		
		String path = new Config().getBasePathConfig() + File.separator + filePath;
		File file = new File(getClass().getClassLoader().getResource(path + File.separator + fileName).getPath().replaceAll("%20", " "));
		
		FileInputStream fis = null;
		Properties props = new Properties();
		try {
			fis = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			fis = null;	
		}
		try {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return props;
	}
}
/*-------------------------*/