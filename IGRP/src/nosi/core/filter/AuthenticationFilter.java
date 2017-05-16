package nosi.core.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Marcel Iekiny
 * May 7, 2017
 */
public class AuthenticationFilter implements Filter {

    public AuthenticationFilter() {
        // empty default constructor
    }

	public void destroy() {
		// Not set yet
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//System.out.println("Filter executado com sucesso");
		HttpServletRequest rq = (HttpServletRequest) request;
		HttpServletResponse rp = (HttpServletResponse) response;
		String identityId = (String) rq.getSession().getAttribute("_identity");
		boolean isLoginPage = false;
		
		if(rq.getParameter("r") != null) /* test the login page (TOO_MANY_REQUEST purpose)*/
			isLoginPage = rq.getParameter("r").contains("login"); // bug ... Perhaps
		
		if(!isLoginPage && identityId == null) {// just test the session context
			//rp.sendRedirect("webapps?r=igrp/login/login"); // go to login page
			rq.getRequestDispatcher("webapps?r=igrp/login/login").forward(request, response);
		}else	
			chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// Not set yet
	}

}