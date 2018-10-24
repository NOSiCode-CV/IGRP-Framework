package nosi.webapps.igrp.dao;

import java.io.Serializable;
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

/**
 * Emanuel
 * 27 Aug 2018
 */

@Entity
@Table(name="tbl_rep_template_source_param")
public class RepTemplateSourceParam extends IGRPBaseActiveRecord<RepTemplateParam> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1248045149728325374L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="rep_template_source_fk",foreignKey=@ForeignKey(name="REP_TEMPLATE_SOURCE_PARAM_FK"),nullable=false)
	private RepTemplateSource repTemplateSource;
	@Column(nullable=false,length=70)
	private String parameter;
	@Column(nullable=false,length=50)
	private String parameter_type;
	
	public RepTemplateSourceParam() {
		
	}
	
	public RepTemplateSourceParam(RepTemplateSource repTemplateSource, String parameter,String parameter_type) {
		super();
		this.repTemplateSource = repTemplateSource;
		this.parameter = parameter;
		this.parameter_type = parameter_type;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public RepTemplateSource getRepTemplateSource() {
		return repTemplateSource;
	}
	public void setRepTemplateSource(RepTemplateSource repTemplateSource) {
		this.repTemplateSource = repTemplateSource;
	}
	public String getParameter() {
		return parameter;
	}
	public void setParameter(String parameter) {
		this.parameter = parameter;
	}

	public String getParameter_type() {
		return parameter_type;
	}

	public void setParameter_type(String parameter_type) {
		this.parameter_type = parameter_type;
	}

	@Override
	public String toString() {
		return "RepTemplateSourceParam [id=" + id + ", repTemplateSource=" + repTemplateSource + ", parameter="
				+ parameter + "]";
	}
	
}
