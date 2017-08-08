package nosi.webapps.agenda.dao;
/**
 * @author: Emanuel Pereira
 * 4 Aug 2017
 */
public class Entidade {

	private int id;
	private String aplicacao;
	private String estado;
	private String nome_entidade;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAplicacao() {
		return aplicacao;
	}
	public void setAplicacao(String aplicacao) {
		this.aplicacao = aplicacao;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getNome_entidade() {
		return nome_entidade;
	}
	public void setNome_entidade(String nome_entidade) {
		this.nome_entidade = nome_entidade;
	}
	
	public String toString(){
		return "[id = "+id+", nome_entidade = "+nome_entidade+", aplicacao = "+aplicacao+", estado = "+estado+"]";
	}
}
