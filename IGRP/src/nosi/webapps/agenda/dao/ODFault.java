package nosi.webapps.agenda.dao;

import java.io.Serializable;

/**
 * Marcel Iekiny
 * Aug 25, 2017
 */
public class ODFault implements Serializable{
	
	private Error error;
	
	public Error getError() {
		return error;
	}

	public void setError(Error error) {
		this.error = error;
	}
	
	@Override
	public String toString() {
		return "ODFault [error=" + error + "]";
	}

	public static class Error implements Serializable{
		
		private int cod;
		private String message;
		
		public int getCod() {
			return cod;
		}
		public void setCod(int cod) {
			this.cod = cod;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		@Override
		public String toString() {
			return "Error [cod=" + cod + ", message=" + message + "]";
		}
		
	}
}
