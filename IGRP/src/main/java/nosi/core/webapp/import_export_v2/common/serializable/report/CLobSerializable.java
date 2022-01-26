package nosi.core.webapp.import_export_v2.common.serializable.report;

import java.io.Serializable;
import java.util.Date;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class CLobSerializable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String mime_type;
	private byte[] c_lob_content;
	private Date dt_created;
	private String uuid;
	
	public CLobSerializable() {super();}
	
	public CLobSerializable(String name, String mime_type, byte[] c_lob_content, Date dt_created) {
		this();
		this.name = name;
		this.mime_type = mime_type;
		this.c_lob_content = c_lob_content;
		this.dt_created = dt_created;
	}
	
	public CLobSerializable(String name, String mime_type, byte[] c_lob_content, Date dt_created, String uuid) {
		this(name, mime_type, c_lob_content, dt_created); 
		this.uuid = uuid; 
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMime_type() {
		return mime_type;
	}
	public void setMime_type(String mime_type) {
		this.mime_type = mime_type;
	}
	public byte[] getC_lob_content() {
		return c_lob_content;
	}
	public void setC_lob_content(byte[] c_lob_content) {
		this.c_lob_content = c_lob_content;
	}
	public Date getDt_created() {
		return dt_created;
	}
	public void setDt_created(Date dt_created) {
		this.dt_created = dt_created;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
}
