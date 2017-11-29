package nosi.core.filter;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.SecureRandom;
import java.util.Arrays;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

/**
 * Marcel Iekiny
 * Nov 27, 2017
 */
@WebFilter
public class IgrpSecurity implements Filter {

	public IgrpSecurity() {}

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest in = (HttpServletRequest)request;
		HttpServletResponse out = (HttpServletResponse) response;
		
		//System.out.println("Filter entrado ");
		
	//	System.out.println(in.getHeader("Referer")); 
	//	System.out.println(in.getHeader("Origin")); 
		
		int flag = 1;//applyCsrfSecurity(in, out); 
		
		if(flag == 1 || flag == 0) {
			this.applySecondLevelSecurity(in, out);
			// pass the request along the filter chain 
			chain.doFilter(request, response);
		}else {
			out.sendError(500, "Security Exception (Cross Site Request Forgery) ... CSRFValidationFilter: Token provided via Form HiddenField and via Cookie are not equals so we block the request ! Please contact the Administrator.");
		}
	}
	
	private int applyCsrfSecurity(HttpServletRequest in, HttpServletResponse out) {
		if(!in.getMethod().equalsIgnoreCase("POST")) return 0; // Dont apply csrf security 
		String csrf = in.getParameter("p_igrp_csrf");
		String cookieName = in.getParameter("r").replaceAll("/", "-");
		Cookie cookie = Arrays.stream(in.getCookies()).filter(c -> c.getName().equals(cookieName)).findFirst().orElse(null);
		if(csrf == null || cookie == null || !cookie.getValue().equalsIgnoreCase(csrf)) 
			return 2;
		return 1;
	}
	
	private void applySecondLevelSecurity(HttpServletRequest in, HttpServletResponse out) {
		out.addHeader("X-XSS-Protection", "1; mode=block"); // For Cross Site Scripting purpose 
		out.addHeader("X-Frame-Options", "SAMEORIGIN"); // Protect against 'ClickJacking' attacks
		out.addHeader("X-Content-Type-Options", "nosniff"); // Content-Type vs. MIME-Type
		out.addHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains"); // For HSTS (1 year = 31536000) 
		// HTTP Public Key Pinning (HPKP)
		// Content Security Policy (CSP)
		
		// Referer vs.Origin
		//out.addHeader("Origin", in.getRequestURL() + "");
		//out.addHeader("Referer", in.getRequestURL() + "");
		
		out.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
		out.addHeader("Access-Control-Allow-Credentials", "true");
		out.addHeader("Access-Control-Allow-Headers", "X-TOKEN");
		//out.addHeader("Access-Control-Request-Method", "GET");
		out.addHeader("Access-Control-Allow-Origin", "*");
		out.addHeader("Access-Control-Expose-Headers", "X-TOKEN");
		
		// Access-Control-Allow-Origin
	}
	
	public void init(FilterConfig fConfig) throws ServletException {}
	
	private int func1(HttpServletRequest httpReq, HttpServletResponse httpResp) throws MalformedURLException {
		String CSRF_TOKEN_NAME = "X-TOKEN";
		String TARGET_ORIGIN_JVM_PARAM_NAME = "target.origin";
		URL targetOrigin = new URL(httpReq.getRequestURL().toString());
		
		SecureRandom secureRandom = new SecureRandom();
		
		 String accessDeniedReason = "";

        /* STEP 1: Verifying Same Origin with Standard Headers */
        //Try to get the source from the "Origin" header
        String source = httpReq.getHeader("Origin");
        if (source == null || source.trim().isEmpty()) {
            //If empty then fallback on "Referer" header
            source = httpReq.getHeader("Referer");
            //If this one is empty too then we trace the event and we block the request (recommendation of the article)...
            if (source == null || source.trim().isEmpty()) {
            	System.out.println("Entrado 1 ");
                accessDeniedReason = "CSRFValidationFilter: ORIGIN and REFERER request headers are both absent/empty so we block the request !";
                return 1;
            }
        }
        //Compare the source against the expected target origin
        URL sourceURL = new URL(source);
        if (!targetOrigin.getProtocol().equals(sourceURL.getProtocol()) || !targetOrigin.getHost().equals(sourceURL.getHost()) 
		|| targetOrigin.getPort() != sourceURL.getPort()) {
            //One the part do not match so we trace the event and we block the request
            accessDeniedReason = String.format("CSRFValidationFilter: Protocol/Host/Port do not fully matches so we block the request! (%s != %s) ", 
				targetOrigin, sourceURL);
            System.out.println("Entrado 2 ");
            return 2;
        }

        /* STEP 2: Verifying CSRF token using "Double Submit Cookie" approach */
        //If CSRF token cookie is absent from the request then we provide one in response but we stop the process at this stage.
        //Using this way we implement the first providing of token
        Cookie tokenCookie = null;
        if (httpReq.getCookies() != null) {
            String csrfCookieExpectedName = "X-TOKEN";
            tokenCookie = Arrays.stream(httpReq.getCookies()).filter(c -> c.getName().equals(csrfCookieExpectedName)).findFirst().orElse(null);
            System.out.println("Entrado 3 ");
            //System.out.println(tokenCookie.getValue()); 
        }
        if (tokenCookie == null || tokenCookie.getValue() == null || tokenCookie.getValue().trim().isEmpty()) {
        	System.out.println("Entrado 4 ");
            // Add the CSRF token cookie and header 
        	String aux = this.generateToken();
        	Cookie cookie = new Cookie("X-TOKEN", aux);
        	httpResp.addCookie(cookie);
        	httpResp.addHeader("X-TOKEN", aux);
            //Set response state to "204 No Content" in order to allow the requester to clearly identify an initial response providing the initial CSRF token
         //   httpResp.setStatus(HttpServletResponse.SC_NO_CONTENT);
            return 3;
        } else {
        	System.out.println("Entrado 5 ");
            //If the cookie is present then we pass to validation phase
            //Get token from the custom HTTP header (part under control of the requester)
            String tokenFromHeader = httpReq.getHeader(CSRF_TOKEN_NAME);
            //If empty then we trace the event and we block the request
            if (tokenFromHeader == null || tokenFromHeader.trim().isEmpty()) {
            	System.out.println("Entrado 6 ");
            	accessDeniedReason = "CSRFValidationFilter: Token provided via HTTP Header is absent/empty so we block the request !";
                return 2;
            } else if (!tokenFromHeader.equals(tokenCookie.getValue())) {
            	System.out.println("Entrado 7 ");
                //Verify that token from header and one from cookie are the same
                //Here is not the case so we trace the event and we block the request
                accessDeniedReason = "CSRFValidationFilter: Token provided via HTTP Header and via Cookie are not equals so we block the request !";
                return 2;
            } else {
                //Verify that token from header and one from cookie matches
                //Here is the case so we let the request reach the target component (ServiceServlet, jsp...) and add a new token when we get back the bucket
            	System.out.println("Entrado 8 ");
            	//Add the CSRF token cookie and header
            	String aux = this.generateToken();
            	Cookie cookie = new Cookie("_igrp_csrf", aux);
            	httpResp.addCookie(cookie);
            	httpResp.addHeader("X-TOKEN", aux);
            }
        }
        return 1;
	}
	
	private String generateToken() {
		 byte[] buffer = new byte[50];
		 new SecureRandom().nextBytes(buffer);
	     String result = DatatypeConverter.printHexBinary(buffer);
		return result;
	}
}


