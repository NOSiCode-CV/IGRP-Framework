package nosi.core.integration.pdex.email;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Iekiny Marcel
 * Mar 11, 2021
 */
public class PdexEmailGatewayPayloadDTO {

	private String code; // UNIQUE_RANDOM_STRING 
	private String from; 
	private String to; 
	private String replyTo; 
	private String cc;
	private String bcc; 
	private String subject; 
	private String content; 
	private String contentType; // Ex.: text/plain 
	private String encoding; // Ex.: UTF-8 
	private List<Attachment> attachments;
	
	public PdexEmailGatewayPayloadDTO() {
		encoding = PdexEmailGatewayConstants.DEFAULT_ENCODING.value(); 
		contentType = PdexEmailGatewayConstants.DEFAULT_CONTENT_TYPE.value(); 
		code = UUID.randomUUID().toString().replaceAll("-", "_"); 
		attachments = new ArrayList<Attachment>(); 
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getReplyTo() {
		return replyTo;
	}
	public void setReplyTo(String replyTo) {
		this.replyTo = replyTo;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public String getBcc() {
		return bcc;
	}
	public void setBcc(String bcc) {
		this.bcc = bcc;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getEncoding() {
		return encoding;
	}
	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}
	
	public List<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}

	public static class Attachment{
		
		private String name; // filename 
		private String content; // base64 of the attach. 
		
		public Attachment() {}
		
		public Attachment(String name, String content) {
			this();
			this.name = name;
			this.content = content;
		}

		public String getName() {
			return name;
		}
		
		public void setName(String name) {
			this.name = name;
		}
		
		public String getContent() {
			return content;
		}
		
		public void setContent(String content) {
			this.content = content;
		}
		
	}
}
