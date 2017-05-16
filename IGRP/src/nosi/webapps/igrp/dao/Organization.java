package nosi.webapps.igrp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;

public class Organization implements RowDataGateway {
	
	private int id;
	private String code;
	private String name;
	private int sigof_fk;
	private int env_fk;
	private int status;
	private int user_create_fk;
	private int self_fk; 
	private Connection con;
	
	@Override
	public String toString() {
		return "Organization [id=" + id + ", code=" + code + ", name=" + name + ", sigof_fk=" + sigof_fk + ", env_fk="
				+ env_fk + ", status=" + status + ", user_create_fk=" + user_create_fk + ", self_fk=" + self_fk + "]";
	}
	
	
	public Organization() {
		super();
		this.con = Igrp.getInstance().getDao().unwrap("db1");
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSigof_fk() {
		return sigof_fk;
	}

	public void setSigof_fk(int sigof_fk) {
		this.sigof_fk = sigof_fk;
	}

	public int getEnv_fk() {
		return env_fk;
	}

	public void setEnv_fk(int env_fk) {
		this.env_fk = env_fk;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getUser_create_fk() {
		return user_create_fk;
	}

	public void setUser_create_fk(int user_create_fk) {
		this.user_create_fk = user_create_fk;
	}

	public int getSelf_fk() {
		return self_fk;
	}

	public void setSelf_fk(int self_fk) {
		this.self_fk = self_fk;
	}

	@Override
	public boolean insert() {
		int result = 0;
		try{
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_organization"
					+ "(code, name, sigof_fk, env_fk, status, user_create_fk, self_fk)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)");
			
			st.setString(1, this.code);
			st.setString(2, this.name);
			
			if(this.sigof_fk == 0)
				st.setNull(3, 0);
			else
			st.setInt(3, this.sigof_fk);
			
			if(this.env_fk == 0)
				st.setNull(4, 0);
			else
			st.setInt(4, this.env_fk);
			
			st.setInt(5, this.status);
			
			if(this.user_create_fk == 0)
				st.setNull(6, 0);
			else
			st.setInt(6, this.user_create_fk);
			
			if(this.self_fk == 0)
				st.setNull(7, 0);
			else
			st.setInt(7, this.self_fk);
			
			result = st.executeUpdate();
			st.close();
		}catch(SQLException e){
			System.out.println(e);
			e.printStackTrace();
		}
		return result > 0;
	}

	@Override
	public Object getOne() {
		Organization obj = null;
		try{
			//id = 18;
			Statement st = con.createStatement();
			ResultSet result = st.executeQuery("SELECT * FROM glb_t_organization where id = " + this.id);
			
			if(result.next()){
				
				obj = new Organization();
				obj.setId(result.getInt("id"));
				obj.setCode(result.getString("code"));
				obj.setName(result.getString("name"));
				obj.setSigof_fk(result.getInt("sigof_fk"));
				obj.setEnv_fk(result.getInt("env_fk"));
				obj.setUser_create_fk(result.getInt("user_create_fk"));
				obj.setStatus(result.getInt("status"));
				obj.setSelf_fk(result.getInt("self_fk"));
				
				
			}
			
			st.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		return obj;
	}

	@Override
	public boolean update() {
		try{
			/*name = "Nome update 1";
			id = 118;
			env_fk = 1;
			self_fk = 17;*/
			con.setAutoCommit(true);
			Statement st = con.createStatement();
	        st.executeUpdate("UPDATE glb_t_organization SET "
	        		+ "name='" + this.name
	        		+"',code= '" + this.code
	        		+ "',sigof_fk= " + this.sigof_fk
	        		+ ",env_fk=" + this.env_fk
	        		+ ",status=" + this.status
	        		+ ",user_create_fk=" + this.user_create_fk
	        		+ ",self_fk = " + this.self_fk
	        		+ "where id = " + this.id);
	        st.close();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete() {
		try{
			//id = 120;
			con.setAutoCommit(true);
			Statement st = con.createStatement();
	        st.executeUpdate("DELETE FROM glb_t_organization where id = " + this.id);
	        st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object[] getAll() {
		ArrayList<Organization> lista = new ArrayList<Organization>();
		
		try{
			Statement st = con.createStatement();
			ResultSet result = st.executeQuery("SELECT * FROM glb_t_organization");
			
			while(result.next()){
				
				Organization obj = new Organization();
				obj.setId(result.getInt("id"));
				obj.setCode(result.getString("code"));
				obj.setName(result.getString("name"));
				obj.setSigof_fk(result.getInt("sigof_fk"));
				obj.setEnv_fk(result.getInt("env_fk"));
				obj.setUser_create_fk(result.getInt("user_create_fk"));
				obj.setStatus(result.getInt("status"));
				obj.setSelf_fk(result.getInt("self_fk"));
				
				lista.add(obj);
			}
			st.close();
			
			}catch(SQLException e){
				e.printStackTrace();
			}
		return lista.toArray();
	}
	
	
	
	public Object[] getAllComFiltro() {
		ArrayList<Organization> lista = new ArrayList<Organization>();
		
		try{
			String sql = "SELECT * FROM glb_t_organization where 1=1 ";
			sql += this.env_fk != 0 ? " and env_fk = " + this.env_fk : " ";
 			Statement st = con.createStatement();
			ResultSet result = st.executeQuery(sql);
			
			while(result.next()){
				
				Organization obj = new Organization();
				obj.setId(result.getInt("id"));
				obj.setCode(result.getString("code"));
				obj.setName(result.getString("name"));
				obj.setSigof_fk(result.getInt("sigof_fk"));
				obj.setEnv_fk(result.getInt("env_fk"));
				obj.setUser_create_fk(result.getInt("user_create_fk"));
				obj.setStatus(result.getInt("status"));
				obj.setSelf_fk(result.getInt("self_fk"));
				
				lista.add(obj);
			}
			st.close();
			
			}catch(SQLException e){
				e.printStackTrace();
			}
		return lista.toArray();
	}
	
	
	
	
	public HashMap<String,String> getListOrganizations(){
		HashMap<String,String> lista = new HashMap<>();
		lista.put(null, "--- Selecionar Orgânica ---");
		for(Object obj:new Organization().getAll()){
			Organization org = (Organization) obj;
			lista.put(org.getId()+"", org.getName());
		}
		return lista;
	}
	
	public HashMap<String,String> getListMyOrganizations(){
		HashMap<String,String> lista = new HashMap<>();
		lista.put(null, "--- Selecionar Orgânica ---");
		for(Object obj:new Organization().getMyOrganization()){
			Organization org = (Organization) obj;
			lista.put(org.getId()+"", org.getName());
		}
		return lista;
	}
	
	private Object[] getMyOrganization() {
		ArrayList<Organization> lista = new ArrayList<Organization>();		
		try{
			PreparedStatement st = con.prepareStatement("SELECT o.* FROM glb_t_organization o, glb_t_profile p where p.org_fk=o.id and p.type=? and p.user_fk=? order by o.name");
			st.setString(1, "PROF");
			st.setInt(2, Igrp.getInstance().getUser().getIdentity().getIdentityId());
			ResultSet result = st.executeQuery();			
			while(result.next()){				
				Organization obj = new Organization();
				obj.setId(result.getInt("id"));
				obj.setCode(result.getString("code"));
				obj.setName(result.getString("name"));
				lista.add(obj);
			}
			st.close();			
			}catch(SQLException e){
				e.printStackTrace();
			}
		return lista.toArray();
	}


	public Object[] getOrgMenu(){
		ArrayList<Menu> lista = new ArrayList<Menu>();		
		try{
			Statement st = con.createStatement();
			ResultSet r = st.executeQuery("SELECT * FROM glb_t_menu WHERE flg_base=0");			
			while(r.next()){				
				Menu m = new Menu();
				m.setDescr(r.getString("descr"));		
				m.setId(r.getInt("id"));
				lista.add(m);
			}
			st.close();			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return lista.toArray();
	}


	public Object[] getPerfilMenu(int org) {
		ArrayList<Menu> lista = new ArrayList<Menu>();		
		try{
			Statement st = con.createStatement();
			ResultSet r = st.executeQuery("SELECT M.* FROM glb_t_menu M, glb_t_profile P WHERE flg_base=0 AND P.type_fk=M.ID AND P.type='MEN' AND P.org_fk="+org);			
			while(r.next()){				
				Menu m = new Menu();
				m.setDescr(r.getString("descr"));		
				m.setId(r.getInt("id"));
				lista.add(m);
			}
			st.close();			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return lista.toArray();
	}
}
