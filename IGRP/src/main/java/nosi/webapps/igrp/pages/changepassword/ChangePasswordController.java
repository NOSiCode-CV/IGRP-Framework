package nosi.webapps.igrp.pages.changepassword;

import static nosi.core.i18n.Translator.gt;
import java.io.IOException;
import java.util.Properties;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.integration.autentika.RemoteUserStoreManagerServiceSoapClient;
import nosi.core.integration.autentika.dto.AuthenticateRequestDTO;
import nosi.core.integration.autentika.dto.UpdateCredentialRequestDTO;
import nosi.core.ldap.LdapInfo;
import nosi.core.ldap.LdapPerson;
import nosi.core.ldap.NosiLdapAPI;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.User;

/*----#END-PRESERVED-AREA----*/

public class ChangePasswordController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/  
		ChangePassword model = new ChangePassword();
		model.load();
		ChangePasswordView view = new ChangePasswordView(model);
		view.email_1.setValue(Core.getCurrentUser().getEmail().trim());
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGuardar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GUARDAR)----*/
		ChangePassword model = new ChangePassword();
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
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
				default:
            }
		}
		return this.redirect("igrp","ChangePassword","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	
	private Response db(String currentPassword, String newPassword) throws IOException {
		User user = Core.getCurrentUser();
		if(!user.getPass_hash().equals(nosi.core.webapp.User.encryptToHash(user.getUser_name()+currentPassword, "SHA-256"))) {
			Core.setMessageError(gt("Senha atual inválida. Tente de novo !!! "));
			return this.forward("igrp","ChangePassword","index");
		} 
		user.setPass_hash(nosi.core.webapp.User.encryptToHash(user.getUser_name()+ "" + newPassword, "SHA-256"));
		user.setUpdated_at(System.currentTimeMillis());
		user = user.update();
		if(user !=null)
			Core.setMessageSuccess(gt("Senha atualizada com sucesso."));
		else
			return this.forward("igrp","ChangePassword","index");
		
		return this.redirect("igrp","ChangePassword","index");
	
	}
	
	private Response ldap(String currentPassword, String newPassword) throws IOException {
		Properties settings = this.configApp.getMainSettings();
		if(settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ENABLED.value()) != null && settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ENABLED.value()).equalsIgnoreCase("true")) {
			if(!useIds(currentPassword, newPassword))
				return forward("igrp","ChangePassword","index");
		}else 
		if(!directlyThroughLdapServer(currentPassword, newPassword))
			return forward("igrp","ChangePassword","index");
		return redirect("igrp","ChangePassword","index");
	}
	
	private boolean useIds(String currentPassword, String newPassword) {
		Properties settings = this.configApp.getMainSettings();
		User user = Core.getCurrentUser();
		String wsdlUrl = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL.value());
		String uid = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_USN.value()); 
		String pwd = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_PWD.value());
		RemoteUserStoreManagerServiceSoapClient client = new RemoteUserStoreManagerServiceSoapClient(wsdlUrl, uid, pwd);
		AuthenticateRequestDTO authenticateRequestDTO = new AuthenticateRequestDTO(); 
		authenticateRequestDTO.setUserName(user.getUser_name());
		authenticateRequestDTO.setCredential(currentPassword);
		if(!client.authenticate(authenticateRequestDTO)) {
			Core.setMessageError(gt("Ooops! Email e senha inconsistentes."));
        	return false;
		}
		UpdateCredentialRequestDTO updateCredentialRequestDTO = new UpdateCredentialRequestDTO();
		updateCredentialRequestDTO.setUserName(user.getUser_name());
		updateCredentialRequestDTO.setNewCredential(newPassword);
		updateCredentialRequestDTO.setOldCredential(currentPassword);
		if(client.updateCredential(updateCredentialRequestDTO)) {
			Core.setMessageSuccess(gt("Password alterado com sucesso."));
        	return true;
		}else
			Core.setMessageError(gt("Ocorreu um erro na atualização de Password."));
		
		return false;	
	}
	
	private boolean directlyThroughLdapServer(String currentPassword, String newPassword) {
		boolean flag = true;
		User user = Core.getCurrentUser();
		Properties settings = this.configApp.getMainSettings(); 
		LdapInfo ldapinfo = new LdapInfo();
		ldapinfo.setUrl(settings.getProperty(ConfigCommonMainConstants.LDAP_AD_URL.value()));
		ldapinfo.setUsername(settings.getProperty(ConfigCommonMainConstants.LDAP_AD_USERNAME.value()));
		ldapinfo.setPassword(settings.getProperty(ConfigCommonMainConstants.LDAP_AD_PASSWORD.value()));
		ldapinfo.setBase(settings.getProperty(ConfigCommonMainConstants.LDAP_AD_BASE.value()));
		ldapinfo.setAuthenticationFilter(settings.getProperty(ConfigCommonMainConstants.LDAP_AD_AUTHENTICATION_FILTER.value()));
		ldapinfo.setEntryDN(settings.getProperty(ConfigCommonMainConstants.LDAP_AD_ENTRY_DN.value()));
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
				user.setPass_hash(nosi.core.webapp.User.encryptToHash(newPassword, "SHA-256"));
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
		/*----#END-PRESERVED-AREA----*/
}
