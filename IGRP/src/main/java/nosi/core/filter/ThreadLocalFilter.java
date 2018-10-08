package nosi.core.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import nosi.core.webapp.Igrp;

/**
 * @author Marcel Iekiny 
 * 05 Oct 2018
 */
@WebFilter
public class ThreadLocalFilter implements Filter {

    public ThreadLocalFilter() {}

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// TODO Auto-generated method stub 
		 Igrp.set();
	      try {
	    	// pass the request along the filter chain 
	        chain.doFilter(request, response);
	      } finally {
	    	  Igrp.remove();
	      }
	}

	public void init(FilterConfig fConfig) throws ServletException {}

}
