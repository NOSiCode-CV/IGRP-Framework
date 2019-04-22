package nosi.core.webapp.import_export_v2.common.serializable.document_type;

import java.io.Serializable;

/**
 * Emanuel
 * 22 Apr 2019
 */
public class DocumentTypeExportSerializable implements Serializable{

	private static final long serialVersionUID = 1L;

	private String nome;
	private int status;
	private String descricao;
	private String codigo;
	private String dad;
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	
	
}
