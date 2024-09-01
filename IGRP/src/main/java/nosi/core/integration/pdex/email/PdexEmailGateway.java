package nosi.core.integration.pdex.email;

import java.net.InetAddress;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.Invocation;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.HttpHeaders;
import jakarta.ws.rs.core.MediaType;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Iekiny Marcel
 * Mar 11, 2021
 */
public class PdexEmailGateway {
	
	private final String endpoint;
	private final String httpAuthorizationHeaderValue;
	private PdexEmailGatewayPayloadDTO payload; 
	private final List<String> errors;
	
	public static final int DEFAULT_TIMEOUT = 1000; 
	
	public PdexEmailGateway(String endpoint, String httpAuthorizationHeaderValue, PdexEmailGatewayPayloadDTO payload) {
		this(endpoint, httpAuthorizationHeaderValue); 
		this.payload = payload; 
	} 
	
	public PdexEmailGateway(String endpoint, String httpAuthorizationHeaderValue) {
		this.endpoint = endpoint;
		this.httpAuthorizationHeaderValue = httpAuthorizationHeaderValue;
		errors = new ArrayList<>();
	}
	
	public void setPayload(PdexEmailGatewayPayloadDTO payload) {
		this.payload = payload;
	}

	public boolean send() {
		validate();
		if (!ping(this.endpoint, DEFAULT_TIMEOUT))
			errors.add("Connection Timeout. The EmailGateway is not Available. Please check your network connection.");
		if (errors.isEmpty()) {
			Client client = ClientBuilder.newClient();
			try {
				WebTarget webTarget = client.target(endpoint);
				Invocation.Builder invocationBuilder = webTarget.request(MediaType.APPLICATION_JSON).header(HttpHeaders.AUTHORIZATION, httpAuthorizationHeaderValue);
				try (jakarta.ws.rs.core.Response response = invocationBuilder.post(Entity.json(convertPayloadToJson()))) {
                   switch (response.getStatus()) {
                      case 200 -> {
                         JSONObject jsonResult = new JSONObject(response.readEntity(String.class));
                         JSONObject result = jsonResult.optJSONObject("result");
                         if (result != null && !result.optBoolean("success"))
                            errors.add("The email was not sent. An error has occurred.");
                      }
                      case 401, 403 ->
                              errors.add("The email was not sent. An Unauthorized or Forbidden error has occurred. Please check the credencials.");
                      case 500 ->
                              errors.add("The email was not sent. An Internal Server Error has occurred. ResponseBody: " + response.readEntity(String.class));
                      default -> {
                      }
                   }
				}
			} catch (Exception e) {
				e.printStackTrace();
				errors.add(e.getMessage());
			} finally {
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
		for (int i = 0; i < payload.getAttachments().size(); i++) {
			PdexEmailGatewayPayloadDTO.Attachment attach = payload.getAttachments().get(i);
			if (attach != null) {
				if (attach.getName() == null || attach.getName().isEmpty())
					errors.add(PdexEmailGatewayConstants.ATTACHMENT_NAME.description() + " at position (" + i + ")\" is invalid.");
				if (attach.getContent() == null || attach.getContent().isEmpty())
					errors.add(PdexEmailGatewayConstants.ATTACHMENT_CONTENT.description() + " at position (" + i + ") is invalid.");
			} else
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
	
	public static boolean ping(final String hostUrl, final int timeout) {
		boolean success = false; 
		try {
			return InetAddress.getByName(new URL(hostUrl).getHost()).isReachable(DEFAULT_TIMEOUT);
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return false;
	}
}
