package nosi.webapps.igrp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import nosi.core.webapp.Igrp;

/**
 * @author: Emanuel Pereira
 * 16 Jun 2017
 */
public class CLob{

	private int id;
	private String name;
	private String mime_type;
	private String c_lob_content;
	private Date dt_created;
	
	private Connection con;
	
	public CLob() {
		this.con = Igrp.getInstance().getDao().unwrap("db1");
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMime_type() {
		return mime_type;
	}
	public void setMime_type(String mime_type) {
		this.mime_type = mime_type;
	}
	public String getC_lob_content() {
		return c_lob_content;
	}
	public void setC_lob_content(String c_lob_content) {
		this.c_lob_content = c_lob_content;
	}
	public Date getDt_created() {
		return dt_created;
	}
	public void setDt_created(Date dt_created) {
		this.dt_created = dt_created;
	}
	

	public CLob insert() {
		try{
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_clob"+
			             "(name,mime_type,c_lob_content,dt_created)" +
					     "VALUES(?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			
			st.setString(1,this.getName());
			st.setString(2, this.getMime_type());
			st.setString(3, this.getC_lob_content());
			st.setDate(4, (Date)this.getDt_created());
			st.executeUpdate();
			try (ResultSet generatedKeys = st.getGeneratedKeys()) {
	            if (generatedKeys.next()) {
	                this.setId(generatedKeys.getInt(1));
	            }
	        }
			st.close();
			return getOne();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return this;
	}

	public CLob getOne() {
		CLob obj = new CLob();
		try{
			PreparedStatement st = con.prepareStatement("SELECT * FROM glb_t_clob where id=?");
			st.setInt(1, this.getId());
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				obj.setId(rs.getInt("id"));
				obj.setName(rs.getString("name"));
				obj.setMime_type(rs.getString("mime_type"));
				obj.setC_lob_content(rs.getString("c_lob_content"));
				obj.setDt_created(rs.getDate("dt_created"));
			}
			st.close();		
		}catch(SQLException e){
			e.printStackTrace();
		}
		return obj;
	}

//	@Override
//	public boolean update() {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
//	public boolean delete() {
//		// TODO Auto-generated method stub
//		return false;
//	}
//
//	@Override
	public Object[] getAll() {
		ArrayList<CLob> lista = new ArrayList<>();		
		try{
			String sql = "SELECT * FROM glb_t_clob where 1=1 ";			
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				CLob obj = new CLob();
				obj.setId(rs.getInt("id"));
				obj.setName(rs.getString("name"));
				obj.setMime_type(rs.getString("mime_type"));
				obj.setC_lob_content(rs.getString("c_lob_content"));
				obj.setDt_created(rs.getDate("dt_created"));	
				lista.add(obj);
			}
		st.close();		
		}catch(SQLException e){
			e.printStackTrace();
		}catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista.toArray();
	}

	public CLob update() {
		try{
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("UPDATE glb_t_clob SET "+
			             "name=?,mime_type=?,c_lob_content=?,dt_created=? WHERE id=?");			
			st.setString(1,this.getName());
			st.setString(2, this.getMime_type());
			st.setString(3, this.getC_lob_content());
			st.setDate(4, (Date)this.getDt_created());
			st.setInt(5,this.getId());
			st.executeUpdate();
			st.close();
			return getOne();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return this;
	}
	
}
