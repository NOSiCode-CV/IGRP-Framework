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

/**
 * Servlet Filter implementation class Exemplo
 */
@WebFilter
public class DetectAppDadWhenSSO implements Filter {

    public DetectAppDadWhenSSO() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest r = (HttpServletRequest) request;
		
		// First check if the session exits 
		String sessionValue = (String) r.getAttribute("_identity-igrp");
		System.out.println("sessionValue: " + sessionValue);
		if(sessionValue == null || sessionValue.isEmpty()) { 
			String app = r.getParameter("app"); 
			System.out.println("App: " + app);
			if(app != null && !app.isEmpty()) 
				r.getSession().setAttribute("_appHomeUrl", app); 
		}
		
		// pass the request along the filter chain 
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
