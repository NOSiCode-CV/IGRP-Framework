package nosi.core.webapp.webservices.biztalk.dao;
/**
 * @author: Emanuel Pereira
 * 15 Nov 2017
 */

import java.io.Serializable;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="rows")
public class Response implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8236536631726097191L;
	private Row row;

	public Row getRow() {
		return row;
	}
	
	public void setRow(Row row) {
		this.row = row;
	}

	public static class Row implements Serializable{
	   	/**
		 * 
		 */
		private static final long serialVersionUID = 3081121019095683328L;
		private boolean status;
	   	private String status_text;
		public boolean isStatus() {
			return status;
		}
		public void setStatus(boolean status) {
			this.status = status;
		}
		public String getStatus_text() {
			return status_text;
		}
		public void setStatus_text(String status_text) {
			this.status_text = status_text;
		}
   
		@Override
		public String toString() {
			return "Row [status=" + status + ", status_text=" + status_text + "]";
		}	
		
   }
}
