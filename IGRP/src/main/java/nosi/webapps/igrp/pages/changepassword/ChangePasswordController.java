
package nosi.webapps.igrp.pages.changepassword;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.ldap.LdapInfo;
import nosi.core.ldap.LdapPerson;
import nosi.core.ldap.NosiLdapAPI;
import nosi.core.webapp.Controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.Properties;

import javax.xml.bind.JAXB;
import javax.xml.bind.JAXBElement;
import javax.xml.namespace.QName;
import javax.xml.ws.handler.MessageContext;

import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerService;
import org.wso2.carbon.um.ws.service.UpdateCredential;
import org.wso2.carbon.um.ws.service.dao.xsd.ClaimDTO;

import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.User;
import service.client.WSO2UserStub;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class ChangePasswordController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/  
		ChangePassword model = new ChangePassword();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		ChangePasswordView view = new ChangePasswordView(model);
		view.email_1.setValue(Core.getCurrentUser().getEmail().trim());
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGuardar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GUARDAR)----*/
		ChangePassword model = new ChangePassword();
		if(Igrp.getMethod().equalsIgnoreCase("post")){

			model.load();
		
			if(!model.getPassword_1().equals(model.getConfirm_password())) {
				Core.setMessageError(gt("Password inconsistentes ... Tente de novo !"));
				return this.forward("igrp","ChangePassword","index");
			}
			
			if (model.getPassword_1().equals(model.getOld_password())) {
				Core.setMessageError(gt("A nova senha não pode ser igual a senha anterior ... Tente de novo !"));
				return this.forward("igrp","ChangePassword","index");
			}
			
			switch(this.getConfig().getAutenticationType()) {
				case "ldap": return ldap(model.getOld_password(), model.getPassword_1());
				case "db": return db(model.getOld_password(), model.getPassword_1());
				default:;
			}
			
		}
		return this.redirect("igrp","ChangePassword","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	
	private Response db(String currentPassword, String newPassword) throws IOException {

		User user = Core.getCurrentUser();
		if(!user.getPass_hash().equals(nosi.core.webapp.User.encryptToHash(currentPassword, "MD5"))) {
			Core.setMessageError(gt("Senha atual inválida. Tente de novo !!! "));
			return this.forward("igrp","ChangePassword","index");
		} 
		user.setPass_hash(nosi.core.webapp.User.encryptToHash(newPassword, "MD5"));
		user.setUpdated_at(System.currentTimeMillis());
		user = user.update();
		if(user !=null)
			Core.setMessageSuccess(gt("Senha atualizada com sucesso."));
		else
			return this.forward("igrp","ChangePassword","index");
		
		return this.redirect("igrp","ChangePassword","index");
	
	}
	
	private Response ldap(String currentPassword, String newPassword) throws IOException {
	
		User user = Core.getCurrentUser();
		if(!user.getPass_hash().equals(nosi.core.webapp.User.encryptToHash(currentPassword, "MD5"))) {
			Core.setMessageError(gt("Senha atual inválida. Tente de novo !!! "));
			return this.forward("igrp","ChangePassword","index");
		}
		
		Properties settings = loadIdentityServerSettings();
		
		if(settings.getProperty("enabled") != null && settings.getProperty("enabled").equalsIgnoreCase("true"))
			if(!useIds(currentPassword, newPassword, settings))
				return forward("igrp","ChangePassword","index");
		else
			if(!dontUseIds(currentPassword, newPassword))
				return forward("igrp","ChangePassword","index");
		
		return redirect("igrp","ChangePassword","index");
	}
	
	private boolean useIds(String currentPassword, String newPassword, Object ...obj) {
		boolean flag = false;
		Properties settings = (Properties)obj[0];
		User user = Core.getCurrentUser();
		try {
			URL url =  new URL(settings.getProperty("RemoteUserStoreManagerService-wsdl-url"));
	        WSO2UserStub.disableSSL();
	        WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
	        stub.applyHttpBasicAuthentication(settings.getProperty("admin-usn"), settings.getProperty("admin-pwd"), 2);
	        
	        List<ClaimDTO> result = stub.getOperations().getUserClaimValues(user.getEmail(), "");
	        if(result != null && result.size() > 0) {
	        	try {
	        		UpdateCredential credential = new UpdateCredential();
			        credential.setUserName(new JAXBElement<String>(new QName(settings.getProperty("RemoteUserStoreManagerService-wsdl-url"), "userName"), String.class, user.getEmail()));
			        credential.setNewCredential(new JAXBElement<String>(new QName(settings.getProperty("RemoteUserStoreManagerService-wsdl-url"), "newCredential"), String.class, newPassword));
			        credential.setOldCredential(new JAXBElement<String>(new QName(settings.getProperty("RemoteUserStoreManagerService-wsdl-url"), "oldCredential"), String.class, currentPassword));
			        
			    	stub.getOperations().updateCredential(credential);
			      
			        int responseCode = (Integer)((javax.xml.ws.BindingProvider) stub.getOperations()).getResponseContext().get(MessageContext.HTTP_RESPONSE_CODE);
			        if(responseCode == 202) { 
			        	Core.setMessageSuccess(gt("Password alterado com sucesso."));
			        	flag = true;
			        }
	        	}catch(Exception e) {
	        		Core.setMessageError("Ocorreu um erro. " + e.getMessage());
	        	}
	        }else {
	        	Core.setMessageError(gt("Ocorreu um erro. Email inválido."));
	        }
		}catch(Exception e) {
			Core.setMessageError("Ocorreu um erro. " + e.getMessage());
			e.printStackTrace();
		}
		
		return flag;
	}
	
	private boolean dontUseIds(String currentPassword, String newPassword) {
		boolean flag = true;
		User user = Core.getCurrentUser();
		File file = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/ldap/ldap.xml"));
		LdapInfo ldapinfo = JAXB.unmarshal(file, LdapInfo.class);
		NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(), ldapinfo.getBase(), ldapinfo.getAuthenticationFilter(), ldapinfo.getEntryDN());
		
		LdapPerson person = ldap.getUserLastInfo(Core.getCurrentUser().getEmail().trim());
		
		String error = ldap.getError();
		if(person != null) {
			person.setPwdLastSet(newPassword);
			person.setUid(user.getUser_name());
			ldap.changePassword(person);
			error = ldap.getError();
			if(error != null) {
				Core.setMessageError("Ocorreu um erro. LDAP error: " + error);
				flag = false;
			}else { 
				user.setPass_hash(nosi.core.webapp.User.encryptToHash(newPassword, "MD5"));
				user.setUpdated_at(System.currentTimeMillis());
				user = user.update();
				Core.setMessageSuccess(gt("Password alterado com sucesso."));
			}
		}else {
			Core.setMessageError(gt(error != null ? error : "Ocorreu um erro. Email inválido."));
			flag = false;
		}
		return flag;
	}
	
	private Properties loadIdentityServerSettings() {
		String path = Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/") + "ids";
		String fileName = "wso2-ids.xml";
		File file = new File(path + File.separator + fileName);
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
	
		/*----#END-PRESERVED-AREA----*/
}
