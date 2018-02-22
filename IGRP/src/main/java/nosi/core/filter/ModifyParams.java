package nosi.core.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;

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
		request.getParameterMap().entrySet().stream().forEach(p->{
			if(p.getValue().length == 1) {//If sigle parameter 
//				System.out.println(p.getKey()+":"+ p.getValue()[0]);
				req.setAttribute(p.getKey(), p.getValue()[0]);
			}
			else if(p.getValue().length > 1){//If array parameter
				req.setAttribute(p.getKey(), (String[]) p.getValue());
			}else {//If Single Parameter with null value
				req.setAttribute(p.getKey(), "");
			}
		});
		chain.doFilter(req, response);
	}

	@Override
	public void destroy() {/*
		Enumeration<String> e = this.req.getAttributeNames();
		while(e.hasMoreElements()) {
			String key = e.nextElement();
			this.req.removeAttribute(key);
		}*/
	}

}
