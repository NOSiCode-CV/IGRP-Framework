package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import nosi.base.ActiveRecord.BaseActiveRecord;

@Entity
@Table(name="tbl_clob")
public class CLob extends BaseActiveRecord<CLob> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8421542320870086918L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String mime_type;
	@Column(nullable=false)
	@Lob
	private String c_lob_content;
	@Column(nullable=false)
	@Temporal(TemporalType.DATE)
	private Date dt_created;
	
	public CLob(){}
	
	public CLob(Integer id, String name, String mime_type, String c_lob_content, Date dt_created) {
		super();
		this.id = id;
		this.name = name;
		this.mime_type = mime_type;
		this.c_lob_content = c_lob_content;
		this.dt_created = dt_created;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMime_type() {
		return mime_type;
	}
	public void setMime_type(String mime_type) {
		this.mime_type = mime_type;
	}
	public String getC_lob_content() {
		return c_lob_content;
	}
	public void setC_lob_content(String c_lob_content) {
		this.c_lob_content = c_lob_content;
	}
	public Date getDt_created() {
		return dt_created;
	}
	public void setDt_created(Date dt_created) {
		this.dt_created = dt_created;
	}
}