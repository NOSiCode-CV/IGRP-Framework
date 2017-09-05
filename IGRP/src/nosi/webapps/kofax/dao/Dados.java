package nosi.webapps.kofax.dao;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.webapp.helpers.DateHelper;

/**
 * @author: Emanuel Pereira
 * 14 Aug 2017
 */
@Entity
@Table(name="tbl_dados")
public class Dados extends BaseActiveRecord<Dados> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "id_objeto",foreignKey = @ForeignKey(name="OBJETO_DADOS_ID_OBJETO"),nullable=false)
	private Objeto objeto;
	private String referencia;
	@Column(nullable=false)
	private Integer nr_processo;
	private String nome;
	private String tipo_documento;
	@Column(nullable=false)
	private Integer nr_documento;
	private String estante;
	private String pasta;
	private String livro;
	private String folha;
	@Column(nullable=false)
	@Temporal(TemporalType.DATE)
	private Date dt_registo;
	@Column(nullable=false)
	@Lob
	private String xml;
	@Column(nullable=false)
	@Lob
	private byte[] imagem;
	
	public Dados(){}

	
	
	public Dados(Objeto objeto, String referencia, Integer nr_processo, String nome, String tipo_documento,
			Integer nr_documento, String estante, String pasta, String livro, String folha,
			String dt_registo, String xml, byte[] imagem) {
		super();
		this.objeto = objeto;
		this.referencia = referencia;
		this.nr_processo = nr_processo;
		this.nome = nome;
		this.tipo_documento = tipo_documento;
		this.nr_documento = nr_documento;
		this.estante = estante;
		this.pasta = pasta;
		this.livro = livro;
		this.folha = folha;
		this.dt_registo = DateHelper.formatDate(dt_registo,"dd-MM-yyyy","yyyy-MM-dd");
		this.xml = xml.trim();
		this.imagem = imagem;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Objeto getObjeto() {
		return objeto;
	}

	public void setObjeto(Objeto objeto) {
		this.objeto = objeto;
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = referencia;
	}

	public Integer getNr_processo() {
		return nr_processo;
	}

	public void setNr_processo(Integer nr_processo) {
		this.nr_processo = nr_processo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTipo_documento() {
		return tipo_documento;
	}

	public void setTipo_documento(String tipo_documento) {
		this.tipo_documento = tipo_documento;
	}

	public Integer getNr_documento() {
		return nr_documento;
	}

	public void setNr_documento(Integer nr_documento) {
		this.nr_documento = nr_documento;
	}

	public String getEstante() {
		return estante;
	}

	public void setEstante(String estante) {
		this.estante = estante;
	}

	public String getPasta() {
		return pasta;
	}

	public void setPasta(String pasta) {
		this.pasta = pasta;
	}

	public String getLivro() {
		return livro;
	}

	public void setLivro(String livro) {
		this.livro = livro;
	}

	public String getFolha() {
		return folha;
	}

	public void setFolha(String folha) {
		this.folha = folha;
	}

	public Date getDt_registo() {
		return dt_registo;
	}

	public void setDt_registo(String dt_registo) {
		this.dt_registo = DateHelper.formatDate(dt_registo,"dd-MM-yyyy","yyyy-MM-dd");
	}

	public String getXml() {
		return xml;
	}

	public void setXml(String xml) {
		this.xml = xml;
	}

	public byte[] getImagem() {
		return imagem;
	}

	public void setImagem(byte[] imagem) {
		this.imagem = imagem;
	}



	@Override
	public String toString() {
		return "Dados [id=" + id + ", objeto=" + objeto + ", referencia=" + referencia + ", nr_processo=" + nr_processo
				+ ", nome=" + nome + ", tipo_documento=" + tipo_documento + ", nr_documento=" + nr_documento
				+ ", estante=" + estante + ", pasta=" + pasta + ", livro=" + livro + ", folha=" + folha
				+ ", dt_registo=" + dt_registo + ", xml=" + xml + ", imagem=" + imagem + "]";
	}	
	

	@Override
	public String getConnectionName() {
		return "hibernate-kofax";
	}
}
