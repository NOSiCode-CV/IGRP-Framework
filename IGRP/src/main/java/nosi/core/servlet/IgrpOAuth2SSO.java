package nosi.core.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
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
import javax.security.cert.X509Certificate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Form;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import nosi.core.webapp.User;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.RestRequest;
import java.util.Base64;
import java.util.Properties;
import java.util.stream.Collectors;
/**
 * Marcel Iekiny
 * Nov 02, 2017
 */
/** 
 	This API is the one of a way that allow you to guarantee the SSO (Single Sign On) from others Web Applications to IGRP. 
 	Endpoint: ../igrpsso?_u=XYX..XYZ where _u = base64 of "username:password" 
 	Set the following configuration to web.xml and enjoy it ! 
 	 
	 <servlet>
		    <servlet-name>igrpsso</servlet-name>
		    <servlet-class>nosi.core.servlet.IgrpOAuth2SSO</servlet-class>
	  </servlet>
	  	
 	For more information go to: <www.nosicode.cv>	
 **/
@WebServlet(name = "igrpoauth2sso", urlPatterns = "/igrpoauth2sso") 
public class IgrpOAuth2SSO extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private static final String igrpPath = "/app/webapps?r=igrp/home/index";
   
	public IgrpOAuth2SSO() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _u = request.getParameter("_u");
		
		String _url = "";
		String param = request.getParameter("_url");
		synchronized (igrpPath) {
			_url = _url + igrpPath;
		}
		_url =  (param != null &&  !param.isEmpty() ? _url + "&_url=" + param : _url + "");
		
		if(_u != null && !_u.isEmpty()) {
			_u = new String(Base64.getDecoder().decode(_u));
			String []aux = _u.split(":");
			if(aux.length != 2) {
				response.sendError(400, "Bad request ! Please contact the Administrator or send mail to <nositeste@nosi.cv>.");
			}else {
				String username = aux[0];
				String password = aux[1];
				
				Properties properties = this.load("sso", "oauth2.xml");
				String client_id = properties.getProperty("oauth2.client_id");
				String client_secret = properties.getProperty("oauth2.client_secret");
				String endpoint = properties.getProperty("oauth2.endpoint.token");
				
				if(client_id == null || client_id.isEmpty() || client_secret == null || client_secret.isEmpty() || endpoint == null || endpoint.isEmpty()) {
					response.sendError(500, "Bad configuration ! Please contact the Administrator or send mail to <nositeste@nosi.cv>.");
				}else {
					// First check if the session exits 
					String sessionValue = (String) request.getSession(true).getAttribute("_identity-igrp");
					if(sessionValue != null && !sessionValue.isEmpty()) { // Anyway go to IGRP login page 
						response.sendRedirect(_url);
						return;
					}
					
					// make the oauth2 request grant_type=password 
					//String postData = "{\"grant_type\":\"password\",\"username\":\"" + username + "\",\"password\":\"" + password + "\",\"client_id\":\"" + client_id + "\",\"client_secret\":\"" + client_secret + "\"}";
					
					disableSSL();
					
					String postData = "grant_type=password"
							+ "&username=" + username
							+ "&password=" + password
							+ "&client_id=" + client_id
							+ "&client_secret=" + client_secret
							+ "&scope=openid";
					
					HttpURLConnection curl = (HttpURLConnection) URI.create(endpoint).toURL().openConnection();
					curl.setDoOutput(true);
					curl.setDoInput(true);
					curl.setInstanceFollowRedirects(false);
					curl.setRequestMethod("POST");
					curl.setRequestProperty("Content-Type", "application/x-www-form-urlencoded"); 
					curl.setRequestProperty("charset", "utf-8");
					curl.setRequestProperty( "Content-Length", (postData.length()) + "");
					curl.setUseCaches(false);
					curl.getOutputStream().write(postData.getBytes());
					
					curl.connect();
					
					int code = curl.getResponseCode();
					
					System.out.println("ResponseStatusCode: " + code);
					
					BufferedReader br = new BufferedReader(new InputStreamReader(curl.getInputStream(), "UTF-8"));
					
					
					String result = "";
					String token = "";
				
					result = br.lines().collect(Collectors.joining());
					
					
					System.out.println("Success " + result);
					
					try {
						JSONObject jToken = new JSONObject(result);
						token = (String) jToken.get("access_token");
					} catch (JSONException e2) {
						e2.printStackTrace();
					}
					
					String userEndpoint = properties.getProperty("oauth2.endpoint.user");
					curl = (HttpURLConnection) URI.create(userEndpoint).toURL().openConnection();
					curl.setDoInput(true);
					curl.setRequestProperty("Authorization", "Bearer " + token);
					curl.connect();
					br = new BufferedReader(new InputStreamReader(curl.getInputStream(), "UTF-8"));
					result = br.lines().collect(Collectors.joining());
					
					code = curl.getResponseCode();
					
					System.out.println(code); 
					if(code != 200) {
						// error 
					}
					
					System.out.println(result);
					
					String uid = "";
					
					try {
						JSONObject jToken = new JSONObject(result);
						uid = (String) jToken.get("sub");
					} catch (JSONException e2) {
						e2.printStackTrace();
					}
					
					System.out.println(uid);
					
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
							response.sendError(500, "Invalid Database configuration ... so we block the request !");
							return;
						}
					}
					
					
				
					
					
					
					try {
						boolean generateNewCookie = false;
						Cookie oldCookie = null;
						try {
							for(Cookie obj : request.getCookies())
								if(obj.getName().equals("_identity-igrp"))
									oldCookie = obj;
							if(oldCookie == null || oldCookie.getValue().isEmpty()) generateNewCookie = true;
							String value = new String(Base64.getDecoder().decode(oldCookie.getValue()));
							JSONArray json = new JSONArray(value);
							int oldUserId = json.getInt(0);
							String oldAuthenticationKey = json.getString(1);
							generateNewCookie = (oldUserId != userId || !authenticationKey.equals(oldAuthenticationKey));
						}catch(Exception e) {
							generateNewCookie = true;
						}
					if(generateNewCookie) {
						JSONArray json =  new JSONArray();
						json.put(userId);
						json.put(authenticationKey);
						Cookie cookie = new Cookie("_identity-igrp", Base64.getEncoder().encodeToString(json.toString().getBytes()));
						cookie.setMaxAge(60*60); // 1h
						cookie.setHttpOnly(true);
						response.addCookie(cookie);
						response.sendRedirect(_url); 
						return;
					}
					}catch(Exception e) {
						e.printStackTrace();
						response.sendError(500, "An INTERNAL_SERVER_ERROR occur ! Please contact the Administrator or send mail to <nositeste@nosi.cv>.");
						return;
					}
				}
			}
		}else
			response.sendError(400, "Bad request ! Please contact the Administrator or send mail to <nositeste@nosi.cv>.");
	}
	
	
	 public static void disableSSL() {
        try {
            TrustManager[] trustAllCerts = new TrustManager[] { new IgrpOAuth2SSO.MyTrustManager() };
            // Install the all-trusting trust manager
            SSLContext sc = SSLContext.getInstance("SSL");
            sc.init(null, trustAllCerts, new java.security.SecureRandom());
            HostnameVerifier allHostsValid = new HostnameVerifier() {
                @Override
                public boolean verify(String string, SSLSession ssls) {
                  return true;
                }
            };
            HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	 
	 private static class MyTrustManager implements X509TrustManager {

		@Override
		public void checkClientTrusted(java.security.cert.X509Certificate[] chain, String authType)
				throws CertificateException {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void checkServerTrusted(java.security.cert.X509Certificate[] chain, String authType)
				throws CertificateException {
			// TODO Auto-generated method stub
			
		}

		@Override
		public java.security.cert.X509Certificate[] getAcceptedIssuers() {
			// TODO Auto-generated method stub
			return null;
		}
	        
	    }
	
	
	
	private Properties load(String filePath, String fileName) {
		String path = this.getServletContext().getRealPath("/WEB-INF/config/") + filePath;
		File file = new File(path + File.separator + fileName);
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
