package nosi.webapps.igrp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;

/**
 * @author: Emanuel Pereira
 * 16 Jun 2017
 */
public class RepInstance implements RowDataGateway{

	private int id;
	private int id_template;
	private String contra_prova;
	private Date dt_created;
	private int user_created;
	private int xml_content_fk;
	private int xsl_content_fk;
	private String reference;
	private int ref_fk;
	private int env_fk;
	
	private Connection con;
	
	public RepInstance() {
		this.con = Igrp.getInstance().getDao().unwrap("db1");
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_template() {
		return id_template;
	}

	public void setId_template(int id_template) {
		this.id_template = id_template;
	}

	public String getContra_prova() {
		return contra_prova;
	}

	public void setContra_prova(String contra_prova) {
		this.contra_prova = contra_prova;
	}

	public Date getDt_created() {
		return dt_created;
	}

	public void setDt_created(Date dt_created) {
		this.dt_created = dt_created;
	}

	public int getUser_created() {
		return user_created;
	}

	public void setUser_created(int user_created) {
		this.user_created = user_created;
	}

	public int getXml_content_fk() {
		return xml_content_fk;
	}

	public void setXml_content_fk(int xml_content_fk) {
		this.xml_content_fk = xml_content_fk;
	}

	public int getXsl_content_fk() {
		return xsl_content_fk;
	}

	public void setXsl_content_fk(int xsl_content_fk) {
		this.xsl_content_fk = xsl_content_fk;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public int getRef_fk() {
		return ref_fk;
	}

	public void setRef_fk(int ref_fk) {
		this.ref_fk = ref_fk;
	}

	public int getEnv_fk() {
		return env_fk;
	}

	public void setEnv_fk(int env_fk) {
		this.env_fk = env_fk;
	}
	
	@Override
	public boolean insert() {
		try{
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_rep_instance"+
			             "(id_template,contra_prova,dt_created,user_created,xml_content_fk,xsl_content_fk,reference,ref_fk,env_fk)" +
					     "VALUES(?,?,?,?,?,?,?,?,?)");
			
			st.setInt(1, this.id_template);
			st.setString(2, this.contra_prova);
			st.setDate(3, (Date)this.dt_created);
			st.setInt(4, this.user_created);
			st.setInt(5, this.xml_content_fk);
			st.setInt(6, this.xsl_content_fk);
			st.setString(7, this.reference);
			st.setInt(8, this.ref_fk);
			st.setInt(9, this.env_fk);
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
		RepInstance obj = new RepInstance();
		try{
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM glb_t_rep_instance where (id = "+ this.id+")");
		while(rs.next()){
			obj.setId(rs.getInt("id"));
			obj.setId_template(rs.getInt("id_template"));
			obj.setContra_prova(rs.getString("contra_prova"));
			obj.setDt_created(rs.getDate("dt_created"));
			obj.setUser_created(rs.getInt("user_created"));
			obj.setXml_content_fk(rs.getInt("xml_content_fk"));
			obj.setXsl_content_fk(rs.getInt("xsl_content_fk"));
			obj.setReference(rs.getString("reference"));
			obj.setRef_fk(rs.getInt("ref_fk"));
			obj.setEnv_fk(rs.getInt("env_fk"));
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
		ArrayList<RepInstance> lista = new ArrayList<>();		
		try{
			String sql = "SELECT * FROM glb_t_rep_instance where 1=1 ";
			sql += (this.getEnv_fk()!=0) ? " and env_fk="+this.getEnv_fk(): " ";
			
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				RepInstance obj = new RepInstance();
				obj.setId(rs.getInt("id"));
				obj.setId_template(rs.getInt("id_template"));
				obj.setContra_prova(rs.getString("contra_prova"));
				obj.setDt_created(rs.getDate("dt_created"));
				obj.setUser_created(rs.getInt("user_created"));
				obj.setXml_content_fk(rs.getInt("xml_content_fk"));
				obj.setXsl_content_fk(rs.getInt("xsl_content_fk"));
				obj.setReference(rs.getString("reference"));
				obj.setRef_fk(rs.getInt("ref_fk"));
				obj.setEnv_fk(rs.getInt("env_fk"));			
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
