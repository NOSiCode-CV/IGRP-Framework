package nosi.webapps.igrp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;

/**
 * @Author: Emanuel Pereira
 * 15 Jun 2017
 */
public class RepSource implements RowDataGateway {

	private int id;
	private String name;
	private String type;
	private int type_fk;
	private String type_name;
	private String type_query;
	private int env_fk;
	private int status;
	private int env_fk_source;
	private Date dt_created;
	private Date dt_updated;
	private int user_created_fk;
	private int user_updated_fk;
	
	private Connection con;
	
	public RepSource() {
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

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getType_query() {
		return type_query;
	}

	public void setType_query(String type_query) {
		this.type_query = type_query;
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

	public int getEnv_fk_source() {
		return env_fk_source;
	}

	public void setEnv_fk_source(int env_fk_source) {
		this.env_fk_source = env_fk_source;
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

	@Override
	public boolean insert() {
		try{
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_rep_source"+
			             "(name,type,type_fk,type_name,type_query,env_fk,status,env_fk_source,dt_created,dt_updated,user_created_fk,user_updated_fk)" +
					     "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			st.setString(1, this.name);
			st.setString(2, this.type);
			st.setInt(3, this.type_fk);
			st.setString(4, this.type_name);
			st.setString(5, this.type_query);
			st.setInt(6, this.env_fk);
			st.setInt(7, this.status);
			st.setInt(8, this.env_fk_source);
			st.setDate(9, (Date)this.dt_created);
			st.setDate(10,(Date)this.dt_updated);
			st.setInt(11, this.user_created_fk);
			st.setInt(12,this.user_updated_fk);
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
		RepSource obj = new RepSource();
		try{
		Statement st = con.createStatement();
		ResultSet result = st.executeQuery("SELECT * FROM glb_t_rep_source where (id = "+ this.id+")");
		while(result.next()){
			obj.setId(result.getInt("id"));
			obj.setName(result.getString("name"));
		    obj.setType(result.getString("type")); 
			obj.setType_fk(result.getInt("type_fk") );
			obj.setType_name(result.getString("type_name"));
			obj.setType_query(result.getString("type_query")); 
			obj.setEnv_fk(result.getInt("env_fk"));
			obj.setEnv_fk_source(result.getInt("env_fk_source")); 
			obj.setDt_created(result.getDate("dt_created"));
			obj.setDt_updated(result.getDate("dt_updated")); 
			obj.setUser_created_fk(result.getInt("user_created_fk"));
			obj.setUser_updated_fk(result.getInt("user_updated_fk"));
			obj.setStatus(result.getInt("status"));
			obj.setId(result.getInt("id"));					
		}
		st.close();
		
		}catch(SQLException e){
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	public boolean update() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object[] getAll() {
		ArrayList<RepSource> lista = new ArrayList<>();		
		try{
			String sql = "SELECT * FROM glb_t_rep_source where 1=1 ";
			sql += (this.getName()!=null && !this.getName().equals("")) ? " and lower (name) like lower ('%" + this.getName() + "%') ": " ";
			sql += (this.getEnv_fk()!=0) ? " and env_fk="+this.getEnv_fk(): " ";
			
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet result = st.executeQuery();
			while(result.next()){
				RepSource obj = new RepSource();
				obj.setId(result.getInt("id"));
				obj.setName(result.getString("name"));
			    obj.setType(result.getString("type")); 
				obj.setType_fk(result.getInt("type_fk") );
				obj.setType_name(result.getString("type_name"));
				obj.setType_query(result.getString("type_query")); 
				obj.setEnv_fk(result.getInt("env_fk"));
				obj.setEnv_fk_source(result.getInt("env_fk_source")); 
				obj.setDt_created(result.getDate("dt_created"));
				obj.setDt_updated(result.getDate("dt_updated")); 
				obj.setUser_created_fk(result.getInt("user_created_fk"));
				obj.setUser_updated_fk(result.getInt("user_updated_fk"));
				obj.setStatus(result.getInt("status"));
				obj.setId(result.getInt("id"));						
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
	
	public HashMap<Integer,String> getListSources(){
		HashMap<Integer,String> lista = new HashMap<>();
		//lista.put(null, "--- Selecionar Aplicação ---");
		for(Object obj:this.getAll()){
			RepSource rep = (RepSource) obj;
			lista.put(rep.getId(), rep.getName());
		}
		return lista;
	}


	public HashMap<String,Boolean> getSqlColumns(String query) {
		HashMap<String,Boolean> columns = new HashMap<>();
		try {
			Statement s = con.createStatement();
			ResultSetMetaData rsd =s.executeQuery(query).getMetaData();
			for(int i=1;i<=rsd.getColumnCount();i++){
				columns.put(rsd.getColumnName(i),false);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return columns;
	}

}
