package nosi.core.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONArray;

import nosi.core.webapp.User;

import java.util.Base64;
import java.util.Properties;
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
		    <servlet-class>nosi.core.servlet.IgrpAuth2SSO</servlet-class>
		    <init-param>
			    <param-name>oauth2.client_id</param-name>
			    <param-value>YOUR_CLIENT_ID</param-value>
		    </init-param>
		    <init-param>
			    <param-name>oauth2.client_secret</param-name>
			    <param-value>YOUR_CLIENT_SECRET</param-value>
		    </init-param>
		    <init-param>
			    <param-name>oauth2.endpoint</param-name>
			    <param-value>IGRP_OAUTH2_ENDPOINT</param-value>
		    </init-param>
	  	</servlet>
	  	
 	For more information go to: <www.nosicode.cv>	
 **/
@WebServlet(name = "igrpauth2sso", urlPatterns = "/igrpauth2sso") 
public class IgrpAuth2SSO extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private static final String igrpPath = "webapps?r=igrp/home/index";
   
	public IgrpAuth2SSO() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _u = request.getParameter("_u");
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
				String endpoint = properties.getProperty("oauth2.endpoint");
				
				if(client_id == null || client_id.isEmpty() || client_secret == null || client_secret.isEmpty() || endpoint == null || endpoint.isEmpty()) {
					response.sendError(500, "Bad configuration ! Please contact the Administrator or send mail to <nositeste@nosi.cv>.");
				}else {
					// First check if the session exits 
					String sessionValue = (String) request.getSession(true).getAttribute("_identity-igrp");
					if(sessionValue != null && !sessionValue.isEmpty()) { // Anyway go to IGRP login page 
						response.sendRedirect(igrpPath);
						return;
					}
					
					// make the oauth2 request grant_type=password 
					String postData = "{\"grant_type\":\"password\",\"username\":\"" + username + "\",\"password\":\"" + password + "\",\"client_id\":\"" + client_id + "\",\"client_secret\":\"" + client_secret + "\"}";
					System.out.println(postData);
					System.out.println(endpoint);
					String result = "";
					Client client = ClientBuilder.newClient();
					Response r = client.target(endpoint).request(MediaType.APPLICATION_JSON).post(Entity.json(postData));
					
					if(r.getStatus() != 200) { // send error 
						result = r.getEntity().toString();
						response.sendError(r.getStatus(), "An error has occurred ! Please contact the Administrator or send mail to <nositeste@nosi.cv>.");
						return;
					}
					
					// if success create the cookie information 
					int userId = 2;
					String authenticationKey = "RN67eqhUUgKUxYJm_wwJOqoEgl5zQugm";
					
					client.close();
					
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
									"insert into tbl_user(activation_key, auth_key, created_at, email, pass_hash, status, updated_at, user_name) "
									+ "values(?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
							authenticationKey = User.generateAuthenticationKey();
							ps2.setString(1, User.generateActivationKey());
							ps2.setString(2, authenticationKey);
							ps2.setLong(3, System.currentTimeMillis());
							ps2.setString(4, "");
							ps2.setString(5, "");
							ps2.setInt(6, 1);
							ps2.setLong(7, System.currentTimeMillis());
							ps2.setString(8, "");
							
							int affectedRows = ps2.executeUpdate();
							
							if(affectedRows > 0) {
								int lastInsertedId = -1;			
								try (ResultSet rs2 = ps2.getGeneratedKeys()) {
							        if (rs.next()) {
							        	lastInsertedId = rs2.getInt(1);
							        }
							        userId = lastInsertedId;
								}
								
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
								// error
								return;
							}
							
							return;
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
						response.sendRedirect(igrpPath); 
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
