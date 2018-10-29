package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import nosi.core.webapp.Core;
import java.io.Serializable;

@Entity
@Table(name="tbl_transaction")
public class Transaction extends IGRPBaseActiveRecord<Transaction> implements Serializable {
	
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
	@ManyToOne
	@JoinColumn(name="env_fk",foreignKey=@ForeignKey(name="TRANSACTION_SOURCE_ENV_FK"),nullable=false)
	private Application application;
	@Transient
	private boolean isInserted;
	
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
	
	public boolean isInserted() {
		return isInserted;
	}

	public void setInserted(boolean isInserted) {
		this.isInserted = isInserted;
	}

	public boolean getPermission(String transaction) {
		String sqlByProfile = "SELECT T.* FROM tbl_transaction T,tbl_profile P"
				+ "	WHERE (T.id = P.type_fk"
				+ " AND T.code=:code"
				+ " AND T.status=1"
				+ "	AND P.type=:type"
				+ " AND P.prof_type_fk=:prof_type_fk"
				+ " AND P.org_fk=:org_fk) "
				+ " OR (T.id = P.type_fk "
				+ "	AND P.type=:type_user"
				+ " AND P.user_fk=:user_fk"
				+ " AND T.code=:code"
				+ " AND T.status=1"
				+ " AND P.prof_type_fk=:prof_type_fk"
				+ " AND P.org_fk=:org_fk"
				+ " )";
		int x = Core.query(this.getConnectionName(), sqlByProfile)
					.addString("type", "TRANS")
					.addInt("prof_type_fk", Core.getCurrentProfile())
					.addInt("org_fk", Core.getCurrentOrganization())
					.addString("code", transaction)
					.addString("type_user", "TRANS_USER")
					.addInt("user_fk", Core.getCurrentUser().getId())
					.addString("code", transaction)
					.addInt("prof_type_fk", Core.getCurrentProfile())
					.addInt("org_fk", Core.getCurrentOrganization())
					.getResultList().size();
		return x > 0;
	}	
}