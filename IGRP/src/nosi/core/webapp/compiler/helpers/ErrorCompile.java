package nosi.core.webapp.compiler.helpers;

import java.io.Serializable;

/**
 * @author: Emanuel Pereira
 * 12 Nov 2017
 */
public class ErrorCompile  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String error;
	private long line;
	private String fileName;
	
	public ErrorCompile(String error, long line, String fileName) {
		super();
		this.error = error;
		this.line = line;
		this.fileName = fileName;
	}
	

	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public long getLine() {
		return line;
	}
	public void setLine(long line) {
		this.line = line;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}
