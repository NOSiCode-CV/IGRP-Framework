package nosi.core.webapp.import_export_v2.common;
/**
 * Emanuel
 * 30 Oct 2018
 */
public enum OptionsImportExport {

	APP(0,"APP","APP"),PAGE(1,"Páginas","Pages"),BPMN(2,"BPMN","BPMN"),REPORT(3,"Report","Reports"),DOMAIN(4,"Domínios","Domains")
	,MENU(5,"Menús","Maims"),CONNECTION(6,"Conexões de Base Dados","Connections"),DAO(7,"Classes DAO","Daos"),MODULO(8,"Módulos","Modulos");//,SERVICE(9,"Serviços","Services");
	
	private final int valor;
	private final String fileName;
	private final String descricao;
	
	OptionsImportExport(int v,String desc,String fileName) {
		this.valor = v;
		this.descricao = desc;
		this.fileName = fileName;
	}
	
	public int getValor() {
		return this.valor;
	}
	
	public String getDescricao() {
		return this.descricao;
	}
	
	public String getFileName() {
		return this.fileName;
	}
}
