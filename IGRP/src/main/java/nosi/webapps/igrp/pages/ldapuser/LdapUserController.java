package nosi.webapps.igrp.pages.ldapuser;

import static nosi.core.i18n.Translator.gt;
import java.io.IOException;
import java.util.Properties;

import nosi.core.authentication.ldap.LdapInfo;
import nosi.core.authentication.ldap.LdapPerson;
import nosi.core.authentication.ldap.NosiLdapAPI;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.integration.autentika.RemoteUserStoreManagerServiceSoapClient;
import nosi.core.integration.autentika.dto.ClaimDTO;
import nosi.core.integration.autentika.dto.RemoteUserStoreManagerServiceConstants;
import nosi.core.integration.autentika.dto.UserRequestDTO;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.User;

/*----#END-PRESERVED-AREA----*/

public class LdapUserController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		LdapUser model = new LdapUser();
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post"))
			model.load();
		LdapUserView view = new LdapUserView(model);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		LdapUser model = new LdapUser();
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			model.load();
			boolean success = false;
			if("true".equalsIgnoreCase(ConfigCommonMainConstants.IDS_AUTENTIKA_ENABLED.environmentValue()))
				success = addThroughIds(model);
			else 
				success = addThroughLdap(model);
			if(!success)
				return this.forward("igrp","LdapUser","index");
		}
		return this.redirect("igrp","LdapUser","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	private boolean addThroughLdap(LdapUser model) {
		boolean flag = false;

		LdapInfo ldapinfo = new LdapInfo();
		ldapinfo.setUrl(ConfigCommonMainConstants.LDAP_AD_URL.environmentValue());
		ldapinfo.setUsername(ConfigCommonMainConstants.LDAP_AD_USERNAME.environmentValue());
		ldapinfo.setPassword(ConfigCommonMainConstants.LDAP_AD_PASSWORD.environmentValue());
		ldapinfo.setBase(ConfigCommonMainConstants.LDAP_AD_BASE.environmentValue());
		ldapinfo.setAuthenticationFilter(ConfigCommonMainConstants.LDAP_AD_AUTHENTICATION_FILTER.environmentValue());
		ldapinfo.setEntryDN(ConfigCommonMainConstants.LDAP_AD_ENTRY_DN.environmentValue());

		NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(), ldapinfo.getBase(), ldapinfo.getAuthenticationFilter(), ldapinfo.getEntryDN());
		LdapPerson person = new LdapPerson(); 
		person.setCn(model.getCommon_name().trim()); 
		person.setSn(model.getSurname().trim());
		try {
			String aux = model.getEmail_1().trim().split("@")[0];
			person.setUid(aux);
		}catch(Exception e) {
			person.setUid(model.getEmail_1().trim());
		}
		person.setMail(model.getEmail_1().trim());
		person.setDisplayName(model.getCommon_name().trim() + " " + model.getSurname().trim());
		person.setGivenName(model.getCommon_name().trim() + " " + model.getSurname().trim());
		ldap.createUser(person);
		String error = ldap.getError();
		if(error != null)
			Core.setMessageError(error);
		else {
			flag = true;
			Core.setMessageSuccess(gt("Utilizador registado com sucesso."));
		}
		return flag;
	}
	
	private boolean addThroughIds(LdapUser model) {

		String wsdlUrl = ConfigCommonMainConstants.IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL.environmentValue();
		String uid = ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_USN.environmentValue();
		String pwd = ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_PWD.environmentValue();

		RemoteUserStoreManagerServiceSoapClient client = new RemoteUserStoreManagerServiceSoapClient(wsdlUrl, uid, pwd);
		UserRequestDTO request = new UserRequestDTO();
		request.setRequirePasswordChange(false);
		request.setUserName(model.getEmail_1().trim());
		request.setCredential(RemoteUserStoreManagerServiceConstants.DEFAULT_PASSWORD);
		request.setProfileName(RemoteUserStoreManagerServiceConstants.DEFAULT_PROFILE);
		// User emailaddress claim
		ClaimDTO emailClaimDTO = new ClaimDTO();
		emailClaimDTO.setClaimUri(RemoteUserStoreManagerServiceConstants.EMAIL_CLAIM_URI);
		emailClaimDTO.setValue(model.getEmail_1().trim());
		request.getClaims().add(emailClaimDTO);
		// User fullname claim
		ClaimDTO fullNameClaimDTO = new ClaimDTO();
		fullNameClaimDTO.setClaimUri(RemoteUserStoreManagerServiceConstants.FULLNAME_CLAIM_URI);
		fullNameClaimDTO.setValue(model.getCommon_name().trim());
		request.getClaims().add(fullNameClaimDTO);
		// User lastname claim
		ClaimDTO lastNameClaimDTO = new ClaimDTO();
		lastNameClaimDTO.setClaimUri(RemoteUserStoreManagerServiceConstants.LASTNAME_CLAIM_URI);
		lastNameClaimDTO.setValue(model.getSurname().trim());
		request.getClaims().add(lastNameClaimDTO);
		if(!client.addUser(request)) 
			Core.setMessageError();
		else {
			Core.setMessageSuccess(gt("Utilizador registado com sucesso.")); 
			return true;
		}
		return false; 	
	}
	
	public Response actionIndex_(@RParam(rParamName = "email") String email) throws IOException, IllegalArgumentException, IllegalAccessException{
		LdapUser model = new LdapUser();
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			model.load();
			if(updateNUsingIds(model, email)) 
				return redirect("igrp", "ldap-user", "index_&email=" + email.trim());	
		}
		LdapUserView view = new LdapUserView(model);
		view.btn_gravar.setLink("igrp", "ldap-user", "index_&email=" + email);
		
		return this.renderView(view);
	}
	
	private boolean updateNUsingIds(LdapUser model, String email) {
		boolean flag = false;

		LdapInfo ldapinfo = new LdapInfo();
		ldapinfo.setUrl(ConfigCommonMainConstants.LDAP_AD_URL.environmentValue());
		ldapinfo.setUsername(ConfigCommonMainConstants.LDAP_AD_USERNAME.environmentValue());
		ldapinfo.setPassword(ConfigCommonMainConstants.LDAP_AD_PASSWORD.environmentValue());
		ldapinfo.setBase(ConfigCommonMainConstants.LDAP_AD_BASE.environmentValue());
		ldapinfo.setAuthenticationFilter(ConfigCommonMainConstants.LDAP_AD_AUTHENTICATION_FILTER.environmentValue());
		ldapinfo.setEntryDN(ConfigCommonMainConstants.LDAP_AD_ENTRY_DN.environmentValue());

		NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(), ldapinfo.getBase(), ldapinfo.getAuthenticationFilter(), ldapinfo.getEntryDN());
		LdapPerson person = ldap.getUserLastInfo(email.trim());
		String uid = "";
		if(person != null) {
			model.setCommon_name(person.getCn());
			model.setSurname(person.getSn());
			model.setEmail_1(person.getMail());
			uid = person.getUid();
		}else {
			Core.setMessageError(gt("Ocorreu um erro. O utilizador pode não existir."));
			return false;
		}
		person.setCn(model.getCommon_name().trim());
		person.setSn(model.getSurname().trim());
		person.setMail(model.getEmail_1().trim());
		person.setDisplayName(person.getCn() + " " + person.getSn());
		person.setGivenName(person.getCn() + " " + person.getSn());
		try {
			person.setUid(model.getEmail_1().trim().split("@")[0]);
		}catch(Exception e) {
			person.setUid(model.getEmail_1().trim());
		}
		ldap.updateUser(person, uid);
		String error = ldap.getError();
		if(error != null) {
			Core.setMessageError(gt("Ocorreu um erro. LDAP error: ") + error);
		}else {
			String oldName = ldapinfo.getEntryDN().replaceAll(":_placeholder", uid);
			String newName = ldapinfo.getEntryDN().replaceAll(":_placeholder", person.getUid());
			ldap.renameEntry(oldName, newName);
			error = ldap.getError();
			if(error != null) {
				Core.setMessageSuccess(gt("Ocorreu um erro. LDAP error: " ) + error);
			}else{
				User u = new User().find().andWhere("email", "=", email).one();
				if(u != null) {
					u.setName(person.getDisplayName());
					u.setEmail(person.getMail());
					u.setUser_name(person.getUid());
					u.setUpdated_at(System.currentTimeMillis());
					u = u.update();
					if(u != null) {
						Core.setMessageSuccess(gt("Utilizador atualizado com sucesso."));
						flag = true;
					}else 
						Core.setMessageSuccess(gt("Ocorreu um erro. Favor contactar o administrador. ")); 
				}else {
					Core.setMessageError(gt("Utilizador inválido. "));
				}
			}
		}
		return flag;
	}
	/*----#END-PRESERVED-AREA----*/
}
