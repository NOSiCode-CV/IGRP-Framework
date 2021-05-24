package nosi.core.integration.pdex.email;

/**
 * Iekiny Marcel
 * Mar 12, 2021
 */
public enum PdexEmailGatewayConstants {
	CODE("code", "Code"), 
	FROM("from", "From"), 
	TO("to", "To"), 
	REPLY_TO("replyTo", "ReplyTo"), 
	CC("cc", "Carbon Copy"), 
	BCC("bcc", "Blind Carbon Copy"), 
	SUBJECT("subject", "Subject"), 
	CONTENT("content", "Content"), 
	CONTENT_TYPE("contentType", "Content-Type"), 
	DEFAULT_CONTENT_TYPE("text/plain", "text/plain"), 
	ENCODING("encoding", "Encoding"), 
	DEFAULT_ENCODING("UTF-8", "UTF-8"), 
	ATTACHMENT_NAME("name", "Attachment Name"), 
	ATTACHMENT_CONTENT("content", "Attachment Content"),
	ATTACHMENTS("attachments", "Attachments")
	;
	
	private String value; 
	private String description; 
	
	PdexEmailGatewayConstants(String value, String description) {
		this.value = value; 
		this.description = description;
	}

	public String value() {
		return value;
	}

	public String description() {
		return description;
	}
}
