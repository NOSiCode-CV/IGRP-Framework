package nosi.webapps.igrp.dao;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.webapp.Core;

/**
 * @author: Emanuel Pereira
 * 6 Jul 2017
 */
@Entity
@Table(name="tbl_rep_template_source")
public class RepTemplateSource extends IGRPBaseActiveRecord<RepTemplateSource> implements Serializable{

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
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="repTemplateSource",fetch=FetchType.EAGER)
	private List<RepTemplateSourceParam> parameters;
	
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
	
	public List<RepTemplateSourceParam> getParameters() {
		return parameters;
	}
	public void setParameters(List<RepTemplateSourceParam> parameters) {
		this.parameters = parameters;
	}
	
	public List<RepTemplateSource> getAllDataSources(int id) {
		List<RepTemplateSource> list = this.find().andWhere("repTemplate", "=", id).all();
		return list;
	}
	public void deleteAll(Integer id) {
		Core.delete(this.getConnectionName(), "tbl_rep_template_source_param")
			.where("rep_template_source_fk IN (SELECT id FROM tbl_rep_template_source WHERE rep_template_fk=:rep_template_fk)")
			.addInt("rep_template_fk", id)
			.execute();
		Core.delete(this.getConnectionName(), "tbl_rep_template_source")
			.where("rep_template_fk=:rep_template_fk")
			.addInt("rep_template_fk", id)
			.execute();
	}
}
