package nosi.core.ldap;
/**
 * @author Adilson Rodrigues
 * May 29, 2017
 */

public class LdapPerson {

	String uid;
	String sn;
	String mail;;
	String proxyAddresses;
	String name;
	String accountExpires;
	String lastLogon;
	String lastLogoff;
	String cn;
	String sAMAccountType;
	String givenName;
	String displayName;
	String userPrincipalName;
	String pwdLastSet;
	String lastLogonTimestamp;
	String mailNickname;
	String distinguishedName;
	String sAMAccountName;

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getProxyAddresses() {
		return proxyAddresses;
	}

	public void setProxyAddresses(String proxyAddresses) {
		this.proxyAddresses = proxyAddresses;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccountExpires() {
		return accountExpires;
	}

	public void setAccountExpires(String accountExpires) {
		this.accountExpires = accountExpires;
	}

	public String getLastLogon() {
		return lastLogon;
	}

	public void setLastLogon(String lastLogon) {
		this.lastLogon = lastLogon;
	}

	public String getLastLogoff() {
		return lastLogoff;
	}

	public void setLastLogoff(String lastLogoff) {
		this.lastLogoff = lastLogoff;
	}

	public String getCn() {
		return cn;
	}

	public void setCn(String cn) {
		this.cn = cn;
	}

	public String getsAMAccountType() {
		return sAMAccountType;
	}

	public void setsAMAccountType(String sAMAccountType) {
		this.sAMAccountType = sAMAccountType;
	}

	public String getGivenName() {
		return givenName;
	}

	public void setGivenName(String givenName) {
		this.givenName = givenName;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getUserPrincipalName() {
		return userPrincipalName;
	}

	public void setUserPrincipalName(String userPrincipalName) {
		this.userPrincipalName = userPrincipalName;
	}

	public String getPwdLastSet() {
		return pwdLastSet;
	}

	public void setPwdLastSet(String pwdLastSet) {
		this.pwdLastSet = pwdLastSet;
	}

	public String getLastLogonTimestamp() {
		return lastLogonTimestamp;
	}

	public void setLastLogonTimestamp(String lastLogonTimestamp) {
		this.lastLogonTimestamp = lastLogonTimestamp;
	}

	public String getMailNickname() {
		return mailNickname;
	}

	public void setMailNickname(String mailNickname) {
		this.mailNickname = mailNickname;
	}

	public String getDistinguishedName() {
		return distinguishedName;
	}

	public void setDistinguishedName(String distinguishedName) {
		this.distinguishedName = distinguishedName;
	}

	public String getsAMAccountName() {
		return sAMAccountName;
	}

	public void setsAMAccountName(String sAMAccountName) {
		this.sAMAccountName = sAMAccountName;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

}
