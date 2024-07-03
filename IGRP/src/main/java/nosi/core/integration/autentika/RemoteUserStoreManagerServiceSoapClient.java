package nosi.core.integration.autentika;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import nosi.core.integration.autentika.dto.UserRequestDTO;
import nosi.core.integration.autentika.dto.AuthenticateRequestDTO;
import nosi.core.integration.autentika.dto.ClaimDTO;
import nosi.core.integration.autentika.dto.UpdateCredentialByAdminRequestDTO;
import nosi.core.integration.autentika.dto.UpdateCredentialRequestDTO;
import nosi.core.integration.autentika.dto.UserClaimValuesRequestDTO;
import nosi.core.integration.autentika.dto.UserClaimValuesResponseDTO;
import nosi.core.webapp.Core;
import nosi.core.webapp.webservices.soap.SoapClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author Iekiny Marcel
 * Jul 26, 2021
 */
public class RemoteUserStoreManagerServiceSoapClient {

	private static final Logger LOGGER = LoggerFactory.getLogger(RemoteUserStoreManagerServiceSoapClient.class);
	
	private String endpoint; 
	private String username; 
	private String password; 
	private final String HTTP_AUTHENTICATION_TYPE = "Basic";
	private String soapAction;
	
	public RemoteUserStoreManagerServiceSoapClient(String endpoint, String username, String password) {
		super();
		this.endpoint = endpoint; 
		this.username = username; 
		this.password = password; 
	}
	
	private Map<String, String> buildHttpHeaders(){
		Map<String, String> headers = new HashMap<String, String>();
		headers.put("Content-Type", "application/soap+xml;charset=UTF-8;action=\"" + soapAction + "\"");
		headers.put("Authorization", HTTP_AUTHENTICATION_TYPE + " "
				+ Base64.getEncoder().encodeToString((username + ":" + password).getBytes()));
		return headers;
	}
	
	private SoapClient soapClient(Map<String, String> namespaces, Map<String, String> headers, Map<String, Object> bodyContent, String soapNameSpace, String soapProtocolVersion) {
		SoapClient sc = new SoapClient(this.endpoint);
		sc.setHeaders(headers);
		sc.setSoapNameSpace(soapNameSpace);
		sc.setSoapProtocolVersion(soapProtocolVersion);
		sc.doRequest(namespaces, (LinkedHashMap<String, Object>) bodyContent);
		sc.call();
		return sc;
	}
	
	private Map<String, String> buildNamespaces(){
		Map<String, String> namespaces = new HashMap<String, String>();
		namespaces.put("ser", "http://service.ws.um.carbon.wso2.org");
		return namespaces;
	}
	
	public UserClaimValuesResponseDTO getUserClaimValues(UserClaimValuesRequestDTO userClaimValuesRequestDTO) {
		this.soapAction = "urn:getUserClaimValues";
		UserClaimValuesResponseDTO userClaimValuesResponseDTO = null;
		// An Map of Soap HTTP Headers 
		Map<String, String> headers = buildHttpHeaders();
		// An Map of Soap Envelope namespace 
		Map<String, String> namespaces = buildNamespaces();
		// content 
		Map<String, Object> bodyContent = new LinkedHashMap<String, Object>();
		Map<String, Object> subContent = new LinkedHashMap<String, Object>();
		subContent.put("ser:userName", userClaimValuesRequestDTO.getUserName() != null ? userClaimValuesRequestDTO.getUserName() : "");
		subContent.put("ser:profileName", userClaimValuesRequestDTO.getProfileName() != null ? userClaimValuesRequestDTO.getProfileName() : "");
		bodyContent.put("ser:getUserClaimValues", subContent);
		// Makes request to the soap endpoint 
		SoapClient sc = soapClient(namespaces, headers, bodyContent,"soap", javax.xml.soap.SOAPConstants.SOAP_1_2_PROTOCOL);
		// check if success 
		if (!sc.hasErrors()) {
			Map<String, Object> map = sc.getResponseBody("soapenv");
			if(map != null) {
				Map<String, Object> nsGetUserClaimValuesResponse = (Map<String, Object>) map.get("ns:getUserClaimValuesResponse");
				if(nsGetUserClaimValuesResponse != null) {
					List<Map<String, Object>> nsReturns = (List<Map<String, Object>>) nsGetUserClaimValuesResponse.get("ns:return"); 
					if(nsReturns != null && !nsReturns.isEmpty()) {
						userClaimValuesResponseDTO = new UserClaimValuesResponseDTO(); 
						for(Map<String, Object> nsReturn : nsReturns) { 
							ClaimDTO claimDTO = new ClaimDTO(); 
							claimDTO.setClaimUri(nsReturn.get("ax2615:claimUri") instanceof String ? (String)nsReturn.get("ax2615:claimUri") : null);
							claimDTO.setDescription(nsReturn.get("ax2615:description") instanceof String ? (String) nsReturn.get("ax2615:description") : null);
							claimDTO.setDialectURI(nsReturn.get("ax2615:dialectURI") instanceof String ? (String)nsReturn.get("ax2615:dialectURI") : null);
							if(nsReturn.get("ax2615:displayOrder")!=null)
								claimDTO.setDisplayOrder((int) nsReturn.get("ax2615:displayOrder"));
							claimDTO.setDisplayTag(nsReturn.get("ax2615:displayTag") instanceof String ? (String)nsReturn.get("ax2615:displayTag") : null);
							claimDTO.setRegEx(nsReturn.get("ax2615:regEx") instanceof String ? (String)nsReturn.get("ax2615:regEx") : null);
							if(nsReturn.get("ax2615:required")!=null)
								claimDTO.setRequired((boolean)nsReturn.get("ax2615:required"));
							if(nsReturn.get("ax2615:supportedByDefault")!=null)
								claimDTO.setSupportedByDefault((boolean)nsReturn.get("ax2615:supportedByDefault"));
							claimDTO.setValue(nsReturn.get("ax2615:value") instanceof String ? (String)nsReturn.get("ax2615:value") : null);
							userClaimValuesResponseDTO.getClaimDTOs().add(claimDTO);
						}
					}
				}
			}
		} else
			sc.getErrors().forEach(LOGGER::error);

		return userClaimValuesResponseDTO;
	}
	
	public boolean authenticate(AuthenticateRequestDTO userClaimValuesRequestDTO) {
		this.soapAction = "urn:authenticate";
		boolean isAuthenticated = false;
		// An Map of Soap HTTP Headers
		Map<String, String> headers = buildHttpHeaders();
		// An Map of Soap Envelope namespace
		Map<String, String> namespaces = buildNamespaces();
		// content
		Map<String, Object> bodyContent = new LinkedHashMap<String, Object>();
		Map<String, Object> subContent = new LinkedHashMap<String, Object>();
		subContent.put("ser:userName", userClaimValuesRequestDTO.getUserName());
		subContent.put("ser:credential", userClaimValuesRequestDTO.getCredential());
		bodyContent.put("ser:authenticate", subContent);
		// Makes request to the soap endpoint
		SoapClient sc = soapClient(namespaces, headers, bodyContent, "soap", javax.xml.soap.SOAPConstants.SOAP_1_2_PROTOCOL);
		Map<String, Object> map = sc.getResponseBody("soapenv");
		// check if success
		if (!sc.hasErrors()) {
			Map<String, Object> nsAuthenticateResponse = (Map<String, Object>) map.get("ns:authenticateResponse");
			isAuthenticated = (boolean) nsAuthenticateResponse.get("ns:return"); 
		}
		return isAuthenticated;
	}
	
	public boolean isExistingUser(String userName) {
		this.soapAction = "urn:isExistingUser"; 
		boolean isUserExists = false;
		// An Map of Soap HTTP Headers
		Map<String, String> headers = buildHttpHeaders();
		// An Map of Soap Envelope namespace
		Map<String, String> namespaces = buildNamespaces();
		// content
		Map<String, Object> bodyContent = new LinkedHashMap<String, Object>();
		Map<String, Object> subContent = new LinkedHashMap<String, Object>();
		subContent.put("ser:userName", userName != null ? userName : "");
		bodyContent.put("ser:isExistingUser", subContent);
		// Makes request to the soap endpoint
		SoapClient sc = soapClient(namespaces, headers, bodyContent, "soap", javax.xml.soap.SOAPConstants.SOAP_1_2_PROTOCOL);
		// check if success
		if (!sc.hasErrors()) {
			Map<String, Object> map = sc.getResponseBody("soapenv");
			Map<String, Object> nsAuthenticateResponse = (Map<String, Object>) map.get("ns:isExistingUserResponse");
			isUserExists = (boolean) nsAuthenticateResponse.get("ns:return"); 
		}
		return isUserExists;
	}
	
	public boolean updateCredential(UpdateCredentialRequestDTO updateCredentialRequestDTO) {
		this.soapAction = "urn:updateCredential"; 
		// An Map of Soap HTTP Headers
		Map<String, String> headers = buildHttpHeaders();
		// An Map of Soap Envelope namespace
		Map<String, String> namespaces = buildNamespaces();
		// content
		Map<String, Object> bodyContent = new LinkedHashMap<String, Object>();
		Map<String, Object> subContent = new LinkedHashMap<String, Object>();
		subContent.put("ser:userName", updateCredentialRequestDTO.getUserName());
		subContent.put("ser:newCredential", updateCredentialRequestDTO.getNewCredential());
		subContent.put("ser:oldCredential", updateCredentialRequestDTO.getOldCredential());
		bodyContent.put("ser:updateCredential", subContent);
		// Makes request to the soap endpoint and return 
		return !soapClient(namespaces, headers, bodyContent, "soap", javax.xml.soap.SOAPConstants.SOAP_1_2_PROTOCOL).hasErrors();
	}
	
	public boolean updateCredentialByAdmin(UpdateCredentialByAdminRequestDTO updateCredentialByAdminRequestDTO) {
		this.soapAction = "urn:updateCredentialByAdmin"; 
		// An Map of Soap HTTP Headers
		Map<String, String> headers = buildHttpHeaders();
		// An Map of Soap Envelope namespace
		Map<String, String> namespaces = buildNamespaces();
		// content
		Map<String, Object> bodyContent = new LinkedHashMap<String, Object>();
		Map<String, Object> subContent = new LinkedHashMap<String, Object>();
		subContent.put("ser:userName", updateCredentialByAdminRequestDTO.getUserName());
		subContent.put("ser:newCredential", updateCredentialByAdminRequestDTO.getNewCredential());
		bodyContent.put("ser:updateCredentialByAdmin", subContent);
		// Makes request to the soap endpoint and return 
		return !soapClient(namespaces, headers, bodyContent, "soap", javax.xml.soap.SOAPConstants.SOAP_1_2_PROTOCOL).hasErrors();
	}
	
	public boolean addUser(UserRequestDTO userRequestDTO) {
		this.soapAction = "urn:addUser"; 
		// An Map of Soap HTTP Headers
		Map<String, String> headers = buildHttpHeaders();
		// An Map of Soap Envelope namespace
		Map<String, String> namespaces = buildNamespaces();
		namespaces.put("xsd", "http://common.mgt.user.carbon.wso2.org/xsd");
		// content
		Map<String, Object> bodyContent = new LinkedHashMap<String, Object>();
		Map<String, Object> subContent = new LinkedHashMap<String, Object>();
		subContent.put("ser:userName", userRequestDTO.getUserName() != null ? userRequestDTO.getUserName() : "");
		subContent.put("ser:credential",userRequestDTO.getCredential() != null ? userRequestDTO.getCredential() : "");
		subContent.put("ser:roleList", !userRequestDTO.getRoleList().isEmpty() ? userRequestDTO.getRoleList() : "");
		List<Map<String, Object>> claims = new ArrayList<Map<String, Object>>();
		for(ClaimDTO claim : userRequestDTO.getClaims()) {
			Map<String, Object> claimMap = new LinkedHashMap<String, Object>();
			claimMap.put("xsd:claimURI", claim.getClaimUri());
			claimMap.put("xsd:value",  claim.getValue());
			claims.add(claimMap); 
		}
		subContent.put("ser:claims", claims);
		subContent.put("ser:profileName", !userRequestDTO.getProfileName().isEmpty() ? userRequestDTO.getProfileName() : "");
		subContent.put("ser:requirePasswordChange", userRequestDTO.isRequirePasswordChange());
		bodyContent.put("ser:addUser", subContent);
		// Makes request to the soap endpoint and return 
		return !soapClient(namespaces, headers, bodyContent, "soap", javax.xml.soap.SOAPConstants.SOAP_1_2_PROTOCOL).hasErrors(); 
	}
}
