package nosi.core.webapp;
/**
 * @author: Emanuel Pereira
 * 23 Jun 2017
 */
public class Response {

	public static final String FORMAT_XML = "text/xml;charset=UTF-8";
	public static final String FORMAT_JSON = "application/json;charset=UTF-8";
	public static final String FORMAT_HTML = "text/html;charset=UTF-8";

	private String content;
	private int type;//type = 1-> Render; type = 2-> Redirect
	private String format;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
}
