package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
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
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.webapp.Core;

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
	
	public RepTemplateParam(RepTemplate reptemplate, String parameter) {
		super();
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
		if(Core.isNotNull(id)) {
			Core.delete(this.getConnectionName(),"tbl_rep_template_param").where("rep_template_fk=:rep_template_fk")
				.addInt("rep_template_fk", id)
				.execute();
		}
	}	
}
