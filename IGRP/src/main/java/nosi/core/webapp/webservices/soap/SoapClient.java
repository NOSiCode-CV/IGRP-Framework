package nosi.core.webapp.webservices.soap;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import jakarta.xml.soap.MessageFactory;
import jakarta.xml.soap.MimeHeaders;
import jakarta.xml.soap.SOAPBody;
import jakarta.xml.soap.SOAPConnection;
import jakarta.xml.soap.SOAPConnectionFactory;
import jakarta.xml.soap.SOAPConstants;
import jakarta.xml.soap.SOAPEnvelope;
import jakarta.xml.soap.SOAPException;
import jakarta.xml.soap.SOAPFault;
import jakarta.xml.soap.SOAPMessage;
import jakarta.xml.soap.SOAPPart;

import org.json.JSONObject;
import org.json.XML;

import com.github.underscore.U;
import com.google.gson.Gson;

/**
 * Iekiny Marcel
 * May 22, 2018
 */
public class SoapClient {
	
	private String wsdl;
	private Map<String, String> headers;
	private SOAPMessage request;
	private SOAPMessage response;
	private List<String> errors;
	
	private String soapNameSpace; 
	private String soapProtocolVersion; 
	
	private String rawEnvelopeRequest; 
	private String rawEnvelopeResponse; 
	
	public static final String []DEFAULT_SOAP_NAMESPACES = {"SOAP-ENV", "env"}; 
	
	public SoapClient() {
		errors = new ArrayList<String>(); 
		soapProtocolVersion = SOAPConstants.SOAP_1_2_PROTOCOL; 
		//To make the below warning goes away 
		//WARNING: Using deprecated META-INF/services mechanism with non-standard property: javax.xml.soap.MetaFactory. Property javax.xml.soap.SAAJMetaFactory should be used instead.
		if(System.getProperty("javax.xml.soap.SAAJMetaFactory") == null)
			System.setProperty("javax.xml.soap.SAAJMetaFactory", "com.sun.xml.messaging.saaj.soap.SAAJMetaFactoryImpl");
	}
	
	public SoapClient(String wsdl) {
		this();
		this.wsdl = wsdl;
	}
	
	public SoapClient(String wsdl, Map<String, String> headers) {
		this(wsdl);
		this.headers = headers;
	}
	
	public void call() {
		SOAPConnection connection = null; 
		try {
			SOAPConnectionFactory sfc = SOAPConnectionFactory.newInstance();
			connection = sfc.createConnection();
		    URL url = new URL(this.wsdl);
		    this.response = connection.call(this.request, url);
		    if(this.response.getSOAPBody().hasFault()) {
		    	 SOAPFault fault = response.getSOAPBody().getFault();
		    	 errors.add(fault.getFaultCode() + "," + fault.getFaultString());
			 }
		}catch(Exception e) {
			errors.add(e.getMessage());
			e.printStackTrace();
		}finally {
			if(connection != null) {
				try {
					connection.close();
				} catch (SOAPException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public Map<String, Object> getResponseBody(String nsName) {
		Map<String, Object> result = null;
		try {
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			response.writeTo(out);
			this.rawEnvelopeResponse = new String(out.toByteArray());
			JSONObject msg = XML.toJSONObject(this.rawEnvelopeResponse); 
			if(msg.has(nsName + ":Envelope")) {
				JSONObject envelope = msg.getJSONObject(nsName + ":Envelope"); 
				if(envelope.has(nsName + ":Body")) {
					JSONObject body = envelope.getJSONObject(nsName + ":Body");
					result = body.toMap(); 
				}
			}	
		}catch(Exception e) {
			errors.add(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public Map<String, Object> getResponseHeader(String nsName) {
		Map<String, Object> result = null;
		try {
			String xml = "";
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			response.writeTo(out);
			xml = new String(out.toByteArray());
			JSONObject msg = XML.toJSONObject(xml); 
			if(msg.has(nsName + ":Envelope")) {
				JSONObject envelope = msg.getJSONObject(nsName + ":Envelope"); 
				if(envelope.has(nsName + ":Body")) {
					JSONObject header = envelope.getJSONObject(nsName + ":Header");
					result = header.toMap(); 
				}
			}	
		}catch(Exception e) {
			errors.add(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public void doRequest(String xmlContent) {
		ByteArrayInputStream is = new ByteArrayInputStream(xmlContent.getBytes());
		try {
			MimeHeaders h = new MimeHeaders();
			 if(this.headers != null) {
			    	this.headers.forEach((k,v)->{
			    		h.addHeader(k, v);
			    	});
			 }
			request = MessageFactory.newInstance(this.soapProtocolVersion).createMessage(h, is); 
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

	public void doRequest(Map<String, String> namespaces, Map<String, Object> bodyContent) {
		try {
			MessageFactory messageFactory = MessageFactory.newInstance(this.soapProtocolVersion);
			request = messageFactory.createMessage();
			SOAPPart soapPart = request.getSOAPPart();
			SOAPEnvelope soapEnvelope = soapPart.getEnvelope();
			SOAPBody soapBody = soapEnvelope.getBody();
			if(soapNameSpace != null && !soapNameSpace.isEmpty()) {
				for(String ns : DEFAULT_SOAP_NAMESPACES) 
					soapEnvelope.removeNamespaceDeclaration(ns);
				soapEnvelope.setPrefix(soapNameSpace);
		   	    request.getSOAPHeader().setPrefix(soapNameSpace);
				soapBody.setPrefix(soapNameSpace); 
			}
	   	    if(namespaces != null)
	   	    	namespaces.forEach((k, v)->{
	   	    		try {
						soapEnvelope.addNamespaceDeclaration(k, v);
					} catch (SOAPException e) {
						e.printStackTrace();
					}
	   	    	});
			soapBody.addTextNode(":_r"); 
			request.saveChanges();
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			request.writeTo(out);
			String rawEnvelope = new String(out.toByteArray());
			convertMapBodyContentToSoapRequestBodyXmlConntent(bodyContent);
			this.rawEnvelopeRequest = rawEnvelope.replace(":_r", this.rawEnvelopeRequest);
			this.doRequest(this.rawEnvelopeRequest);
		}catch(Exception e) {
			errors.add(e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void convertMapBodyContentToSoapRequestBodyXmlConntent(Map<String, Object> mapBodyContent) {
		String json = new Gson().toJson(mapBodyContent);
		this.rawEnvelopeRequest = U.jsonToXml(json);
		this.rawEnvelopeRequest = this.rawEnvelopeRequest.replaceAll("__HI__", ":"); 
		this.rawEnvelopeRequest = this.rawEnvelopeRequest.replace("<?xml version=\"1.0\" encoding=\"UTF-8\"?>", ""); 
		this.rawEnvelopeRequest = this.rawEnvelopeRequest.replaceAll(" number=\"true\"", "")
										.replaceAll(" array=\"true\"", "")
										.replaceAll(" boolean=\"true\"", ""); 
		this.rawEnvelopeRequest = this.rawEnvelopeRequest.trim();
	}
	
	public SOAPMessage getResponse() {
		return response;
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
	
	public List<String> getErrors(){
		return errors;
	}
	
	public boolean hasErrors() {
		return !errors.isEmpty();
	}

	public String getSoapProtocolVersion() {
		return soapProtocolVersion;
	}

	public void setSoapProtocolVersion(String soapProtocolVersion) {
		this.soapProtocolVersion = soapProtocolVersion;
	}

	public String getSoapNameSpace() {
		return soapNameSpace;
	}

	public void setSoapNameSpace(String soapNameSpace) {
		this.soapNameSpace = soapNameSpace;
	}

	public String getRawEnvelopeRequest() {
		return rawEnvelopeRequest;
	}
	
	public String getRawEnvelopeResponse() {
		return rawEnvelopeResponse;
	}
	
}
