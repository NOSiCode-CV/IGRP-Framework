package nosi.core.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Iekiny Marcel
 * Dec 12, 2017
 */
public final class EmailMessage {
	
	private String to;
	private String from;
	private String subject;
	private String msg;
	
	private Properties settings;
	
	private String auth_username;
	private String auth_password;
	
	private EmailMessage() {}
	
	public static EmailMessage newInstance() {
		EmailMessage msg = new EmailMessage();
		msg.newSettings(null);
		msg.authenticate("username", "password");
		return msg;
	}
	
	public void send() {
		// Get the default Session object.
				Session session = Session.getDefaultInstance(this.settings,
						new javax.mail.Authenticator() {
							protected PasswordAuthentication getPasswordAuthentication() {
								return new PasswordAuthentication(auth_username, auth_password);
							}
						});
				// Set response content type
				try{
					// Create a default MimeMessage object.
					MimeMessage message = new MimeMessage(session); 
					// Set From: header field of the header.
					message.setFrom(new InternetAddress(this.from));
					// Set To: header field of the header.
					message.addRecipient(Message.RecipientType.TO,
					new InternetAddress(this.to));
					// Set Subject: header field
					message.setSubject(this.subject);
					// Now set the actual message 
					message.setText(this.msg, "utf-8", "html");	
					// Send message
					Transport.send(message);
				}catch (MessagingException mex) {
					System.out.println("Error ... sending email ...");
					mex.printStackTrace();
				}
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
}
