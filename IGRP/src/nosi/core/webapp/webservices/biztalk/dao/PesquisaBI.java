package nosi.core.webapp.webservices.biztalk.dao;

import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import com.google.gson.annotations.Expose;

/**
 * @author: Emanuel Pereira
 * 15 Nov 2017
 */

@XmlRootElement(name="lista")
public class PesquisaBI implements ServiceSerach,Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7367971611215772234L;

	@Expose(serialize = true, deserialize = false)
 	private Integer bi;
	@Expose(serialize = true, deserialize = false)
  	private String nome;	
	@XmlElement(name="row")
	@Expose(serialize = false, deserialize = true)
	private List<PesquisaBI.RowList> rowList;
	
	public PesquisaBI(){}
	
	public PesquisaBI(Integer bi, String nome) {
		super();
		this.bi = bi;
		this.nome = nome;
	}
	
	public Integer getBi() {
		return bi;
	}		
	public void setBi(Integer bi) {
		this.bi = bi;
	}
	
	public String getNome() {
		return nome;
	}		
	public void setNome(String nome) {
		this.nome = nome;
	}


	public List<PesquisaBI.RowList> getRowList() {
		return rowList;
	}

	public void setRowList(List<PesquisaBI.RowList> rowList) {
		this.rowList = rowList;
	}

	@Override
	public String toString() {
		return "PesquisaBI [bi=" + bi + ", nome=" + nome + ", rowList=" + rowList + "]";
	}


	public static class RowList implements Serializable{
		/**
		 * 
		 */
		private static final long serialVersionUID = -7606966910567401269L;
		private Integer numero;
        private String identificacao;
        private String data_nascimento;
        private Integer id_list;
        private String nome_mae;
        private String nome_pai;
        private String sexo;
        private String local_nascimento;
        private Integer local_id;
        private String morada;
        private Integer morada_id;
        private String data_registo;
        private String estado_civil;
        
		public Integer getNumero() {
			return numero;
		}
		public void setNumero(Integer numero) {
			this.numero = numero;
		}
		public String getIdentificacao() {
			return identificacao;
		}
		public void setIdentificacao(String identificacao) {
			this.identificacao = identificacao;
		}
		public String getData_nascimento() {
			return data_nascimento;
		}
		public void setData_nascimento(String data_nascimento) {
			this.data_nascimento = data_nascimento;
		}
		public Integer getId_list() {
			return id_list;
		}
		public void setId_list(Integer id_list) {
			this.id_list = id_list;
		}
		public String getNome_mae() {
			return nome_mae;
		}
		public void setNome_mae(String nome_mae) {
			this.nome_mae = nome_mae;
		}
		public String getNome_pai() {
			return nome_pai;
		}
		public void setNome_pai(String nome_pai) {
			this.nome_pai = nome_pai;
		}
		public String getSexo() {
			return sexo;
		}
		public void setSexo(String sexo) {
			this.sexo = sexo;
		}
		public String getLocal_nascimento() {
			return local_nascimento;
		}
		public void setLocal_nascimento(String local_nascimento) {
			this.local_nascimento = local_nascimento;
		}
		public Integer getLocal_id() {
			return local_id;
		}
		public void setLocal_id(Integer local_id) {
			this.local_id = local_id;
		}
		public String getMorada() {
			return morada;
		}
		public void setMorada(String morada) {
			this.morada = morada;
		}
		public Integer getMorada_id() {
			return morada_id;
		}
		public void setMorada_id(Integer morada_id) {
			this.morada_id = morada_id;
		}
		public String getData_registo() {
			return data_registo;
		}
		public void setData_registo(String data_registo) {
			this.data_registo = data_registo;
		}
		public String getEstado_civil() {
			return estado_civil;
		}
		public void setEstado_civil(String estado_civil) {
			this.estado_civil = estado_civil;
		}
		@Override
		public String toString() {
			return "RowList [numero=" + numero + ", identificacao=" + identificacao + ", data_nascimento="
					+ data_nascimento + ", id_list=" + id_list + ", nome_mae=" + nome_mae + ", nome_pai=" + nome_pai
					+ ", sexo=" + sexo + ", local_nascimento=" + local_nascimento + ", local_id=" + local_id
					+ ", morada=" + morada + ", morada_id=" + morada_id + ", data_registo=" + data_registo
					+ ", estado_civil=" + estado_civil + "]";
		}		
		
	}
}
