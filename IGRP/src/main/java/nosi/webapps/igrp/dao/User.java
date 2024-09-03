package nosi.webapps.igrp.dao;
/*
  @author: Emanuel Pereira
 * 29 Jun 2017
 */

import java.io.Serializable;
import java.util.Locale;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import nosi.core.webapp.Identity;

@Entity
@Table(name="tbl_user")
public class User extends IGRPBaseActiveRecord<User> implements Serializable, Identity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3554172942911474423L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String name;
	@Column(unique=true)
	private String email;
	private String pass_hash; // Apply md5 or sha1 ... I dont know yet ?????
	private String userProfile;
	private String valid_until; // Date type
	private int status;
	private String remarks;
	@Column(nullable = false)
	private String activation_key;
	@Column(unique=true)
	private String user_name;
	private String photo_id;
	private String signature_id;
	private String mobile;
	private String phone;
	private String password_reset_token;
	private String auth_key;
	private String cni;
	private long created_at;
	private long updated_at;
	
	@Column(name="oidc_id_token", columnDefinition="text")
	private String oidcIdToken; 
	
	@Column(name="oidc_state")
	private String oidcState; 
	
	@Column(name="refresh_token")
	private String refreshToken; 
	
	@Column(name="is_authenticated")
	private Integer isAuthenticated; // 0 || 1 

	@Transient
	private ProfileType profileType;
	@Transient
	private Organization organica;
	@Transient
	private Application aplicacao;
	
	public User(){}
	
	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		User user = (User) o;
		return getStatus() == user.getStatus() && getCreated_at() == user.getCreated_at() && getUpdated_at() == user.getUpdated_at() && Objects.equals(getId(), user.getId()) && Objects.equals(getName(), user.getName()) && Objects.equals(getEmail(), user.getEmail()) && Objects.equals(getPass_hash(), user.getPass_hash()) && Objects.equals(getUserProfile(), user.getUserProfile()) && Objects.equals(getValid_until(), user.getValid_until()) && Objects.equals(getRemarks(), user.getRemarks()) && Objects.equals(getActivation_key(), user.getActivation_key()) && Objects.equals(getUser_name(), user.getUser_name()) && Objects.equals(getPhoto_id(), user.getPhoto_id()) && Objects.equals(getSignature_id(), user.getSignature_id()) && Objects.equals(getMobile(), user.getMobile()) && Objects.equals(getPhone(), user.getPhone()) && Objects.equals(getPassword_reset_token(), user.getPassword_reset_token()) && Objects.equals(getAuth_key(), user.getAuth_key()) && Objects.equals(getCni(), user.getCni()) && Objects.equals(getOidcIdToken(), user.getOidcIdToken()) && Objects.equals(getOidcState(), user.getOidcState()) && Objects.equals(getRefreshToken(), user.getRefreshToken()) && Objects.equals(getIsAuthenticated(), user.getIsAuthenticated());
	}

	@Override
	public int hashCode() {
		return Objects.hash(getId(), getName(), getEmail(), getPass_hash(), getUserProfile(), getValid_until(), getStatus(), getRemarks(), getActivation_key(), getUser_name(), getPhoto_id(), getSignature_id(), getMobile(), getPhone(), getPassword_reset_token(), getAuth_key(), getCni(), getCreated_at(), getUpdated_at(), getOidcIdToken(), getOidcState(), getRefreshToken(), getIsAuthenticated());
	}

	public User(String name, String email, String pass_hash, String userProfile, String valid_until,
			int status, String remarks, String activation_key, String user_name, String photo_id, String signature_id,
			String mobile, String phone, String password_reset_token, String auth_key, long created_at,
			long updated_at) {
		super();
		this.name = name;
		this.email = email;
		this.pass_hash = pass_hash;
		this.userProfile = userProfile;
		this.valid_until = valid_until;
		this.status = status;
		this.remarks = remarks;
		this.activation_key = activation_key;
		this.user_name = user_name;
		this.photo_id = photo_id;
		this.signature_id = signature_id;
		this.mobile = mobile;
		this.phone = phone;
		this.password_reset_token = password_reset_token;
		this.auth_key = auth_key;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getCni() {
		return cni;
	}

	public void setCni(String cni) {
		this.cni = cni;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass_hash() {
		return pass_hash;
	}
	public void setPass_hash(String pass_hash) {
		this.pass_hash = pass_hash;
	}
	public String getUserProfile() {
		return userProfile;
	}
	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}
	public String getValid_until() {
		return valid_until;
	}
	public void setValid_until(String valid_until) {
		this.valid_until = valid_until;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getActivation_key() {
		return activation_key;
	}
	public void setActivation_key(String activation_key) {
		this.activation_key = activation_key;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPhoto_id() {
		return photo_id;
	}
	public void setPhoto_id(String photo_id) {
		this.photo_id = photo_id;
	}
	public String getSignature_id() {
		return signature_id;
	}
	public void setSignature_id(String signature_id) {
		this.signature_id = signature_id;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword_reset_token() {
		return password_reset_token;
	}
	public void setPassword_reset_token(String password_reset_token) {
		this.password_reset_token = password_reset_token;
	}
	public String getAuth_key() {
		return auth_key;
	}
	public void setAuth_key(String auth_key) {
		this.auth_key = auth_key;
	}
	public long getCreated_at() {
		return created_at;
	}
	public void setCreated_at(long created_at) {
		this.created_at = created_at;
	}
	public long getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(long updated_at) {
		this.updated_at = updated_at;
	}

	public User findIdentityById(int identityId) {
		return this.findOne(identityId);
	}

	@Override
	public int getIdentityId() {
		return this.id;
	}

	@Override
	public User findIdentityByUsername(String username) {	
		return this.find().andWhere("lower(user_name)","user_name", "=", username.trim().toLowerCase(Locale.ROOT).trim()).one();
	}
	
	public User findIdentityByEmail(String email) {	
		return this.find().andWhere("lower(email)","email", "=", email.toLowerCase(Locale.ROOT).trim()).one();
	}
	
	@Override
	public boolean validate(String inputPassword) {
		return this.pass_hash!=null&&this.pass_hash.equals(inputPassword);
	}
	
	public Organization getOrganica() {
		return organica;
	}
	
	public void setOrganica(Organization organica) {
		this.organica = organica;
	}
	
	public Application getAplicacao() {
		return aplicacao;
	}
	
	public void setAplicacao(Application aplicacao) {
		this.aplicacao = aplicacao;
	}
	public ProfileType getProfile() {
		return profileType;
	}
	
	public void setProfile(ProfileType profile) {
		this.profileType = profile;
	}

	@Override
	public String getAuthenticationKey() {
		return this.auth_key;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", pass_hash=" + pass_hash + ", userProfile="
				+ userProfile + ", valid_until=" + valid_until + ", status=" + status + ", remarks=" + remarks
				+ ", activation_key=" + activation_key + ", user_name=" + user_name + ", photo_id=" + photo_id
				+ ", signature_id=" + signature_id + ", mobile=" + mobile + ", phone=" + phone
				+ ", password_reset_token=" + password_reset_token + ", auth_key=" + auth_key + ", created_at="
				+ created_at + ", updated_at=" + updated_at + ", oidcIdToken=" + oidcIdToken + ", oidcState="
				+ oidcState + ", is_authenticated=" + isAuthenticated + ", profileType=" + profileType + ", organica="
				+ organica + ", aplicacao=" + aplicacao + "]";
	}
	
	public Integer getIsAuthenticated() {
		return isAuthenticated;
	}

	public void setIsAuthenticated(Integer isAuthenticated) {
		this.isAuthenticated = isAuthenticated;
	}

	public String getOidcIdToken() {
		return oidcIdToken;
	}

	public void setOidcIdToken(String oidcIdToken) {
		this.oidcIdToken = oidcIdToken;
	}
	
	public String getRefreshToken() {
		return refreshToken;
	}

	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}

	public String getOidcState() {
		return oidcState;
	}

	public void setOidcState(String oidcState) {
		this.oidcState = oidcState;
	}

	public User getUserAdmin() {
		return this.findIdentityByEmail("igrpweb@nosi.cv");
	}
}
