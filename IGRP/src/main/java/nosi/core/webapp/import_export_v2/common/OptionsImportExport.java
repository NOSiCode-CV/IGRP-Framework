package nosi.core.webapp.import_export_v2.common;
/**
 * Emanuel
 * 30 Oct 2018
 */
public enum OptionsImportExport {

	APP(0,"APP","app"),PAGE(1,"Páginas","pages"),BPMN(2,"BPMN","process"),REPORT(3,"Report","reports"),DOMAIN(4,"Domínios","domains")
	,MENU(5,"Menús","maims"),CONNECTION(6,"Conexões de Base Dados","connections"),DAO(7,"Classes DAO","dao"),MODULO(8,"Módulos","modulos"),
	OTHERS_CLASS(9,"Outras classes","others_class"),TRANSATION(10,"Transations","transations"),DOCUMENT_TYPE(11,"Tipo Documento","documentType"),SERVICE(12,"Serviços","services");
	
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
