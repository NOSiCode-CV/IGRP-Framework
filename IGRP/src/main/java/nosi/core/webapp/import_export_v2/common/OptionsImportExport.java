package nosi.core.webapp.import_export_v2.common;
/**
 * Emanuel
 * 30 Oct 2018
 */
public enum OptionsImportExport {

	APP(0,"APP","APP"),BPMN(1,"BPMN","BPMN"),REPORT(2,"Report","Reports"),PAGE(3,"Páginas","Pages"),DOMAIN(4,"Domínios","Domains")
	,MENU(5,"Menús","Maims"),CONNECTION(6,"Conexões de Base Dados","Connections"),MODULO(7,"Módulos","Modulos"),DAO(8,"Classes DAO","Daos");//,SERVICE(9,"Serviços","Services");
	
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
