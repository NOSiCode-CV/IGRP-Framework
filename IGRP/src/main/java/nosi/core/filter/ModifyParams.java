package nosi.core.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 12 Feb 2018
 */
public class ModifyParams implements Filter{

	private String encoding = "UTF-8";
	
	private HttpServletRequest req;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.encoding = Core.isNotNull(filterConfig.getInitParameter("encoding"))?filterConfig.getInitParameter("encoding"):this.encoding;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//Transform params into attributes
		this.req = (HttpServletRequest) request;
		request.setCharacterEncoding(this.encoding);
		chain.doFilter(req, response);
	}

	@Override
	public void destroy() {
		
	}
	
}
