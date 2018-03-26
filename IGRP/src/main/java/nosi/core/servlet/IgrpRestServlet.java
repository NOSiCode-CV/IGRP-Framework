package nosi.core.servlet;

import java.io.IOException;
import java.net.URI;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.glassfish.jersey.internal.util.collection.Value;

/**
 * Emanuel
 * 25 Mar 2018
 */

@WebServlet
@MultipartConfig
public class IgrpRestServlet extends org.glassfish.jersey.servlet.ServletContainer{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public IgrpRestServlet() {
		super();
	}
	
	@Override
	public Value<Integer> service(URI baseUri, URI requestUri, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		nosi.core.webapp.Igrp.getInstance().init(this, request, response);
		return super.service(baseUri, requestUri, request, response);
	}
	
}
