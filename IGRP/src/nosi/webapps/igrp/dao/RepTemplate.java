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
public class RepTemplate{

	private int id;
	private String code;
	private String name;
	private int env_fk;
	private int html_content_fk;
	private int xsl_content_fk;
	private Date dt_created;
	private Date dt_updated;
	private int user_created_fk;
	private int user_updated_fk;
	private int status;
	private int data_source_id;
	private int template_id;
	
	
	private Connection con;
	public RepTemplate() {
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

	public int getEnv_fk() {
		return env_fk;
	}

	public void setEnv_fk(int env_fk) {
		this.env_fk = env_fk;
	}

	public int getHtml_content_fk() {
		return html_content_fk;
	}

	public void setHtml_content_fk(int html_content_fk) {
		this.html_content_fk = html_content_fk;
	}

	public int getXsl_content_fk() {
		return xsl_content_fk;
	}

	public void setXsl_content_fk(int xsl_content_fk) {
		this.xsl_content_fk = xsl_content_fk;
	}

	public Date getDt_created() {
		return dt_created;
	}

	public void setDt_created(Date dt_created) {
		this.dt_created = dt_created;
	}

	public Date getDt_updated() {
		return dt_updated;
	}

	public void setDt_updated(Date dt_updated) {
		this.dt_updated = dt_updated;
	}

	public int getUser_created_fk() {
		return user_created_fk;
	}

	public void setUser_created_fk(int user_created_fk) {
		this.user_created_fk = user_created_fk;
	}

	public int getUser_updated_fk() {
		return user_updated_fk;
	}

	public void setUser_updated_fk(int user_updated_fk) {
		this.user_updated_fk = user_updated_fk;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	public int getData_source_id() {
		return data_source_id;
	}
	public void setData_source_id(int data_source_id) {
		this.data_source_id = data_source_id;
	}
	public int getTemplate_id() {
		return template_id;
	}
	public void setTemplate_id(int template_id) {
		this.template_id = template_id;
	}
	public RepTemplate insert() {
		try{
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_rep_template"+
			             "(code,name,env_fk,html_content_fk,xsl_content_fk,dt_created,dt_updated,user_created_fk,user_updated_fk,status)" +
					     "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?,?)",Statement.RETURN_GENERATED_KEYS);			
			st.setString(1, this.code);
			st.setString(2, this.name);
			st.setInt(3, this.env_fk);
			st.setInt(4, this.html_content_fk);
			st.setInt(5, this.xsl_content_fk);
			st.setDate(6, (Date)this.dt_created);
			st.setDate(7,(Date)this.dt_updated);
			st.setInt(8, this.user_created_fk);
			st.setInt(9,this.user_updated_fk);
			st.setInt(10,this.status);
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
	
	public RepTemplate insertTemDataSource(int id_t,int id_dt) {
		try{
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_rep_template_source"+
			             "(data_source_id,template_id)" +
					     "VALUES(?, ?)");			
			st.setInt(1, id_dt);
			st.setInt(2, id_t);
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return this;
	}
	
	public RepTemplate getOne() {
		RepTemplate obj = new RepTemplate();
		try{
		Statement st = con.createStatement();
		ResultSet result = st.executeQuery("SELECT * FROM glb_t_rep_template where (id = "+ this.id+")");
		while(result.next()){
			obj.setId(result.getInt("id"));
			obj.setName(result.getString("name"));
		    obj.setCode(result.getString("code")); 
			obj.setHtml_content_fk(result.getInt("html_content_fk"));
			obj.setXsl_content_fk(result.getInt("xsl_content_fk"));
			obj.setEnv_fk(result.getInt("env_fk"));
			obj.setDt_created(result.getDate("dt_created"));
			obj.setDt_updated(result.getDate("dt_updated")); 
			obj.setUser_created_fk(result.getInt("user_created_fk"));
			obj.setUser_updated_fk(result.getInt("user_updated_fk"));
			obj.setStatus(result.getInt("status"));		
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
		ArrayList<RepTemplate> lista = new ArrayList<>();		
		try{
			String sql = "SELECT * FROM glb_t_rep_template where 1=1 ";
			sql += (this.getName()!=null && !this.getName().equals("")) ? " and lower (name) like lower ('%" + this.getName() + "%') ": " ";
			sql += (this.getEnv_fk()!=0) ? " and env_fk="+this.getEnv_fk(): " ";
			
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet result = st.executeQuery();
			while(result.next()){
				RepTemplate obj = new RepTemplate();
				obj.setId(result.getInt("id"));
				obj.setName(result.getString("name"));
			    obj.setCode(result.getString("code")); 
				obj.setHtml_content_fk(result.getInt("html_content_fk"));
				obj.setXsl_content_fk(result.getInt("xsl_content_fk"));
				obj.setEnv_fk(result.getInt("env_fk"));
				obj.setDt_created(result.getDate("dt_created"));
				obj.setDt_updated(result.getDate("dt_updated")); 
				obj.setUser_created_fk(result.getInt("user_created_fk"));
				obj.setUser_updated_fk(result.getInt("user_updated_fk"));
				obj.setStatus(result.getInt("status"));					
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
	
	public Object[] getAllDataSources() {
		ArrayList<RepTemplate> lista = new ArrayList<>();		
		try{
			String sql = "SELECT * FROM GLB_T_REP_TEMPLATE_SOURCE where 1=1 ";
			sql += (this.getId()!=0) ? " and template_id="+this.getId(): " ";	
			sql += (this.getData_source_id()!=0) ? " and data_source_id="+this.getData_source_id(): " ";	
			
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet result = st.executeQuery();
			while(result.next()){	
				RepTemplate obj = new RepTemplate();
				obj.setData_source_id(result.getInt("data_source_id"));
				obj.setTemplate_id(result.getInt("template_id"));
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
	
}
