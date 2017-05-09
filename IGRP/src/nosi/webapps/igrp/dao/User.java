package nosi.webapps.igrp.dao;

import nosi.core.webapp.Identity;
import nosi.core.webapp.Igrp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.Cookie;

import nosi.core.dao.RowDataGateway;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class User implements Identity, RowDataGateway{
	
	private int id;
	private String name;
	private String email;
	private String pass_hash; // Apply md5 or sha1 ... I dont know yet ?????
	private String userProfile;
	private String valid_until; // Date type
	private int status;
	private String remarks;
	private int activation_key;
	private String user_name;
	private String photo_id;
	private String signature_id;
	private String mobile;
	private String phone;
	private String password_reset_token;
	private String auth_key;
	private long created_at;
	private long updated_at;
	private ProfileType profile;
	
	private Connection conn;
	
	public User(){
		this.conn = Igrp.getInstance().getDao().unwrap("db1");
	}
	
	public User(String username, String password){
		this.name = username;
		this.pass_hash = password;
	}

	@Override
	public Object findIdentityById(int identityId) {
		try{
		PreparedStatement ps = this.conn.prepareStatement("select * from glb_t_user where id = ?");
		ps.setInt(1, identityId);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			this.id = rs.getInt("id");
			this.name = rs.getString("name");
			this.email = rs.getString("email");
			this.pass_hash = rs.getString("pass_hash");
			this.userProfile = rs.getString("userprofile");
			this.valid_until = rs.getString("valid_until");
			this.status = rs.getInt("status");
			this.remarks = rs.getString("remarks");
			//this.activation_key = rs.getInt("activation_key");
			this.user_name = rs.getString("user_name");
			this.photo_id = rs.getString("photo_id");
			this.signature_id = rs.getString("signature_id");
			this.mobile = rs.getString("mobile");
			this.phone = rs.getString("phone");
			this.password_reset_token = rs.getString("password_reset_token");
			this.auth_key = rs.getString("auth_key");
			this.created_at = rs.getLong("created_at");
			this.updated_at = rs.getLong("updated_at");
		}
		ps.close();
		
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return this.id != 0 ? this : null;
	}

	@Override
	public int getIdentityId() {
		return this.id;
	}

	@Override
	public Object findIdentityByUsername(String username) {
		boolean result = false;
		try{
			PreparedStatement ps = this.conn.prepareStatement("select * from glb_t_user where user_name = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				this.id = rs.getInt("id");
				this.name = rs.getString("name");
				this.email = rs.getString("email");
				this.pass_hash = rs.getString("pass_hash");
				this.userProfile = rs.getString("userprofile");
				this.valid_until = rs.getString("valid_until");
				this.status = rs.getInt("status");
				this.remarks = rs.getString("remarks");
				this.activation_key = rs.getInt("activation_key");
				this.user_name = rs.getString("user_name");
				this.photo_id = rs.getString("photo_id");
				this.signature_id = rs.getString("signature_id");
				this.mobile = rs.getString("mobile");
				this.phone = rs.getString("phone");
				this.password_reset_token = rs.getString("password_reset_token");
				this.auth_key = rs.getString("auth_key");
				this.created_at = rs.getLong("created_at");
				this.updated_at = rs.getLong("updated_at");
				result = true;
			}
			ps.close();
			
			}catch(SQLException e){
				e.printStackTrace();
			}
		
		return  result ? this : null;
	}

	public Object findIdentityByEmail(String email) {
		boolean result = false;
		try{
			PreparedStatement ps = this.conn.prepareStatement("select * from glb_t_user where email = ?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				this.id = rs.getInt("id");
				this.name = rs.getString("name");
				this.email = rs.getString("email");
				this.pass_hash = rs.getString("pass_hash");
				this.userProfile = rs.getString("userprofile");
				this.valid_until = rs.getString("valid_until");
				this.status = rs.getInt("status");
				this.remarks = rs.getString("remarks");
				this.activation_key = rs.getInt("activation_key");
				this.user_name = rs.getString("user_name");
				this.photo_id = rs.getString("photo_id");
				this.signature_id = rs.getString("signature_id");
				this.mobile = rs.getString("mobile");
				this.phone = rs.getString("phone");
				this.password_reset_token = rs.getString("password_reset_token");
				this.auth_key = rs.getString("auth_key");
				this.created_at = rs.getLong("created_at");
				this.updated_at = rs.getLong("updated_at");
				result = true;
			}
			ps.close();
			
			}catch(SQLException e){
				e.printStackTrace();
			}
		
		return  result ? this : null;
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
			conn.setAutoCommit(true);
			PreparedStatement ps = this.conn.prepareStatement(sql);
			ps.setString(1, this.name);
			ps.setString(2, this.user_name);
			ps.setString(3, this.email);
			ps.setString(4, this.pass_hash);
			ps.setInt(5, this.status);
			ps.setLong(6, this.created_at);
			ps.setLong(7, this.updated_at);
			ps.setString(8, this.auth_key);
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
		ArrayList<User> lista = new ArrayList<User>();
		
		try{
			PreparedStatement st = conn.prepareStatement("SELECT u.*,tp.descr as perfil FROM glb_t_user u,glb_t_profile p, glb_t_profile_type tp "
					+ " WHERE u.id=p.user_fk and tp.id=p.type_fk and p.type=?");
			st.setString(1, "PROF");
			ResultSet result = st.executeQuery();
			
			while(result.next()){
				
				User obj = new User();
				obj.setId(result.getInt("id"));
				obj.setEmail(result.getString("email"));;
				obj.setUser_name(result.getString("user_name"));
				obj.setName(result.getString("name"));
				ProfileType prof = new ProfileType();
				prof.setDescr(result.getString("perfil"));
				obj.setProfile(prof);
				lista.add(obj);
			}
			st.close();
			
			}catch(SQLException e){
				e.printStackTrace();
			}
		return lista.toArray();
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
	public int getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
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

	/**
	 * @return the password_reset_token
	 */
	public String getPassword_reset_token() {
		return password_reset_token;
	}

	/**
	 * @param password_reset_token the password_reset_token to set
	 */
	public void setPassword_reset_token(String password_reset_token) {
		this.password_reset_token = password_reset_token;
	}

	/**
	 * @return the auth_key
	 */
	public String getAuth_key() {
		return auth_key;
	}

	/**
	 * @param auth_key the auth_key to set
	 */
	public void setAuth_key(String auth_key) {
		this.auth_key = auth_key;
	}

	/**
	 * @return the created_at
	 */
	public long getCreated_at() {
		return created_at;
	}

	/**
	 * @param created_at the created_at to set
	 */
	public void setCreated_at(long created_at) {
		this.created_at = created_at;
	}

	/**
	 * @return the updated_at
	 */
	public long getUpdated_at() {
		return updated_at;
	}

	/**
	 * @param updated_at the updated_at to set
	 */
	public void setUpdated_at(long updated_at) {
		this.updated_at = updated_at;
	}

	/**
	 * @return the currentPerfilId
	 */
	public int getCurrentPerfilId() {
		Cookie aux = null;
		for(Cookie c : Igrp.getInstance().getRequest().getCookies())
			if(c.getName().equals("_perf"))
				aux = c;		
		return aux!=null?Integer.parseInt(aux.getValue()):0;
	}

	public int getCurrentOrganization() {
		Cookie aux = null;
		for(Cookie c : Igrp.getInstance().getRequest().getCookies())
			if(c.getName().equals("_org"))
				aux = c;		
		return aux!=null?Integer.parseInt(aux.getValue()):0;
	}

	public ProfileType getProfile() {
		return profile;
	}

	public void setProfile(ProfileType profile) {
		this.profile = profile;
	}	
	
	
}
