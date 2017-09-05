package nosi.webapps.kofax.dao;

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

/**
 * Isaias.Nunes
 * Aug 14, 2017
 */
@Entity
@Table(name = "tbl_campos")
public class Campos extends BaseActiveRecord<Campos> implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;	
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="id_objeto_fk", foreignKey = @ForeignKey(name = "Campos_obj_fk"), nullable=false)
	private Objeto id_objeto;
	
	@Column(nullable=false)
	private String campo;
	private String estado;
	
	public Campos() {}

	public Campos(Objeto id_objeto, String campo, String estado) {
		super();
		this.id_objeto = id_objeto;
		this.campo = campo;
		this.estado = estado;
	} 
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Objeto getId_objeto() {
		return id_objeto;
	}

	public void setId_objeto(Objeto id_objeto) {
		this.id_objeto = id_objeto;
	}

	public String getCampo() {
		return campo;
	}

	public void setCampo(String campo) {
		this.campo = campo;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Campos [id=" + id + ", id_objeto=" + id_objeto + ", campo=" + campo + ", estado=" + estado + "]";
	}
	
	@Override
	public String getConnectionName() {
		return "hibernate-kofax";
	}
}
