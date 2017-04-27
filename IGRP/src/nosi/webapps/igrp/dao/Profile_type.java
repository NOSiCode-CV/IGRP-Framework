
package nosi.webapps.igrp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;

public class Profile_type implements RowDataGateway {
	
	private int id;
	private String descr;
	private String code;
	private int env_fk;
	private int self_fk;
	private int org_fk;
	private int status;
	private Connection con;
	
	public Profile_type() {
		super();
		this.con = Igrp.getInstance().getDao().unwrap("postgresql");
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

	@Override
	public boolean insert() {
		try{
		/*descr = "Teste Tipo de Perfil";
		code = "Teste"; 
		env_fk = 1;
		self_fk = 18;
		org_fk = 17;
		status = 1;*/
		PreparedStatement st = con.prepareStatement("INSERT INTO public.glb_t_profile_type"
				+ "(descr, code, env_fk, self_fk, org_fk, status) "
				+ "VALUES (?, ?, ?, ?, ?, ?)");
		st.setString(1, this.descr);
		st.setString(2, this.code);
		st.setInt(3, this.env_fk);
		st.setInt(4, this.self_fk);
		st.setInt(5, this.org_fk);
		st.setInt(6, this.status);
		
		st.executeUpdate();
		st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object getOne() {
		Profile_type obj = new Profile_type();
		try{
			//id = 17;
			Statement st = con.createStatement();
			ResultSet res = st.executeQuery("SELECT id, descr, code, env_fk, self_fk, org_fk, status "
					+ "FROM public.glb_t_profile_type where id= " + this.id);
			while(res.next()){
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
		/*id = 126;
		descr = "Teste Tipo de Perfil update";
		code = "Teste"; 
		env_fk = 1;
		self_fk = 126;
		org_fk = 17;
		status = 1;*/
		try {
			PreparedStatement st = con.prepareStatement("UPDATE public.glb_t_profile_type SET "
					+ "descr=?, code=?, env_fk=?, self_fk=?, org_fk=?, status = ? WHERE id = " + this.id);
			
			st.setString(1, this.descr);
			st.setString(2, this.code);
			st.setInt(3, this.env_fk);
			st.setInt(4, this.self_fk);
			st.setInt(5, this.org_fk);
			st.setInt(6, this.status);
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public boolean delete() {
		try{
			//id = 84;
			Statement st = con.createStatement();
			st.executeUpdate("DELETE FROM public.glb_t_profile_type WHERE id = " + this.id);
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object[] getAll() {
		ArrayList<Profile_type> lista = new ArrayList<>(); 
		try{
			//id = 17;
			Statement st = con.createStatement();
			ResultSet res = st.executeQuery("SELECT id, descr, code, env_fk, self_fk, org_fk, status "
					+ "FROM public.glb_t_profile_type order by id");
			while(res.next()){
				Profile_type obj = new Profile_type();
				obj.setDescr(res.getString("descr"));
				obj.setCode(res.getString("code"));
				obj.setEnv_fk(res.getInt("env_fk"));
				obj.setSelf_fk(res.getInt("self_fk"));
				obj.setOrg_fk(res.getInt("org_fk"));
				obj.setStatus(res.getInt("status"));
				lista.add(obj);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return lista.toArray();
	}
	public static void main(String[] args) {
		//System.out.println(new Profile_type().getOne());
		/*for(Object i: new Profile_type().getAll()){
			Profile_type obj = (Profile_type) i;
		System.out.println(obj.getDescr());
		}*/
		
		//new Profile_type().delete();
		//new Profile_type().insert();
		//new Profile_type().update();
		//new IgrpDb().closeConnection("conexao");//para fechar a base de dadosS
	}

	@Override
	public String toString() {
		return "Profile_type [id=" + id + ", descr=" + descr + ", code=" + code + ", env_fk=" + env_fk + ", self_fk="
				+ self_fk + ", org_fk=" + org_fk + ", status=" + status +  "]";
	}
	
}
