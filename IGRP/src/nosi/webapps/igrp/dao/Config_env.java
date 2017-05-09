/**
 * 
 */
package nosi.webapps.igrp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;
/**
 * @author Isaias.Nunes
 *
 */

public class Config_env implements RowDataGateway {

	
	private int id;
	private int port;
	private String type_db;
	private String host;
	private String name_db;
	private String username;
	private String password;
	private String charset;
	private String name;
	private int env_fk;
	
	private Connection con;
	
	
	public Config_env() {
		super();
		this.con = Igrp.getInstance().getDao().unwrap("postgresql");
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public String getType_db() {
		return type_db;
	}

	public void setType_db(String type_db) {
		this.type_db = type_db;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getName_db() {
		return name_db;
	}

	public void setName_db(String name_db) {
		this.name_db = name_db;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCharset() {
		return charset;
	}

	public void setCharset(String charset) {
		this.charset = charset;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getEnv_fk() {
		return env_fk;
	}
	
	public void setEnv_fk(int env_fk) {
		this.env_fk = env_fk;
	}



	@Override
	public boolean insert() {
		try{
			/*host = "localhost";
			type_db = "postgre";
			name_db = "db_igrp";
			username = "postgres";
			password = "nunes";
			charset = "utf-8";
			name = "name teste";
			env_fk = 1;*/
			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_config_env("
					+ "port, type_db, host, name_db, username, password, charset, name, env_fk)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			st.setInt(1, this.port);
			st.setString(2, this.type_db);
			st.setString(3, this.host);
			st.setString(4, this.name_db);
			st.setString(5, this.username);
			st.setString(6, this.password);
			st.setString(7, this.charset);
			st.setString(8, this.name);
			st.setInt(9, this.env_fk);
			
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}


	@Override
	public Object getOne() {
		Config_env obj = new Config_env();
		try {
			id = 144;
			PreparedStatement st = con.prepareStatement("SELECT * FROM glb_t_config_env WHERE id = " + this.id);
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				obj.setPort(rs.getInt("port"));
				obj.setType_db(rs.getString("type_db"));
				obj.setHost(rs.getString("host"));
				obj.setName_db(rs.getString("name_db"));
				obj.setUsername(rs.getString("username"));
				obj.setPassword(rs.getString("password"));
				obj.setCharset(rs.getString("charset"));
				obj.setName(rs.getString("name"));
				obj.setEnv_fk(rs.getInt("env_fk"));
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return obj;
	}


	@Override
	public boolean update() {
		try{
			/*id = 144;
			host = "localhost";
			type_db = "postgre";
			name_db = "db_igrp";
			username = "postgres";
			password = "nunes";
			charset = "utf-8";
			name = "name teste update";
			env_fk = 1;*/
			PreparedStatement st = con.prepareStatement("UPDATE glb_t_config_env "
					+ "SET port=?, type_db=?, host=?, name_db=?, username=?, "
					+ "password=?, charset=?, name=?, env_fk = ? WHERE id = " + this.id);
			
			st.setInt(1, this.port);
			st.setString(2, this.type_db);
			st.setString(3, this.host);
			st.setString(4, this.name_db);
			st.setString(5, this.username);
			st.setString(6, this.password);
			st.setString(7, this.charset);
			st.setString(8, this.name);
			st.setInt(9, this.env_fk);
			
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}


	@Override
	public boolean delete() {
		try{
			id = 145;
			PreparedStatement st = con.prepareStatement("DELETE FROM glb_t_config_env WHERE id = " + this.id);
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}


	@Override
	public Object[] getAll() {
		ArrayList<Config_env> lista = new ArrayList<>();
		try {
			PreparedStatement st = con.prepareStatement("SELECT * FROM glb_t_config_env");
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				Config_env obj = new Config_env();
				obj.setPort(rs.getInt("port"));
				obj.setType_db(rs.getString("type_db"));
				obj.setHost(rs.getString("host"));
				obj.setName_db(rs.getString("name_db"));
				obj.setUsername(rs.getString("username"));
				obj.setPassword(rs.getString("password"));
				obj.setCharset(rs.getString("charset"));
				obj.setName(rs.getString("name"));
				obj.setEnv_fk(rs.getInt("env_fk"));
				lista.add(obj);
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return lista.toArray();
	}
	
	public static void main(String[] args) {
		//new Config_env().insert();
		//System.out.println(new Config_env().getOne());
		/*for(Object i: new Config_env().getAll()){
			Config_env obj = (Config_env) i;
			System.out.println(obj.getPort());
			System.out.println(obj.getHost());
		}*/
		//new Config_env().update();
		new Config_env().delete();
	}


	@Override
	public String toString() {
		return "Config_env [id=" + id + ", port=" + port + ", type_db=" + type_db + ", host=" + host + ", name_db="
				+ name_db + ", username=" + username + ", password=" + password + ", charset=" + charset + ", name="
				+ name + ", env_fk=" + env_fk + "]";
	}
	
	
}
