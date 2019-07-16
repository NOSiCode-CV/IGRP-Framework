package nosi.core.webapp.webservices.rest.pesquisa_geral;
/**
 * Isaias.Nunes
 * Jul 3, 2019
 */
public class PesquisaEmpresa {
	private String nome_firma;
	private String matricula;
	private String dt_ini_atividade;
	private String natureza_juridica;
	private String natureza_juridica_desc;
	private String tipo_entidade;
	private String tipo_entidade_desc;
	private String nif;
	private String estado;
	private String data_registo;
	
	public String getNome_firma() {
		return nome_firma;
	}
	public void setNome_firma(String nome_firma) {
		this.nome_firma = nome_firma;
	}
	public String getMatricula() {
		return matricula;
	}
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	public String getDt_ini_atividade() {
		return dt_ini_atividade;
	}
	public void setDt_ini_atividade(String dt_ini_atividade) {
		this.dt_ini_atividade = dt_ini_atividade;
	}
	public String getNatureza_juridica() {
		return natureza_juridica;
	}
	public void setNatureza_juridica(String natureza_juridica) {
		this.natureza_juridica = natureza_juridica;
	}
	public String getNatureza_juridica_desc() {
		return natureza_juridica_desc;
	}
	public void setNatureza_juridica_desc(String natureza_juridica_desc) {
		this.natureza_juridica_desc = natureza_juridica_desc;
	}
	public String getTipo_entidade() {
		return tipo_entidade;
	}
	public void setTipo_entidade(String tipo_entidade) {
		this.tipo_entidade = tipo_entidade;
	}
	public String getTipo_entidade_desc() {
		return tipo_entidade_desc;
	}
	public void setTipo_entidade_desc(String tipo_entidade_desc) {
		this.tipo_entidade_desc = tipo_entidade_desc;
	}
	public String getNif() {
		return nif;
	}
	public void setNif(String nif) {
		this.nif = nif;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getData_registo() {
		return data_registo;
	}
	public void setData_registo(String data_registo) {
		this.data_registo = data_registo;
	}
	@Override
	public String toString() {
		return "PesquisaEmpresa [nome_firma=" + nome_firma + ", matricula=" + matricula + ", dt_ini_atividade="
				+ dt_ini_atividade + ", natureza_juridica=" + natureza_juridica + ", natureza_juridica_desc="
				+ natureza_juridica_desc + ", tipo_entidade=" + tipo_entidade + ", tipo_entidade_desc="
				+ tipo_entidade_desc + "]";
	}
	
	
}
