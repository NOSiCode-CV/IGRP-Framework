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
import java.util.HashMap;
import java.util.Map;
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
		
		System.out.println("SSO entrado ... ");
		
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
				String userEndpoint = properties.getProperty("ids.wso2.oauth2.endpoint.user"); 
				
				if(client_id == null || client_id.isEmpty() || client_secret == null || client_secret.isEmpty() || endpoint == null || endpoint.isEmpty()) {
					response.sendError(500, "Bad configuration ! Please contact the Administrator or send mail to <nositeste@nosi.cv>.");
				}else {
					// First check if the session exits 
					String sessionValue = (String) request.getSession().getAttribute("_identity-igrp");
					if(sessionValue != null && !sessionValue.isEmpty()) { // Anyway go to IGRP login page 
						response.sendRedirect(_url); 
						return;
					}
					
					
					Properties p = this.load("db", "db_igrp_config.xml");
					String driverName = p.getProperty("driverConnection", "");
					String dns = p.getProperty("urlConnection", "");
					
					
					Map<String, Object> map = httpRequestToUserEndpoint(client_id, client_secret, userEndpoint, token);
					Integer code = (Integer) map.get("statusCode"); 
					String result = (String) map.get("result"); 
					
					Integer userId = -1;
					String authenticationKey = "RN67eqhUUgKUxYJm_wwJOqoEgl5zQugm";
					
					
					Connection conn = null;  
					try {
						
						Class.forName(driverName);
						conn = DriverManager.getConnection(dns, p.getProperty("username"), p.getProperty("password"));
						conn.setAutoCommit(false); 
						
						nosi.webapps.igrp.dao.User user = this.getUserById(conn, username);
						
						if(code == null) throw new Exception("code == null -> NullPointerException "); 
						
						String uid = null; 
						
						if(code != 200) {
							
							if(code == 401) { // invalid_token 
								
								if(user != null) {
									
									Map<String, Object> _m = httpRequestForRefreshToken(client_id, client_secret, endpoint, user.getRefreshToken()); 
									Integer code_ = (Integer) _m.get("statusCode"); 
									String result_ = (String) _m.get("result"); 
									
									if(code_ == 200) {
										
										boolean b = this.updateUser(conn, result_, username); 
										
										try {
											JSONObject jToken = new JSONObject(result_); 
											token = (String) jToken.get("access_token"); 
										} catch (Exception e) {
											e.printStackTrace();
											throw new Exception("An error has occured while trying to refresh token !");
										}
										
										map = httpRequestToUserEndpoint(client_id, client_secret, userEndpoint, token);
										code = (Integer) map.get("statusCode"); 
										result = (String) map.get("result"); 
										
									}else {
										throw new Exception("An error has occured while trying to refresh token !");
									}
									
								}
								
							}else 
								throw new Exception("An error has occured while trying connect to ids !");
							
						} else {
							try {
								JSONObject jToken = new JSONObject(result);
								uid = (String) jToken.get("sub");
							} catch (Exception e2) {
								e2.printStackTrace();
							}
						}
						
						if(uid != null) {							
							if(user != null) {
								
								userId = user.getId();
								authenticationKey = user.getAuth_key(); 
								
								System.out.println("Utilizador existe ... " + authenticationKey); 
								
								boolean bool = setUserIsAuthenticated(conn, username); 
								System.out.println("bool: " + bool);
								
							}else {
								
								System.out.println("Utilizador nao existe ... ");
								
								Map<String, Object> _c = new HashMap<String, Object>(); 
								boolean b = createUserNDefaultProfile(conn, result, username, _c); 
								
								if(b) {
									
									System.out.println("Utilizador criado ... ");
									
									userId = (Integer) _c.get("userId");
									authenticationKey = (String) _c.get("authenticationKey");
								}else {
									throw new Exception("Ocorreu um erro ao registar o utilizador.");
								}
								
							}
							
						}else {
							throw new Exception("An internal server error has occurred ! (uid inválido)");
						}
						
						
					}catch(Exception e) {
						e.printStackTrace();
						try {
							if(!conn.isClosed())
								conn.close();
						} catch (SQLException e2) {
							e2.printStackTrace();
						}
						response.sendError(500, "An internal server error has occurred !");
						return;
					}finally {
						try {
							if(!conn.isClosed())
								conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
					
					
					System.out.println("Novo cookkie"); 
					
					System.out.println("UserId: " + userId + " - authenticatonKey: " + authenticationKey);
					
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
						
						System.out.println("generateNewCookie entrado: " + generateNewCookie);
						
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
		
		Properties props = new Properties();
		try (FileInputStream fis = new FileInputStream(file)) {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return props;
	}
	
	private Map<String, Object> httpRequestToUserEndpoint(String client_id, String client_secret, String user_endpoint, String token){
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		try {
			HttpURLConnection curl = (HttpURLConnection) URI.create(user_endpoint).toURL().openConnection();
			curl.setDoInput(true);
			curl.setRequestProperty("Authorization", "Bearer " + token);
			curl.connect();
			
			int code = curl.getResponseCode(); 
			
			map.put("statusCode", code); 
			
			BufferedReader br = new BufferedReader(new InputStreamReader(curl.getInputStream(), "UTF-8"));
			
			String result = br.lines().collect(Collectors.joining());
			
			map.put("result", result); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map; 
	}
	
	
	private Map<String, Object> httpRequestForRefreshToken(String client_id, String client_secret, String token_endpoint, String refresh_token){
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		try {
			
			String postData = "grant_type=refresh_token&refresh_token=" + refresh_token + "&client_id=" + client_id + "&client_secret=" + client_secret;
			
			HttpURLConnection curl = (HttpURLConnection) URI.create(token_endpoint).toURL().openConnection();
			curl.setDoOutput(true);
			curl.setDoInput(true);
			curl.setInstanceFollowRedirects(false);
			curl.setRequestMethod("POST");
			curl.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			curl.setRequestProperty("charset", "utf-8");
			curl.setRequestProperty("Content-Length", (postData.length()) + "");
			curl.setUseCaches(false);                           
			curl.getOutputStream().write(postData.getBytes());
			
			curl.connect();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(curl.getInputStream(), "UTF-8"));
			
			String r = br.lines().collect(Collectors.joining());
			
			int statuCode = curl.getResponseCode(); 
			
			map.put("statusCode", statuCode); 
			map.put("result", r);
			
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		
		return map; 
	}
	
	public nosi.webapps.igrp.dao.User getUserById(Connection conn, String uid) { 
		nosi.webapps.igrp.dao.User user = null;
		try {
			PreparedStatement ps = conn.prepareStatement("select * from tbl_user where user_name = ? or email = ?");
			ps.setString(1, uid);
			ps.setString(2, uid);
			ResultSet rs = ps.executeQuery(); 
			if(rs.next()) {
				user = new nosi.webapps.igrp.dao.User();
				user.setId(rs.getInt("id"));
				user.setUser_name(rs.getString("user_name")); 
				user.setEmail(rs.getString("email")); 
				user.setOidcIdToken(rs.getString("oidc_id_token")); 
				user.setRefreshToken(rs.getString("refresh_token")); 
				user.setValid_until(rs.getString("valid_until")); 
				user.setOidcState(rs.getString("oidc_state")); 
				user.setAuth_key(rs.getString("auth_key"));
			}
			ps.close();
			rs.close();
		} catch (Exception e) {
		} 
		return user;
	}
	
	
	private boolean createUserNDefaultProfile(Connection conn, String result, String user_name, Map<String, Object> _r) {  
		boolean flag = true;
		try {
			PreparedStatement ps2 = conn.prepareStatement(
					"insert into tbl_user(activation_key, auth_key, created_at, email, status, updated_at, user_name, name, is_authenticated) " 
					+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?) ", Statement.RETURN_GENERATED_KEYS);
			
			String authenticationKey = User.generateAuthenticationKey(); 
			
			_r.put("authenticationKey", authenticationKey);
			
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
			ps2.setString(7, user_name); // user_name 
			ps2.setInt(9, 1); 
			
			int affectedRows = ps2.executeUpdate();
			
			conn.commit();
			
			if(affectedRows > 0) {
				
				nosi.webapps.igrp.dao.User u = getUserById(conn, user_name);
				
				int lastInsertedId = -1;	
				
				if(u != null) {
					lastInsertedId = u.getId(); 
					_r.put("userId", lastInsertedId);
				}
				
				ps2.close();
				
				PreparedStatement ps3 = conn.prepareStatement("insert into tbl_profile(type, type_fk, org_fk, prof_type_fk, user_fk) values(?, ?, ?, ?, ?)");
				/*
				ps3.setString(1, "PROF");
				ps3.setInt(2, 4);
				ps3.setInt(3, 3);
				ps3.setInt(4, 4); // For Igrp studio 
				ps3.setInt(5, lastInsertedId); 
				
				ps3.addBatch();*/
				
				ps3.setString(1, "ENV");
				ps3.setInt(2, 2);
				ps3.setInt(3, 2);
				ps3.setInt(4, 3); // For Igrp tutorial   
				ps3.setInt(5, lastInsertedId);
				
				ps3.addBatch();
				
				int result1[] = ps3.executeBatch(); 
				
				if(result1.length > 0 )
					conn.commit(); 
				
				ps3.close();
			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) { 
				e1.printStackTrace(); 
			} 
			flag = false;
		}	
		
		return flag;
	}
	
	private boolean updateUser(Connection conn, String result, String user_name) {
		boolean flag = true; 
		
		try {
			
			JSONObject jToken = new JSONObject(result);
			String token = (String) jToken.get("access_token");
			String refresh_token = (String) jToken.get("refresh_token");
			String id_token = (String) jToken.get("id_token");
			
			String sql = "update tbl_user " 
					+ "set " 
						+ " valid_until = ?, " 
						+ " oidc_id_token = ?," 
						+ " refresh_token = ? " 
						+ " where user_name = ? or email = ? "; 
			PreparedStatement ps = conn.prepareStatement(sql); 
			ps.setString(1, token); 
			ps.setString(2, id_token); 
			ps.setString(3, refresh_token); 
			ps.setString(4, user_name); 
			ps.setString(5, user_name); 
			
			int r = ps.executeUpdate(); 
			
			flag = r > 0; 
			
			conn.commit();
			
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			flag = false; 
		}
		
		return flag;
	}
	
	private boolean setUserIsAuthenticated(Connection conn, String user_name) {
		boolean flag = true; 
		
		try {
			
			String sql = "update tbl_user " 
					+ "set " 
						+ " is_authenticated = ? " 
						+ " where user_name = ? or email = ? "; 
			PreparedStatement ps = conn.prepareStatement(sql); 
			ps.setInt(1, 1);
			ps.setString(2, user_name); 
			ps.setString(3, user_name); 
			
			int r = ps.executeUpdate(); 
			
			flag = r > 0; 
			
			conn.commit();
			
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			flag = false; 
		}
		
		return flag;
	}
	
	
}
