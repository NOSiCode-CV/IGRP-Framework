package nosi.core.webapp.webservices.biztalk.dao;

import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import com.google.gson.annotations.Expose;

import nosi.core.webapp.Core;

/**
 * @author: Emanuel Pereira
 * 16 Nov 2017
 */

@XmlRootElement(name="lista")
public class PesquisaHierarquicaCAE implements ServiceSerach,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6401185248766868577L;
	@Expose(serialize = true, deserialize = false)
	private String id;
	@Expose(serialize = true, deserialize = false)
	private String codigo;
	@Expose(serialize = true, deserialize = false)
	private String crpcae_id;
	@Expose(serialize = true, deserialize = false)
	private String self_id;
	@XmlElement(name="row")
	@Expose(serialize = false, deserialize = true)
	private List<PesquisaHierarquicaCAE.RowList> rowList;
	
	public PesquisaHierarquicaCAE(){}
	
	public PesquisaHierarquicaCAE(String id, String codigo, String crpcae_id, String self_id) {
		super();
		this.id = id;
		this.codigo = codigo;
		this.crpcae_id = crpcae_id;
		this.self_id = self_id;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getCrpcae_id() {
		return crpcae_id;
	}
	public void setCrpcae_id(String crpcae_id) {
		this.crpcae_id = crpcae_id;
	}
	public String getSelf_id() {
		return self_id;
	}
	public void setSelf_id(String self_id) {
		this.self_id = self_id;
	}
	
	@Override
	public List<PesquisaHierarquicaCAE.RowList> getRowList() {
		return rowList;
	}

	@Override
	public String toString() {
		return "PesquisaHierarquiaCAE [id=" + id + ", codigo=" + codigo + ", crpcae_id=" + crpcae_id + ", self_id="
				+ self_id + ", rowList=" + rowList + "]";
	}


	public static class RowList implements Serializable{

		/**
		 * 
		 */
		private static final long serialVersionUID = 2446623641418792330L;

		private String id;
	    private String codigo;
	    private String descricao;
	    private String crpcae_id;
	    private Integer nivel;
	    private String flag_situacao;
	    private String self_id;
	    private Integer nivel_detalhe;
	    private String nome;
		public String getId() {
			return id;
		}
		public void setId(String id) {
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
		public String getCrpcae_id() {
			return crpcae_id;
		}
		public void setCrpcae_id(String crpcae_id) {
			this.crpcae_id = crpcae_id;
		}
		public Integer getNivel() {
			return nivel;
		}
		public void setNivel(Integer nivel) {
			this.nivel = nivel;
		}
		public String getFlag_situacao() {
			return flag_situacao;
		}
		public void setFlag_situacao(String flag_situacao) {
			this.flag_situacao = flag_situacao;
		}
		public String getSelf_id() {
			return self_id;
		}
		public void setSelf_id(String self_id) {
			this.self_id = self_id;
		}
		public Integer getNivel_detalhe() {
			return nivel_detalhe;
		}
		public void setNivel_detalhe(Integer nivel_detalhe) {
			this.nivel_detalhe = nivel_detalhe;
		}
		public String getNome() {
			return nome;
		}
		public void setNome(String nome) {
			this.nome = nome;
		}
		@Override
		public String toString() {
			return "RowList [id=" + id + ", codigo=" + codigo + ", descricao=" + descricao + ", crpcae_id=" + crpcae_id
					+ ", nivel=" + nivel + ", flag_situacao=" + flag_situacao + ", self_id=" + self_id
					+ ", nivel_detalhe=" + nivel_detalhe + ", nome=" + nome + "]";
		}	    
	    
	}
	
	@Override
	public String getClientID() {
		return Core.getConfig("CLIENT_ID_BIZTALK");
	}

	@Override
	public String getTransactionID() {
		return Core.getConfig("TRANSACTION_ID_BIZTALK_PESQUISA_HIERARQUICA_CAE");
	}

	@Override
	public String getServiceID() {
		return Core.getConfig("SERVICE_ID_BIZTALK_PESQUISA_HIERARQUICA_CAE");
	}
}
