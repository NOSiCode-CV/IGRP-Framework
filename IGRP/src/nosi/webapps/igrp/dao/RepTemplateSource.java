package nosi.webapps.igrp.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
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

/**
 * @author: Emanuel Pereira
 * 6 Jul 2017
 */
@Entity
@Table(name="tbl_rep_template_source")
public class RepTemplateSource extends BaseActiveRecord<RepTemplateSource> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="rep_template_fk",foreignKey=@ForeignKey(name="REP_TEMPLATE_SOURCE_REP_TEMPLATE_FK"),nullable=false)
	private RepTemplate repTemplate;
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="rep_source_fk",foreignKey=@ForeignKey(name="REP_TEMPLATE_SOURCE_REP_SOURCE_FK"),nullable=false)
	private RepSource repSource;
	
	public RepTemplateSource(){		
	}
	public RepTemplateSource(RepTemplate repTemplate, RepSource repSource) {
		super();
		this.repTemplate = repTemplate;
		this.repSource = repSource;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public RepTemplate getRepTemplate() {
		return repTemplate;
	}
	public void setRepTemplate(RepTemplate repTemplate) {
		this.repTemplate = repTemplate;
	}
	public RepSource getRepSource() {
		return repSource;
	}
	public void setRepSource(RepSource repSource) {
		this.repSource = repSource;
	}
	
	public List<RepTemplateSource> getAllDataSources(int id) {
		List<RepTemplateSource> list = this.find().andWhere("repTemplate", "=", id).all();
		return list;
	}
	public void deleteAll(Integer id) {
		EntityManager em = this.getEntityManagerFactory().createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Query q = em.createNativeQuery("DELETE FROM tbl_rep_template_source WHERE rep_template_fk=?");
		q.setParameter(1, id);
		q.executeUpdate();
		t.commit();
		em.close();
	}
}
