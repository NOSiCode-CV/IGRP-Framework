package nosi.webapps.igrp.pages.sp;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;

import java.io.IOException;
import java.security.cert.CertificateEncodingException;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onelogin.saml2.Auth;
import com.onelogin.saml2.exception.Error;
import com.onelogin.saml2.exception.SettingsException;
import com.onelogin.saml2.settings.Saml2Settings;
import com.onelogin.saml2.servlet.ServletUtils;
import org.apache.commons.lang3.StringUtils;
/**
 * @author Marcel Iekiny
 * Jul 6, 2017
 */
public class SPController extends Controller{
	
	public Response actionIndex(){
		Response response = new Response();
		response.setFormat(Response.FORMAT_XML);
		response.setContent("<?xml version=\"1.0\" encoding=\"utf-8\" ?><root></root>");
		response.setType(1);
		return response;
	}
	
	public Response actionMetadata(){
		Response response = new Response();
		response.setFormat(Response.FORMAT_XML);
		String metadata = "<?xml version=\"1.0\" encoding=\"utf-8\" ?><root></root>";
		try {
			Auth auth = new Auth();
			Saml2Settings settings = auth.getSettings();
			metadata = settings.getSPMetadata();
			List<String> errors = Saml2Settings.validateMetadata(metadata);
			if (errors.isEmpty())
				System.out.println(metadata);
			else
				for (String error : errors)
				    System.out.println("<p>"+error+"</p>");
			
		} catch (IOException | SettingsException | Error e) {
			e.printStackTrace();
		} catch (CertificateEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		response.setContent(metadata);
		response.setType(1);
		return response;
	}
	
	public Response actionLogin(){
		Response response = new Response();
		response.setFormat(Response.FORMAT_XML);
		String metadata = "<?xml version=\"1.0\" encoding=\"utf-8\" ?><root></root>";
		HttpServletRequest request = Igrp.getInstance().getRequest();
		try {
			Auth auth = new Auth(request, Igrp.getInstance().getResponse());
			if (request.getParameter("attrs") == null) {
				auth.login();
			} else {
				String x = request.getPathInfo();
				auth.login("/java-saml-tookit-jspsample/attrs.jsp");
			}
			return null;
		} catch (IOException | SettingsException | Error e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContent(metadata);
		response.setType(1);
		return response;
	}
	
	public Response actionAcs() throws Exception{
		HttpServletRequest request = Igrp.getInstance().getRequest();
		HttpServletResponse response = Igrp.getInstance().getResponse();
		HttpSession session = Igrp.getInstance().getRequest().getSession();
		Auth auth = new Auth(request, response);
		auth.processResponse();
		if (!auth.isAuthenticated()) {
			System.out.println("<div class=\"alert alert-danger\" role=\"alert\">Not authenticated</div>");
		}
		List<String> errors = auth.getErrors();

	    if (!errors.isEmpty()) {
	    	System.out.println("<p>" + StringUtils.join(errors, ", ") + "</p>");
	    	if (auth.isDebugActive()) {
	    		String errorReason = auth.getLastErrorReason();
	    		if (errorReason != null && !errorReason.isEmpty()) {
	    			System.out.println("<p>" + auth.getLastErrorReason() + "</p>");
	    		}
	    	}
	    	System.out.println("<a href=\"dologin.jsp\" class=\"btn btn-primary\">Login</a>");
	    } else {
			Map<String, List<String>> attributes = auth.getAttributes();
			String nameId = auth.getNameId();

			session.setAttribute("attributes", attributes);
			session.setAttribute("nameId", nameId);

			String relayState = request.getParameter("RelayState");

			if (relayState != null && relayState != ServletUtils.getSelfRoutedURLNoQuery(request) &&
				!relayState.contains("/dologin.jsp") ) { // We don't want to be redirected to login.jsp neither
				//response.sendRedirect(request.getParameter("RelayState"));
			} else {
				if (attributes.isEmpty()) {}
				else {			
						Collection<String> keys = attributes.keySet();
						for(String name :keys){
							System.out.println("<tr><td>" + name + "</td><td>");
							List<String> values = attributes.get(name);
							for(String value :values) {
								System.out.println("<li>" + value + "</li>");
							}
		
									System.out.println("</td></tr>");
								}
									
							}
					
						}
					}
		return null;
	}
	
	public Response actionSls(){
		return null;
	}

}
