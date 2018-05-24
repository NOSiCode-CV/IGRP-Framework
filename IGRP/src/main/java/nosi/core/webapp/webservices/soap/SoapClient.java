package nosi.core.webapp.webservices.soap;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.Map;

import javax.xml.soap.MessageFactory;
import javax.xml.soap.MimeHeaders;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPConnection;
import javax.xml.soap.SOAPConnectionFactory;
import javax.xml.soap.SOAPConstants;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPEnvelope;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPMessage;
import javax.xml.soap.SOAPPart;
/**
 * Iekiny Marcel
 * May 22, 2018
 */
public class SoapClient {
	
	private String wsdl;
	private Map<String, String> headers;
	private SOAPMessage request;
	
	private SOAPMessage response;
	
	public SoapClient() {}
	
	public SoapClient(String wsdl) {
		this.wsdl = wsdl;
	}
	
	public SoapClient(String wsdl, Map<String, String> headers) {
		this.wsdl = wsdl;
		this.headers = headers;
	}
	
	public void call() {
		try {
			SOAPConnectionFactory sfc = SOAPConnectionFactory.newInstance();
		    SOAPConnection connection = sfc.createConnection();
		    URL url = new URL(this.wsdl);
		    
		    if(this.headers != null)
		    	this.headers.forEach((k,v)->{
		    		request.getMimeHeaders().addHeader(k, v);
		    	});
		    
		    this.response = connection.call(this.request, url);
		    
		    response.writeTo(System.out);
		    
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void doRequest(String xmlContent) {
		ByteArrayInputStream is = new ByteArrayInputStream(xmlContent.getBytes());
		try {
			
			this.request = MessageFactory.newInstance(SOAPConstants.SOAP_1_2_PROTOCOL).createMessage(new MimeHeaders(), is);
			
			
			
			this.request.writeTo(System.out);
			
		} catch (IOException | SOAPException e) {
			e.printStackTrace();
		}finally {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	// message.getMimeHeaders().addHeader("header name", "header value"); 
	public void doRequest(String nsName, String nsValue, String operationName, String []paramNames, String []paramValues) {
		try {
			MessageFactory messageFactory = MessageFactory.newInstance();
			request = messageFactory.createMessage();
			SOAPPart soapPart = request.getSOAPPart();
	   	    SOAPEnvelope soapEnvelope = soapPart.getEnvelope();
	   	    soapEnvelope.addNamespaceDeclaration(nsName, nsValue);
			SOAPBody soapBody = soapEnvelope.getBody();
			SOAPElement soapElement = soapBody.addChildElement(operationName, nsName);
			if(paramNames != null)
				for(int i = 0; i < paramNames.length; i++) {
					soapElement.addChildElement(paramNames[i], nsName).addTextNode(paramValues[i]);
				}
			request.saveChanges();
			this.request.writeTo(System.out);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public SOAPMessage getResponse() {
		SOAPMessage message = null;
		
		return null;
	}

	public String getWsdl() {
		return wsdl;
	}

	public void setWsdl(String wsdl) {
		this.wsdl = wsdl;
	}

	public Map<String, String> getHeaders() {
		return headers;
	}

	public void setHeaders(Map<String, String> headers) {
		this.headers = headers;
	}
	
	public static void main(String[] args) {
		SoapClient sc = new SoapClient("http://ws.cdyne.com/ip2geo/ip2geo.asmx?wsdl");
		
		sc.doRequest("ws", "http://ws.cdyne.com/", "ResolveIP", new String[] {"ipAddress", "licenseKey"}, new String[] {"10.4.5.23", "fg32"});
		sc.call();
	}
	
}
