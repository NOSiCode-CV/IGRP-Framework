package nosi.core.mail;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import nosi.core.config.ConfigApp;

/**
 * Iekiny Marcel
 * Dec 12, 2017
 */
public class EmailMessage { 
	
	private static final Logger LOG = LogManager.getLogger(EmailMessage.class); 
	
	public static final String EMAIL_REGEXP = "[a-zA-Z0-9!#$%&\\'*+\\/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?"; 

	private String to;
	private String cc;
	private String bcc;
	private String from;
	private String subject;
	private String msg;
	
	private boolean multipleRecipients;
	
	private String replyTo; // emails separated by comma 
	
	private String charset;
	private String subType;
	
	private Properties settings;
	
	// credentials 
	private String auth_username;
	private String auth_password;
	
	private List<File> attaches; 
	private List<Attachment> attachesBytes; 
	
	private EmailMessage() { 
		if(!this.load()) 
			this.loadDefaultConfig();
		this.attaches = new ArrayList<>();
		this.attachesBytes = new ArrayList<>();
		this.multipleRecipients = false;
	}
	
	public static EmailMessage newInstance() {	
		return new EmailMessage();
	}
	
	public void loadDefaultConfig() {
		System.setProperty("java.net.preferIPv4Stack", "true");
		// Get system properties
		Properties properties = System.getProperties();
		// Setup mail server
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.checkserveridentity", true); // Compliant
		this.settings = new Properties(properties);
	}
	
	public EmailMessage setTo(String to) {
		this.to = to.replace(";", ",");
		return this;
	}

	public EmailMessage setFrom(String from) {
		this.from = from;
		return this;
	}

	public EmailMessage setSubject(String subject) {
		this.subject = subject;
		return this;
	}

	public EmailMessage setMsg(String msg) {
		this.msg = msg;
		return this;
	}
	
	public EmailMessage setMsg(String msg, String charset) {
		this.msg = msg;
		this.charset = charset;
		return this;
	}
	
	public EmailMessage setMsg(String msg, String charset, String subType) {
		this.msg = msg;
		this.charset = charset;
		this.subType = subType;
		return this;
	}
	
	public EmailMessage attach(File attach) {
		this.attaches.add(attach);
		return this;
	}
	
	public EmailMessage attach(Attachment attach) {
		this.attachesBytes.add(attach);
		return this;
	}
	
	public EmailMessage newSettings(Properties p) {
		this.settings = p;
		return this;
	}
	
	public Properties getSettings() {
		return this.settings;
	}
	
	public EmailMessage authenticate(String username, String password) {
		this.auth_username = username;
		this.auth_password = password;
		return this;
	}
	
	private void checkNSetupCredencials() {
		if(auth_username == null || auth_username.isEmpty() || auth_password == null || auth_password.isEmpty()) {
			auth_username = settings.getProperty("mail.user"); 
			auth_password = settings.getProperty("mail.password"); 
		}
	}
	
	private boolean load() {
		settings = ConfigApp.getInstance().getMainSettings(); 
		return !settings.isEmpty();
	}
	
	public boolean send() throws IOException { 
		try{
			checkNSetupCredencials();
			// Get the default Session object.
			Session session = Session.getInstance(this.settings,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(auth_username, auth_password);
					}
			});
			// Create a default MimeMessage object. 
			MimeMessage message = new MimeMessage(session); 
			if(!validateEmail(this.from)) {
				LOG.error("Email not sent ... Invalid email (from): <" + this.from + "> ");
				return false;
			}
			// Set From: header field of the header.
			message.setFrom(new InternetAddress(this.from));
			// Set To: header field of the header. 
			if(this.multipleRecipients) {
				if(!validateEmails(this.to)) {
					LOG.error("Email not sent (To)... one of email is invalid: <" + this.to + "> ");
					return false;
				}
				message.addRecipients(Message.RecipientType.CC,InternetAddress.parse(this.to)); // this.to is a string separated by comma 
			}else {
				if(!validateEmails(this.to)) {
					LOG.error("Email not sent (To)... one of email is invalid: <" + this.to + "> ");
					return false;
				}		
				if(this.to != null && !this.to.isEmpty()) 
					message.addRecipients(Message.RecipientType.TO,InternetAddress.parse(this.to)); 
			}			
			if(this.cc != null && !this.cc.isEmpty())	
				message.addRecipients(Message.RecipientType.CC,InternetAddress.parse(this.cc));
			if(this.bcc != null && !this.bcc.isEmpty()) 
				message.addRecipients(Message.RecipientType.BCC,InternetAddress.parse(this.bcc));
			if(this.replyTo != null && !this.replyTo.isEmpty() && validateEmails(this.replyTo)) 
				message.setReplyTo(InternetAddress.parse(this.replyTo));
			// Set Subject: header field
			message.setSubject(this.subject); 
			// If there is any attach ... 
			if(!this.attaches.isEmpty() || !this.attachesBytes.isEmpty()) {
				// Create a multipart message 
				MimeBodyPart mbp = new MimeBodyPart();
		        Multipart multipart = new MimeMultipart();
			    // Now set the actual message 
				if(this.charset != null && !this.charset.isEmpty() && this.subType != null && !this.subType.isEmpty())
					mbp.setText(this.msg, this.charset, this.subType);
				else if(this.charset != null && !this.charset.isEmpty())
					mbp.setText(this.msg, this.charset);
				else if(this.subType != null && !this.subType.isEmpty())
					message.setText(this.msg, null, this.subType);
				else
					mbp.setText(this.msg);
				//if type is text/html and not just one word like html, must use setContent or error will occur
				if(this.subType != null && !this.subType.isEmpty() && this.subType.contains("/"))
					mbp.setContent(this.msg, this.subType);
		        multipart.addBodyPart(mbp);
		        // Add Attachments 
				if(!this.attaches.isEmpty()) 
					this.wrapFilesToMultipart(message, multipart);
				if(!this.attachesBytes.isEmpty())  
					this.wrapBytesToMultipart(message, multipart); 
			}else {
				// Otherwise set the actual message 
				if(this.charset != null && !this.charset.isEmpty() && this.subType != null && !this.subType.isEmpty())
					message.setText(this.msg, this.charset, this.subType);
				else if(this.charset != null && !this.charset.isEmpty())
					message.setText(this.msg, this.charset);
				else if(this.subType != null && !this.subType.isEmpty())
					message.setText(this.msg, null, this.subType);
				else
					message.setText(this.msg);
				//if type is text/html and not just one word like html, must use setContent or error will occur
				if(this.subType != null && !this.subType.isEmpty() && this.subType.contains("/"))
					message.setContent(this.msg, this.subType);
			}
			// Send message
			Transport.send(message);
			return true;
		}catch (MessagingException ex)  {
			LOG.error("Error ... sending email ... ");
			ex.printStackTrace();
		}
		return false;
	}
	
	public static boolean validateEmail(String email) {
		return email != null && !email.isEmpty() && email.matches(EMAIL_REGEXP);
	}
	
	public static boolean validateEmails(String emails) {
		String aux[] = emails.split(",");
		for(String email : aux)
			if(!validateEmail(email))
				return false;
		return true;
	}

	public EmailMessage multipleRecipients(boolean flag) {
		this.multipleRecipients = flag;
		return this;
	}
	
	public EmailMessage replyTo(String emails) {
		this.replyTo = emails;
		return this;
	} 
	
	protected void wrapFilesToMultipart(MimeMessage message,  Multipart multipart) throws MessagingException, IOException { 
		for(File attach : this.attaches) {
			// Create the message part 
			MimeBodyPart messageBodyPart = new MimeBodyPart();
	         messageBodyPart.attachFile(attach);
	         // Set message part 
	         multipart.addBodyPart(messageBodyPart);
		} 
		// Send the complete message parts 
        message.setContent(multipart);
	} 
	
	protected void wrapBytesToMultipart(MimeMessage message, Multipart multipart) throws MessagingException { 
		for(Attachment obj : this.attachesBytes){
			MimeBodyPart messageBodyPart = new MimeBodyPart(); 
			ByteArrayDataSource bds = new ByteArrayDataSource(obj.content, obj.getType());
			bds.setName(obj.getName()); 
			messageBodyPart.setDataHandler(new DataHandler(bds)); 
			messageBodyPart.setFileName(bds.getName()); 
			// Set message part 
	        multipart.addBodyPart(messageBodyPart);
		}
		// Send the complete message parts 
        message.setContent(multipart); 
	}

	/**
	 * @param cc the cc to set
	 */
	public EmailMessage setCc(String cc) {
		this.cc = cc.replace(";", ",");
		return this;
	}

	/**
	 * @param bcc the bcc to set
	 */
	public EmailMessage setBcc(String bcc) {
		this.bcc = bcc.replace(";", ",");
		return this;
	}

	public static class Attachment{ 
				
		private byte[] content; 
		private String name; 
		private String type;
		
		public Attachment(byte[] content,String name, String type) {			
			this.content = content;
			this.name = name;
			this.type = type;
		}
		
		public Attachment() {
		
		}

		public byte[] getContent() {
			return content;
		}
		public void setContent(byte[] content) {
			this.content = content;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		} 
		
	}
	
	public static class PdexTemplate{
		
		public PdexTemplate() {}
		
		
		public static String getCorpoFormatado(String boxTitle, String msgBoasVindas, String[] paragrafos, String []textoBtnAcao, String []hrefBtnAcao, String helpLink) {
			if(paragrafos.length == 0 || msgBoasVindas.isEmpty()) return "";
			 String body = ""
	                + "<div style=\"HEIGHT: 100%; width:100%; background-color: rgb(244, 244, 244);\">"
	                + "<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->"	        		
	                + "<div style=\" margin: 10px auto; width: 600px;\">"
	                + "<table align=\"center\" role=\"presentation\" style=\"width: 100%;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"
	                + "        <tbody>"
	                + "            <tr>"
	                + "                <td style=\"padding: 20px 0px; text-align: center; direction: ltr;font: 15px 'Helvetica Neue', Helvetica, Arial, sans-serif;\">"
	                + "         	      <div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"width: 100%; text-align: left; vertical-align: top; display: inline-block; direction: ltr;\">"
	                + "<table width=\"100%\" role=\"presentation\" style=\"background: white;vertical-align: top;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"
	                + "<tbody>"
	                + "<tr>"
	                + "<td align=\"left\" style=\"padding: 10px 25px; \">"
	                + "<table role=\"presentation\" style=\"border-collapse: collapse; border-spacing: 0px;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"
	                + "<tbody>"
	                + "                       <tr style=\"width:100%;height:57px;\" >"
	                + "                                <td style=\"border-bottom-color: #ddd; border-bottom-width: 1px; border-bottom-style: solid; font-size:36px;text-align:center;color:#333333;padding:0px;margin: 0 auto;\">"
	                + "                                    <strong>" + boxTitle + "</strong>"
	                + "                                </td>"
	                + "                            </tr>"
	                + "                            <tr style=\"width:100%;\" >"
	                + "                                <td style=\"border-bottom-color: #ddd; border-bottom-width: 1px; border-bottom-style: solid; background:#FFFFFF;padding:18px;vertical-align:top;text-align:left;\">"
	                + "                                    <h1 style=\"font-size:20px;margin:0;color:#424242\">" + msgBoasVindas + "</h1>";
	        // Paragrafos
	        for (String paragrafo : paragrafos) {
	        	body += "<p style=\"margin: 10px 0px;\">"
	        			+ "<span style=\"color: rgb(27, 29, 34);\">"
	        			+ "<span style=\"font-size: 14px; background-color: rgb(255, 255, 255); \">"
	        			+ paragrafo + "</span></span></p>";
	        			 
			}
	        body += "</td></tr><tr>"; 
	        if (textoBtnAcao != null && textoBtnAcao.length > 0 && hrefBtnAcao != null && hrefBtnAcao.length > 0 && hrefBtnAcao.length == textoBtnAcao.length) {
	        	for(int i = 0 ; i < hrefBtnAcao.length; i++) { // Botao Accao 
	        		body += ""
		                    + "<td align=\"center\" style=\"padding: 20px 5px;\" vertical-align=\"middle\">"
		                    + "<table role=\"presentation\" style=\"line-height: 100%; border-collapse: separate;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"
		                    + "<tbody>"
		                    + "<tr><td align=\"center\" role=\"presentation\" valign=\"middle\" style=\"background: #337ab7; border-radius: 3px; border: 0px solid rgb(255, 255, 255); cursor: auto; mso-padding-alt: 15px 25px 15px 25px;\" bgcolor=\"#337ab7\">"
		                    + "<a style=\"background: #337ab7; margin: 0px; padding: 15px 25px; border-radius: 3px; color: rgb(255, 255, 255); text-transform: none; line-height: 120%; font-family: Arial, sans-serif; font-size: 15px; font-weight: normal; text-decoration: none; display: inline-block; mso-padding-alt: 0px;\" "
		                    + "href=\"" + hrefBtnAcao[i] + "\" target=\"_blank\">"
		                    + "<b style=\"font-weight: 700;\"><span style=\"color: rgb(255, 255, 255); font-weight: 700;\">"+ textoBtnAcao[i] + "</span></b></a>"
		                    + "</td></tr></tbody></table></td>";
	        	}
	        } else {
	            // Funciona tipo uma margem antes do rodape
	            body += "<td><p style=\"height:30px;\"></p></td>";
	        }
	        body += "</tr>";
	        body += "<tr><td>";
	        // Rodape
	        body += "                                    <p style=\"color:#797f89;margin-bottom:0;font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:13px;\"> "
	                + "                                        <a href=\"" + helpLink + "\" style=\"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;color:#ef5b25;text-decoration:none;float: right;\" target=\"_blank\" >Click +info</a>"
	                + "                                    </p>"
	                + "                                </td>"
	                + "                            </tr>"
	                + "                        </tbody>"
	                + "                    </table>"
	                + "                </td>"
	                + "            </tr>"
	                + "        </tbody>"
	                + "    </table></div></div>";
	        return body;
	    }
	}
	
}
