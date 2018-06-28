package nosi.core.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.security.cert.CertificateException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBElement;
import javax.xml.namespace.QName;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.wso2.carbon.um.ws.service.AddUser;
import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerService;
import org.wso2.carbon.user.mgt.common.xsd.ClaimValue;

import nosi.core.config.Config;
import nosi.core.webapp.User;
import service.client.WSO2UserStub;

import java.util.Arrays;
import java.util.Base64;
import java.util.Properties;
import java.util.stream.Collector;
import java.util.stream.Collectors;
/**
 * Marcel Iekiny
 * Nov 02, 2017
 */
/** 
 	This API is the one of a way that allow you to guarantee the SSO (Single Sign On) from others Web Applications to IGRP. 
 	Endpoint: ../igrpsso?_u=XYX..XYZ where _t = base64 of "token" 
 	Set the following configuration to web.xml and enjoy it ! 
 	 
	 <servlet>
		    <servlet-name>testesso</servlet-name>
		    <servlet-class>nosi.core.servlet.TesteSso</servlet-class>
	  </servlet>
	  
 	For more information go to: <www.nosicode.cv>	
 **/
@WebServlet(name = "testesso", urlPatterns = "/testesso") 
public class TesteSso extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private static final String igrpPath = "app/webapps?r=igrp/home/index";
   
	public TesteSso() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String token = request.getHeader("Authorization");
		String uid = "";
		try {
			token = token.replaceFirst("Basic ", "");
			token = new String(Base64.getDecoder().decode(token));
			String []arr = token.split(":");
			uid = arr[0];
			token = arr[1];
		}catch(Exception e) {
			token = null;
		}
		
		if(token == null || token.isEmpty()) {
			response.setStatus(401);
			response.setContentType("application/json");
			response.getWriter().append("{\"error\": \"Token inválido.\"}");
			return;
		}
		
		
		
		Properties properties = this.load("sso", "oauth2.xml");
		
		String userEndpoint = properties.getProperty("oauth2.endpoint.user");
		HttpURLConnection curl = (HttpURLConnection) URI.create(userEndpoint).toURL().openConnection();
		curl.setDoInput(true);
		curl.setRequestProperty("Authorization", "Bearer " + token);
		curl.connect();
		BufferedReader br = new BufferedReader(new InputStreamReader(curl.getInputStream(), "UTF-8"));
		
		String result = br.lines().collect(Collectors.joining());
		
		int code = curl.getResponseCode();
		
		if(code != 200) {
			response.setStatus(code);
			response.setContentType("application/json");
			response.getWriter().append("{\"error\": \"Token inválido.\"}");
			return;
		}
		
		try {
			JSONObject jToken = new JSONObject(result);
			String aux = (String) jToken.get("sub");
			
			if(!aux.equals(uid)) {
				response.setStatus(500);
				response.setContentType("application/json");
				response.getWriter().append("{\"error\": \"Token ou username inconsistentes.\"}");
				return;
			}
			
		} catch (JSONException e2) {
		}
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String cn = request.getParameter("cn");
		String fn = request.getParameter("fn");
		
		boolean r = insertUserToLdap(username, password, cn, fn);
		
		if(r)
			response.setStatus(200);
		else
			response.setStatus(500);
		
	}
	
	private boolean insertUserToLdap(String username, String password, String commonName, String fullName) {
		boolean flag = true;
		try {
			
			Properties settings = this.load("ids", "wso2-ids.xml");
			
			URL url =  new URL(settings.getProperty("RemoteUserStoreManagerService-wsdl-url"));
			String uri = settings.getProperty("RemoteUserStoreManagerService-wsdl-url");
			
			  WSO2UserStub.disableSSL();  
		      WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
		      stub.applyHttpBasicAuthentication(settings.getProperty("admin-usn"), settings.getProperty("admin-pwd"), 2);
		        
		     AddUser addUser = new AddUser();
	          
	         addUser.setRequirePasswordChange(false);
	         
	         // aux = model.getEmail_1().trim().split("@")[0];
	         addUser.setUserName(new JAXBElement<String>(new QName(uri, "userName"), String.class, username));
	         
	         addUser.setCredential(new JAXBElement<String>(new QName(uri, "credential"), String.class, "Pa$$w0rd"));
	         addUser.setProfileName(new JAXBElement<String>(new QName(uri, "profileName"), String.class, "default"));
	       
	         ClaimValue email = new ClaimValue();
	         email.setClaimURI(new JAXBElement<String>(new QName(uri, "claimURI"), String.class, "http://wso2.org/claims/emailaddress"));
	         
	         email.setValue(new JAXBElement<String>(new QName(uri, "value"), String.class, username));
	         
	         ClaimValue cn = new ClaimValue();
	         cn.setClaimURI(new JAXBElement<String>(new QName(uri, "claimURI"), String.class, "http://wso2.org/claims/fullname"));
	         cn.setValue(new JAXBElement<String>(new QName(uri, "value"), String.class, commonName));
	         
	         ClaimValue sn = new ClaimValue();
	         sn.setClaimURI(new JAXBElement<String>(new QName(uri, "claimURI"), String.class, "http://wso2.org/claims/lastname"));
	         sn.setValue(new JAXBElement<String>(new QName(uri, "value"), String.class, fullName));
	         
	         addUser.getClaims().addAll(Arrays.asList(cn, email, sn));
	        
	         try {
	        	 stub.getOperations().addUser(addUser); 
	         }catch (Exception e) {
	        	 e.printStackTrace();
			}
	         
	         int httpStatusCode = -1;
	         
	         try {
	        	 httpStatusCode = stub.getHttpResponseStatusCode(); // bug TomEE 
	         }catch (NullPointerException e) {
	        	 httpStatusCode = 200;
			}
	         
	        flag = !(httpStatusCode != 202 && httpStatusCode != 200);
	        
		}catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}
		
		return flag;
	}
	
	private Properties load(String filePath, String fileName) {
		
		String path = new Config().getBasePathConfig() + File.separator + filePath;
		File file = new File(getClass().getClassLoader().getResource(path + File.separator + fileName).getPath());
		
		FileInputStream fis = null;
		Properties props = new Properties();
		try {
			fis = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			fis = null;	
		}
		try {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return props;
	}
	
}
