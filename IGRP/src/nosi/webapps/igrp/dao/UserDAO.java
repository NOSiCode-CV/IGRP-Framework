package nosi.webapps.igrp.dao;

import nosi.core.webapp.Identity;
import nosi.core.webapp.Igrp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import nosi.core.dao.RowDataGateway;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class UserDAO implements Identity, RowDataGateway{
	
	private int id;
	private String name;
	private String email;
	private String pass_hash; // Apply md5 or sha1 ... I dont know yet ?????
	private String userProfile;
	private String valid_until; // Date type
	private String status;
	private String remarks;
	private int activation_key;
	private String user_name;
	private String photo_id;
	private String signature_id;
	private String mobile;
	private String phone;
	
	private Connection conn;
	
	public UserDAO(){
		this.conn = Igrp.getInstance().getDao().unwrap("db1");
	}
	
	public UserDAO(String username, String password){
		this.name = username;
		this.pass_hash = password;
	}

	@Override
	public Object findIdentityById(int identityId) {
		return null;
	}

	@Override
	public int getIdentityId() {
		return 0;
	}

	@Override
	public Object findIdentityByUsername(String username) {
		this.user_name = "imarcelf";
		return this;
	}

	@Override
	public boolean validate(String inputPassword) {
		return this.pass_hash.equals(inputPassword);
	}

	
	@Override
	public boolean insert(){
		String sql  = "insert into glb_t_user(name, user_name, email, pass_hash, status, created_at, updated_at, auth_key) "
				+ "values(?, ?, ?, ?, ?, ?, ?,?);";
		int result = 0;
		try{
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, this.name);
			ps.setString(2, this.user_name);
			ps.setString(3, this.email);
			ps.setString(4, this.pass_hash);
			ps.setInt(5, 1);
			ps.setInt(6, 10);
			ps.setInt(7, 30);// System.currentTimeMillis()
			ps.setString(8, "xpto");
			result = ps.executeUpdate();
			ps.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result > 0;
	}

	
	@Override
	public Object getOne() {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public boolean update() {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean delete() {
		// TODO Auto-generated method stub
		return false;
	}

	
	@Override
	public Object[] getAll() {
		return null;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the pass_hash
	 */
	public String getPass_hash() {
		return pass_hash;
	}

	/**
	 * @param pass_hash the pass_hash to set
	 */
	public void setPass_hash(String pass_hash) {
		this.pass_hash = pass_hash;
	}

	/**
	 * @return the userProfile
	 */
	public String getUserProfile() {
		return userProfile;
	}

	/**
	 * @param userProfile the userProfile to set
	 */
	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	/**
	 * @return the valid_until
	 */
	public String getValid_until() {
		return valid_until;
	}

	/**
	 * @param valid_until the valid_until to set
	 */
	public void setValid_until(String valid_until) {
		this.valid_until = valid_until;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the remarks
	 */
	public String getRemarks() {
		return remarks;
	}

	/**
	 * @param remarks the remarks to set
	 */
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	/**
	 * @return the activation_key
	 */
	public int getActivation_key() {
		return activation_key;
	}

	/**
	 * @param activation_key the activation_key to set
	 */
	public void setActivation_key(int activation_key) {
		this.activation_key = activation_key;
	}

	/**
	 * @return the user_name
	 */
	public String getUser_name() {
		return user_name;
	}

	/**
	 * @param user_name the user_name to set
	 */
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	/**
	 * @return the photo_id
	 */
	public String getPhoto_id() {
		return photo_id;
	}

	/**
	 * @param photo_id the photo_id to set
	 */
	public void setPhoto_id(String photo_id) {
		this.photo_id = photo_id;
	}

	/**
	 * @return the signature_id
	 */
	public String getSignature_id() {
		return signature_id;
	}

	/**
	 * @param signature_id the signature_id to set
	 */
	public void setSignature_id(String signature_id) {
		this.signature_id = signature_id;
	}

	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}	
	
}
