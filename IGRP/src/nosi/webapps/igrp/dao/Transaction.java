package nosi.webapps.igrp.dao;

import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;
public class Transaction implements RowDataGateway {
	
	private int id;
	private String code;
	private String descr;
	private int env_fk;
	private int status;
	private int org_fk;
	private Connection con;
	
	public Transaction() {
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

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
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
	
	public int getOrg_fk() {
		return org_fk;
	}

	public void setOrg_fk(int org_fk) {
		this.org_fk = org_fk;
	}

	@Override
	public boolean insert() {
		try{
			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_transaction"
					+ "(code, descr, env_fk, status) "
					+ "VALUES (?, ?, ?, ?)");
			st.setString(1, this.code);
			st.setString(2, this.descr);
			st.setInt(3, this.env_fk);
			st.setInt(4, this.status);
			st.executeUpdate();
			st.close();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object getOne() {
		Transaction obj = new Transaction();
		try{
			String conditions = "";
			if(this.id!=0){
				conditions+=" AND id=? ";
			}if(this.code!=null && !this.code.equals("")){
				conditions+=" AND code=? ";
			}
			PreparedStatement st = con.prepareStatement("SELECT id, code, descr, env_fk, status "
					+ "FROM glb_t_transaction "
					+ "WHERE 1=1 "+conditions);
			if(this.id!=0){
				st.setInt(1, this.id);
			}if(this.code!=null && !this.code.equals("")){
				st.setString(1, this.code);
			}
			ResultSet rs = st.executeQuery();			
			while(rs.next()){
				obj.setCode(rs.getString("code"));
				obj.setDescr(rs.getString("descr"));
				obj.setEnv_fk(rs.getInt("env_fk"));
				obj.setStatus(rs.getInt("status"));
				obj.setId(rs.getInt("id"));
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
			PreparedStatement st = con.prepareStatement("UPDATE glb_t_transaction SET "
					+ "code=?, "
					+ "descr=?, "
					+ "env_fk=?, "
					+ "status =? "
					+ "WHERE id = " + this.id);
			st.setString(1, this.code);
			st.setString(2, this.descr);
			st.setInt(3, this.env_fk);
			st.setInt(4, this.status);
	        st.executeUpdate();
	        st.close();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete() {
		try{
			PreparedStatement st = con.prepareStatement("DELETE FROM glb_t_transaction WHERE id = ?");
			st.setInt(1, this.id);
			st.executeUpdate();
			st.close();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object[] getAll() {
		ArrayList<Transaction> lista = new ArrayList<>();
		try{
			String sql = "SELECT id, code, descr, env_fk, status "
					   + "FROM glb_t_transaction WHERE env_fk=?";
			if(this.org_fk!=0 && (this.code==null || this.code.equals(""))){
				sql = "SELECT T.* "
						   + "FROM glb_t_transaction T,glb_t_profile P WHERE T.env_fk=? AND T.id=P.type_fk AND P.type=? AND P.org_fk=?";
			}if(this.org_fk==0 && this.code!=null && !this.code.equals("")){
				sql +=" AND code=? ";
			}if(this.org_fk!=0 && this.code!=null && !this.code.equals("")){
				sql = "SELECT T.* "
						   + "FROM glb_t_transaction T,glb_t_profile P WHERE T.env_fk=? AND T.id=P.type_fk AND P.type=? AND P.org_fk=? AND T.code=?";
			}
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, this.env_fk);
			if(this.org_fk!=0 && (this.code==null  || this.code.equals(""))){
				st.setString(2, "TRANS");
				st.setInt(3,this.org_fk);
			}if(this.org_fk==0 && this.code!=null  && !this.code.equals("")){
				st.setString(2, this.code);
			}if(this.org_fk!=0 && this.code!=null  && !this.code.equals("")){
				st.setString(2, "TRANS");
				st.setInt(3,this.org_fk);
				st.setString(4, this.code);
			}
			ResultSet rs = st.executeQuery();			
			while(rs.next()){
				Transaction obj = new Transaction();
				obj.setCode(rs.getString("code"));
				obj.setDescr(rs.getString("descr"));
				obj.setEnv_fk(rs.getInt("env_fk"));
				obj.setStatus(rs.getInt("status"));
				lista.add(obj);
			}
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return lista.toArray();
	}

}
