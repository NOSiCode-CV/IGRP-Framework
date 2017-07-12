package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Query;
import javax.persistence.Table;

import nosi.base.ActiveRecord.BaseActiveRecord;

@Entity
@Table(name="tbl_rep_template_param")
public class RepTemplateParam extends BaseActiveRecord<RepTemplateParam> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5327240541320741542L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="rep_template_fk",foreignKey=@ForeignKey(name="REP_TEMPLATE_PARAM_FK"),nullable=false)
	private RepTemplate reptemplate;
	@Column(nullable=false)
	private String parameter;
	
	public RepTemplateParam(){}
	
	public RepTemplateParam(Integer id, RepTemplate reptemplate, String parameter) {
		super();
		this.id = id;
		this.reptemplate = reptemplate;
		this.parameter = parameter;
	}
	
	public RepTemplate getReptemplate() {
		return reptemplate;
	}
	public void setReptemplate(RepTemplate reptemplate) {
		this.reptemplate = reptemplate;
	}
	public String getParameter() {
		return parameter;
	}
	public void setParameter(String parameter) {
		this.parameter = parameter;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public void deleteAll(Integer id) {
		EntityManager em = this.entityManagerFactory.createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Query q = em.createNativeQuery("DELETE FROM tbl_rep_template_param WHERE rep_template_fk=?");
		q.setParameter(1, id);
		q.executeUpdate();
		t.commit();
		em.close();
	}	
}

//package nosi.webapps.igrp.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import nosi.core.dao.RowDataGateway;
//import nosi.core.webapp.Igrp;
//
///**
// * @author: Emanuel Pereira
// * 16 Jun 2017
// */
//public class RepTemplateParam implements RowDataGateway{
//
//	private int id_template;
//	private String parameter;
//	
//	private Connection con;
//	public RepTemplateParam() {
//		this.con = Igrp.getInstance().getDao().unwrap("db1");
//	}
//	public int getId_template() {
//		return id_template;
//	}
//
//	public void setId_template(int id_template) {
//		this.id_template = id_template;
//	}
//
//	public String getParameter() {
//		return parameter;
//	}
//
//	public void setParameter(String parameter) {
//		this.parameter = parameter;
//	}
//	
//	@Override
//	public boolean insert() {
//		try{
//			con.setAutoCommit(true);
//			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_rep_template_param"+
//			             "(id_template,parameter)" +
//					     "VALUES(?,?)");
//			
//			st.setInt(1, this.id_template);
//			st.setString(2, this.parameter);
//			st.executeUpdate();
//			st.close();
//			return true;
//		}catch(SQLException e){
//			e.printStackTrace();
//		}
//		return false;
//	}
//
//	@Override
//	public Object getOne() {
//		RepTemplateParam obj = new RepTemplateParam();
//		try{
//			PreparedStatement st = con.prepareStatement("SELECT * FROM glb_t_rep_template_param where id_template=? and parameter=?");
//			st.setInt(1, this.getId_template());
//			st.setString(2, this.getParameter());
//			ResultSet rs = st.executeQuery();
//			while(rs.next()){
//				obj.setId_template(rs.getInt("id_template"));
//				obj.setParameter(rs.getString("parameter"));
//			}
//			st.close();		
//		}catch(SQLException e){
//			e.printStackTrace();
//		}
//		return obj;
//	}
//
//	@Override
//	public boolean update() {
//		
//		return false;
//	}
//
//	@Override
//	public boolean delete() {
//		try{
//			con.setAutoCommit(true);
//			PreparedStatement st = con.prepareStatement("DELETE FROM glb_t_rep_template_param WHERE id_template=?");	
//			st.setInt(1, this.id_template);
//			st.executeUpdate();
//			st.close();
//			return true;
//		}catch(SQLException e){
//			e.printStackTrace();
//		}
//		return false;
//	}
//
//	@Override
//	public Object[] getAll() {
//		ArrayList<RepTemplateParam> lista = new ArrayList<>();		
//		try{
//			String sql = "SELECT * FROM glb_t_rep_template_param where 1=1 ";
//			sql += (this.getId_template()!=0) ? " and id_template="+this.getId_template(): " ";
//			
//			PreparedStatement st = con.prepareStatement(sql);
//			ResultSet rs = st.executeQuery();
//			while(rs.next()){
//				RepTemplateParam obj = new RepTemplateParam();
//				obj.setId_template(rs.getInt("id_template"));
//				obj.setParameter(rs.getString("parameter"));		
//				lista.add(obj);
//			}
//		st.close();		
//		}catch(SQLException e){
//			e.printStackTrace();
//		}catch (IllegalArgumentException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return lista.toArray();
//	}
//}
