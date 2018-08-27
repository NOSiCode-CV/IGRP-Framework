package nosi.webapps.igrp.pages.resetbyemail;

import nosi.core.config.Config;
import nosi.core.mail.EmailMessage;
import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.webapps.igrp.dao.User;
import service.client.WSO2UserStub;
import nosi.core.webapp.databse.helpers.QueryInterface;

import static nosi.core.i18n.Translator.gt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.xml.bind.JAXBElement;
import javax.xml.namespace.QName;
import javax.xml.ws.handler.MessageContext;

import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerService;
import org.wso2.carbon.um.ws.service.UpdateCredential;
import org.wso2.carbon.um.ws.service.dao.xsd.ClaimDTO;

import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/


/*----#end-code----*/

public class ResetbyemailController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Resetbyemail model = new Resetbyemail();
		model.load();
		ResetbyemailView view = new ResetbyemailView();
		/*----#start-code(index)----*/
		
		
/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionEnviar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Resetbyemail model = new Resetbyemail();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Resetbyemail","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(enviar)----*/
		String link = "#";
		String email = model.getForm_1_email_1();
		
		switch(this.getConfig().getAutenticationType()) {
			case "db": 
				if(!db(email)) {
					Core.setMessageError("Ooops ! O email inserido não foi encontrado.");
					return forward("igrp","Resetbyemail","index", this.queryString());
				}
			break;
			case "ldap": 
				if(!ldap(email)) {
					Core.setMessageError("Ooops ! O email inserido não foi encontrado.");
					return forward("igrp","Resetbyemail","index", this.queryString());
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
		
/*----#end-code----*/
		return this.redirect("igrp","Resetbyemail","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	private boolean db(String email) {
		User u = new User().find().andWhere("email", "=", email).one();
		return u != null;
	}
	
	private boolean ldap(String email) {
		boolean flag = false;
		try {
			Properties settings = loadIdentityServerSettings();
			URL url =  new URL(settings.getProperty("RemoteUserStoreManagerService-wsdl-url"));
	        WSO2UserStub.disableSSL();
	        WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
	        stub.applyHttpBasicAuthentication(settings.getProperty("admin-usn"), settings.getProperty("admin-pwd"), 2);

	        List<ClaimDTO> result = stub.getOperations().getUserClaimValues(email, "");
	        
	        flag = result != null && result.size() > 0;
	        	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	private Properties loadIdentityServerSettings() {
		String path = new Config().getBasePathConfig() + File.separator  + "ids";
		String fileName = "wso2-ids.xml";
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
