package nosi.core.webapp.helpers;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: Emanuel Pereira
 * 9 Nov 2017
 */
public class ErrorCompile implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -118231744893205115L;
	private String msg;
	private List<ErrorConfig> error;
	
	public ErrorCompile(){
		this.error = new ArrayList<>();
	}
	public String getMsg() {
		return msg;
	}	
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<ErrorConfig> getError() {
		return error;
	}
	public void setError(List<ErrorConfig> error) {
		this.error = error;
	}

	public void addError(ErrorConfig e){
		if(e!=null)
			error.add(e);
	}
	
	public class ErrorConfig implements Serializable{
		
		/**
		 * 
		 */
		private static final long serialVersionUID = 7052733859345915398L;
		private String name;
		private List<ErrorDescr> errors;
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public List<ErrorDescr> getErrors() {
			return errors;
		}
		public void setErrors(List<ErrorDescr> errors) {
			this.errors = errors;
		}
		
		public class ErrorDescr implements Serializable{
			/**
			 * 
			 */
			private static final long serialVersionUID = 1L;
			private String error;
			private String line;
			
			public String getError() {
				return error;
			}
			public void setError(String error) {
				this.error = error;
			}
			public String getLine() {
				return line;
			}
			public void setLine(String line) {
				this.line = line;
			}
		}
	}
}
