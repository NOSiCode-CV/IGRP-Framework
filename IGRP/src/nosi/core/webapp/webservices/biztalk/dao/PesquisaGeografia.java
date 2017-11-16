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
public class PesquisaGeografia implements ServiceSerach,Serializable{

	 /**
	 * 
	 */
	private static final long serialVersionUID = 8146541972727528140L;
	@Expose(serialize = false, deserialize = true)
	private String id;
	@Expose(serialize = false, deserialize = true)
	private String zona;
	@Expose(serialize = false, deserialize = true)
	private String freguesia;
	@Expose(serialize = false, deserialize = true)
	private String concelho;
	@Expose(serialize = false, deserialize = true)
	private String ilha;
	@Expose(serialize = false, deserialize = true)
	private String pais;
	@Expose(serialize = false, deserialize = true)
	private String nivel_detalhe;
	@Expose(serialize = false, deserialize = true)
	private String tp_geog_cd;
	@Expose(serialize = false, deserialize = true)
	private String codigo_ine;
	@Expose(serialize = false, deserialize = true)
	private String codigo;
	@Expose(serialize = false, deserialize = true)
	private String self_id;
	@XmlElement(name="row")
	@Expose(serialize = false, deserialize = true)
	private List<PesquisaGeografia.RowList> rowList;

	public PesquisaGeografia(){}
	
	public PesquisaGeografia(String id, String zona, String freguesia, String concelho, String ilha, String pais,
			String nivel_detalhe, String tp_geog_cd, String codigo_ine, String codigo, String self_id) {
		super();
		this.id = id;
		this.zona = zona;
		this.freguesia = freguesia;
		this.concelho = concelho;
		this.ilha = ilha;
		this.pais = pais;
		this.nivel_detalhe = nivel_detalhe;
		this.tp_geog_cd = tp_geog_cd;
		this.codigo_ine = codigo_ine;
		this.codigo = codigo;
		this.self_id = self_id;
	}
	
		
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getZona() {
		return zona;
	}
	public void setZona(String zona) {
		this.zona = zona;
	}
	public String getFreguesia() {
		return freguesia;
	}
	public void setFreguesia(String freguesia) {
		this.freguesia = freguesia;
	}
	public String getConcelho() {
		return concelho;
	}
	public void setConcelho(String concelho) {
		this.concelho = concelho;
	}
	public String getIlha() {
		return ilha;
	}
	public void setIlha(String ilha) {
		this.ilha = ilha;
	}
	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}
	public String getNivel_detalhe() {
		return nivel_detalhe;
	}
	public void setNivel_detalhe(String nivel_detalhe) {
		this.nivel_detalhe = nivel_detalhe;
	}
	public String getTp_geog_cd() {
		return tp_geog_cd;
	}
	public void setTp_geog_cd(String tp_geog_cd) {
		this.tp_geog_cd = tp_geog_cd;
	}
	public String getCodigo_ine() {
		return codigo_ine;
	}
	public void setCodigo_ine(String codigo_ine) {
		this.codigo_ine = codigo_ine;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getSelf_id() {
		return self_id;
	}
	public void setSelf_id(String self_id) {
		this.self_id = self_id;
	}


	@Override
	public String toString() {
		return "PesquisaGeografia [id=" + id + ", zona=" + zona + ", freguesia=" + freguesia + ", concelho=" + concelho
				+ ", ilha=" + ilha + ", pais=" + pais + ", nivel_detalhe=" + nivel_detalhe + ", tp_geog_cd="
				+ tp_geog_cd + ", codigo_ine=" + codigo_ine + ", codigo=" + codigo + ", self_id=" + self_id
				+ ", rowList=" + rowList + "]";
	}


	public static class RowList implements Serializable{

		/**
		 * 
		 */
		private static final long serialVersionUID = -2418647871832269737L;
		
		private Integer id;
        private String nome;
        private Integer zona;
        private Integer freguesia;
        private Integer concelho;
        private Integer ilha;
        private Integer pais;
        private Integer geogr_id;
        private Integer nivel_detalhe;
        private String nacionalidade;
        private String nome_oficial;
        private String flag_alter;
        private String nome_norm;
        private String tp_geog_cd;
        private String flg_situacao;
        private Integer codigo_ine;
        private Integer codigo;
        private Integer self_id;
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
		public Integer getZona() {
			return zona;
		}
		public void setZona(Integer zona) {
			this.zona = zona;
		}
		public Integer getFreguesia() {
			return freguesia;
		}
		public void setFreguesia(Integer freguesia) {
			this.freguesia = freguesia;
		}
		public Integer getConcelho() {
			return concelho;
		}
		public void setConcelho(Integer concelho) {
			this.concelho = concelho;
		}
		public Integer getIlha() {
			return ilha;
		}
		public void setIlha(Integer ilha) {
			this.ilha = ilha;
		}
		public Integer getPais() {
			return pais;
		}
		public void setPais(Integer pais) {
			this.pais = pais;
		}
		public Integer getGeogr_id() {
			return geogr_id;
		}
		public void setGeogr_id(Integer geogr_id) {
			this.geogr_id = geogr_id;
		}
		public Integer getNivel_detalhe() {
			return nivel_detalhe;
		}
		public void setNivel_detalhe(Integer nivel_detalhe) {
			this.nivel_detalhe = nivel_detalhe;
		}
		public String getNacionalidade() {
			return nacionalidade;
		}
		public void setNacionalidade(String nacionalidade) {
			this.nacionalidade = nacionalidade;
		}
		public String getNome_oficial() {
			return nome_oficial;
		}
		public void setNome_oficial(String nome_oficial) {
			this.nome_oficial = nome_oficial;
		}
		public String getFlag_alter() {
			return flag_alter;
		}
		public void setFlag_alter(String flag_alter) {
			this.flag_alter = flag_alter;
		}
		public String getNome_norm() {
			return nome_norm;
		}
		public void setNome_norm(String nome_norm) {
			this.nome_norm = nome_norm;
		}
		public String getTp_geog_cd() {
			return tp_geog_cd;
		}
		public void setTp_geog_cd(String tp_geog_cd) {
			this.tp_geog_cd = tp_geog_cd;
		}
		public String getFlg_situacao() {
			return flg_situacao;
		}
		public void setFlg_situacao(String flg_situacao) {
			this.flg_situacao = flg_situacao;
		}
		public Integer getCodigo_ine() {
			return codigo_ine;
		}
		public void setCodigo_ine(Integer codigo_ine) {
			this.codigo_ine = codigo_ine;
		}
		public Integer getCodigo() {
			return codigo;
		}
		public void setCodigo(Integer codigo) {
			this.codigo = codigo;
		}
		public Integer getSelf_id() {
			return self_id;
		}
		public void setSelf_id(Integer self_id) {
			this.self_id = self_id;
		}
		@Override
		public String toString() {
			return "RowList [id=" + id + ", nome=" + nome + ", zona=" + zona + ", freguesia=" + freguesia
					+ ", concelho=" + concelho + ", ilha=" + ilha + ", pais=" + pais + ", geogr_id=" + geogr_id
					+ ", nivel_detalhe=" + nivel_detalhe + ", nacionalidade=" + nacionalidade + ", nome_oficial="
					+ nome_oficial + ", flag_alter=" + flag_alter + ", nome_norm=" + nome_norm + ", tp_geog_cd="
					+ tp_geog_cd + ", flg_situacao=" + flg_situacao + ", codigo_ine=" + codigo_ine + ", codigo="
					+ codigo + ", self_id=" + self_id + "]";
		}        
        
	}


	@Override
	public String getClientID() {
		return Core.getConfig("CLIENT_ID_BIZTALK");
	}

	@Override
	public String getTransactionID() {
		return Core.getConfig("TRANSACTION_ID_BIZTALK_PESQUISA_GEOGRAFIA");
	}

	@Override
	public String getServiceID() {
		return Core.getConfig("SERVICE_ID_BIZTALK_PESQUISA_GEOGRAFIA");
	}

	@Override
	public List<PesquisaGeografia.RowList> getRowList() {
		return this.rowList;
	}
}
