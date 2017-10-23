package nosi.core.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.Session;

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
					
					// if success create the session 
					
					/*Profile profile = new Profile().getByUser(user.getId());
					if(profile != null && Igrp.getInstance().getUser().login(user, 3600 * 24 * 30)){
						if(!Session.afterLogin(profile))
							Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Error no registo session ...");
						//String backUrl = Route.previous(); // remember the last url that was requested by the user
						success = true;
					}
					else
						Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Login inválido ...");
					*/
				}
			}
		}else
			response.sendError(400, "Bad request ! Please contact the Administrator or send mail to <iekinyfernandes@gmail.com>.");
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}
