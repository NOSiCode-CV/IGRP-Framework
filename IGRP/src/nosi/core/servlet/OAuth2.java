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
import java.util.List;

import javax.persistence.Query;
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
import org.hibernate.Session;

import nosi.core.config.Config;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.OAuthAccessToken;
import nosi.webapps.igrp.dao.OAuthClient;
import nosi.webapps.igrp.dao.OAuthorizationCode;
import nosi.webapps.igrp.dao.User;

@WebServlet
public class OAuth2 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	public OAuth2() { 
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Config.configurationApp();
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
				result = generateTokenByAuthCode("2", code, client_id, client_secret, redirect_uri);
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
	
	private static String generateTokenByAuthCode(String userCode, String code, String client_id, String client_secret, String redirect_uri) {
		String json = "";
		
		OAuthClient authClient = new OAuthClient().find().andWhere("client_id", "=", client_id).one();
		OAuthorizationCode authorizationCode = new OAuthorizationCode().find().andWhere("authorization_code", "=", code).one();
		
		if(authClient == null)
			throw new RuntimeException("ClientId Inválido.");
		
		if(!authClient.getClient_secret().equalsIgnoreCase(client_secret))
			throw new RuntimeException("ClientSecret Inválido.");
		
		if(!authorizationCode.getAuthClient().getClient_id().equalsIgnoreCase(authClient.getClient_id()))
			throw new RuntimeException("ClientId Inválido para o Code.");
		
		if(!(authorizationCode.getExpires().compareTo(System.currentTimeMillis() + "") > 0))
			throw new RuntimeException("Code has been expired.");
		
		OAuthAccessToken accessToken = new OAuthAccessToken();
		
		Session session = authorizationCode.getEntityManagerFactory().openSession();
		Query query = session.createQuery("select t from OAuthAccessToken t where t.client_id = :_c and t.user_id =  :_u ORDER BY t.expires DESC");
		query.setParameter("_c", authClient.getClient_id());
		query.setParameter("_u", userCode);
		
		List list = query.getResultList();
		
		OAuthAccessToken aux = new OAuthAccessToken();
		aux.setAccess_token(RandomStringUtils.randomAlphanumeric(40));
		aux.setExpires("" + (System.currentTimeMillis() + 1000*60*2));
		User user = new User();
		user.setId(Integer.parseInt(userCode));
		aux.setUser(user);
		aux.setScope(authClient.getScope());
		aux.setAuthClient(authClient);
		
		if(list != null && list.size() > 0) {
			accessToken = (OAuthAccessToken) list.get(0);
			if(accessToken.getExpires().compareTo(System.currentTimeMillis() + "") > 0) {
				//
			}else {
				session.beginTransaction();
				session.persist(aux);
				session.getTransaction().commit();
				System.out.println("Objecto registado com sucesso. Token1");
				
				json += "{" + "\"access_token\":" + aux.getAccess_token() + ", " +
							"\"token_type\":\"bearer\" , " + 
							"\"expires\":" + aux.getExpires() + ", " + 
						 "}";
				
			}
		}else {
			session.beginTransaction();
			session.persist(aux);
			session.getTransaction().commit();
			System.out.println("Objecto registado com sucesso. Token2");
			json += "{" + "\"access_token\":" + aux.getAccess_token() + ", " +
					"\"token_type\":\"bearer\" , " + 
					"\"expires\":" + aux.getExpires() + ", " + 
				 "}";
		}
		
		return json;
	}
	
	private static void browserBasedApps(HttpServletRequest request,HttpServletResponse response) {
		String response_type = request.getParameter("response_type");
		String client_id = request.getParameter("client_id");
		String redirect_uri = request.getParameter("redirect_uri");
		String scope = request.getParameter("scope");
	
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
			if(validateUri(response_type, client_id, redirect_uri, scope)) {
				//response.sendRedirect(loginUrl); 
				try {	
						String code = getAuthorizationCode("2", response_type, client_id, redirect_uri, scope);
						System.out.println("Code: " + code);
					}
				catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
			else
				response.sendError(500, "Ocorreu um erro. O servidor oauth2 não pode continuar ...");
		} catch (IOException e) {
			// TODO Auto-generated catch block 
			e.printStackTrace();
		}
	}
	
	public static String getAuthorizationCode(String userCode, String response_type, String client_id, String redirect_uri, String scope) {
			String result = null;
		
			OAuthClient authClient = new OAuthClient().find().andWhere("client_id", "=", client_id).one();
			
			System.out.println(authClient);
			
			if(authClient != null) {
				
				if(!authClient.getScope().equalsIgnoreCase(scope))
					throw new RuntimeException("Scope Inválido.");
				
				if(!authClient.getRedirect_uri().equalsIgnoreCase(redirect_uri))
					throw new RuntimeException("RedirectUri Inválido.");
				
				if(!(authClient.getUser().getId() + "").equalsIgnoreCase(userCode))
					throw new RuntimeException("ClientId Inválido para o utilizador.");
				
				if(!authClient.getGrant_types().equalsIgnoreCase(response_type.equalsIgnoreCase("code") ? "authorization_code" : ""))
					throw new RuntimeException("ResponseType inválido.");
				
				OAuthorizationCode authorizationCode = new OAuthorizationCode();
				
				Session session = authorizationCode.getEntityManagerFactory().openSession();
				
				Query query = session.createQuery("select t from OAuthorizationCode t where client_id = :_c and user_id = :_u and scope = :_s "
						+ "and redirect_uri = :_uri ORDER BY t.expires DESC");
				query.setParameter("_c", authClient.getClient_id() + "")
				.setParameter("_u", authClient.getUser().getId() + "")
				.setParameter("_s", authClient.getScope())
				.setParameter("_uri", authClient.getRedirect_uri());
				
				List list = query.getResultList();
				
				OAuthorizationCode aux  = new OAuthorizationCode();
				aux.setAuthClient(authClient);
				aux.setExpires("" + (System.currentTimeMillis() + 1000*60*2)); // Expires -> 2 min.
				aux.setScope(authClient.getScope());
				aux.setRedirect_uri(authClient.getRedirect_uri());
				aux.setAuthorization_code(RandomStringUtils.randomAlphanumeric(40));
				User user = new User();
				user.setId(Integer.parseInt(userCode));
				aux.setUser(user);
				
				if(list != null && list.size() > 0) {
					authorizationCode = (OAuthorizationCode) list.get(0);
					System.out.println(authorizationCode.getExpires());
					String time = System.currentTimeMillis() + "";
					if(authorizationCode.getExpires().compareTo(time + "") > 0) {
						result = authorizationCode.getAuthorization_code();
					}else {
						session.beginTransaction();
						session.persist(aux);
						session.getTransaction().commit();
						result = aux.getAuthorization_code();
						System.out.println("Objecto registado com sucesso.");
					}
				}else { 
					session.beginTransaction();
					session.persist(aux);
					session.getTransaction().commit();
					result = aux.getAuthorization_code();
					System.out.println("Objecto registado com sucesso.");
				}
				
			}else
				throw new RuntimeException("ClientId Inválido.");
		
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
