
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
import nosi.core.webapp.helpers.Permission;

public class ProfileType implements RowDataGateway {
	
	private int id;
	private String descr;
	private String code;
	private int env_fk;
	private int self_fk;
	private int org_fk;
	private int status;
	private Organization organica;
	private Application aplicacao;
	private Connection con;
	
	public ProfileType() {
		super();
		this.con = Igrp.getInstance().getDao().unwrap("db1");
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public int getEnv_fk() {
		return env_fk;
	}
	public void setEnv_fk(int env_fk) {
		this.env_fk = env_fk;
	}

	public int getSelf_fk() {
		return self_fk;
	}
	public void setSelf_fk(int self_fk) {
		this.self_fk = self_fk;
	}

	public int getOrg_fk() {
		return org_fk;
	}
	public void setOrg_fk(int org_fk) {
		this.org_fk = org_fk;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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

	@Override
	public boolean insert() {
		int result = 0;
		try{
			con.setAutoCommit(true);
		PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_profile_type"
				+ "(descr, code, env_fk, self_fk, org_fk, status) "
				+ "VALUES (?, ?, ?, ?, ?, ?)");
		st.setString(1, this.descr);
		st.setString(2, this.code);
		
		if(this.env_fk == 0) // Default value
			st.setNull(3, 0);
		else
		st.setInt(3, this.env_fk);
		
		if(this.self_fk == 0)
			st.setNull(4,0);
		else
		st.setInt(4, this.self_fk);
		
		if(this.org_fk == 0)
			st.setNull(5,0);
		else
		st.setInt(5, this.org_fk);
		
		st.setInt(6, this.status);
		
		result = st.executeUpdate();
		st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result > 0;
	}

	@Override
	public Object getOne() {
		ProfileType obj = new ProfileType();
		try{
			Statement st = con.createStatement();
			ResultSet res = st.executeQuery("SELECT id, descr, code, env_fk, self_fk, org_fk, status "
					+ "FROM glb_t_profile_type where id= " + this.id);
			while(res.next()){
				obj.setId(res.getInt("id"));
				obj.setDescr(res.getString("descr"));
				obj.setCode(res.getString("code"));
				obj.setEnv_fk(res.getInt("env_fk"));
				obj.setSelf_fk(res.getInt("self_fk"));
				obj.setOrg_fk(res.getInt("org_fk"));
				obj.setStatus(res.getInt("status"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	public boolean update() {
		int result = 0;
		try {
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("UPDATE glb_t_profile_type SET "
					+ "descr=?, code=?, env_fk=?, self_fk=?, org_fk=?, status = ? WHERE id = " + this.id);
			
			st.setString(1, this.descr);
			st.setString(2, this.code);
			
			if(this.env_fk == 0)
				st.setNull(3, this.env_fk);
			else
				st.setInt(3, this.env_fk);
			
			if(this.self_fk == 0)
				st.setNull(4, this.self_fk);
			else
				st.setInt(4, this.self_fk);
			
			if(this.org_fk == 0)
				st.setNull(5, 0);
			else
				st.setInt(5, this.org_fk);
			
			st.setInt(6, this.status);
			result = st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result > 0;
	}

	@Override
	public boolean delete() {
		try{
			con.setAutoCommit(true);
			Statement st = con.createStatement();
			st.executeUpdate("DELETE FROM glb_t_profile_type WHERE id = " + this.id);
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object[] getAll() {
		ArrayList<ProfileType> lista = new ArrayList<>(); 
		try{
			Statement st = con.createStatement();
			ResultSet res = st.executeQuery("SELECT p.*,o.name as organiza "
					+ "FROM glb_t_profile_type p, glb_t_organization o where o.id=p.org_fk order by id");
			while(res.next()){
				ProfileType obj = new ProfileType();
				obj.setId(res.getInt("id"));
				obj.setDescr(res.getString("descr"));
				obj.setCode(res.getString("code"));
				obj.setEnv_fk(res.getInt("env_fk"));
				obj.setSelf_fk(res.getInt("self_fk"));
				obj.setOrg_fk(res.getInt("org_fk"));
				obj.setStatus(res.getInt("status"));
				Organization org = new Organization();
				org.setName(res.getString("organiza"));
				obj.setOrganica(org);
				lista.add(obj);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return lista.toArray();
	}
	
	
	
	public Object[] getAllComFiltro() {
		ArrayList<ProfileType> lista = new ArrayList<>(); 
		try{
			
			String sql = "SELECT DISTINCT p.*, o.name as organiza "
					+ " FROM glb_t_profile_type p, glb_t_organization o"
					+ " WHERE "
					+ " o.id = p.org_fk ";
			
			sql += this.getAplicacao().getId() != 0 ? " AND o.env_fk = " + this.getAplicacao().getId() : " ";
			sql += this.getOrganica().getId() != 0 ? " AND p.org_fk = " + this.getOrganica().getId() : " ";
			
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet res = st.executeQuery();
			while(res.next()){
				ProfileType obj = new ProfileType();
				obj.setId(res.getInt("id"));
				obj.setDescr(res.getString("descr"));
				obj.setCode(res.getString("code"));
				obj.setEnv_fk(res.getInt("env_fk"));
				obj.setSelf_fk(res.getInt("self_fk"));
				obj.setOrg_fk(res.getInt("org_fk"));
				obj.setStatus(res.getInt("status"));
				Organization org = new Organization();
				org.setName(res.getString("organiza"));
				obj.setOrganica(org);
				lista.add(obj);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return lista.toArray();
	}
	
	
	
	public HashMap<String,String> getListProfiles(){
		HashMap<String,String> lista = new HashMap<>();
		lista.put(null, "--- Selecionar Perfil ---");
		for(Object obj:new ProfileType().getAll()){
			ProfileType p = (ProfileType) obj;
			lista.put(p.getId()+"", p.getDescr());
		}
		return lista;
	}
	
	
	public HashMap<String,String> getListMyProfiles(){
		HashMap<String,String> lista = new HashMap<>();
		lista.put(null, "--- Selecionar Perfil ---");
		for(Object obj:new ProfileType().getMyPerfil()){
			ProfileType p = (ProfileType) obj;
			lista.put(p.getId()+"", p.getDescr());
		}
		return lista;
	}
	
	private Object[] getMyPerfil() {
		ArrayList<ProfileType> lista = new ArrayList<>(); 
		try{
			PreparedStatement st = con.prepareStatement("SELECT pt.* "
					+ "FROM glb_t_profile_type pt, glb_t_profile p where pt.id=p.type_fk and p.type=? AND p.user_fk=? AND pt.env_fk=? order by pt.descr");
			st.setString(1, "PROF");
			st.setInt(2,Igrp.getInstance().getUser().getIdentity().getIdentityId());
			Application app = new Application();
			app.setDad(Permission.getCurrentEnv());
			app = (Application) app.getOne();
			st.setInt(3, app.getId());
			ResultSet res = st.executeQuery();
			while(res.next()){
				ProfileType obj = new ProfileType();
				obj.setId(res.getInt("id"));
				obj.setDescr(res.getString("descr"));
				lista.add(obj);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return lista.toArray();
	}

	@Override
	public String toString() {
		return "Profile_type [id=" + id + ", descr=" + descr + ", code=" + code + ", env_fk=" + env_fk + ", self_fk="
				+ self_fk + ", org_fk=" + org_fk + ", status=" + status +  "]";
	}
	
}
