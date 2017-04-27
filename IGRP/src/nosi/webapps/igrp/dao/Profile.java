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
		this.con = Igrp.getInstance().getDao().unwrap("postgresql");
	}

	@Override
	public boolean insert() {
		try {
			/*user_fk = 2;
			type = "PROF";
			org_fk = 17;
			type_fk = 18;
			prof_type_fk = 18;*/
			PreparedStatement st = con.prepareStatement("INSERT INTO public.glb_t_profile"
					+ "(prof_type_fk, user_fk, type, type_fk, org_fk) "
					+ "VALUES (?, ?, ?, ?, ?)");
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
	public Object getOne() {
		Profile obj = new Profile();
		try{
			user_fk = 2;
			org_fk = 17;
			type_fk = 18;
			prof_type_fk = 18;
			Statement st = con.createStatement();
			ResultSet res = st.executeQuery("SELECT prof_type_fk, user_fk, type, type_fk, org_fk "
					+ "FROM public.glb_t_profile where prof_type_fk = " + this.prof_type_fk + " and user_fk = " + 
					this.user_fk  + " and type_fk = " + this.type_fk + " and org_fk = " + this.org_fk);
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
			PreparedStatement st = con.prepareStatement("UPDATE public.glb_t_profile SET "
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
			/*user_fk = 2;
			type = "PROF";
			org_fk = 17;
			type_fk = 18;
			prof_type_fk = 18;*/
			PreparedStatement st = con.prepareStatement("DELETE FROM public.glb_t_profile where "
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

	@Override
	public Object[] getAll() {
		ArrayList<Profile> lista = new ArrayList<>();
		try{
			
			Statement st = con.createStatement();
			ResultSet res = st.executeQuery("SELECT prof_type_fk, user_fk, type, type_fk, org_fk "
					+ "FROM public.glb_t_profile");
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
	public static void main(String[] args) {
		for(Object i: new Profile().getAll()){
			Profile obj = (Profile) i;
			System.out.println(obj.getUser_fk());
		}
		
		//System.out.println(new Profile().getOne());
		
		//new Profile().delete();
		//new Profile().insert();
		//new Profile().update();
	}

	@Override
	public String toString() {
		return "Profile [prof_type_fk=" + prof_type_fk + ", user_fk=" + user_fk + ", type=" + type + ", type_fk="
				+ type_fk + ", org_fk=" + org_fk + "]";
	}
	
	
	
}
