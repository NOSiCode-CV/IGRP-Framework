package nosi.core.webapp;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

/**
 * @author: Emanuel Pereira
 * 23 Jun 2017
 */
public class Response extends HttpServletResponseWrapper{

	public static final String FORMAT_XML = "text/xml;charset=UTF-8";
	public static final String FORMAT_JSON = "application/json;charset=UTF-8";
	public static final String FORMAT_HTML = "text/html;charset=UTF-8";

	private String content;
	private int type;//type = 1-> Render; type = 2-> Redirect
	
	public Response(HttpServletResponse response) {
		super(response);
	}
	
	public Response() {
		this(Igrp.getInstance().getResponse());
	}
	
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
}
