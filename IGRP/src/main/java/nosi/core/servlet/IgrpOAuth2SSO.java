package nosi.core.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import nosi.core.config.Config;
import nosi.core.webapp.User;
import java.util.Base64;
import java.util.Properties;
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
		    <servlet-name>igrpsso</servlet-name>
		    <servlet-class>nosi.core.servlet.IgrpOAuth2SSO</servlet-class>
	  </servlet>
	  
 	For more information go to: <www.nosicode.cv>	
 **/
@WebServlet(name = "igrpoauth2sso", urlPatterns = "/igrpoauth2sso") 
public class IgrpOAuth2SSO extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public IgrpOAuth2SSO() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _u = request.getParameter("_t"); // _t = Token 
		
		String _url = "";
		String param = request.getParameter("_url");
		
		_url = _url +  "app/webapps?r=igrp/home/index";
					
		_url =  (param != null &&  !param.isEmpty() ? _url + "&_url=" + param : _url + "");
		
		if(_u != null && !_u.isEmpty()) {
			_u = new String(Base64.getDecoder().decode(_u));
			String []aux = _u.split(":");
			if(aux.length != 2) {
				response.sendError(400, "Bad request ! Please contact the Administrator or send mail to <nositeste@nosi.cv>.");
			}else {
				String username = aux[0];
				String token = aux[1];
				
				Properties properties = this.load("common", "main.xml");
				String client_id = properties.getProperty("ids.wso2.oauth2.client_id");
				String client_secret = properties.getProperty("ids.wso2.oauth2.client_secret");
				String endpoint = properties.getProperty("ids.wso2.oauth2.endpoint.token");
				
				if(client_id == null || client_id.isEmpty() || client_secret == null || client_secret.isEmpty() || endpoint == null || endpoint.isEmpty()) {
					response.sendError(500, "Bad configuration ! Please contact the Administrator or send mail to <nositeste@nosi.cv>.");
				}else {
					// First check if the session exits 
					String sessionValue = (String) request.getSession().getAttribute("_identity-igrp");
					if(sessionValue != null && !sessionValue.isEmpty()) { // Anyway go to IGRP login page 
						response.sendRedirect(_url); 
						return;
					}
					
					// disableSSL(); 
					
					String userEndpoint = properties.getProperty("ids.wso2.oauth2.endpoint.user");
					HttpURLConnection curl = (HttpURLConnection) URI.create(userEndpoint).toURL().openConnection();
					curl.setDoInput(true);
					curl.setRequestProperty("Authorization", "Bearer " + token);
					curl.connect();
					BufferedReader br = new BufferedReader(new InputStreamReader(curl.getInputStream(), "UTF-8"));
					
					String result = br.lines().collect(Collectors.joining());
					
					int code = curl.getResponseCode();
					
					if(code != 200) {
						response.sendError(500, "An error has occured while trying connect to ids !");
						return;
					}
					
					String uid = "";
					
					try {
						JSONObject jToken = new JSONObject(result);
						uid = (String) jToken.get("sub");
					} catch (JSONException e2) {
						e2.printStackTrace();
					}
					
					// if success create the cookie information 
					int userId = -1;
					String authenticationKey = "RN67eqhUUgKUxYJm_wwJOqoEgl5zQugm";
					
					Properties p = this.load("db", "db_igrp_config.xml");
					
					String driverName = p.getProperty("driverConnection", "");
					String dns = p.getProperty("urlConnection", "");
					
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
							
							JSONObject jsonUser = new JSONObject(result);
							
							try {
								ps2.setString(8, jsonUser.getJSONObject("data").getString("name")); // name  
								ps2.setString(4, jsonUser.getJSONObject("data").getString("email")); // email 
							} catch (JSONException e2) {
								e2.printStackTrace();
								ps2.setString(4, jsonUser.getString("sub")); // email
								ps2.setString(8, jsonUser.getString("sub")); // name  
							}
							
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
								
								int result1[] = ps3.executeBatch();
								
								if(result1.length == 2)
									conn.commit();
								
							}else {
								response.sendError(500, "An internal server error has occurred !");
								return;
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
						response.sendError(500, "A SQLException occurred ... so we block the request !");
						return;
					}catch(ClassNotFoundException e) {
						e.printStackTrace();
						response.sendError(500, "Database driver not found ... so we block the request !");
						return;
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
					}
					
					response.sendRedirect(_url); 
					return;
					
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
