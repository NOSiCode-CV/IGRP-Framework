package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import nosi.base.ActiveRecord.BaseActiveRecord;

@Entity
@Table(name="tbl_rep_instance")
public class RepInstance extends BaseActiveRecord<RepInstance> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6038086276230437820L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name="rep_template_fk",foreignKey=@ForeignKey(name="REP_INSTANCE_REP_TEMPLATE_FK"),nullable=true)
	private RepTemplate template;
	private String contra_prova;
	@Column(nullable=false)
	@Temporal(TemporalType.DATE)
	private Date dt_created;
	private String reference;
	private int ref_fk;
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="env_fk",foreignKey=@ForeignKey(name="REP_INSTANCE_ENV_FK"),nullable=false)
	private Application application;

	@ManyToOne
	@JoinColumn(name="xml_content_fk",foreignKey=@ForeignKey(name="REP_INSTANCE_XML_CONTENT_FK"),nullable=false)
	private CLob xml_content;
	
	@ManyToOne
	@JoinColumn(name="xsl_content_fk",foreignKey=@ForeignKey(name="REP_INSTANCE_XSL_CONTENT_FK"),nullable=false)
	private CLob xsl_content;
	
	@ManyToOne
	@JoinColumn(name="user_fk",foreignKey=@ForeignKey(name="REP_INSTANCE_USER_FK"))
	private User user;

	public RepInstance(){}
	
	public RepInstance(Integer id, RepTemplate template, String contra_prova, Date dt_created, String reference,
			int ref_fk, Application application, CLob xml_content, CLob xsl_content, User user) {
		super();
		this.id = id;
		this.template = template;
		this.contra_prova = contra_prova;
		this.dt_created = dt_created;
		this.reference = reference;
		this.ref_fk = ref_fk;
		this.application = application;
		this.xml_content = xml_content;
		this.xsl_content = xsl_content;
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public RepTemplate getTemplate() {
		return template;
	}

	public void setTemplate(RepTemplate template) {
		this.template = template;
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

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public CLob getXml_content() {
		return xml_content;
	}

	public void setXml_content(CLob xml_content) {
		this.xml_content = xml_content;
	}

	public CLob getXsl_content() {
		return xsl_content;
	}

	public void setXsl_content(CLob xsl_content) {
		this.xsl_content = xsl_content;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}

//package nosi.webapps.igrp.dao;
//
//import java.sql.Connection;
//import java.sql.Date;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.util.ArrayList;
//import nosi.core.dao.RowDataGateway;
//import nosi.core.webapp.Igrp;
//
///**
// * @author: Emanuel Pereira
// * 16 Jun 2017
// */
//public class RepInstance implements RowDataGateway{
//
//	private int id;
//	private int id_template;
//	private String contra_prova;
//	private Date dt_created;
//	private int user_created;
//	private int xml_content_fk;
//	private int xsl_content_fk;
//	private String reference;
//	private int ref_fk;
//	private int env_fk;
//	
//	private Connection con;
//	
//	public RepInstance() {
//		this.con = Igrp.getInstance().getDao().unwrap("db1");
//	}
//	public int getId() {
//		return id;
//	}
//
//	public void setId(int id) {
//		this.id = id;
//	}
//
//	public int getId_template() {
//		return id_template;
//	}
//
//	public void setId_template(int id_template) {
//		this.id_template = id_template;
//	}
//
//	public String getContra_prova() {
//		return contra_prova;
//	}
//
//	public void setContra_prova(String contra_prova) {
//		this.contra_prova = contra_prova;
//	}
//
//	public Date getDt_created() {
//		return dt_created;
//	}
//
//	public void setDt_created(Date dt_created) {
//		this.dt_created = dt_created;
//	}
//
//	public int getUser_created() {
//		return user_created;
//	}
//
//	public void setUser_created(int user_created) {
//		this.user_created = user_created;
//	}
//
//	public int getXml_content_fk() {
//		return xml_content_fk;
//	}
//
//	public void setXml_content_fk(int xml_content_fk) {
//		this.xml_content_fk = xml_content_fk;
//	}
//
//	public int getXsl_content_fk() {
//		return xsl_content_fk;
//	}
//
//	public void setXsl_content_fk(int xsl_content_fk) {
//		this.xsl_content_fk = xsl_content_fk;
//	}
//
//	public String getReference() {
//		return reference;
//	}
//
//	public void setReference(String reference) {
//		this.reference = reference;
//	}
//
//	public int getRef_fk() {
//		return ref_fk;
//	}
//
//	public void setRef_fk(int ref_fk) {
//		this.ref_fk = ref_fk;
//	}
//
//	public int getEnv_fk() {
//		return env_fk;
//	}
//
//	public void setEnv_fk(int env_fk) {
//		this.env_fk = env_fk;
//	}
//	
//	@Override
//	public boolean insert() {
//		try{
//			con.setAutoCommit(true);
//			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_rep_instance"+
//			             "(id_template,contra_prova,dt_created,user_created,xml_content_fk,xsl_content_fk,reference,ref_fk,env_fk)" +
//					     "VALUES(?,?,?,?,?,?,?,?,?)");
//			
//			st.setInt(1, this.id_template);
//			st.setString(2, this.contra_prova);
//			st.setDate(3, (Date)this.dt_created);
//			st.setInt(4, this.user_created);
//			st.setInt(5, this.xml_content_fk);
//			st.setInt(6, this.xsl_content_fk);
//			st.setString(7, this.reference);
//			st.setInt(8, this.ref_fk);
//			st.setInt(9, this.env_fk);
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
//		RepInstance obj = new RepInstance();
//		try{
//		Statement st = con.createStatement();
//		ResultSet rs = st.executeQuery("SELECT * FROM glb_t_rep_instance where (id = "+ this.id+")");
//		while(rs.next()){
//			obj.setId(rs.getInt("id"));
//			obj.setId_template(rs.getInt("id_template"));
//			obj.setContra_prova(rs.getString("contra_prova"));
//			obj.setDt_created(rs.getDate("dt_created"));
//			obj.setUser_created(rs.getInt("user_created"));
//			obj.setXml_content_fk(rs.getInt("xml_content_fk"));
//			obj.setXsl_content_fk(rs.getInt("xsl_content_fk"));
//			obj.setReference(rs.getString("reference"));
//			obj.setRef_fk(rs.getInt("ref_fk"));
//			obj.setEnv_fk(rs.getInt("env_fk"));
//		}
//		st.close();
//		
//		}catch(SQLException e){
//			e.printStackTrace();
//		}
//		return obj;
//	}
//
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
//	public Object[] getAll() {
//		ArrayList<RepInstance> lista = new ArrayList<>();		
//		try{
//			String sql = "SELECT * FROM glb_t_rep_instance where 1=1 ";
//			sql += (this.getEnv_fk()!=0) ? " and env_fk="+this.getEnv_fk(): " ";
//			
//			PreparedStatement st = con.prepareStatement(sql);
//			ResultSet rs = st.executeQuery();
//			while(rs.next()){
//				RepInstance obj = new RepInstance();
//				obj.setId(rs.getInt("id"));
//				obj.setId_template(rs.getInt("id_template"));
//				obj.setContra_prova(rs.getString("contra_prova"));
//				obj.setDt_created(rs.getDate("dt_created"));
//				obj.setUser_created(rs.getInt("user_created"));
//				obj.setXml_content_fk(rs.getInt("xml_content_fk"));
//				obj.setXsl_content_fk(rs.getInt("xsl_content_fk"));
//				obj.setReference(rs.getString("reference"));
//				obj.setRef_fk(rs.getInt("ref_fk"));
//				obj.setEnv_fk(rs.getInt("env_fk"));			
//				lista.add(obj);
//		}
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
