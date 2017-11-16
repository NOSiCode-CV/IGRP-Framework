package nosi.core.webapp.webservices.biztalk.dao;

import java.io.Serializable;
import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;
import com.google.gson.annotations.Expose;

/**
 * @author: Emanuel Pereira
 * 15 Nov 2017
 */
@XmlRootElement(name="lista")
public class PesquisaNascimento implements ServiceSerach,Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4364504625954848300L;
	@Expose(serialize = true, deserialize = false)
	private String nome;
	@Expose(serialize = true, deserialize = false)
	private Integer numero_registo;
	@Expose(serialize = true, deserialize = false)
	private String data_nascimento; 
	@Expose(serialize = false, deserialize = true)
	private List<PesquisaNascimento.RowList> rowList;

	public PesquisaNascimento() {}
	
	public PesquisaNascimento(String nome, Integer numero_registo, String data_nascimento) {
		super();
		this.nome = nome;
		this.numero_registo = numero_registo;
		this.data_nascimento = data_nascimento;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Integer getNumero_registo() {
		return numero_registo;
	}

	public void setNumero_registo(Integer numero_registo) {
		this.numero_registo = numero_registo;
	}

	public String getData_nascimento() {
		return data_nascimento;
	}

	public void setData_nascimento(String data_nascimento) {
		this.data_nascimento = data_nascimento;
	}

	
	@Override
	public List<PesquisaNascimento.RowList> getRowList() {
		// TODO Auto-generated method stub
		return this.rowList;
	}

	public void setRowList(List<PesquisaNascimento.RowList> rowList) {
		this.rowList = rowList;
	}
	
	
	@Override
	public String toString() {
		return "PesquisaNascimento [rowList=" + rowList + "]";
	}


	public static class RowList implements Serializable{

		/**
		 * 
		 */
		private static final long serialVersionUID = 4452593229526625368L;
		private Integer id;
        private Integer numero;
        private String identificacao;
        private String data_nascimento;
        private String mae_nome;
        private String nome_pai;
        private String local_nascimento;
        private String orgao;
        private String numero_livro;
        private String folha;
        private String natureza;
        private String estado;
        private String link;
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
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
		public String getMae_nome() {
			return mae_nome;
		}
		public void setMae_nome(String mae_nome) {
			this.mae_nome = mae_nome;
		}
		public String getNome_pai() {
			return nome_pai;
		}
		public void setNome_pai(String nome_pai) {
			this.nome_pai = nome_pai;
		}
		public String getLocal_nascimento() {
			return local_nascimento;
		}
		public void setLocal_nascimento(String local_nascimento) {
			this.local_nascimento = local_nascimento;
		}
		public String getOrgao() {
			return orgao;
		}
		public void setOrgao(String orgao) {
			this.orgao = orgao;
		}
		public String getNumero_livro() {
			return numero_livro;
		}
		public void setNumero_livro(String numero_livro) {
			this.numero_livro = numero_livro;
		}
		public String getFolha() {
			return folha;
		}
		public void setFolha(String folha) {
			this.folha = folha;
		}
		public String getNatureza() {
			return natureza;
		}
		public void setNatureza(String natureza) {
			this.natureza = natureza;
		}
		public String getEstado() {
			return estado;
		}
		public void setEstado(String estado) {
			this.estado = estado;
		}
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		@Override
		public String toString() {
			return "RowList [id=" + id + ", numero=" + numero + ", identificacao=" + identificacao
					+ ", data_nascimento=" + data_nascimento + ", mae_nome=" + mae_nome + ", nome_pai=" + nome_pai
					+ ", local_nascimento=" + local_nascimento + ", orgao=" + orgao + ", numero_livro=" + numero_livro
					+ ", folha=" + folha + ", natureza=" + natureza + ", estado=" + estado + ", link=" + link + "]";
		}        
        
	}
}
