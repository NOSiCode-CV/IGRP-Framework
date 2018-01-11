package nosi.core.ldap;
/**
 * @author Adilson Rodrigues
 * May 29, 2017
 */

import java.io.File;
import java.util.ArrayList;

import javax.xml.bind.JAXB;

import nosi.core.gui.components.IGRPLogBar;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;

public class Test {

	static String l_ldap_url;
	static String l_ldap_username;
	static String l_ldap_password;
	static String l_ldap_base;
	static String l_ldap_type;
	static String l_ldap_authentication_filter;
	static String l_ldap_entryDN;

	public static void main(String[] args) {
		System.out.println(new IGRPLogBar());
		System.exit(0);
		//Teste LDAP 
		//String path = Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/ldap/ldap.xml"); 
		String path="C:\\git\\IGRP-Framework\\IGRP\\WebContent\\WEB-INF\\config\\ldap\\ldap.xml";
		File file = new File(path);
		LdapInfo ldapinfo = JAXB.unmarshal(file, LdapInfo.class);
		l_ldap_url = ldapinfo.getUrl();
		l_ldap_username = ldapinfo.getUsername();
		l_ldap_password = ldapinfo.getPassword();
		l_ldap_base = ldapinfo.getBase();
		l_ldap_authentication_filter = ldapinfo.getAuthenticationFilter();
		l_ldap_entryDN = ldapinfo.getEntryDN();
		
		TestePesquisa();
	}

	static void TesteLogin() {
		NosiLdapAPI ldap = new NosiLdapAPI(l_ldap_url, l_ldap_username, l_ldap_password, l_ldap_base, l_ldap_authentication_filter,l_ldap_entryDN);
		if (ldap.validateLogin("iekinyfernandes", ""))
			System.out.println("User Válido");
		else {
			System.out.println("User Inválido: " + ldap.getError());
		}
	}

	static void TestePesquisa() {
		String email = "pedro.ramos@nosi.cv";
		NosiLdapAPI ldap = new NosiLdapAPI(l_ldap_url, l_ldap_username, l_ldap_password, l_ldap_base, l_ldap_authentication_filter,l_ldap_entryDN);
		ArrayList<LdapPerson> personArray = ldap.getUser(email);
		if (personArray != null) {
			for (int i = 0; i < personArray.size(); i++) {
				LdapPerson p = personArray.get(i);
				System.out.println("uid:" + p.getUid());
				System.out.println("cn:" + p.getCn());
				System.out.println("Sn:" + p.getCn());
				System.out.println("SAMAccountName:" + p.getsAMAccountName());
				System.out.println("Name:" + p.getName());
				System.out.println("DisplayName:" + p.getDisplayName());
				System.out.println("givenName:" + p.getGivenName());
				System.out.println("Mail:" + p.getMail());
				System.out.println("ProxyAdrresses:" + p.getProxyAddresses());
				System.out.println("Username:" + p.getUserPrincipalName());
			}
		} else
			System.out.println("Pesquisa não encontrada: " + ldap.getError());
	}

}
