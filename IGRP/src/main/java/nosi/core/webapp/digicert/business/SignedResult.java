package nosi.core.webapp.digicert.business;

import java.io.Serializable;

/**
 * frant
 * 12/12/2022
 */
public class SignedResult implements Serializable {
	
	public String getSignerdata() {
		return signerdata;
	}
	public void setSignerdata(String signerdata) {
		this.signerdata = signerdata;
	}
	public String getSignerkey() {
		return signerkey;
	}
	public void setSignerkey(String signerkey) {
		this.signerkey = signerkey;
	}
					
	public String getMime_type() {
		return mime_type;
	}
	public void setMime_type(String mime_type) {
		this.mime_type = mime_type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "SignedResult [signerdata=" + signerdata + ", signerkey=" + signerkey + "]";
	}
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8224208854690586847L;

	private String signerdata;
	private String signerkey;
	private String mime_type;
	private String name;
	
}