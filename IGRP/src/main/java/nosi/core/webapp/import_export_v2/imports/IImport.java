package nosi.core.webapp.import_export_v2.imports;
/**
 * Emanuel
 * 2 Nov 2018
 */
public interface IImport {

	/**
	 * Receive the json content and deserializable it
	 * 
	 * @param jsonContent
	 */
	public void deserialization(String jsonContent);
	
	/**
	 * Insert data in respective table on database
	 */
	public void execute();
	
	/**
	 * Set a message error
	 * 
	 * @param error
	 */
	public void addError(String error);
	
	/**
	 * Get a message error
	 * 
	 * @return
	 */
	public String getError();
}
