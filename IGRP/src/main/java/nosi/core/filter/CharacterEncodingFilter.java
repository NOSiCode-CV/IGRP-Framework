package nosi.core.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Marcel Iekiny
 * Nov 27, 2017
 */

/** 
  <filter>
		<filter-name>IgrpCharacterEncoding</filter-name>
		<filter-class>nosi.core.filter.CharacterEncodingFilter</filter-class>
		<init-param>
		  <param-name>encoding</param-name>
		  <param-value>UTF-8</param-value>
		</init-param>
		<!--<init-param>
		  <param-name>ignore</param-name>
		  <param-value>false</param-value>
		</init-param>-->
	</filter>
	<filter-mapping>
		<filter-name>IgrpCharacterEncoding</filter-name>
		<servlet-name>igrp</servlet-name>
	</filter-mapping>
 **/
@WebFilter
public class CharacterEncodingFilter implements Filter {
	
	private String encoding = null;
	private boolean ignore = false;

    public CharacterEncodingFilter() {}

    public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (ignore || (request.getCharacterEncoding() == null) || request.getCharacterEncoding().trim().isEmpty()) {
        	if (this.encoding != null && !this.encoding.trim().isEmpty()) {
                request.setCharacterEncoding(this.encoding);
                response.setCharacterEncoding(this.encoding);
        	}
        }
		// pass the request along the filter chain 
		chain.doFilter(request, response);
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
		this.encoding = fConfig.getInitParameter("encoding");
		String aux = fConfig.getInitParameter("ignore");
		this.ignore = (aux != null && aux.equalsIgnoreCase("true") ? true : false);
	}
}
