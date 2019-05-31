package nosi.webapps.igrp_studio.pages.partilhageral;

/**
 * Iekiny Marcel
 * May 30, 2019
 */
public enum TipoPartilha {
	
	PAGE("Página", "PAGE"),
	TRANSACTION("Transação", "TRANS"),
	ACTI("Actividade", "ACTI"),
	REPORT("Report", "REPORT"),
	SERV("Serviço", "SERV");

	private String descricao;
	private String codigo;

	TipoPartilha(String descricao, String codigo) {
		this.descricao = descricao;
		this.codigo = codigo;
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
	
	public static TipoPartilha getByCodigo(String codigo) {
		for (TipoPartilha item : TipoPartilha.values()) {
			if (item.getCodigo().equalsIgnoreCase(codigo))
				return item;
		}
		return null;
	}
	
}
