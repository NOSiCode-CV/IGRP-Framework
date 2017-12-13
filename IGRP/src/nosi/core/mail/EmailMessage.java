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
	}
	
	public static EmailMessage newInstance() {
		EmailMessage msg = new EmailMessage();
		return msg;
	}
	
	public boolean send() throws IOException {
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
			
			if(!validateEmail(this.to)) {
				System.out.println("Email not sent ... Invalid email: <" + this.to + "> ");
				return false;
			}
			if(!validateEmail(this.from)) {
				System.out.println("Email not sent ... Invalid email: <" + this.from + "> ");
				return false;
			}
			// Set From: header field of the header.
			message.setFrom(new InternetAddress(this.from));
			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO,
			new InternetAddress(this.to));
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
		String path = Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/") + "mail";
		String fileName = "mail.xml";
		File file = new File(path + File.separator + fileName);
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			fis = null;	
		}
		try {
			this.settings = new Properties();
			this.settings.loadFromXML(fis);
			flag = true;
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public synchronized boolean validateEmail(String email) {
		String pattern = "[a-zA-Z0-9!#$%&\\\\'*+\\\\/=?^_`{|}~-]+(?:\\\\.[a-zA-Z0-9!#$%&\\'*+\\\\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?"; 
		return email != null && !email.isEmpty();
	}
	
}
