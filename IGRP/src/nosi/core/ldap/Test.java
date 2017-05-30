package nosi.core.ldap;
/**
 * @author Adilson Rodrigues
 * May 29, 2017
 */

import java.io.File;
import java.util.ArrayList;

import javax.xml.bind.JAXB;

import nosi.core.webapp.Igrp;

public class Test {

	static String l_ldap_url;
	static String l_ldap_username;
	static String l_ldap_password;
	static String l_ldap_base;

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//String path = Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/ldap/ldap.xml");
		String path="D:\\git\\IGRP-Framework\\IGRP\\WebContent\\WEB-INF\\config\\ldap\\ldap.xml";
		File file = new File(path);
		LdapInfo ldapinfo = JAXB.unmarshal(file, LdapInfo.class);
		l_ldap_url = ldapinfo.getUrl();
		l_ldap_username = ldapinfo.getUsername();
		l_ldap_password = ldapinfo.getPassword();
		l_ldap_base = ldapinfo.getBase();
		
		System.out.println("url:"+l_ldap_url);
		TesteLogin();
		//
		//TestePesquisa();

	}

	static void TesteLogin() {
		NosiLdapAPI ldap = new NosiLdapAPI(l_ldap_url, l_ldap_username, l_ldap_password, l_ldap_base);
		if (ldap.validateLogin("nositeste", "Pa$$w0rd"))
			System.out.println("User Válido");
		else {
			System.out.println("User Inválido: " + ldap.getError());
		}
	}

	static void TestePesquisa() {

		String email = "nositeste@moko.cv";
		NosiLdapAPI ldap = new NosiLdapAPI(l_ldap_url, l_ldap_username, l_ldap_password, l_ldap_base);

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
			}
		} else
			System.out.println("Pesquisa não encontrada: " + ldap.getError());

	}

}
