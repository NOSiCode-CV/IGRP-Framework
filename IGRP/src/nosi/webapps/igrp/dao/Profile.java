package nosi.webapps.igrp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;

public class Profile implements RowDataGateway {
	
	private int prof_type_fk;
	private int user_fk;
	private String type;
	private int type_fk;
	private int org_fk;
	private Connection con;
	
	public int getProf_type_fk() {
		return prof_type_fk;
	}

	public void setProf_type_fk(int prof_type_fk) {
		this.prof_type_fk = prof_type_fk;
	}

	public int getUser_fk() {
		return user_fk;
	}

	public void setUser_fk(int user_fk) {
		this.user_fk = user_fk;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getType_fk() {
		return type_fk;
	}

	public void setType_fk(int type_fk) {
		this.type_fk = type_fk;
	}

	public int getOrg_fk() {
		return org_fk;
	}

	public void setOrg_fk(int org_fk) {
		this.org_fk = org_fk;
	}

	
	
	public Profile() {
		super();
		this.con = Igrp.getInstance().getDao().unwrap("db1");
	}

	@Override
	public boolean insert() {
		int result = 0;
		try {
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_profile"
					+ "(prof_type_fk, user_fk, type, type_fk, org_fk) "
					+ "VALUES (?, ?, ?, ?, ?)");
			st.setInt(1, this.prof_type_fk);
			st.setInt(2, this.user_fk);
			st.setString(3, this.type);
			st.setInt(4, this.type_fk);
			st.setInt(5, this.org_fk);
			
			result = st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result > 0;
	}

	@Override
	public Object getOne() {
		Profile obj = new Profile();
		try{
			PreparedStatement st = con.prepareStatement("SELECT * FROM glb_t_profile "
					+ " WHERE prof_type_fk=? "
					+ " AND user_fk=? "
					+ " AND type_fk=? "
					+ " AND type=? "
					+ " AND org_fk=?");
			st.setInt(1, this.prof_type_fk);
			st.setInt(2, this.user_fk);
			st.setInt(3, this.type_fk);
			st.setString(4, this.type);
			st.setInt(5, this.org_fk);
			ResultSet res = st.executeQuery();
			while(res.next()){
				obj.setProf_type_fk(res.getInt("prof_type_fk"));
				obj.setUser_fk(res.getInt("user_fk"));
				obj.setType(res.getString("type"));
				obj.setType_fk(res.getInt("type_fk"));
				obj.setOrg_fk(res.getInt("org_fk"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	public boolean update() {
		try {
			user_fk = 2;
			type = "MEN";
			org_fk = 17;
			type_fk = 18;
			prof_type_fk = 18;
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("UPDATE glb_t_profile SET "
					+ "prof_type_fk=?, "
					+ "user_fk=?, "
					+ "type=?, "
					+ "type_fk=?, "
					+ "org_fk=? "
					+ " WHERE prof_type_fk = " + this.prof_type_fk + " and user_fk = " + 
					this.user_fk + " and type_fk = " + this.type_fk + " and org_fk = " + this.org_fk);
			
			st.setInt(1, this.prof_type_fk);
			st.setInt(2, this.user_fk);
			st.setString(3, this.type);
			st.setInt(4, this.type_fk);
			st.setInt(5, this.org_fk);
			
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
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("DELETE FROM glb_t_profile where "
					+ "prof_type_fk = ? "
					+ "and user_fk =? "
					+ "and type =? "
					+ "and type_fk =? "
					+ "and org_fk =?");
			st.setInt(1, this.prof_type_fk );
			st.setInt(2, this.user_fk );
			st.setString(3, this.type  );
			st.setInt(4, this.type_fk  );
			st.setInt(5, this.org_fk );
			
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}
	
	
	public boolean deleteAllOrgProfile() {
		try{
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("DELETE FROM glb_t_profile where "
					+ "prof_type_fk = ? "
					+ "and user_fk =? "
					+ "and type =? "
					+ "and org_fk =?");
			st.setInt(1, this.prof_type_fk );
			st.setInt(2, this.user_fk );
			st.setString(3, this.type  );
			st.setInt(4, this.org_fk );
			
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}
	
	
	public boolean deleteAllPerfilProfile() {
		try{
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("DELETE FROM glb_t_profile where "
					+ "prof_type_fk = ? "
					+ "and user_fk =? "
					+ "and type =? "
					+ "and org_fk =?");
			st.setInt(1, this.prof_type_fk );
			st.setInt(2, this.user_fk );
			st.setString(3, this.type  );
			st.setInt(4, this.org_fk );
			
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public Object[] getAll() {
		ArrayList<Profile> lista = new ArrayList<>();
		try{
			
			Statement st = con.createStatement();
			ResultSet res = st.executeQuery("SELECT prof_type_fk, user_fk, type, type_fk, org_fk "
					+ "FROM glb_t_profile");
			while(res.next()){
				Profile obj = new Profile();
				obj.setProf_type_fk(res.getInt("prof_type_fk"));
				obj.setUser_fk(res.getInt("user_fk"));
				obj.setType(res.getString("type"));
				obj.setType_fk(res.getInt("type_fk"));
				obj.setOrg_fk(res.getInt("org_fk"));
				lista.add(obj);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return lista.toArray();
	}
	
	public Object getByUser(int userId) {
		boolean flag = false;
		try{
			PreparedStatement st = this.con.prepareStatement("SELECT prof_type_fk, user_fk, type, type_fk, org_fk FROM glb_t_profile where TYPE = 'PROF' and user_fk = ?");
			st.setInt(1, userId);
			ResultSet res = st.executeQuery();
			while(res.next()){
				this.setProf_type_fk(res.getInt("prof_type_fk"));
				this.setUser_fk(res.getInt("user_fk"));
				this.setType(res.getString("type"));
				this.setType_fk(res.getInt("type_fk"));
				this.setOrg_fk(res.getInt("org_fk"));
				flag = true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return flag ? this : null;
	}
	
	public Object getByUserAndPerfil(int userId, int profileId) {
		boolean flag = false;
		try{
			PreparedStatement st = this.con.prepareStatement("SELECT prof_type_fk, user_fk, type, type_fk, org_fk FROM glb_t_profile where TYPE = 'PROF' and user_fk = ? and TYPE_FK = ?");
			st.setInt(1, userId);
			st.setInt(2, profileId);
			ResultSet res = st.executeQuery();
			while(res.next()){
				this.setProf_type_fk(res.getInt("prof_type_fk"));
				this.setUser_fk(res.getInt("user_fk"));
				this.setType(res.getString("type"));
				this.setType_fk(res.getInt("type_fk"));
				this.setOrg_fk(res.getInt("org_fk"));
				flag = true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return flag ? this : null;
	}
	
	
	@Override
	public String toString() {
		return "Profile [prof_type_fk=" + prof_type_fk + ", user_fk=" + user_fk + ", type=" + type + ", type_fk="
				+ type_fk + ", org_fk=" + org_fk + "]";
	}
	
	
	
}
