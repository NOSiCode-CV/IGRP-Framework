package nosi.core.webapp.import_export_v2.common.serializable.transation;

import java.io.Serializable;

/**
 * Emanuel
 * 6 Dec 2018
 */
public class TransationSerializable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String code;
	private String descr;
	private String dad;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	
	
}
