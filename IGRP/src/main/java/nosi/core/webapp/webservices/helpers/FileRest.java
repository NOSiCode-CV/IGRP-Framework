package nosi.core.webapp.webservices.helpers;
/**
 * Emanuel
 * 29 Jan 2018
 */

import java.io.InputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import javax.ws.rs.core.Response;

public class FileRest implements AutoCloseable {

	private Integer size;
	private Long contentLength;
	private InputStream content;
	private String contentType;
	private String fileName;
	
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
		this.contentLength = size == null ? null : size.longValue();
	}

	/** Length in bytes, or -1 when unknown; supports downloads larger than 2 GiB. */
	public long getContentLength() {
		return contentLength == null ? -1L : contentLength;
	}

	/** Transfers ownership of the response to this file and its content stream. */
	public void setResponse(final Response response) {
		try {
			String length = response.getHeaderString("Content-Length");
			try {
				contentLength = length == null ? -1L : Long.parseLong(length);
			} catch (NumberFormatException e) {
				contentLength = -1L;
			}
			size = contentLength >= 0 && contentLength <= Integer.MAX_VALUE ? contentLength.intValue() : -1;
			contentType = response.getMediaType() == null ? "application/octet-stream" : response.getMediaType().toString();
			content = new FilterInputStream(response.readEntity(InputStream.class)) {
				private boolean closed;
				@Override
				public void close() throws IOException {
					if (!closed) {
						closed = true;
						try {
							super.close();
						} finally {
							response.close();
						}
					}
				}
			};
		} catch (RuntimeException e) {
			response.close();
			throw e;
		}
	}

	@Override
	public void close() throws IOException {
		if (content != null)
			content.close();
	}
	public InputStream getContent() {
		return content;
	}
	public void setContent(InputStream content) {
		this.content = content;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}
