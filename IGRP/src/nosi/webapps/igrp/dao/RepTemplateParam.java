package nosi.webapps.igrp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;

/**
 * @author: Emanuel Pereira
 * 16 Jun 2017
 */
public class RepTemplateParam implements RowDataGateway{

	private int id_template;
	private String parameter;
	
	private Connection con;
	public RepTemplateParam() {
		this.con = Igrp.getInstance().getDao().unwrap("db1");
	}
	public int getId_template() {
		return id_template;
	}

	public void setId_template(int id_template) {
		this.id_template = id_template;
	}

	public String getParameter() {
		return parameter;
	}

	public void setParameter(String parameter) {
		this.parameter = parameter;
	}
	
	@Override
	public boolean insert() {
		try{
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_rep_template_param"+
			             "(id_template,parameter)" +
					     "VALUES(?,?)");
			
			st.setInt(1, this.id_template);
			st.setString(2, this.parameter);
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
		RepTemplateParam obj = new RepTemplateParam();
		try{
			PreparedStatement st = con.prepareStatement("SELECT * FROM glb_t_rep_template_param where id_template=? and parameter=?");
			st.setInt(1, this.getId_template());
			st.setString(2, this.getParameter());
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				obj.setId_template(rs.getInt("id_template"));
				obj.setParameter(rs.getString("parameter"));
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
		ArrayList<RepTemplateParam> lista = new ArrayList<>();		
		try{
			String sql = "SELECT * FROM glb_t_rep_template_param where 1=1 ";
			sql += (this.getId_template()!=0) ? " and id_template="+this.getId_template(): " ";
			
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				RepTemplateParam obj = new RepTemplateParam();
				obj.setId_template(rs.getInt("id_template"));
				obj.setParameter(rs.getString("parameter"));		
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
