package nosi.core.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

/**
 * Marcel Iekiny
 * Nov 27, 2017
 */
/** 
	<filter>
		<filter-name>BasicSecurity</filter-name>
		<filter-class>nosi.core.filter.BasicSecurityFilter</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>BasicSecurity</filter-name>
		<servlet-name>igrp</servlet-name>
	</filter-mapping>
**/
@WebFilter
public class BasicSecurityFilter implements Filter {

	public BasicSecurityFilter() {}

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse out = (HttpServletResponse) response;
		out.addHeader("X-XSS-Protection", "1; mode=block"); // For Cross Site Scripting purpose 
		out.addHeader("X-Frame-Options", "SAMEORIGIN"); // Protect against 'ClickJacking' attacks
		out.addHeader("X-Content-Type-Options", "nosniff"); // Content-Type vs. MIME-Type
		out.addHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains"); // For HSTS (1 year = 31536000) 
		// HTTP Public Key Pinning (HPKP)
		// Content Security Policy (CSP)
		
		// Access-Control-Allow-Origin
		
		// pass the request along the filter chain 
		chain.doFilter(request, response);
	}
	
	public void init(FilterConfig fConfig) throws ServletException {}
}


