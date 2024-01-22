package nosi.core.filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpServletRequest;


/**
 * Emanuel
 * 12 Feb 2018
 */
@WebFilter(filterName = "EncodingFilter", servletNames = "IGRP", initParams = @WebInitParam(name = "encoding", value = "UTF-8"))
public class EncodingFilter implements Filter{

	private String encoding = "UTF-8";
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException { 
		String customEncoding = filterConfig.getInitParameter("encoding"); 
		if(customEncoding != null && !customEncoding.isEmpty()) 
			encoding = customEncoding; 
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
  HttpServletRequest req;
		request.setCharacterEncoding(this.encoding);
		req = (HttpServletRequest) request;
		response.setCharacterEncoding(this.encoding);
		chain.doFilter(req, response);
	}

	
}
