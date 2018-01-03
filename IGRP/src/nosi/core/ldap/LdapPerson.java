package nosi.core.ldap;
/**
 * @author Adilson Rodrigues
 * May 29, 2017
 */

public class LdapPerson {

	private String uid;
	private String sn;
	private String mail;;
	private String proxyAddresses;
	private String name;
	private String accountExpires;
	private String lastLogon;
	private String lastLogoff;
	private String cn;
	private String sAMAccountType;
	private String givenName;
	private String displayName;
	private String userPrincipalName;
	private String pwdLastSet;
	private String lastLogonTimestamp;
	private String mailNickname;
	private String distinguishedName;
	private String sAMAccountName;

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

	@Override
	public String toString() {
		return "LdapPerson [uid=" + uid + ", sn=" + sn + ", mail=" + mail + ", proxyAddresses=" + proxyAddresses
				+ ", name=" + name + ", accountExpires=" + accountExpires + ", lastLogon=" + lastLogon + ", lastLogoff="
				+ lastLogoff + ", cn=" + cn + ", sAMAccountType=" + sAMAccountType + ", givenName=" + givenName
				+ ", displayName=" + displayName + ", userPrincipalName=" + userPrincipalName + ", pwdLastSet="
				+ pwdLastSet + ", lastLogonTimestamp=" + lastLogonTimestamp + ", mailNickname=" + mailNickname
				+ ", distinguishedName=" + distinguishedName + ", sAMAccountName=" + sAMAccountName + "]";
	}
}
