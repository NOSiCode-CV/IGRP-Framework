package nosi.core.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;

import nosi.core.webapp.util.Core;

/**
 * Emanuel
 * 12 Feb 2018
 */
@WebFilter
public class EncodingFilter implements Filter{

	private String encoding = "UTF-8";
	
	private HttpServletRequest req; 
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String customEncoding = filterConfig.getInitParameter("encoding"); 
		if(customEncoding != null && !customEncoding.isEmpty())
			encoding = customEncoding; 
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding(this.encoding);
		this.req = (HttpServletRequest) request;
		response.setCharacterEncoding(this.encoding);
		chain.doFilter(req, response);
	}

	@Override
	public void destroy() {}
	
}
