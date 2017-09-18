package nosi.core.servlet;
/**
 * Marcel Iekiny
 * Sep 16, 2017
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.oltu.oauth2.as.issuer.OAuthIssuer;
import org.apache.oltu.oauth2.as.issuer.OAuthIssuerImpl;
import org.apache.oltu.oauth2.as.request.OAuthAuthzRequest;
import org.apache.oltu.oauth2.as.request.OAuthTokenRequest;
import org.apache.oltu.oauth2.as.response.OAuthASResponse;
import org.apache.oltu.oauth2.common.OAuth;
import org.apache.oltu.oauth2.common.exception.OAuthProblemException;
import org.apache.oltu.oauth2.common.exception.OAuthSystemException;
import org.apache.oltu.oauth2.common.message.OAuthResponse;
import org.apache.oltu.oauth2.common.message.types.ParameterStyle;
import org.apache.oltu.oauth2.rs.request.OAuthAccessResourceRequest;
import org.apache.oltu.oauth2.rs.response.OAuthRSResponse;

import nosi.core.webapp.Igrp;

@WebServlet
public class OAuth2 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	public OAuth2() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OAuth2.browserBasedApps(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private static void browserBasedApps(HttpServletRequest request,HttpServletResponse response) {
		String response_type = request.getParameter("response_type");
		String client_id = request.getParameter("client_id");
		String redirect_uri = request.getParameter("redirect_uri");
		String scope = request.getParameter("scope");
		
		String loginUrl = "http://localhost:8080/IGRP/webapps?r=igrp/login/login&oauth=1";
		loginUrl += response_type != null && !response_type.isEmpty() ? "&response_type=" + response_type : "";
		loginUrl += client_id != null && !client_id.isEmpty() ? "&client_id=" + client_id : "";
		loginUrl += redirect_uri != null && !redirect_uri.isEmpty() ? "&redirect_uri=" + redirect_uri : "";
		loginUrl += scope != null && !scope.isEmpty() ? "&scope=" + scope : "";
		//
		try {
			response.sendRedirect(loginUrl);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static String getAuthorizationCode(String response_type, String client_id, String redirect_uri, String scope) {
		
		return "";
	}
	
	public static boolean validateUri(String response_type, String client_id, String redirect_uri, String scope) {
		boolean flag = true && response_type != null && !response_type.isEmpty() && client_id != null && !client_id.isEmpty() && redirect_uri != null && 
				!redirect_uri.isEmpty() && scope != null && !scope.isEmpty();
		return flag;
	}
	
	public static void func1(HttpServletRequest request, HttpServletResponse response) {
		 try {
             // Make the OAuth Request out of this request and validate it
             // Specify where you expect OAuth access token (request header, body or query string)
            OAuthAccessResourceRequest oauthRequest = new
                    OAuthAccessResourceRequest(request, ParameterStyle.HEADER);
 
             // Get the access token
            String accessToken = oauthRequest.getAccessToken();
            
 
           //... validate access token
 
         //if something goes wrong
    } catch(OAuthProblemException | OAuthSystemException  ex) {
        //build error response
            try {
				OAuthResponse oauthResponse = OAuthRSResponse
				        .errorResponse(HttpServletResponse.SC_UNAUTHORIZED)
				        .setRealm("Album Example")
				        .buildHeaderMessage();
				 response.addHeader(OAuth.HeaderType.WWW_AUTHENTICATE, oauthResponse.getHeader(OAuth.HeaderType.WWW_AUTHENTICATE));
			} catch (OAuthSystemException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
           
    	}
	}
	
}
