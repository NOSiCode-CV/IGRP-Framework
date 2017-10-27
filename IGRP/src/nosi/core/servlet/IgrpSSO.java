package nosi.core.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import java.util.Base64;
/** 
 	This API is the only one way that allow you to guarante the SSO (Single Sign On) from others Web Applications to IGRP. 
 	Endpoint: ../igrpsso?_u=XYX..XYZ where _u = base64 of "username:password" 
 	Set the following configuration to web.xml and enjoy it ! 
	 <servlet>
		    <servlet-name>igrpsso</servlet-name>
		    <servlet-class>nosi.core.servlet.IgrpSSO</servlet-class>
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
@WebServlet(name = "igrpsso", urlPatterns = "/igrpsso") 
public class IgrpSSO extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private static final String igrpPath = "webapps?r=igrp/home/index"; 
   
	public IgrpSSO() {
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
				String client_id = this.getInitParameter("oauth2.client_id");
				String client_secret = this.getInitParameter("oauth2.client_secret");
				if(client_id == null || client_id.isEmpty() || client_secret == null || client_secret.isEmpty())
					response.sendError(500, "Bad configuration ! Please contact the Administrator or send mail to <nositeste@nosi.cv>.");
				else {
					// First check if the session exits 
					String sessionValue = (String) request.getSession(false).getAttribute("_identity-igrp");
					if(sessionValue != null && !sessionValue.isEmpty()) { // Anyway go to IGRP login page 
						response.sendRedirect(igrpPath);
						return;
					}
					
					// make the oauth2 request grant_type=password 
					
					// if success create the cookie information 
					int userId = 2;
					String authenticationKey = "RN67eqhUUgKUxYJm_wwJOqoEgl5zQugm";
					
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
}