package nosi.webapps.igrp.dao;
import javax.persistence.CascadeType;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
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
import nosi.core.webapp.helpers.Permission;
import java.io.Serializable;

@Entity
@Table(name="tbl_transaction")
public class Transaction extends BaseActiveRecord<Transaction> implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2765636370127502462L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false)
	private String code;
	@Column(nullable=false)
	private String descr;
	private int status;
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="env_fk",foreignKey=@ForeignKey(name="TRANSACTION_SOURCE_ENV_FK"),nullable=false)
	private Application application;

	public Transaction(){}
	
	public Transaction(String code, String descr, int status, Application application) {
		super();
		this.code = code;
		this.descr = descr;
		this.status = status;
		this.application = application;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public boolean getPermission(String transaction) {
		EntityManager em = this.getEntityManagerFactory().createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		String sql = "SELECT T.* FROM tbl_transaction T,tbl_profile P "
				+ "	WHERE T.id = P.type_fk "
				+ "	AND P.type=?"
				+ " AND P.prof_type_fk = ? "
				+ " AND P.org_fk = ?"
				+ " AND T.code = ? "
				+ " AND T.status=1 "
				+ "	ORDER BY T.id";
		Query q =  em.createNativeQuery(sql);
		q.setParameter(1,"TRANS");
		q.setParameter(2,new Permission().getCurrentPerfilId());
		q.setParameter(3,new Permission().getCurrentOrganization());	
		q.setParameter(4,transaction);	
		int x = q.getResultList().size();
		t.commit();
		em.close();
		return x > 0;
	}	
}