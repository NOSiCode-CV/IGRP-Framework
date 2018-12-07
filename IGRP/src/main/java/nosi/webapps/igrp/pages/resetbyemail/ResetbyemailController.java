package nosi.webapps.igrp.pages.resetbyemail;


import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

import nosi.core.mail.EmailMessage;
import nosi.webapps.igrp.dao.User;
import service.client.WSO2UserStub;
import nosi.core.config.Config;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URL;
import java.util.List;
import java.util.Properties;
import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerService;
import org.wso2.carbon.um.ws.service.dao.xsd.ClaimDTO;
import nosi.core.webapp.Igrp;

/*----#end-code----*/
		
public class ResetbyemailController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Resetbyemail model = new Resetbyemail();
		model.load();
		
		ResetbyemailView view = new ResetbyemailView();
		/*----#start-code(index)----*/
		model.setSign_in("igrp","login","login");
		view.btn_enviar.setLink("enviar&isPublic=1");
		
/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionEnviar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#start-code(enviar)----*/
		
      Resetbyemail model = new Resetbyemail();
		model.load();
      
		String token = nosi.core.webapp.User.generatePasswordResetToken();
		
		String link = Igrp.getInstance().getRequest().getRequestURL() + "?r=" + "igrp" + "/Resetpassword/index"; 
		link += "&target=_blank&isPublic=1" + "&t=" + token; 
		
		String email = model.getForm_1_email_1();
		
		switch(this.getConfig().getAutenticationType()) { 
			case "db": 
				if(!db(email, token)) { 
					Core.setMessageError("Ooops ! O email inserido não foi encontrado."); 
					return forward("igrp","Resetbyemail","index&isPublic=1&target=_blank", this.queryString()); 
				}
			break;
			case "ldap": 
				if(!ldap(email, token)) {
					Core.setMessageError("Ooops ! O email inserido não foi encontrado.");
					return forward("igrp","Resetbyemail","index&isPublic=1&target=_blank", this.queryString());
				}
			break;
	}
		
		String msg = "" + "<p>Caro (a) utilizador, foi solicitado o reset de password da sua conta de acesso ... </p>"; 
		
		String aux = EmailMessage.PdexTemplate.getCorpoFormatado("Reset de Password - Kriol", "Olá", new String[] {msg}, new String[] {"Recuperar Password"}, new String[] {link}, null);
		
		try {
			boolean r = EmailMessage.newInstance().setTo(email).setFrom("igrpframeworkjava@gmail.com").setSubject("Reset de Password")
			.setMsg(aux, "utf-8", "html").send();
			if(r)
				Core.setMessageSuccess("Consulte a sua conta de email para confirmar a ação e assim ter acesso a sua nova password.");
			else
				Core.setMessageError("Ocorreu um erro no envio do email. Email não foi enviado ...");
		} catch (IOException e) {
			Core.setMessageError("Ocorreu um erro no envio do email. Email não foi enviado ...");
			e.printStackTrace();
		}
		
		this.addQueryString("target","_blank");
		this.addQueryString("isPublic","1");
		
/*----#end-code----*/
		
		return this.redirect("igrp","Resetbyemail","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	
	private boolean db(String email, String token) {
		User u = new User().find().andWhere("email", "=", email).one();
		if(u != null) {
			u.setPassword_reset_token(token);
			u = u.update();
		}
		return u != null;
	}
	
	private boolean ldap(String email, String token) {
		boolean flag = false;
		try {
			Properties settings = loadIdentityServerSettings();
			URL url =  new URL(settings.getProperty("ids.wso2.RemoteUserStoreManagerService-wsdl-url"));
	        WSO2UserStub.disableSSL();
	        WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
	        stub.applyHttpBasicAuthentication(settings.getProperty("ids.wso2.admin-usn"), settings.getProperty("ids.wso2.admin-pwd"), 2);

	        List<ClaimDTO> result = stub.getOperations().getUserClaimValues(email, "");
	        
	        flag = result != null && result.size() > 0 && db(email, token);
	        	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	private Properties loadIdentityServerSettings() {
		String path = new Config().getBasePathConfig() + File.separator  + "common";
		String fileName = "main.xml";
		File file = new File(getClass().getClassLoader().getResource(path + File.separator + fileName).getPath());
		
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
	
/*----#end-code----*/
}