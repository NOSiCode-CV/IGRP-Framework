package nosi.webapps.kofax.dao;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import nosi.base.ActiveRecord.BaseActiveRecord;

/**
 * @author: Emanuel Pereira
 * 14 Aug 2017
 */
@Entity
@Table(name="tbl_objeto")
public class Objeto extends BaseActiveRecord<Objeto> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "id_organica",nullable=false)
	private Integer id_organica;
	@Column(nullable=false)
	private String objeto;
	@Column(nullable=false)
	private String link_pagina;
	@Column(nullable=false)
	private Integer default_page;
	@Column(nullable=false)
	private String formato_output;
	@Column(nullable=false)
	private String guardar_em;
	@Column(nullable=false)
	private String estado;
	@Column(nullable = false)
	private int automatico;
	@OneToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL,mappedBy="id_objeto")
	private Collection<Campos> campos;
	
	
	public Objeto(){}

	

	public Objeto(Integer id_organica, String objeto, String link_pagina, Integer default_page, String formato_output,
			String guardar_em, String estado, int automatico, Collection<Campos> campos) {
		super();
		this.id_organica = id_organica;
		this.objeto = objeto;
		this.link_pagina = link_pagina;
		this.default_page = default_page;
		this.formato_output = formato_output;
		this.guardar_em = guardar_em;
		this.estado = estado;
		this.automatico = automatico;
		this.campos = campos;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId_organica() {
		return id_organica;
	}

	public void setId_organica(Integer organica) {
		this.id_organica = organica;
	}

	public String getObjeto() {
		return objeto;
	}

	public void setObjeto(String objeto) {
		this.objeto = objeto;
	}

	public String getLink_pagina() {
		return link_pagina;
	}

	public void setLink_pagina(String link_pagina) {
		this.link_pagina = link_pagina;
	}

	public Integer getDefault_page() {
		return default_page;
	}

	public void setDefault_page(Integer default_page) {
		this.default_page = default_page;
	}

	public String getFormato_output() {
		return formato_output;
	}

	public void setFormato_output(String formato_output) {
		this.formato_output = formato_output;
	}

	public String getGuardar_em() {
		return guardar_em;
	}

	public void setGuardar_em(String guardar_em) {
		this.guardar_em = guardar_em;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public int getAutomatico() {
		return automatico;
	}

	public void setAutomatico(int automatico) {
		this.automatico = automatico;
	}

	public Collection<Campos> getCampos() {
		return campos;
	}

	public void setCampos(Collection<Campos> campos) {
		this.campos = campos;
	}

	@Override
	public String toString() {
		return "Objeto [id=" + id + ", organica=" + id_organica + ", objeto=" + objeto + ", link_pagina=" + link_pagina
				+ ", default_page=" + default_page + ", formato_output=" + formato_output + ", guardar_em=" + guardar_em
				+ ", estado=" + estado + ", automatico=" + automatico + "]";
	}
	

	@Override
	public String getConnectionName() {
		return "hibernate-kofax";
	}
}
