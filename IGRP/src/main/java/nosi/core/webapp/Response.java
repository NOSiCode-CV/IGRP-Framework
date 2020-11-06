package nosi.core.webapp;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import nosi.core.webapp.webservices.helpers.FileRest;

/**
 * @author: Emanuel Pereira
 * 23 Jun 2017
 */
public class Response extends HttpServletResponseWrapper{

	public static final String FORMAT_XML = "text/xml";
	public static final String FORMAT_JSON = "application/json";
	public static final String FORMAT_HTML = "text/html";
	public static final String FORMAT_XSL = "text/xsl";
	public static final String FORMAT_TEXT = "text/plain";
	public static final String FORMAT_PDF = "application/pdf";
	public static final String FORMAT_RAW = "application/octet-stream";
	
	public static final String CHARSET_UTF_8 = "UTF-8";

	private String content;
	
	private int type;//type = 1-> Render; type = 2-> Redirect; type = 3-> Dispatcher forward
	
	private String url;
	
	private HttpStatus httpStatus; // Http statusCode + Http statusText
	private FileRest file;
	private byte []stream; // For raw format (Ex.: binary files ...)
	private PrintWriter printWriter;
	
	
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

	public HttpStatus getHttpStatus() {
		return httpStatus;
	}

	public void setHttpStatus(HttpStatus httpStatus) {
		this.httpStatus = httpStatus;
	}

	public byte[] getStream() {
		return stream;
	}

	public void setStream(byte[] stream) {
		this.stream = stream;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public FileRest getFile() {
		return file;
	}

	public void setFile(FileRest file) {
		this.file = file;
	}

	public PrintWriter getPrintWriter() {
		return printWriter;
	}

	public void setPrintWriter(PrintWriter printWriter) {
		this.printWriter = printWriter;
	}


}
