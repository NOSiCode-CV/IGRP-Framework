package nosi.core.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import nosi.core.webapp.Igrp;

import java.util.Base64;

@WebServlet(name = "igrpsso", urlPatterns = "/igrpsso")
public class IgrpSSO extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
   
	public IgrpSSO() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _u = request.getParameter("_u");
		if(_u != null && !_u.isEmpty()) {
			_u = new String(Base64.getDecoder().decode(_u));
			String []aux = _u.split(":");
			if(aux.length != 2) {
				response.sendError(400, "Bad request ! Please contact the Administrator or send mail to <iekinyfernandes@gmail.com>.");
			}else {
				String username = aux[0];
				String password = aux[1];
				String client_id = this.getInitParameter("oauth2.client_id");
				String client_secret = this.getInitParameter("oauth2.client_secret");
				if(client_id == null || client_id.isEmpty() || client_secret == null || client_secret.isEmpty())
					response.sendError(500, "Bad configuration ! Please contact the Administrator or send mail to <iekinyfernandes@gmail.com>.");
				else {
					// make the oauth2 request grant_type=password 
					
					// if success create the cookie information 
					int userId = 2;
					String authenticationKey = "RN67eqhUUgKUxYJm_wwJOqoEgl5zQugm";
					
					try {
						
						boolean generateNewCookie = false;
						
						Cookie oldCookie = null;
						for(Cookie obj : Igrp.getInstance().getRequest().getCookies())
							if(obj.getName().equals("_identity-igrp"))
								oldCookie = obj;
						if(oldCookie == null || oldCookie.getValue().isEmpty()) generateNewCookie = true;
						String value = new String(Base64.getDecoder().decode(oldCookie.getValue()));
						try {
							JSONArray json = new JSONArray(value);
							int oldUserId = json.getInt(0);
							String oldAuthenticationKey = json.getString(1);
						}catch(Exception e) {
							generateNewCookie = true;
						}
						
					if(generateNewCookie) {
						
					}	
						JSONArray json =  new JSONArray();
						json.put(userId);
						json.put(authenticationKey);
						Cookie cookie = new Cookie("_identity-igrp", Base64.getEncoder().encodeToString(json.toString().getBytes()));
						cookie.setMaxAge(60*60); // 1h
						cookie.setHttpOnly(true);
						response.addCookie(cookie);
						response.sendRedirect("/webapps?r=igrp/home/index"); 
						return;
					}catch(Exception e) {
						e.printStackTrace();
						response.sendError(500, "An INTERNAL_SERVER_ERROR occur ! Please contact the Administrator or send mail to <iekinyfernandes@gmail.com>.");
						return;
					}
				}
			}
		}else
			response.sendError(400, "Bad request ! Please contact the Administrator or send mail to <iekinyfernandes@gmail.com>.");
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}
