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
import java.util.Base64;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import nosi.core.config.Config;
/**
 * Marcel Iekiny
 * Nov 02, 2017
 */
/** 
	This API is the one of a way that allow you to guarantee the SSO (Single Sign On) from others Web Applications to IGRP. 
	Based on Http Basic Access Authentication 
	Set the following configuration to web.xml and enjoy it ! 
 	
 	<servlet>
	    <servlet-name>igrpsso</servlet-name>
	    <servlet-class>nosi.core.servlet.IgrpSSO</servlet-class>
	    <init-param>
	      <param-name>role_name</param-name>
	      <param-value>IGRP_ADMIN</param-value>
	    </init-param>
  	</servlet>
  	<servlet-mapping>
	    <servlet-name>igrpsso</servlet-name>
	    <url-pattern>/igrpsso</url-pattern>
	</servlet-mapping>
  	  <login-config>
	    <auth-method>BASIC</auth-method>
	  </login-config>
	  <security-constraint>
	    <display-name>Default IGRP Security Constraints</display-name>
	    <web-resource-collection>
	      <web-resource-name>IGRP SSO</web-resource-name>
	      <url-pattern>/igrpsso</url-pattern>
	      <http-method>GET</http-method>
	    </web-resource-collection>
	    <auth-constraint>
	      <role-name>IGRP_ADMIN</role-name>
	    </auth-constraint>
	    <user-data-constraint>
	      <transport-guarantee>NONE</transport-guarantee>
	    </user-data-constraint>
	  </security-constraint>
	  <security-role>
	    <description>Non-Existent Role - this prevents direct access to JSPs</description>
	    <role-name>IGRP_ADMIN</role-name>
	  </security-role>
	  
	For more information go to: <www.nosicode.cv> 
**/
@WebServlet
public class IgrpSSO extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private static final String igrpPath = "webapps?r=igrp/home/index";
  
	public IgrpSSO() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _url = "";
		String param = request.getParameter("_url");
		synchronized (IgrpSSO.igrpPath) {
			_url = _url + igrpPath;
		}
		_url =  (param != null &&  !param.isEmpty() ? _url + "&_url=" + param : _url + "");
		
		try {
			// First check if the session exits 
			String sessionValue = (String) request.getSession(false).getAttribute("_identity-igrp");
			if(sessionValue != null && !sessionValue.isEmpty()) { // Anyway go to IGRP login page 
				response.sendRedirect(_url);
				return;
			}
		}catch(Exception e) { // NullPointerException Purpose 
			e.printStackTrace();
		}
		String []aux = request.getHeader("Authorization").split(" ");
		aux = new String(Base64.getDecoder().decode(aux[1])).split(":");
		String username = aux[0];
		String password = aux[1];
		Properties p = this.load();
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
		int userId = 2; // demo 
		String authenticationKey = "123456"; // demo 
		try {
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(dns, p.getProperty("username"), p.getProperty("password"));
			PreparedStatement ps = conn.prepareStatement("select * from tbl_user where user_name = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			rs.next();
			userId = rs.getInt("id");
			authenticationKey = rs.getString("auth_key");
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(500, "A SQLException occurred ... so we block the request !");
			return;
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			response.sendError(500, "Database driver not found ... so we block the request !");
			return;
		}
		JSONArray json =  new JSONArray();
		json.put(userId);
		json.put(authenticationKey);
		Cookie cookie = new Cookie("_identity-igrp", Base64.getEncoder().encodeToString(json.toString().getBytes()));
		cookie.setMaxAge(60*60); // 1h
		cookie.setHttpOnly(true);
		response.addCookie(cookie);
		response.sendRedirect(_url);
	}
	
	private Properties load() {
		
		String path = new Config().getBasePathConfig() + File.separator + "db";
		String fileName = "db_igrp_config.xml";
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
