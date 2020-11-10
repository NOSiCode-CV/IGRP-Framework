package cv.nosi.webapps.igrp.pages.resetpassword;

import java.io.IOException;

import static cv.nosi.core.i18n.Translator.gt;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.xml.bind.JAXBElement;
import javax.xml.namespace.QName;
import javax.xml.ws.handler.MessageContext;
import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerService;
import org.wso2.carbon.um.ws.service.UpdateCredentialByAdmin;
import org.wso2.carbon.um.ws.service.dao.xsd.ClaimDTO;

import cv.nosi.core.config.Config;
import cv.nosi.core.config.ConfigApp;
import cv.nosi.core.config.ConfigCommonMainConstants;
import cv.nosi.core.webapp.Response;
import cv.nosi.core.webapp.mvc.Controller;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.util.helpers.database.QueryInterface;
import cv.nosi.core.webapp.util.helpers.database.ResultSet;
import cv.nosi.webapps.igrp.dao.User;
import service.client.WSO2UserStub;

/*----#end-code----*/
		
public class ResetpasswordController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Resetpassword model = new Resetpassword();
		model.load();
		model.setSign_in("igrp","Dominio","index");
		ResetpasswordView view = new ResetpasswordView();
		/*----#start-code(index)----*/
		model.setSign_in("webapps?r=igrp/login/login");
		
		String token = Core.getParam("t");
		
		
		
		try {
			
			if(token == null || token.isEmpty()) 
				throw new RuntimeException("Invalid or expired token.");
			
			User user = new User().find().andWhere("password_reset_token", "=", token).one();
			
			if(user != null) {
				model.setUsername(user.getEmail());
				String aux = new String(Base64.getUrlDecoder().decode(user.getPassword_reset_token()));
				String time = aux.split("_")[1];
				if(time.compareTo(System.currentTimeMillis() + "") <= 0 || user.getStatus() == 0) 
					throw new Exception("Invalid or expired token.");
			}else
				throw new Exception("Invalid or expired token."); 
		
		}catch(Exception e) {
			Core.setMessageError(gt("Token inválido ou expirado."));
			Core.setMessageInfo(gt("Favor solicitar um novo reset."));
			return redirect("igrp","Resetbyemail","index", this.queryString());
		}
		
		view.btn_guardar.setLink("guardar&t=" + token); 
		
/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGuardar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Resetpassword model = new Resetpassword();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Resetpassword","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(guardar)----*/
		
    
      
		String token = Core.getParam("t");
		User user = null;
		
		try {
			
			if(token == null || token.isEmpty()) 
				throw new Exception("Invalid or expired token.");
			
			user = new User().find().andWhere("password_reset_token", "=", token).one();
			
			if(user != null) {
				String aux = new String(Base64.getUrlDecoder().decode(user.getPassword_reset_token()));
				String arr[] = aux.split("_");
				String time = arr[1];
				if(time.compareTo(System.currentTimeMillis() + "") <= 0 || user.getStatus() == 0) 
					throw new Exception("Invalid or expired token.");
			}else
				throw new Exception("Invalid or expired token."); 
			
		}catch(Exception e) {
			this.addQueryString("t", token);		
			Core.setMessageError(gt("Token inválido ou expirado."));
			Core.setMessageInfo(gt("Favor solicitar um novo reset."));
			return forward("igrp","Resetbyemail","index", this.queryString());
		}
		
		String username = user.getUser_name();
		String pwd = model.getNova_senha();
		String pwdConfirm = model.getConfirmar_nova_senha();
		
		if(!pwd.equals(pwdConfirm)) 
			Core.setMessageError("Password inconsistentes. Tente novamente !"); 
		else {
			String authenticationType = this.getConfig().getAutenticationType(); 
			if(authenticationType.equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_DATABASE.value())) {
				if(db(username, pwd)) 				
					return redirectToUrl("webapps?r=igrp/login/login"); 
			}else 
				if(authenticationType.equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_LDAP.value())) {
					if(ldap(username, pwd)) 	                      
						return redirectToUrl("webapps?r=igrp/login/login");
				}
		}
		this.addQueryString("t", token);
		/*----#end-code----*/
		return this.redirect("igrp","Resetpassword","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	
	private boolean db(String username, String password) {
		boolean flag = false;
		User u = Core.findUserByUsername(username);
		if(u != null) {
			u.setPass_hash(cv.nosi.core.webapp.component.User.encryptToHash(username + "" + password, "SHA-256"));
			u = u.update();
			if(u != null) {
				Core.setMessageSuccess("Password alterado com sucesso. Faça o login para continuar.");
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
			Properties settings = this.configApp.getMainSettings(); 
			URL url =  new URL(settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL.value()));
	        WSO2UserStub.disableSSL();
	        WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
	        stub.applyHttpBasicAuthentication(settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_USN.value()), settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_PWD.value()), 2);
	        
	        flag = stub.getOperations().isExistingUser(username);
	        
	        if(!flag) { 
	        	Core.setMessageError(gt("Ooops! Email e senha inconsistentes.")); 
	        	return flag;
	        }
	        
	        flag = false;
	        
	        List<ClaimDTO> result = stub.getOperations().getUserClaimValues(username, "");
	        if(result != null && result.size() > 0) {
	        	try {
	        		
			        UpdateCredentialByAdmin credential = new UpdateCredentialByAdmin();
			        credential.setUserName(new JAXBElement<String>(new QName(settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL.value()), "userName"), String.class, username));
			        credential.setNewCredential(new JAXBElement<String>(new QName(settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL.value()), "newCredential"), String.class, password));
			        
			        stub.getOperations().updateCredentialByAdmin(credential);
			        
			        javax.xml.ws.BindingProvider bp =  (javax.xml.ws.BindingProvider)stub.getOperations();
			        
			        Map<String, Object> m = bp.getResponseContext();
			      
			        
			        int responseCode = -1;
			        
			        try {
			        	responseCode = (Integer)m.get(MessageContext.HTTP_RESPONSE_CODE); // bug due version of jax-ws client TomEE 
			        }catch (NullPointerException e) {
			        	responseCode = 200;
					}
			        if(responseCode == 202 || responseCode == 200) { 
			        	Core.setMessageSuccess(gt("Password alterado com sucesso. Faça o login para continuar."));
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
	
	
/*----#end-code----*/
}
