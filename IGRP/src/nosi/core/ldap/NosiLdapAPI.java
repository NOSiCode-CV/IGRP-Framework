package nosi.core.ldap;

/**
 * @author Adilson Rodrigues
 * May 29, 2017
 */

import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;

import java.util.Hashtable;

public class NosiLdapAPI {

	private String l_ldap_url;
	private String l_ldap_username;
	private String l_ldap_password;
	private String l_ldap_base;

	private String error;

	private Hashtable<String, String> props;

	public NosiLdapAPI() {
		super();
	}

	public NosiLdapAPI(String l_ldap_url, String l_ldap_username, String l_ldap_password, String l_ldap_base) {
		super();
		this.l_ldap_url = l_ldap_url;
		this.l_ldap_username = l_ldap_username;
		this.l_ldap_password = l_ldap_password;
		this.l_ldap_base = l_ldap_base;
	}

	public String getL_ldap_url() {
		return l_ldap_url;
	}

	public void setL_ldap_url(String l_ldap_url) {
		this.l_ldap_url = l_ldap_url;
	}

	public String getL_ldap_username() {
		return l_ldap_username;
	}

	public void setL_ldap_username(String l_ldap_username) {
		this.l_ldap_username = l_ldap_username;
	}

	public String getL_ldap_password() {
		return l_ldap_password;
	}

	public void setL_ldap_password(String l_ldap_password) {
		this.l_ldap_password = l_ldap_password;
	}

	public String getL_ldap_base() {
		return l_ldap_base;
	}

	public void setL_ldap_base(String l_ldap_base) {
		this.l_ldap_base = l_ldap_base;
	}

	private void setError(String error) {
		this.error = error;
	}

	public String getError() {
		return this.error;
	}

	private InitialDirContext ldapContext(String user, String password) throws NamingException {
		props = new Hashtable<String, String>();
		props.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		props.put(Context.PROVIDER_URL, this.getL_ldap_url());
		props.put(Context.SECURITY_AUTHENTICATION, "simple");
		props.put(Context.SECURITY_PRINCIPAL, user);

		props.put(Context.SECURITY_CREDENTIALS, password);
		props.put(Context.REFERRAL, "follow");

		InitialDirContext context = new InitialDirContext(props);
		return context;
	}

	public String getDistinguishedName(String pUsername) {

		InitialDirContext context;
		String distinguishedName = "";
		try {
			context = this.ldapContext(this.getL_ldap_username(), this.getL_ldap_password());

			SearchControls ctrls = new SearchControls();
			ctrls.setReturningAttributes(new String[] { "givenName", "sn", "memberOf" });
			ctrls.setSearchScope(SearchControls.SUBTREE_SCOPE);

			NamingEnumeration<javax.naming.directory.SearchResult> answers = context.search(this.getL_ldap_base(),
					"(&(objectclass=USER)(SAMAccountName=" + pUsername + "))", ctrls);

			if (answers.hasMore()) {
				javax.naming.directory.SearchResult result = answers.nextElement();
				distinguishedName = result.getNameInNamespace();
			}
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			this.setError(e.getMessage());
			e.printStackTrace();

		}
		return distinguishedName;
	}

	private ArrayList<LdapPerson> SerializeAttribs(NamingEnumeration<?> results) {
		ArrayList<LdapPerson> personArray = new ArrayList<LdapPerson>();
		LdapPerson p = null;

		try {
			while (results.hasMore()) {
				SearchResult sr = (SearchResult) results.next();
				Attributes attrs = sr.getAttributes();
				p = new LdapPerson();

				for (NamingEnumeration ae = attrs.getAll(); ae.hasMore();) {
					Attribute attr = (Attribute) ae.next();
					String name = attr.getID();
					String value = "";
					for (NamingEnumeration e = attr.getAll(); e.hasMore(); value += e.next())
						;

					switch (name.toLowerCase()) {
					case "uid":
						p.setUid(value);
						break;
					case "sn":
						p.setSn(value);
						break;
					case "mail":
						p.setMail(value);
						break;

					case "proxyaddresses":
						p.setProxyAddresses(value);
						break;
					case "name":
						p.setName(value);
						break;
					case "accountexpires":
						p.setAccountExpires(value);
						break;
					case "lastlogon":
						p.setLastLogon(value);
						break;
					case "lastlogoff":
						p.setLastLogoff(value);
						break;
					case "cn":
						p.setCn(value);
						break;
					case "samaccounttype":
						p.setsAMAccountType(value);
						break;
					case "givenname":
						p.setGivenName(value);
						break;
					case "displayname":
						p.setDisplayName(value);
						break;

					case "userprincipalname":
						p.setUserPrincipalName(value);
						break;

					case "pwdlastset":
						p.setPwdLastSet(value);
						break;

					case "lastlogontimestamp":
						p.setLastLogonTimestamp(value);
						break;

					case "mailnickname":
						p.setMailNickname(value);
						break;

					case "distinguishedname":
						p.setDistinguishedName(value);
						break;

					case "samaccountname":
						p.setsAMAccountName(value);
						break;
					}
				}

				p.name = p.name != null ? p.name : (p.givenName != null ? p.givenName : p.sn);

				personArray.add(p);

			}
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			this.setError(e.getMessage());
			//e.printStackTrace();

		}

		return personArray;
	}

	public boolean validateLogin(String pUsername, String pPassword) {
		String user = this.getDistinguishedName(pUsername);
		InitialDirContext context;
		boolean validate = false;
		if (user != "") {
			try {
				context = this.ldapContext(user, pPassword);
				validate = true;
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				this.setError(e.getMessage());
				e.printStackTrace();
			}
		}
		return validate;
	}

	public ArrayList<LdapPerson> getUser(String pEmail) {
		ArrayList<LdapPerson> p = null;
		InitialDirContext context;

		try {
			context = this.ldapContext(this.getL_ldap_username(), this.getL_ldap_password());

			SearchControls ctrls = new SearchControls();
			ctrls.setReturningAttributes(new String[] { "*" });
			ctrls.setSearchScope(SearchControls.SUBTREE_SCOPE);

			String filter = "(&(mail=" + pEmail + "))";
			NamingEnumeration<?> results = context.search(this.getL_ldap_base(), filter, ctrls);
			if (!results.hasMore()) {
				filter = "(&(proxyAddresses=smtp:" + pEmail + "))";
				results = context.search(this.getL_ldap_base(), filter, ctrls);
			}

			if (results.hasMore()) {
				p = this.SerializeAttribs(results);
			} else
				this.setError("error searching for " + pEmail);

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			this.setError(e.getMessage());
			e.printStackTrace();
		}
		return p;
	}

}
