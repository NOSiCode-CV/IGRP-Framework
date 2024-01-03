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
    void deserialization(String jsonContent);
	
	/**
	 * Insert data in respective table on database
	 */
    void execute();
	
	/**
	 * Set a message error
	 * 
	 * @param error
	 */
    void addError(String error);
	
	/**
	 * Set a message warning
	 * 
	 * @param warning
	 */
    void addWarning(String warning);

	/**
	 * List of file names to process compile
	 * @return
	 */
    List<String> getFileName();
	
	/**
	 * Get a message error
	 * 
	 * @return
	 */
    String getError();
	

	/**
	 * Get a message warning
	 * 
	 * @return
	 */
    String getWarning();
}
