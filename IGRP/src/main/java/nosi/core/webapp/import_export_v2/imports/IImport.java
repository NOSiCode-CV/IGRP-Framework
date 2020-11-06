package nosi.core.webapp.import_export_v2.imports;

import java.util.List;


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
	 * Set a message warning
	 * 
	 * @param warning
	 */
	public void addWarning(String warning);

	/**
	 * List of file names to process compile
	 * @return
	 */
	public List<String> getFileName();
	
	/**
	 * Get a message error
	 * 
	 * @return
	 */
	public String getError();
	

	/**
	 * Get a message warning
	 * 
	 * @return
	 */
	public String getWarning();
}
