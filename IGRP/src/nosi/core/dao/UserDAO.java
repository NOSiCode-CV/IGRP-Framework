package nosi.core.dao;

import nosi.core.webapp.Identity;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class UserDAO implements Identity{
	
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
	
	
	public UserDAO(){
		
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
	
}
