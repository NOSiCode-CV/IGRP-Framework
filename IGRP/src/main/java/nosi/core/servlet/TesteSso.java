package nosi.core.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		System.out.println(uid);
		
		System.out.println("TokenDescodificado: " + token);
		
		Properties properties = this.load("common", "main.xml");
		
		String userEndpoint = properties.getProperty("ids.wso2.oauth2.endpoint.user");
		HttpURLConnection curl = (HttpURLConnection) URI.create(userEndpoint).toURL().openConnection();
		curl.setDoInput(true);
		
		System.out.println("Leu endpoint ... ");
		
		curl.setRequestProperty("Authorization", "Bearer " + token);
		curl.connect();
		BufferedReader br = new BufferedReader(new InputStreamReader(curl.getInputStream(), "UTF-8"));
		
		String result = br.lines().collect(Collectors.joining());
		
		System.out.println("Resultadp de wos2: " + result);
		
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
			
			System.out.println("Sub: " + aux);
			
			if(!aux.trim().equals(uid.trim())) {
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
					
					
					System.out.println("Inserido ");
					
				}else {
					flag = false;
					System.out.println("Não Inserido ");
				}
			}else {
				userId = rs.getInt("id");
				authenticationKey = rs.getString("auth_key");
			}
			rs.close();
			ps.close();
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
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return flag;
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
	
}
