package nosi.core.servlet;
/**
 * Marcel Iekiny
 * Sep 16, 2017
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
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
		String grant_type = request.getParameter("grant_type");
		String client_id = request.getParameter("client_id");
		String client_secret = request.getParameter("client_secret");

		String result = "{\"error\":\"Invalid Request ...\"}";
		
		switch(grant_type) {
			case "authorization_code":
				String redirect_uri = request.getParameter("redirect_uri");
				String code = request.getParameter("code");
				result = generateTokenByAuthCode(code, client_id, client_secret, redirect_uri);
				//
			break;
			case "password":
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				result = generateTokenByPassword(username, password, client_id, client_secret);
				//
			break;
			default: break;
		}
		
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().append(result);
	}
	
	private static String generateTokenByPassword(String username, String password, String client_id, String client_secret) {
		String json = "";
		return json;
	}
	
	private static String generateTokenByAuthCode(String code, String client_id, String client_secret, String redirect_uri) {
		String json = "";
		return json;
	}
	
	private static void browserBasedApps(HttpServletRequest request,HttpServletResponse response) {
		String response_type = request.getParameter("response_type");
		String client_id = request.getParameter("client_id");
		String redirect_uri = request.getParameter("redirect_uri");
		String scope = request.getParameter("scope");
		
		System.out.println(response_type);
		System.out.println(client_id);
		System.out.println(redirect_uri);
		System.out.println(scope);
		
		String authorizationCode = RandomStringUtils.random(40);
		System.out.println("Authorization Code: " + authorizationCode);
		
		/*try {
			System.out.println(URLEncoder.encode("https://www.google.cv/?gws_rd=cr&dcr=0&ei=6VDCWYD_C8aqU-LCpugC", "UTF-8"));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}*/
		
		String loginUrl = "http://localhost:8080/IGRP/webapps?r=igrp/login/login&oauth=1";
		loginUrl += response_type != null && !response_type.isEmpty() ? "&response_type=" + response_type : "";
		loginUrl += client_id != null && !client_id.isEmpty() ? "&client_id=" + client_id : "";
		loginUrl += redirect_uri != null && !redirect_uri.isEmpty() ? "&redirect_uri=" + redirect_uri : "";
		loginUrl += scope != null && !scope.isEmpty() ? "&scope=" + scope : "";
		//
		try {
			if(validateUri(response_type, client_id, redirect_uri, scope))
				response.sendRedirect(loginUrl);
			else
				response.sendError(500, "Ocorreu um erro. O servidor oauth2 não pode continuar ...");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static String getAuthorizationCode(String userCode, String response_type, String client_id, String redirect_uri, String scope) {
		String result = null;
		
		return result;
	}
	
	public static String getToken(String response_type, String client_id, String redirect_uri, String scope) {
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
	
	public static void main(String []args) {
		String authorizationCode = RandomStringUtils.randomAlphanumeric(40);
		System.out.println("Authorization Code: " + authorizationCode);
	}
	
}
