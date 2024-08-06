package nosi.core.authentication;


import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import jakarta.servlet.http.HttpServletRequest;
import nosi.core.authentication.ldap.LdapPerson;
import nosi.core.authentication.ldap.NosiLdapAPI;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.integration.autentika.RemoteUserStoreManagerServiceSoapClient;
import nosi.core.integration.autentika.dto.AuthenticateRequestDTO;
import nosi.core.integration.autentika.dto.ClaimDTO;
import nosi.core.integration.autentika.dto.RemoteUserStoreManagerServiceConstants;
import nosi.core.integration.autentika.dto.UserClaimValuesRequestDTO;
import nosi.core.integration.autentika.dto.UserClaimValuesResponseDTO;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.User;

public final class LdapAuthenticationManager {
	
	private LdapAuthenticationManager() {}
	
	public static boolean authenticate(String username, String password, Properties config, HttpServletRequest request) {
		boolean success = false;
		ArrayList<LdapPerson> personArray = new ArrayList<>();
		String idsAutentikaEnabled = config.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ENABLED.value());
		if ("true".equalsIgnoreCase(idsAutentikaEnabled))
			success = authenticateThroughIdentityServerAutentika(username, password, config, personArray);
		else
			success = authenticateDirectlyToLDAPServer(username, password, config, personArray);
		if(!success)
			throw new IllegalStateException("A sua conta ou palavra-passe está incorreta.");
			// Verify if this credentials exist in DB
		User user = new User().findIdentityByUsername(username);
			if (user != null) {
				Profile profile = new Profile().getByUser(user.getId());
				if(profile == null)
					throw new IllegalStateException("Nenhum perfil foi encontrado para o utilizador."+"("+username+")");
				AuthenticationManager.createSecurityContext(user, request.getSession(false));
				AuthenticationManager.afterLogin(profile, user, request);

				// sso(username, password, user);
				return setUserAsAuthenticated(user);
			} else {
				final String env = ConfigCommonMainConstants.isEnvironmentVariableScanActive() ? ConfigCommonMainConstants.IGRP_ENV.getEnvironmentVariable() : config.getProperty(ConfigCommonMainConstants.IGRP_ENV.value());
				if(!ConfigCommonMainConstants.IGRP_ENV_DEV.value().equals(env))
					throw new IllegalStateException("Esta conta não tem acesso ao IGRP. Por favor, contacte o Administrador."+"("+username+")");
				User newUser = new User();
				newUser.setUser_name(username.trim().toLowerCase());
				if ( !personArray.isEmpty()) {
                   for (LdapPerson p : personArray) {
                      if (p.getName() != null && !p.getName().isEmpty())
                         newUser.setName(p.getName());
                      else if (p.getDisplayName() != null && !p.getDisplayName().isEmpty())
                         newUser.setName(p.getDisplayName());
                      else
                         newUser.setName(p.getFullName());
                      newUser.setEmail(p.getMail().toLowerCase());
                   }
				}
				newUser.setStatus(1);
				newUser.setCreated_at(System.currentTimeMillis());
				newUser.setUpdated_at(System.currentTimeMillis());
				newUser.setAuth_key(nosi.core.webapp.User.generateAuthenticationKey());
				newUser.setActivation_key(nosi.core.webapp.User.generateActivationKey());
				newUser.setIsAuthenticated(1);
				newUser = newUser.insert();
				if (newUser != null) {
					AuthenticationManager.createPerfilWhenAutoInvite(newUser);
					AuthenticationManager.createSecurityContext(newUser, request.getSession(false));
					// sso(username, password, newUser)
					return true;
				}
			}
		return success;
	}
	
	private static boolean authenticateThroughIdentityServerAutentika(String username, String password, Properties config, List<LdapPerson> personArray) {
		boolean flag = false;
		String wsdlUrl = config.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL.value());
		String uid = config.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_USN.value());
		String pwd = config.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_PWD.value());
		String v = config.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_GOVCV_ENABLED.value());
		username = "true".equalsIgnoreCase(v) ? RemoteUserStoreManagerServiceConstants.GOVCV_TENANT + "/" + username : username;
		RemoteUserStoreManagerServiceSoapClient client = new RemoteUserStoreManagerServiceSoapClient(wsdlUrl, uid, pwd);
		AuthenticateRequestDTO authenticateRequestDTO = new AuthenticateRequestDTO();
		authenticateRequestDTO.setUserName(username);
		authenticateRequestDTO.setCredential(password);
		if (client.authenticate(authenticateRequestDTO)) {
			UserClaimValuesRequestDTO userClaimValuesRequestDTO = new UserClaimValuesRequestDTO();
			userClaimValuesRequestDTO.setUserName(username);
			UserClaimValuesResponseDTO userClaimValuesResponseDTO = client
					.getUserClaimValues(userClaimValuesRequestDTO);
			if (userClaimValuesResponseDTO != null) {
				// Pesquisar user from Ids
				List<ClaimDTO> claimDTOs = userClaimValuesResponseDTO.getClaimDTOs();
				claimDTOs.forEach(obj -> {
					LdapPerson ldapPerson = new LdapPerson();
					switch (obj.getClaimUri()) {
					case RemoteUserStoreManagerServiceConstants.DISPLAYNAME_CLAIM_URI:
						ldapPerson.setDisplayName(obj.getValue());
						break;
					case RemoteUserStoreManagerServiceConstants.GIVENNAME_CLAIM_URI:
						ldapPerson.setGivenName(obj.getValue());
						break;
					case RemoteUserStoreManagerServiceConstants.EMAIL_CLAIM_URI:
						ldapPerson.setUid(obj.getValue());
						ldapPerson.setMail(obj.getValue());
						break;
					case RemoteUserStoreManagerServiceConstants.FULLNAME_CLAIM_URI:
						ldapPerson.setFullName(obj.getValue());
						break;
					case RemoteUserStoreManagerServiceConstants.LASTNAME_CLAIM_URI:
						ldapPerson.setLastName(obj.getValue());
						break;
					}
					personArray.add(ldapPerson);
				});
				flag = !claimDTOs.isEmpty();
			}
		}
		return flag;
	}
	
	private static boolean authenticateDirectlyToLDAPServer(String username, String password, Properties config, ArrayList<LdapPerson> personArray) {
		NosiLdapAPI ldap = new NosiLdapAPI(
				config.getProperty(ConfigCommonMainConstants.LDAP_AD_URL.value()),
				config.getProperty(ConfigCommonMainConstants.LDAP_AD_USERNAME.value()),
				config.getProperty(ConfigCommonMainConstants.LDAP_AD_PASSWORD.value()),
				config.getProperty(ConfigCommonMainConstants.LDAP_AD_BASE.value()),
				config.getProperty(ConfigCommonMainConstants.LDAP_AD_AUTHENTICATION_FILTER.value()),
				config.getProperty(ConfigCommonMainConstants.LDAP_AD_ENTRY_DN.value()));
		return ldap.validateLogin(username, password, personArray);
	}
	
	private static boolean setUserAsAuthenticated(User u) {
		u.setIsAuthenticated(1);
		u = u.update();
		return u != null && !u.hasError();
	}

}
