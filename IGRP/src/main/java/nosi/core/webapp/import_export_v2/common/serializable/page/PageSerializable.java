package nosi.core.webapp.import_export_v2.common.serializable.page;

import java.io.Serializable;

/**
 * Emanuel
 * 30 Oct 2018
 */
public class PageSerializable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String page;
	private String action;
	private String package_name;
	private String xsl_src;
	private String page_descr;
	private String action_descr;
	private String version;
	private String img_src;
	private int status;
	private short isComponent = 0; // 0 = Page; 1 = Component; 2 = Page Task
	private String xmlContent;
	private String xslContent;
	private String processKey;
	private short tipo = 0; // 0 = Privado (Authentication); 1 = Publico; ... 
	private String nomeModulo;
	private String dad;
	private PageFilesSerializable pageFiles;
	private PageFilesSerializable classFiles;
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getPackage_name() {
		return package_name;
	}
	public void setPackage_name(String package_name) {
		this.package_name = package_name;
	}
	public String getXsl_src() {
		return xsl_src;
	}
	public void setXsl_src(String xsl_src) {
		this.xsl_src = xsl_src;
	}
	public String getPage_descr() {
		return page_descr;
	}
	public void setPage_descr(String page_descr) {
		this.page_descr = page_descr;
	}
	public String getAction_descr() {
		return action_descr;
	}
	public void setAction_descr(String action_descr) {
		this.action_descr = action_descr;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public short getIsComponent() {
		return isComponent;
	}
	public void setIsComponent(short isComponent) {
		this.isComponent = isComponent;
	}
	public String getXmlContent() {
		return xmlContent;
	}
	public void setXmlContent(String xmlContent) {
		this.xmlContent = xmlContent;
	}
	public String getXslContent() {
		return xslContent;
	}
	public void setXslContent(String xslContent) {
		this.xslContent = xslContent;
	}
	public String getProcessKey() {
		return processKey;
	}
	public void setProcessKey(String processKey) {
		this.processKey = processKey;
	}
	public short getTipo() {
		return tipo;
	}
	public void setTipo(short tipo) {
		this.tipo = tipo;
	}
	public String getNomeModulo() {
		return nomeModulo;
	}
	public void setNomeModulo(String nomeModulo) {
		this.nomeModulo = nomeModulo;
	}
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	public PageFilesSerializable getPageFiles() {
		return pageFiles;
	}
	public void setPageFiles(PageFilesSerializable pageFiles) {
		this.pageFiles = pageFiles;
	}
	public PageFilesSerializable getClassFiles() {
		return classFiles;
	}
	public void setClassFiles(PageFilesSerializable classFiles) {
		this.classFiles = classFiles;
	}
	
	
}
