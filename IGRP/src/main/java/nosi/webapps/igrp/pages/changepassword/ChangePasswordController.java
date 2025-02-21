package nosi.webapps.igrp.pages.changepassword;

import static nosi.core.i18n.Translator.gt;
import java.io.IOException;

import nosi.core.authentication.ldap.LdapInfo;
import nosi.core.authentication.ldap.LdapPerson;
import nosi.core.authentication.ldap.NosiLdapAPI;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.integration.autentika.RemoteUserStoreManagerServiceSoapClient;
import nosi.core.integration.autentika.dto.AuthenticateRequestDTO;
import nosi.core.integration.autentika.dto.UpdateCredentialRequestDTO;
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
		if ("true".equalsIgnoreCase(ConfigCommonMainConstants.IDS_AUTENTIKA_ENABLED.environmentValue())) {
			if (!useIds(currentPassword, newPassword))
				return forward("igrp", "ChangePassword", "index");
		} else if (!directlyThroughLdapServer(currentPassword, newPassword))
			return forward("igrp", "ChangePassword", "index");

		return redirect("igrp", "ChangePassword", "index");
	}
	
	private boolean useIds(String currentPassword, String newPassword) {

		User user = Core.getCurrentUser();

		String wsdlUrl = ConfigCommonMainConstants.IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL.environmentValue();
		String uid = ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_USN.environmentValue();
		String pwd = ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_PWD.environmentValue();

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
		LdapInfo ldapinfo = new LdapInfo();

		ldapinfo.setUrl(ConfigCommonMainConstants.LDAP_AD_URL.environmentValue());
		ldapinfo.setUsername(ConfigCommonMainConstants.LDAP_AD_USERNAME.environmentValue());
		ldapinfo.setPassword(ConfigCommonMainConstants.LDAP_AD_PASSWORD.environmentValue());
		ldapinfo.setBase(ConfigCommonMainConstants.LDAP_AD_BASE.environmentValue());
		ldapinfo.setAuthenticationFilter(ConfigCommonMainConstants.LDAP_AD_AUTHENTICATION_FILTER.environmentValue());
		ldapinfo.setEntryDN(ConfigCommonMainConstants.LDAP_AD_ENTRY_DN.environmentValue());

		NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(), ldapinfo.getBase(), ldapinfo.getAuthenticationFilter(), ldapinfo.getEntryDN());
		LdapPerson person = ldap.getUserLastInfo(user.getEmail().trim());
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
