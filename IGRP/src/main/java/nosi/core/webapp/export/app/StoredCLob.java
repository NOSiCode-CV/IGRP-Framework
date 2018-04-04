package nosi.core.webapp.export.app;

import java.util.Arrays;

/**
 * Emanuel
 * 3 Apr 2018
 */
public class StoredCLob {
	private String name;
	private String mime_type;
	private byte[] c_lob_content;
	private String dt_created;
	
	
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
	public String getDt_created() {
		return dt_created;
	}
	public void setDt_created(String dt_created) {
		this.dt_created = dt_created;
	}
	
	@Override
	public String toString() {
		return "StoredCLob [name=" + name + ", mime_type=" + mime_type + ", c_lob_content="
				+ Arrays.toString(c_lob_content) + ", dt_created=" + dt_created + "]";
	}
	
}
