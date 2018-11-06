package nosi.core.webapp.import_export_v2.exports;
/**
 * Emanuel
 * 29 Oct 2018
 */
public interface IExport {
	/**
	 * The filename for save content
	 * @return
	 */
	public String getFileName();
	/**
	 * Get content export in Json or XML
	 * @return
	 */
	public String serialization();
	
	/**
	 * 
	 * @param export
	 * @param ids
	 */
	public void export(Export export, String[] ids);
	
	/**
	 * Add content export to list
	 * @param id
	 */
	public void add(String id);
	
}
