package nosi.core.integration.pdex.email;

import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Iekiny Marcel
 * Mar 11, 2021
 */
public class PdexEmailGateway {
	
	private String endpoint; 
	private String httpAuthorizationHeaderValue;
	private PdexEmailGatewayPayloadDTO payload; 
	private List<String> errors; 
	
	public PdexEmailGateway(String endpoint, String httpAuthorizationHeaderValue, PdexEmailGatewayPayloadDTO payload) {
		this(endpoint, httpAuthorizationHeaderValue); 
		this.payload = payload; 
	} 
	
	public PdexEmailGateway(String endpoint, String httpAuthorizationHeaderValue) {
		this.endpoint = endpoint;
		this.httpAuthorizationHeaderValue = httpAuthorizationHeaderValue;
		errors = new ArrayList<String>(); 
	}
	
	public void setPayload(PdexEmailGatewayPayloadDTO payload) {
		this.payload = payload;
	}
	
	public boolean send() { 
		validate(); 
		if(errors.isEmpty()) {
			Client client = ClientBuilder.newClient(); 
			try {
				WebTarget webTarget = client.target(endpoint); 
				Invocation.Builder invocationBuilder  = webTarget.request(MediaType.APPLICATION_JSON).header(HttpHeaders.AUTHORIZATION, httpAuthorizationHeaderValue); 
				javax.ws.rs.core.Response response  = invocationBuilder.post(Entity.json(convertPayloadToJson()));
				if(response.getStatus() == 200) {
					JSONObject jsonResult = new JSONObject(response.readEntity(String.class)); 
					JSONObject result = jsonResult.optJSONObject("result"); 
					if(result != null && result.optBoolean("success") == false)
						errors.add("The email was not sent. An error has occurred."); 
				}else {
					errors.add("The email was not sent. An error has occurred."); 
				}
			} catch (Exception e) {
				e.printStackTrace(); 
				errors.add(e.getMessage());
			}finally {
				client.close();
			}
		}
		return errors.isEmpty(); 
	}
	
	private void validate() {
		if(payload.getCode() == null || payload.getCode().isEmpty()) 
			errors.add("\"" + PdexEmailGatewayConstants.CODE.description() + "\" cannot be blank."); 
		if(payload.getFrom() == null || payload.getFrom().isEmpty()) 
			errors.add("\"" + PdexEmailGatewayConstants.FROM.description() + "\" cannot be blank."); 
		if(payload.getTo() == null || payload.getTo().isEmpty()) 
			errors.add("\"" + PdexEmailGatewayConstants.TO.description() + "\" cannot be blank."); 
		if(payload.getSubject() == null || payload.getSubject().isEmpty()) 
			errors.add("\"" + PdexEmailGatewayConstants.SUBJECT.description() + "\" cannot be blank."); 
		if(payload.getContent() == null || payload.getContent().isEmpty()) 
			errors.add("\"" + PdexEmailGatewayConstants.CONTENT.description() + "\" cannot be blank."); 
		if(payload.getContentType() == null || payload.getContentType().isEmpty()) 
			errors.add("\"" + PdexEmailGatewayConstants.CONTENT_TYPE.description() + "\" cannot be blank."); 
		if(payload.getEncoding() == null || payload.getEncoding().isEmpty()) 
			errors.add("\"" + PdexEmailGatewayConstants.ENCODING.description() + "\" cannot be blank."); 
		for(int i = 0; i < payload.getAttachments().size(); i++) { 
			PdexEmailGatewayPayloadDTO.Attachment attach = payload.getAttachments().get(i); 
			if(attach != null) {
				if(attach.getName() == null || attach.getName().isEmpty()) 
					errors.add(PdexEmailGatewayConstants.ATTACHMENT_NAME.description() + " at position (" + i + ")\" is invalid."); 
				if(attach.getContent() == null || attach.getContent().isEmpty()) 
				errors.add(PdexEmailGatewayConstants.ATTACHMENT_CONTENT.description() + " at position (" + i + ") is invalid."); 
			}else
				errors.add("\"" + PdexEmailGatewayConstants.ATTACHMENTS.description() + "\" cannot be NULL."); 
		}
	}
	
	private String convertPayloadToJson() {
		JSONObject jsonObject = new JSONObject(); 
		jsonObject.put(PdexEmailGatewayConstants.CODE.value(), payload.getCode()); 
		jsonObject.put(PdexEmailGatewayConstants.FROM.value(), payload.getFrom()); 
		jsonObject.put(PdexEmailGatewayConstants.TO.value(), payload.getTo()); 
		jsonObject.put(PdexEmailGatewayConstants.SUBJECT.value(), payload.getSubject()); 
		jsonObject.put(PdexEmailGatewayConstants.CONTENT.value(), payload.getContent()); 
		jsonObject.put(PdexEmailGatewayConstants.CONTENT_TYPE.value(), payload.getContentType()); 
		jsonObject.put(PdexEmailGatewayConstants.ENCODING.value(), payload.getEncoding()); 
		if(payload.getCc() != null && !payload.getCc().isEmpty())
			jsonObject.put(PdexEmailGatewayConstants.CC.value(), payload.getCc()); 
		if(payload.getBcc() != null && !payload.getBcc().isEmpty())
			jsonObject.put(PdexEmailGatewayConstants.BCC.value(), payload.getBcc()); 
		if(payload.getReplyTo() != null && !payload.getReplyTo().isEmpty())
			jsonObject.put(PdexEmailGatewayConstants.REPLY_TO.value(), payload.getReplyTo()); 
		if(!payload.getAttachments().isEmpty()) {
			JSONArray jsonArray = new JSONArray(); 
			for(PdexEmailGatewayPayloadDTO.Attachment attach : payload.getAttachments()) {
				JSONObject element = new JSONObject(); 
				element.put(PdexEmailGatewayConstants.ATTACHMENT_NAME.value(), attach.getName()); 
				element.put(PdexEmailGatewayConstants.ATTACHMENT_CONTENT.value(), attach.getContent()); 
				jsonArray.put(element); 
			}
			jsonObject.put(PdexEmailGatewayConstants.ATTACHMENTS.value(), jsonArray); 
		}
		return jsonObject.toString();  
	}
	
	public List<String> getErrors() {
		return errors;
	}
	
	public boolean hasErrors() {
		return !errors.isEmpty();
	}
}
