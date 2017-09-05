package nosi.webapps.marcacao_consulta.dao;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import nosi.base.ActiveRecord.BaseActiveRecord;

/**
 * Yma
 * 16 Aug 2017
 */
@Entity
@Table(name="tbl_especialidade")
public class Especialidade extends BaseActiveRecord<Especialidade> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String codigo;
	@Column(nullable=false)
	private String descricao;
	@ManyToMany
	@JoinTable(name="tbl_medico_especialidades",
    joinColumns={@JoinColumn(name="id_especialidade", referencedColumnName="id")},
    inverseJoinColumns={@JoinColumn(name="id_medico", referencedColumnName="id")})
	private List<Medico> medicos;
	 
	public Especialidade() {
		// TODO Auto-generated constructor stub
	}

	public Especialidade(Integer id, String codigo, String descricao) {
		super();
		this.id = id;
		this.codigo = codigo;
		this.descricao = descricao;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public List<Medico> getMedicos() {
		return medicos;
	}

	public void setMedicos(List<Medico> medicos) {
		this.medicos = medicos;
	}
	
	
	@Override
	public String getConnectionName() {
		return "hibernate-marcacao-consulta";
	}
}
