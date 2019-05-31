package nosi.core.mail;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
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

import nosi.core.config.Config;
import nosi.core.webapp.Igrp;

/**
 * Iekiny Marcel
 * Dec 12, 2017
 */
public final class EmailMessage { // Not inherit 
	
	private String to;
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
	
	private EmailMessage() { // Not instantiate 
		if(!this.load()) 
			this.loadDefaultConfig();
		else {
			this.auth_username = this.getSettings().getProperty("mail.user");
			this.auth_password = this.getSettings().getProperty("mail.password");
		}
		this.attaches = new ArrayList<File>();
		this.multipleRecipients = false;
	}
	
	public static EmailMessage newInstance() {
		EmailMessage msg = new EmailMessage();
		return msg;
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
		this.auth_username = "";
		this.auth_password = "";
		this.settings = properties;
	}
	
	public EmailMessage setTo(String to) {
		this.to = to;
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
	
	private boolean load() {
		boolean flag = false;
		
		String fileName = "main.xml";
		String path = new Config().getBasePathConfig() + File.separator + "common";
		File file = new File(getClass().getClassLoader().getResource(path + File.separator + fileName).getPath());
		
		try(FileInputStream fis = new FileInputStream(file)) {
			this.settings = new Properties();
			this.settings.loadFromXML(fis);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean send() throws IOException {
		// Get the default Session object.
		Session session = Session.getInstance(this.settings,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(auth_username, auth_password);
				}
		});
		// Set response content type 
		try{
			// Create a default MimeMessage object. 
			MimeMessage message = new MimeMessage(session); 
			
			if(!validateEmail(this.from)) {
				System.out.println("Email not sent ... Invalid email: <" + this.from + "> ");
				return false;
			}
			// Set From: header field of the header.
			message.setFrom(new InternetAddress(this.from));
			
			// Set To: header field of the header. 
			if(this.multipleRecipients) {
				if(!validateEmails(this.to)) {
					System.out.println("Email not sent ... one of email is invalid: <" + this.to + "> ");
					return false;
				}
				message.addRecipients(Message.RecipientType.CC,InternetAddress.parse(this.to)); // this.to is a string separated by comma 
			}else {
				if(!validateEmail(this.to)) {
					System.out.println("Email not sent ... Invalid email: <" + this.to + "> ");
					return false;
				}
				message.addRecipient(Message.RecipientType.TO,new InternetAddress(this.to));
			}
			
			if(this.replyTo != null && !this.replyTo.isEmpty() && validateEmails(this.replyTo)) {
				message.setReplyTo(InternetAddress.parse(this.replyTo));
			}
			
			// Set Subject: header field
			message.setSubject(this.subject);
			// If there is any attach ... 
			if(this.attaches.size() > 0) {
				// Create a multipar message 
		        Multipart multipart = new MimeMultipart();
		        MimeBodyPart mbp = new MimeBodyPart();
			    // Now set the actual message 
				if(this.charset != null && !this.charset.isEmpty() && this.subType != null && !this.subType.isEmpty())
					mbp.setText(this.msg, this.charset, this.subType);
				else if(this.charset != null && !this.charset.isEmpty())
					mbp.setText(this.msg, this.charset);
				else if(this.subType != null && !this.subType.isEmpty())
					message.setText(this.msg, null, this.subType);
				else
					mbp.setText(this.msg);
		        mbp.setContent(this.msg, this.subType);
		        multipart.addBodyPart(mbp);
				for(File attach : this.attaches) {
					// Create the message part 
					MimeBodyPart messageBodyPart = new MimeBodyPart();
			         messageBodyPart.attachFile(attach);
			         // Set text message part 
			         multipart.addBodyPart(messageBodyPart);
			         // Part two is attachment 
			        /*// For javax.mail <= 1.3 :-) 
			         messageBodyPart = new MimeBodyPart(); 
			         DataSource source = new FileDataSource(attach); 
			         messageBodyPart.setDataHandler(new DataHandler(source));
			         messageBodyPart.setFileName(attach.getName());
			         multipart.addBodyPart(messageBodyPart);*/
				}
				 // Send the complete message parts 
		         message.setContent(multipart);
			}else {
				// Now set the actual message 
				if(this.charset != null && !this.charset.isEmpty() && this.subType != null && !this.subType.isEmpty())
					message.setText(this.msg, this.charset, this.subType);
				else if(this.charset != null && !this.charset.isEmpty())
					message.setText(this.msg, this.charset);
				else if(this.subType != null && !this.subType.isEmpty())
					message.setText(this.msg, null, this.subType);
				else
					message.setText(this.msg);
			}
			// Send message
			Transport.send(message);
		return true;
		}catch (MessagingException mex) {
			System.out.println("Error ... sending email ... ");
			mex.printStackTrace();
		}
		return false;
	}
	
	public static boolean validateEmail(String email) {
		String pattern = "[a-zA-Z0-9!#$%&\\'*+\\/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?"; 
		return email != null && !email.isEmpty() && email.matches(pattern);
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
	
	public static class PdexTemplate{
		
		public PdexTemplate() {}
		
		
		public static String getCorpoFormatado(String boxTitle, String msgBoasVindas, String[] paragrafos, String []textoBtnAcao, String []hrefBtnAcao, String helpLink) {
			if(paragrafos.length == 0 || msgBoasVindas.isEmpty()) {
				return "";
			}
			
	        String body = ""
	                + "<table style=\"border-width: 0px; border-collapse:collapse;border-spacing:0;color:#333;background:#fff;padding:0;margin:0;width:100%;font: 15px 'Helvetica Neue', Helvetica, Arial, sans-serif;\">"
	                + "        <tbody>"
	                + "            <tr style=\"width:100%;\">"
	                + "                <td style=\"background:#EEEEEE;padding:0px;vertical-align: top;text-align:left;font: 15px 'Helvetica Neue', Helvetica, Arial, sans-serif;\">"
	                + "                    <table style=\"border:none;padding:0 18px;margin:30px auto;width:550px; min-height: 250px;\">"
	                + "                        <tbody>"
	                + "                            <tr style=\"width:100%;height:57px;\" >"
	                + "                                <td style=\"border-top-color: #ddd; border-top-width: 1px; border-top-style: solid; border-bottom-color: #ddd; border-bottom-width: 1px; border-bottom-style: solid; font-size:36px;text-align:center;color:#333333;padding:0px;margin: 0 auto;\">"
	                + "                                    <strong>" + boxTitle + "</strong>"
	                + "                                </td>"
	                + "                            </tr>"
	                + "                            <tr style=\"width:100%;\" >"
	                + "                                <td style=\"border-bottom-color: #ddd; border-bottom-width: 1px; border-bottom-style: solid; background:#FFFFFF;padding:18px;vertical-align:top;text-align:left;\">"
	                + "                                    <h1 style=\"font-size:20px;margin:0;color:#424242\">" + msgBoasVindas + "</h1>";

	        
	        // Paragrafos
	        for (String paragrafo : paragrafos) {
	        	body += "                                 <p style=\"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:14px;color:#424242;margin-top:8px; margin-left: 21px;\">" + paragrafo + "</p>";
			}

	        if (textoBtnAcao != null && textoBtnAcao.length > 0 && hrefBtnAcao != null && hrefBtnAcao.length > 0 && hrefBtnAcao.length == textoBtnAcao.length) {
	           
	        	for(int i = 0 ; i < hrefBtnAcao.length; i++) {
	        		 // Botao Accao
		            body += ""
		                    + "                                <p style=\"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;\">"
		                    + "                                    <a href=\"" + hrefBtnAcao[i] + "\" style=\"color:#ffffff;background:#5cb85c;padding:12px;width:200px;display:block;text-align:center;text-decoration:none;font-weight:700;font-size:16px;font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;margin:24px auto 24px;border-radius:3px;line-height:20px\" target=\"_blank\" >" + textoBtnAcao[i] + "</a>"
		                    + "                                </p>";
	        	}
	        	
	        } else {
	            // Funciona tipo uma margem antes do rodape
	            body += ""
	                    + "                                <p style=\"height:30px;\"></p>";
	        }
	        // Rodape
	        body += "                                    <p style=\"color:#797f89;margin-bottom:0;font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;font-size:13px;\"> "
	                + "                                        <a href=\"" + helpLink + "\" style=\"font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;color:#ef5b25;text-decoration:none\" target=\"_blank\" >Clique aqui</a>" + " para mais informações"
	                + "                                    </p>";
	        body += "                                </td>"
	                + "                            </tr>"
	                + "                        </tbody>"
	                + "                    </table>"
	                + "                </td>"
	                + "            </tr>"
	                + "        </tbody>"
	                + "    </table>";

	        return body;
	    }
	}
	
	public static void main(String[] args) throws IOException {
		String email = "iekinyfernandes@gmail.com";
		String aux = "<p>Activity Test Email </p>";
		boolean r = EmailMessage.newInstance()
				.authenticate("igrpframeworkjava@gmail.com", "Pa$$w0rd10")
				.setTo(email).setFrom("igrpframeworkjava@gmail.com").setSubject("Reset de Password")
				.setMsg(aux, "utf-8", "html").send();
	}
	
}
