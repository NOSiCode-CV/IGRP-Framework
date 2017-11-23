package nosi.core.servlet;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
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
			try {
				// First check if the session exits 
				String sessionValue = (String) request.getSession(false).getAttribute("_identity-igrp");
				if(sessionValue != null && !sessionValue.isEmpty()) { // Anyway go to IGRP login page 
					response.sendRedirect(igrpPath);
					return;
				}
			}catch(Exception e) { // NullPointerException Purpose 
				e.printStackTrace();
			}
			
			String []aux = request.getHeader("Authorization").split(" ");
			aux = new String(Base64.getDecoder().decode(aux[1])).split(":");
			
			String username = aux[0];
			String password = aux[1];
			
			String result = username + password;
			
			int userId = 2; // demo
			String authenticationKey = "123456"; // demo
			
			JSONArray json =  new JSONArray();
			json.put(userId);
			json.put(authenticationKey);
			Cookie cookie = new Cookie("_identity-igrp", Base64.getEncoder().encodeToString(json.toString().getBytes()));
			cookie.setMaxAge(60*60); // 1h
			cookie.setHttpOnly(true);
			response.addCookie(cookie);
			response.sendRedirect(igrpPath);
			
	}
}
