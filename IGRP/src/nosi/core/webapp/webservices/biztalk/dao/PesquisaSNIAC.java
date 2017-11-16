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
public class PesquisaSNIAC  implements ServiceSerach,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5587418393454453748L;
	@Expose(serialize = true, deserialize = false)
	private Integer num_idnt_civil_pes;
	@Expose(serialize = true, deserialize = false)
	private String num_registo_pes;
	@Expose(serialize = true, deserialize = false)
	private String nome_pes;
	@Expose(serialize = true, deserialize = false)
	private String data_nasc_pes;
	@Expose(serialize = true, deserialize = false)
	private Integer id_tp_doc_pes;	
	@XmlElement(name="row")
	@Expose(serialize = false, deserialize = true)
	private List<PesquisaSNIAC.RowList> rowList;
	
	public PesquisaSNIAC(){}
	
	public PesquisaSNIAC(Integer num_idnt_civil_pes, String num_registo_pes, String nome_pes, String data_nasc_pes,
			Integer id_tp_doc_pes) {
		super();
		this.num_idnt_civil_pes = num_idnt_civil_pes;
		this.num_registo_pes = num_registo_pes;
		this.nome_pes = nome_pes;
		this.data_nasc_pes = data_nasc_pes;
		this.id_tp_doc_pes = id_tp_doc_pes;
	}

	public Integer getNum_idnt_civil_pes() {
		return num_idnt_civil_pes;
	}

	public void setNum_idnt_civil_pes(Integer num_idnt_civil_pes) {
		this.num_idnt_civil_pes = num_idnt_civil_pes;
	}

	public String getNum_registo_pes() {
		return num_registo_pes;
	}

	public void setNum_registo_pes(String num_registo_pes) {
		this.num_registo_pes = num_registo_pes;
	}

	public String getNome_pes() {
		return nome_pes;
	}

	public void setNome_pes(String nome_pes) {
		this.nome_pes = nome_pes;
	}

	public String getData_nasc_pes() {
		return data_nasc_pes;
	}

	public void setData_nasc_pes(String data_nasc_pes) {
		this.data_nasc_pes = data_nasc_pes;
	}

	public Integer getId_tp_doc_pes() {
		return id_tp_doc_pes;
	}

	public void setId_tp_doc_pes(Integer id_tp_doc_pes) {
		this.id_tp_doc_pes = id_tp_doc_pes;
	}	
	
	
	@Override
	public String toString() {
		return "PesquisaSNIAC [rowList=" + rowList + "]";
	}

	@Override
	public List<PesquisaSNIAC.RowList> getRowList() {
		return rowList;
	}

	public static class RowList{

		private String num_idnt_civil;
	
        private Integer num_registo;
	
        private String data_nasc;
	
        private String nome;
	
        private String nome_completo;
	
        private String nome_proprio;
	
        private String nome_apelido;
	
        private String nome_mae;
	
        private String nm_mae_proprio;
	
        private String nm_mae_apelido;
	
        private String nome_pai;
	
        private String nm_pai_proprio;
	
        private String nm_pai_apelido;
	
        private String estado_documento;
	
        private String estado_pessoa;
	
        private String perda_nasc;
	
        private Integer id_pessoa;
	
        private String natuaralidade;
	
        private Integer natuaralidade_id;
	
        private String nacionalidade;
	
        private Integer nacionalidade_id;
	
        private String sexo;
	
        private String local_nasc;
	
        private Integer local_nasc_id;
	
        private String altura;
	
        private String estado_civil;
	
        private String sinais_partic;
	
        private String indicacoes;
	
        private String grupo_profissional;
	
        private String profissao;
	
        private String num_nic;
	
        private Integer bi;
	
        private String num_passaporte;
	
        private Integer nif;
	
        private String data_emissao;
	
        private String data_validade;
	
        private String data_inscricao;
	
        private String local_emissao;
	
        private String fotografia;
	
        private String imprissao_digt_esq;
	
        private String imprissao_digt_dir;
	
        private String assinatura;
		public String getNum_idnt_civil() {
			return num_idnt_civil;
		}
		public void setNum_idnt_civil(String num_idnt_civil) {
			this.num_idnt_civil = num_idnt_civil;
		}
		public Integer getNum_registo() {
			return num_registo;
		}
		public void setNum_registo(Integer num_registo) {
			this.num_registo = num_registo;
		}
		public String getData_nasc() {
			return data_nasc;
		}
		public void setData_nasc(String data_nasc) {
			this.data_nasc = data_nasc;
		}
		public String getNome() {
			return nome;
		}
		public void setNome(String nome) {
			this.nome = nome;
		}
		public String getNome_completo() {
			return nome_completo;
		}
		public void setNome_completo(String nome_completo) {
			this.nome_completo = nome_completo;
		}
		public String getNome_proprio() {
			return nome_proprio;
		}
		public void setNome_proprio(String nome_proprio) {
			this.nome_proprio = nome_proprio;
		}
		public String getNome_apelido() {
			return nome_apelido;
		}
		public void setNome_apelido(String nome_apelido) {
			this.nome_apelido = nome_apelido;
		}
		public String getNome_mae() {
			return nome_mae;
		}
		public void setNome_mae(String nome_mae) {
			this.nome_mae = nome_mae;
		}
		public String getNm_mae_proprio() {
			return nm_mae_proprio;
		}
		public void setNm_mae_proprio(String nm_mae_proprio) {
			this.nm_mae_proprio = nm_mae_proprio;
		}
		public String getNm_mae_apelido() {
			return nm_mae_apelido;
		}
		public void setNm_mae_apelido(String nm_mae_apelido) {
			this.nm_mae_apelido = nm_mae_apelido;
		}
		public String getNome_pai() {
			return nome_pai;
		}
		public void setNome_pai(String nome_pai) {
			this.nome_pai = nome_pai;
		}
		public String getNm_pai_proprio() {
			return nm_pai_proprio;
		}
		public void setNm_pai_proprio(String nm_pai_proprio) {
			this.nm_pai_proprio = nm_pai_proprio;
		}
		public String getNm_pai_apelido() {
			return nm_pai_apelido;
		}
		public void setNm_pai_apelido(String nm_pai_apelido) {
			this.nm_pai_apelido = nm_pai_apelido;
		}
		public String getEstado_documento() {
			return estado_documento;
		}
		public void setEstado_documento(String estado_documento) {
			this.estado_documento = estado_documento;
		}
		public String getEstado_pessoa() {
			return estado_pessoa;
		}
		public void setEstado_pessoa(String estado_pessoa) {
			this.estado_pessoa = estado_pessoa;
		}
		public String getPerda_nasc() {
			return perda_nasc;
		}
		public void setPerda_nasc(String perda_nasc) {
			this.perda_nasc = perda_nasc;
		}
		public Integer getId_pessoa() {
			return id_pessoa;
		}
		public void setId_pessoa(Integer id_pessoa) {
			this.id_pessoa = id_pessoa;
		}
		public String getNatuaralidade() {
			return natuaralidade;
		}
		public void setNatuaralidade(String natuaralidade) {
			this.natuaralidade = natuaralidade;
		}
		public Integer getNatuaralidade_id() {
			return natuaralidade_id;
		}
		public void setNatuaralidade_id(Integer natuaralidade_id) {
			this.natuaralidade_id = natuaralidade_id;
		}
		public String getNacionalidade() {
			return nacionalidade;
		}
		public void setNacionalidade(String nacionalidade) {
			this.nacionalidade = nacionalidade;
		}
		public Integer getNacionalidade_id() {
			return nacionalidade_id;
		}
		public void setNacionalidade_id(Integer nacionalidade_id) {
			this.nacionalidade_id = nacionalidade_id;
		}
		public String getSexo() {
			return sexo;
		}
		public void setSexo(String sexo) {
			this.sexo = sexo;
		}
		public String getLocal_nasc() {
			return local_nasc;
		}
		public void setLocal_nasc(String local_nasc) {
			this.local_nasc = local_nasc;
		}
		public Integer getLocal_nasc_id() {
			return local_nasc_id;
		}
		public void setLocal_nasc_id(Integer local_nasc_id) {
			this.local_nasc_id = local_nasc_id;
		}
		public String getAltura() {
			return altura;
		}
		public void setAltura(String altura) {
			this.altura = altura;
		}
		public String getEstado_civil() {
			return estado_civil;
		}
		public void setEstado_civil(String estado_civil) {
			this.estado_civil = estado_civil;
		}
		public String getSinais_partic() {
			return sinais_partic;
		}
		public void setSinais_partic(String sinais_partic) {
			this.sinais_partic = sinais_partic;
		}
		public String getIndicacoes() {
			return indicacoes;
		}
		public void setIndicacoes(String indicacoes) {
			this.indicacoes = indicacoes;
		}
		public String getGrupo_profissional() {
			return grupo_profissional;
		}
		public void setGrupo_profissional(String grupo_profissional) {
			this.grupo_profissional = grupo_profissional;
		}
		public String getProfissao() {
			return profissao;
		}
		public void setProfissao(String profissao) {
			this.profissao = profissao;
		}
		public String getNum_nic() {
			return num_nic;
		}
		public void setNum_nic(String num_nic) {
			this.num_nic = num_nic;
		}
		public Integer getBi() {
			return bi;
		}
		public void setBi(Integer bi) {
			this.bi = bi;
		}
		public String getNum_passaporte() {
			return num_passaporte;
		}
		public void setNum_passaporte(String num_passaporte) {
			this.num_passaporte = num_passaporte;
		}
		public Integer getNif() {
			return nif;
		}
		public void setNif(Integer nif) {
			this.nif = nif;
		}
		public String getData_emissao() {
			return data_emissao;
		}
		public void setData_emissao(String data_emissao) {
			this.data_emissao = data_emissao;
		}
		public String getData_validade() {
			return data_validade;
		}
		public void setData_validade(String data_validade) {
			this.data_validade = data_validade;
		}
		public String getData_inscricao() {
			return data_inscricao;
		}
		public void setData_inscricao(String data_inscricao) {
			this.data_inscricao = data_inscricao;
		}
		public String getLocal_emissao() {
			return local_emissao;
		}
		public void setLocal_emissao(String local_emissao) {
			this.local_emissao = local_emissao;
		}
		public String getFotografia() {
			return fotografia;
		}
		public void setFotografia(String fotografia) {
			this.fotografia = fotografia;
		}
		public String getImprissao_digt_esq() {
			return imprissao_digt_esq;
		}
		public void setImprissao_digt_esq(String imprissao_digt_esq) {
			this.imprissao_digt_esq = imprissao_digt_esq;
		}
		public String getImprissao_digt_dir() {
			return imprissao_digt_dir;
		}
		public void setImprissao_digt_dir(String imprissao_digt_dir) {
			this.imprissao_digt_dir = imprissao_digt_dir;
		}
		public String getAssinatura() {
			return assinatura;
		}
		public void setAssinatura(String assinatura) {
			this.assinatura = assinatura;
		}
		@Override
		public String toString() {
			return "RowList [num_idnt_civil=" + num_idnt_civil + ", num_registo=" + num_registo + ", data_nasc="
					+ data_nasc + ", nome=" + nome + ", nome_completo=" + nome_completo + ", nome_proprio="
					+ nome_proprio + ", nome_apelido=" + nome_apelido + ", nome_mae=" + nome_mae + ", nm_mae_proprio="
					+ nm_mae_proprio + ", nm_mae_apelido=" + nm_mae_apelido + ", nome_pai=" + nome_pai
					+ ", nm_pai_proprio=" + nm_pai_proprio + ", nm_pai_apelido=" + nm_pai_apelido
					+ ", estado_documento=" + estado_documento + ", estado_pessoa=" + estado_pessoa + ", perda_nasc="
					+ perda_nasc + ", id_pessoa=" + id_pessoa + ", natuaralidade=" + natuaralidade
					+ ", natuaralidade_id=" + natuaralidade_id + ", nacionalidade=" + nacionalidade
					+ ", nacionalidade_id=" + nacionalidade_id + ", sexo=" + sexo + ", local_nasc=" + local_nasc
					+ ", local_nasc_id=" + local_nasc_id + ", altura=" + altura + ", estado_civil=" + estado_civil
					+ ", sinais_partic=" + sinais_partic + ", indicacoes=" + indicacoes + ", grupo_profissional="
					+ grupo_profissional + ", profissao=" + profissao + ", num_nic=" + num_nic + ", bi=" + bi
					+ ", num_passaporte=" + num_passaporte + ", nif=" + nif + ", data_emissao=" + data_emissao
					+ ", data_validade=" + data_validade + ", data_inscricao=" + data_inscricao + ", local_emissao="
					+ local_emissao + ", fotografia=" + fotografia + ", imprissao_digt_esq=" + imprissao_digt_esq
					+ ", imprissao_digt_dir=" + imprissao_digt_dir + ", assinatura=" + assinatura + "]";
		}
		
		
	}

}
