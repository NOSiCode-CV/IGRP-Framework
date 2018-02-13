package nosi.core.filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Emanuel
 * 12 Feb 2018
 */
public class ModifyParams implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//Transform params into attributes
		HttpServletRequest req = (HttpServletRequest) request;
		request.getParameterMap().entrySet().stream().forEach(p->{
			if(p.getValue().length == 1) {//If sigle parameter
				req.setAttribute(p.getKey(), p.getValue()[0]);
			}
			else if(p.getValue().length > 1){//If array parameter
				req.setAttribute(p.getKey(), p.getValue());
			}else {//If Single Parameter with null value
				req.setAttribute(p.getKey(), "");
			}
		});
		chain.doFilter(req, response);
	}

	@Override
	public void destroy() {		
	}

}
