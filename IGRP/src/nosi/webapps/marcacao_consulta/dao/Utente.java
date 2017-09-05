package nosi.webapps.marcacao_consulta.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.webapp.helpers.DateHelper;

@Entity
@Table(name="tbl_utente")
public class Utente extends BaseActiveRecord<Utente> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false)
	private String nome;
	@Column(nullable=false)
	private String morada;
	@Column(nullable=false)
	private int sexo;
	@Column(nullable=false)
	@Temporal(TemporalType.DATE)
	private Date data_nascimento;
	
	public Utente(){
	}
	
	public Utente(String nome, String morada, int sexo, String data_nascimento) {
		super();
		this.nome = nome;
		this.morada = morada;
		this.sexo = sexo;
		this.data_nascimento = DateHelper.formatDate(data_nascimento, "dd-MM-yyyy", "yyyy-MM-dd");
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getNome() {
		return nome;
	}



	public void setNome(String nome) {
		this.nome = nome;
	}



	public String getMorada() {
		return morada;
	}



	public void setMorada(String morada) {
		this.morada = morada;
	}



	public int getSexo() {
		return sexo;
	}



	public void setSexo(int sexo) {
		this.sexo = sexo;
	}



	public Date getData_nascimento() {
		return data_nascimento;
	}



	public void setData_nascimento(String data_nascimento) {
		this.data_nascimento = DateHelper.formatDate(data_nascimento, "dd-MM-yyyy", "yyyy-MM-dd");
	}



	public HashMap<Integer,String> getListUtente(){
		HashMap<Integer,String> lista = new HashMap<>();
		lista.put(null, "--- Selecionar Utente ---");
		for(Object obj:this.findAll()){
			Utente u = (Utente) obj;
			lista.put(u.getId(), u.getNome());
		}
		return lista;
	}
	
	@Override
	public String getConnectionName() {
		return "hibernate-marcacao-consulta";
	}
}
