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
		
		//String token = request.getHeader("Authorization");
		String token = request.getParameter("_t"); // _t = Token
		String uid = "";
		try {
			token = token/*.replaceFirst("Basic ", "")*/.trim().replace("\n", "").replace("\r", "");
			System.out.println(token);
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
		
		boolean r = insertUserToDb(username, password, cn, fn);
		
		if(r) {
			response.setStatus(200);
			response.setContentType("application/json");
			response.getWriter().append("{\"success\": \"Success.\"}");
		}else {
			response.setStatus(500);
			response.setContentType("application/json");
			response.getWriter().append("{\"error\": \"An error occured while trying to insert user.\"}");
		}
		
	}
	
	private boolean insertUserToDb(String username, String password, String commonName, String fullName) {
		boolean flag = true;
		
		
		// if success create the cookie information 
		int userId = -1;
		String authenticationKey = "RN67eqhUUgKUxYJm_wwJOqoEgl5zQugm";
		
		Properties p = this.load("db", "db_igrp_config.xml");
		String driverName = "";
		String dns = "";
		switch(p.getProperty("type_db")) {
			case "h2": 
				driverName = "org.h2.Driver";
				dns = "jdbc:h2:" + p.getProperty("hostname") + (Integer.parseInt(p.getProperty("port")) == 0 ? "" : ":" + p.getProperty("port")) + "/" + p.getProperty("dbname");
			break;
			case "mysql": 
				driverName = "com.mysql.jdbc.Driver";
				dns = "jdbc:mysql://" + p.getProperty("hostname") +  ":" + (Integer.parseInt(p.getProperty("port")) == 0 ? "3306" : p.getProperty("port")) + "/" + p.getProperty("dbname");
			break;
			case "postgresql": 
				driverName = "org.postgresql.Driver"; 
				dns = "jdbc:postgresql://" + p.getProperty("hostname") +  ":" + (Integer.parseInt(p.getProperty("port")) == 0 ? "5432" : p.getProperty("port")) + "/" + p.getProperty("dbname");
			break;
			case "sqlserver": 
				driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
				//dns = "jdbc:sqlserver://" + p.getProperty("hostname") +  ":" + (Integer.parseInt(p.getProperty("port")) == 0 ? "1433" : p.getProperty("port")) + "/" + p.getProperty("dbname");
			break;
			case "oracle": 
				driverName = "oracle.jdbc.driver.Driver"; 
				dns = "jdbc:oracle:thin:" + p.getProperty("username") + "/" + p.getProperty("password") + "@" + p.getProperty("hostname") + ":" + p.getProperty("port") + ":" + p.getProperty("dbname");
			break;
			default: {
				flag = false;
			}
		}
	
		Connection conn = null;
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(dns, p.getProperty("username"), p.getProperty("password"));
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("select * from tbl_user where user_name = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			
			if(!rs.next()) { // insert the user to the current igrp database 
				PreparedStatement ps2 = conn.prepareStatement(
						"insert into tbl_user(activation_key, auth_key, created_at, email, status, updated_at, user_name, name) "
						+ "values(?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
				
				authenticationKey = User.generateAuthenticationKey();
				
				ps2.setString(8, commonName); // name  
				ps2.setString(4, username); // email 
				
				
				ps2.setString(1, User.generateActivationKey());
				ps2.setString(2, authenticationKey);
				ps2.setLong(3, System.currentTimeMillis());
				//ps2.setString(5, password); // password 
				ps2.setInt(5, 1);
				ps2.setLong(6, System.currentTimeMillis());
				ps2.setString(7, username); // user_name 
				
				int affectedRows = ps2.executeUpdate();
				
				conn.commit();
				
				if(affectedRows > 0) {
					
					int lastInsertedId = -1;	
					
					PreparedStatement psUser = conn.prepareStatement("select id from tbl_user where email = ? or user_name = ?"); 
					psUser.setString(1, username);
					psUser.setString(2, username);
					
					ResultSet rsUser = psUser.executeQuery();
					
					if(rsUser.next()) {
						lastInsertedId = rsUser.getInt("id");
					}
					
					/*try (ResultSet rs2 = ps2.getGeneratedKeys()) {
					    if (rs.next()) {
					        	lastInsertedId = rs2.getInt(1);
					        }
					}*/
					
					userId = lastInsertedId;
					
					ps2.close();
					
					PreparedStatement ps3 = conn.prepareStatement("insert into tbl_profile(type, type_fk, org_fk, prof_type_fk, user_fk) values(?, ?, ?, ?, ?)");
					
					ps3.setString(1, "PROF");
					ps3.setInt(2, 4);
					ps3.setInt(3, 3);
					ps3.setInt(4, 4); // For Igrp studio 
					ps3.setInt(5, lastInsertedId);
					
					ps3.addBatch();
					
					ps3.setString(1, "ENV");
					ps3.setInt(2, 3);
					ps3.setInt(3, 3);
					ps3.setInt(4, 4); // For Igrp studio 
					ps3.setInt(5, lastInsertedId);
					
					ps3.addBatch();
					
					
					
					ps3.setString(1, "ENV");
					ps3.setInt(2, 1);
					ps3.setInt(3, 1);
					ps3.setInt(4, 2); // For Adm. 
					ps3.setInt(5, lastInsertedId);
					
					ps3.addBatch();
					
					
					ps3.setString(1, "PROF");
					ps3.setInt(2, 2);
					ps3.setInt(3, 1);
					ps3.setInt(4, 2); // For Adm. 
					ps3.setInt(5, lastInsertedId);
					
					ps3.addBatch();
					
					
					ps3.setString(1, "ENV");
					ps3.setInt(2, 2);
					ps3.setInt(3, 2);
					ps3.setInt(4, 3); // For Tutorial. 
					ps3.setInt(5, lastInsertedId);
					
					ps3.addBatch();
					
					
					
					int result1[] = ps3.executeBatch();
					
					if(result1.length == 5)
						conn.commit();
					
				}else {
					flag = false;
				}
			}else {
				userId = rs.getInt("id");
				authenticationKey = rs.getString("auth_key");
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			flag = false;
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			flag = false;
		}
		
		return flag;
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
