package nosi.webapps.igrp.pages.resetpassword;


import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/


import static nosi.core.i18n.Translator.gt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.xml.bind.JAXBElement;
import javax.xml.namespace.QName;
import javax.xml.ws.handler.MessageContext;

import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerService;
import org.wso2.carbon.um.ws.service.UpdateCredential;
import org.wso2.carbon.um.ws.service.UpdateCredentialByAdmin;
import org.wso2.carbon.um.ws.service.dao.xsd.ClaimDTO;

import nosi.webapps.igrp.dao.User;

import nosi.core.config.Config;

import service.client.WSO2UserStub;

/*----#end-code----*/
		
public class ResetpasswordController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Resetpassword model = new Resetpassword();
		model.load();
		ResetpasswordView view = new ResetpasswordView();
		/*----#start-code(index)----*/
		model.setSign_in("igrp","login","login");
		
		String token = Core.getParam("t");
		
		 this.addQueryString("target","_blank");
		 this.addQueryString("isPublic","1");
		
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
		
		view.btn_guardar.setLink("guardar&target=_blank&isPublic=1&t=" + token); 
		
/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGuardar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#start-code(guardar)----*/
		
      Resetpassword model = new Resetpassword();
		model.load();
      
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
			this.addQueryString("target", "_blank");
			this.addQueryString("isPublic", "1");
			Core.setMessageError(gt("Token inválido ou expirado."));
			Core.setMessageInfo(gt("Favor solicitar um novo reset."));
			return forward("igrp","Resetbyemail","index", this.queryString());
		}
		
		String username = user.getUser_name();
		String pwd = model.getNova_senha();
		String pwdConfirm = model.getConfirmar_nova_senha();
		
		if(!pwd.equals(pwdConfirm)) {
			Core.setMessageError("Password inconsistentes. Tente novamente !");
			
		//	return forward("igrp","Resetpassword","index", this.queryString());
		}else {
			switch(this.getConfig().getAutenticationType()) {
				case "db": 
					if(db(username, pwd)) {
						this.addQueryString("target", "_self");
						return redirect("igrp","login","login", this.queryString());
					}
				break;
				case "ldap": 
					if(ldap(username, pwd)) {
						this.addQueryString("target", "_self");
						return redirect("igrp","login","login", this.queryString());
					}
				break;
			}
		}
		
		this.addQueryString("t", token);
		this.addQueryString("target", "_blank");
		this.addQueryString("isPublic", "1");
		
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
			Properties settings = loadIdentityServerSettings();
			URL url =  new URL(settings.getProperty("ids.wso2.RemoteUserStoreManagerService-wsdl-url"));
	        WSO2UserStub.disableSSL();
	        WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
	        stub.applyHttpBasicAuthentication(settings.getProperty("ids.wso2.admin-usn"), settings.getProperty("ids.wso2.admin-pwd"), 2);
	        
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
			        credential.setUserName(new JAXBElement<String>(new QName(settings.getProperty("ids.wso2.RemoteUserStoreManagerService-wsdl-url"), "userName"), String.class, username));
			        credential.setNewCredential(new JAXBElement<String>(new QName(settings.getProperty("ids.wso2.RemoteUserStoreManagerService-wsdl-url"), "newCredential"), String.class, password));
			        
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
	
	public boolean validateRequest() {
		boolean flag = false;
		
		return flag;
	}
	
	
/*----#end-code----*/
}