package nosi.webapps.igrp_studio.dao;

import javax.persistence.Id;
import nosi.base.ActiveRecord.BaseActiveRecord;
import javax.persistence.GeneratedValue;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.GenerationType;
import javax.persistence.Entity;
import javax.validation.constraints.Size;
import javax.persistence.NamedQuery;
import javax.validation.constraints.NotBlank;

/**
 * @author: IGRP SysAdmin 20-07-2021
*/

@Entity
@Table(name = "tbl_image_login", schema = "public")
@NamedQuery(name = "TblImageLogin.findAll", query = "SELECT t FROM TblImageLogin t")
public class TblImageLogin extends BaseActiveRecord<TblImageLogin> {

	private static final long serialVersionUID = 1L;

	// Change Integer type to BigDecimal if the number is very large!

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, updatable = false)
 	private Integer id;
	@NotBlank
	@Size(min = 1, max = 50)
	@Column(name = "imagem_id")
	private String imagemId;
	@Column(name = "ordem")
	private Integer ordem;

	public Integer getId() { 
		return this.id;
	}

	public void setId(Integer id) {
		 this.id = id;
	}

	public String getImagemId() { 
		return this.imagemId;
	}

	public void setImagemId(String imagemId) {
		 this.imagemId = imagemId;
	}

	public Integer getOrdem() { 
		return this.ordem;
	}

	public void setOrdem(Integer ordem) {
		 this.ordem = ordem;
	}

}