package nosi.webapps.igrp.pages.resetpassword;

import nosi.core.config.Config;
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

public class ResetpasswordController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Resetpassword model = new Resetpassword();
		model.load();
		ResetpasswordView view = new ResetpasswordView();
		/*----#start-code(index)----*/
		
		model.setUsername("demo@nosi.cv");
		
/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGuardar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Resetpassword model = new Resetpassword();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Resetpassword","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(guardar)----*/
		
		String username = "demo@nosi.cv";
		String pwd = model.getNova_senha();
		String pwdConfirm = model.getConfirmar_nova_senha();
		
		if(!pwd.equals(pwdConfirm)) {
			Core.setMessageError("Password inconsistentes. Tente novamente !");
			
			return forward("igrp","Resetpassword","index", this.queryString());
		}else {
			switch(this.getConfig().getAutenticationType()) {
				case "db": 
					db(username, pwd);
				break;
				case "ldap": 
					ldap(username, pwd);
				break;
			}
		}
		
/*----#end-code----*/
		return this.redirect("igrp","Resetpassword","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	private boolean db(String username, String password) {
		boolean flag = false;
		User u = new User().find().andWhere("user_name", "=", username).one();
		if(u != null) {
			u.setPass_hash(nosi.core.webapp.User.encryptToHash(username + "" + password, "SHA-256"));
			u = u.update();
			if(u != null) {
				Core.setMessageSuccess("Operação efectuada com sucesso.");
				flag = true;
			}else
				Core.setMessageError();
		}else {
			Core.setMessageError();
		}
		return flag;
	}
	
	private boolean ldap(String username, String password) {
		boolean flag = false;
		try {
			Properties settings = loadIdentityServerSettings();
			URL url =  new URL(settings.getProperty("RemoteUserStoreManagerService-wsdl-url"));
	        WSO2UserStub.disableSSL();
	        WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
	        stub.applyHttpBasicAuthentication(settings.getProperty("admin-usn"), settings.getProperty("admin-pwd"), 2);
	        
	        flag = stub.getOperations().authenticate(username, password);
	        
	        if(!flag) { 
	        	Core.setMessageError(gt("Ooops! Email e senha inconsistentes."));
	        	return flag;
	        }
	        
	        flag = false;
	        
	        List<ClaimDTO> result = stub.getOperations().getUserClaimValues(username, "");
	        if(result != null && result.size() > 0) {
	        	try {
	        		UpdateCredential credential = new UpdateCredential();
			        credential.setUserName(new JAXBElement<String>(new QName(settings.getProperty("RemoteUserStoreManagerService-wsdl-url"), "userName"), String.class, username));
			        credential.setNewCredential(new JAXBElement<String>(new QName(settings.getProperty("RemoteUserStoreManagerService-wsdl-url"), "newCredential"), String.class, password));
			       // credential.setOldCredential(new JAXBElement<String>(new QName(settings.getProperty("RemoteUserStoreManagerService-wsdl-url"), "oldCredential"), String.class, currentPassword));
		
			        stub.getOperations().updateCredential(credential);
			        
			        javax.xml.ws.BindingProvider bp =  (javax.xml.ws.BindingProvider)stub.getOperations();
			        
			        Map<String, Object> m = bp.getResponseContext();
			      
			        
			        int responseCode = -1;
			        
			        try {
			        	responseCode = (Integer)m.get(MessageContext.HTTP_RESPONSE_CODE); // bug due version of jax-ws client TomEE 
			        }catch (NullPointerException e) {
			        	responseCode = 200;
					}
			        if(responseCode == 202 || responseCode == 200) { 
			        	Core.setMessageSuccess(gt("Password alterado com sucesso."));
			        	flag = true;
			        }
	        	}catch(Exception e) {
	        		e.printStackTrace();
	        		Core.setMessageError("Ocorreu um erro. " + e.getMessage());
	        	}
	        }else {
	        	Core.setMessageError(gt("Ocorreu um erro. Utilizador inválido."));
	        }
		}catch(Exception e) {
			Core.setMessageError("Ocorreu um erro. " + e.getMessage());
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
