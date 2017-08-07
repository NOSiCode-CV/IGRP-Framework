package nosi.webapps.agenda.dao;
/**
 * Marcel Iekiny
 * Aug 6, 2017
 */
public class Fault {
	
	private String faultcode;
	private String faultstring;
	private String detail;
	
	
	public Fault() {}
	
	public Fault(String faultcode, String faultstring, String detail) {
		this.faultcode = faultcode;
		this.faultstring = faultstring;
		this.detail = detail;
	}
	
	public String getFaultcode() {
		return faultcode;
	}
	
	public void setFaultcode(String faultcode) {
		this.faultcode = faultcode;
	}
	
	public String getFaultstring() {
		return faultstring;
	}
	
	public void setFaultstring(String faultstring) {
		this.faultstring = faultstring;
	}
	
	public String getDetail() {
		return detail;
	}
	
	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "Fault [faultcode=" + faultcode + ", faultstring=" + faultstring + ", detail=" + detail + "]";
	}

}
