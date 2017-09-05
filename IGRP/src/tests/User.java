package tests;

import java.io.Serializable;
/**
 * Marcel Iekiny
 * Aug 6, 2017
 */
public class User implements Serializable{
	
	private int updated_at;
	private String password_hash;
	private int created_at;
	private String password_reset_token;
	private String id;
	private String auth_key;
	private String email;
	private String username;
	private int status;
	private int funcionario;
	
	
	
	public int getFuncionario() {
		return funcionario;
	}
	public void setFuncionario(int funcionario) {
		this.funcionario = funcionario;
	}
	public int getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(int updated_at) {
		this.updated_at = updated_at;
	}
	public String getPassword_hash() {
		return password_hash;
	}
	public void setPassword_hash(String password_hash) {
		this.password_hash = password_hash;
	}
	public int getCreated_at() {
		return created_at;
	}
	public void setCreated_at(int created_at) {
		this.created_at = created_at;
	}
	public String getPassword_reset_token() {
		return password_reset_token;
	}
	public void setPassword_reset_token(String password_reset_token) {
		this.password_reset_token = password_reset_token;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAuth_key() {
		return auth_key;
	}
	public void setAuth_key(String auth_key) {
		this.auth_key = auth_key;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "User [updated_at=" + updated_at + ", password_hash=" + password_hash + ", created_at=" + created_at
				+ ", password_reset_token=" + password_reset_token + ", id=" + id + ", auth_key=" + auth_key
				+ ", email=" + email + ", username=" + username + ", status=" + status + "]";
	}
	
	

}
