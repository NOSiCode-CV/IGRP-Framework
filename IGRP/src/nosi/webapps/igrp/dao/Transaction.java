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
	private Connection con;
	
	public Transaction() {
		super();
		this.con = Igrp.getInstance().getDao().unwrap("postgresql");
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
	
	
	
	@Override
	public boolean insert() {
		try{
			/*code = "code 1 teste";
			descr = "descr 1 teste";
			env_fk = 2;
			status = 1;*/
		PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_transaction"
				+ "(code, descr, env_fk, status) "
				+ "VALUES (?, ?, ?, ?)");
		st.setString(1, this.code);
		st.setString(2, this.descr);
		st.setInt(3, this.env_fk);
		st.setInt(4, this.status);
		st.executeUpdate();
		st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object getOne() {
		Transaction obj = new Transaction();
		try{
			//id = 127;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT id, code, descr, env_fk, status "
					+ "FROM glb_t_transaction "
					+ "WHERE id = " + this.id);
			
			while(rs.next()){
				obj.setCode(rs.getString("code"));
				obj.setDescr(rs.getString("descr"));
				obj.setEnv_fk(rs.getInt("env_fk"));
				obj.setStatus(rs.getInt("status"));
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
			/*id = 127;
			code = "code 1 teste update";
			descr = "descr 1 teste";
			env_fk = 2;
			status = 1;*/
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
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete() {
		id = 128;
		try{
			PreparedStatement st = con.prepareStatement("DELETE FROM glb_t_transaction WHERE id = ?");
			st.setInt(1, this.id);
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object[] getAll() {
		ArrayList<Transaction> lista = new ArrayList<>();
		try{
			//id = 127;
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT id, code, descr, env_fk, status "
					+ "FROM glb_t_transaction");
			
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
	
	public static void main(String [] args){
		//new Transaction().insert();
		//System.out.println(new Transaction().getOne()); 
		/*for(Object i: new Transaction().getAll()){
			Transaction obj = (Transaction) i;
			System.out.println(obj.getCode());
		}*/
		
		//new Transaction().update();
		new Transaction().delete();
	}

	@Override
	public String toString() {
		return "Transaction [id=" + id + ", code=" + code + ", descr=" + descr + ", env_fk=" + env_fk + ", status="
				+ status + "]";
	}
	
	

}
