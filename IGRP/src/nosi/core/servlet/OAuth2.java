package nosi.core.servlet;
import java.io.BufferedReader;
/**
 * Marcel Iekiny
 * Sep 25, 2017
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URI;
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
import org.hibernate.Session;
import org.json.JSONException;
import org.json.JSONObject;

import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.OAuthAccessToken;
import nosi.webapps.igrp.dao.OAuthClient;
import nosi.webapps.igrp.dao.OAuthRefreshToken;
import nosi.webapps.igrp.dao.OAuthorizationCode;
import nosi.webapps.igrp.dao.User;

@WebServlet
public class OAuth2 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	public OAuth2() { 
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Config.configurationApp(); 
		OAuth2.browserBasedApps(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String grant_type = null;
		String client_id = null;
		String client_secret = null;
		
		String redirect_uri = null;
		String code = null;
		
		String username = null;
		String password = null;
		
		BufferedReader cin = request.getReader();
		String data = "";
		String aux = null;
		while((aux = cin.readLine()) != null)
			data += aux;
		
		JSONObject jsonObject = null;
		
		try {
			jsonObject = new JSONObject(data);
			grant_type = jsonObject.getString("grant_type");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		String result = "{\"error\":\"Invalid Request\"}";
		
			switch(grant_type) {
				case "authorization_code":
					
					try {
						client_id =  jsonObject.getString("client_id");
						client_secret =  jsonObject.getString("client_secret");
						redirect_uri =  jsonObject.getString("redirect_uri");
						code = jsonObject.getString("code");
					} catch (JSONException e) {
						e.printStackTrace();
					}
					
					
					if(OAuth2.validatePostData("authorization_code", code, client_id, client_secret, redirect_uri)) {
						try {
							result = generateTokenByAuthCode(code, client_id, client_secret, redirect_uri);
						}catch(Exception e) {
							result = "{\"error\":\"" + e.getMessage() + "\"}";
							e.printStackTrace(); 
						}
						//
					}
				break;
				case "password":
					
					Igrp.getInstance().init(this, request, response);
					
					try {
						client_id =  jsonObject.getString("client_id");
						client_secret =  jsonObject.getString("client_secret");
						username =  jsonObject.getString("username");
						password = jsonObject.getString("password");
					} catch (JSONException e) {
						e.printStackTrace();
					}
					
					result = generateTokenByPassword(username, password, client_id, client_secret);
					
				break;
				
				case "refresh_token":
					Igrp.getInstance().init(this, request, response);
					String refresh_token = "";
					try {
						client_id =  jsonObject.getString("client_id");
						client_secret =  jsonObject.getString("client_secret");
						refresh_token =  jsonObject.getString("refresh_token");
					} catch (JSONException e) {
						e.printStackTrace();
					}
					
					result = refreshToken(client_id, client_secret, refresh_token);
					
					break;
				
				default: break;
			}
		
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().append(result);
	}
	
	private static String refreshToken(String client_id, String client_secret, String refresh_token) {
		String json = "";
		
		Session session = new OAuthRefreshToken().getEntityManagerFactory().openSession();
		Query query4 = session.createQuery("select t from OAuthRefreshToken t where t.refresh_token = :_r");
		query4.setParameter("_r",refresh_token);
		OAuthRefreshToken refreshToken = (OAuthRefreshToken) query4.getSingleResult();
		
		if(refreshToken == null)
			return "{\"error\":\"Invalid refresh token ...\"}";
		
		if(!refreshToken.getAuthClient().getClient_id().equals(client_id) || !refreshToken.getAuthClient().getClient_secret().equals(client_secret))
			return "{\"error\":\"Invalid client ...\"}";
		
		/*	
		Query query3 = session.createQuery("select t from OAuthAccessToken t where t.authClient.client_id = :_c and t.user.id =  :_u and t.scope = :_s ORDER BY t.id DESC");
		query3.setParameter("_c", refreshToken.getAuthClient().getClient_id());
		query3.setParameter("_u", refreshToken.getUser().getId());
		query3.setParameter("_s", refreshToken.getScope());
		
		OAuthAccessToken aux1 = (OAuthAccessToken) query3.getSingleResult();
		
		if(aux1 == null || aux1.getExpires().compareTo(System.currentTimeMillis() + "") <= 0) {
			aux1 = new OAuthAccessToken();
			aux1.setAccess_token(RandomStringUtils.randomAlphanumeric(40));
			aux1.setExpires("" + (System.currentTimeMillis() + 1000*60*2));
			aux1.setUser(refreshToken.getUser());
			aux1.setScope(refreshToken.getScope()); 
			aux1.setAuthClient(refreshToken.getAuthClient());
			
			session.beginTransaction();
			session.persist(aux1);
			session.getTransaction().commit();
		}*/
		
		OAuthAccessToken aux1 = new OAuthAccessToken();
		aux1.setAccess_token(java.util.UUID.randomUUID().toString().replaceAll("-", ""));
		aux1.setExpires("" + (System.currentTimeMillis() + 1000*3600)); // 1h
		aux1.setUser(refreshToken.getUser());
		aux1.setScope(refreshToken.getScope()); 
		aux1.setAuthClient(refreshToken.getAuthClient());
		
		session.beginTransaction();
		session.persist(aux1);
		session.getTransaction().commit();
		
		json = "{" + "\"access_token\":\"" + aux1.getAccess_token() + "\", " +
				"\"token_type\":\"bearer\" , " + 
				"\"expires_in\":" + ((Long.parseLong(aux1.getExpires()) - System.currentTimeMillis())/1000) + ", " + 
				"\"refresh_token\":\"" + refreshToken.getRefresh_token() + "\"" +
			 "}";
		
		return json;
	}
	
	private static String generateTokenByPassword(String username, String password, String client_id, String client_secret) {
		String json = "";
		
		try {	
			User user = new User();
			Session session = user.getEntityManagerFactory().openSession();
			
			Query query = session.createQuery("select u from User u where u.user_name = :_u");
			query.setParameter("_u", username);
			
			try {
				user = (User) query.getSingleResult();
			}catch(Exception e) {
				throw new RuntimeException("Utilizador inválido");
			}
			
			if(user == null)
				throw new RuntimeException("Utilizador inválido");
			
			if(!user.getPass_hash().equals(nosi.core.webapp.User.encryptToHash(password, "MD5")))
				throw new RuntimeException("Username ou password inválido");
			
			Query query2 = session.createQuery("select t from OAuthClient t where t.client_id = :_c");
			query2.setParameter("_c", client_id);
			OAuthClient authClient = null;
			
			try {
				authClient = (OAuthClient) query2.getSingleResult();
			}catch(Exception e) {
				throw new RuntimeException("ClientId inválido.");
			}
			
			if(authClient == null)
				throw new RuntimeException("ClientId inválido.");
				
			if(!authClient.getClient_secret().equals(client_secret))
				throw new RuntimeException("Client Secret inválido.");
			
			Query query3 = session.createQuery("select t from OAuthAccessToken t where t.authClient.client_id = :_c and t.user.id =  :_u and t.scope = :_s ORDER BY t.id DESC");
			query3.setParameter("_c", authClient.getClient_id());
			query3.setParameter("_u", user.getId());
			query3.setParameter("_s", authClient.getScope());
			List list = query3.getResultList();
			
			Query query4 = session.createQuery("select t from OAuthRefreshToken t where t.authClient.client_id = :_c and t.user.id =  :_u and t.scope = :_s ORDER BY t.id DESC");
			query4.setParameter("_c", authClient.getClient_id());
			query4.setParameter("_u", user.getId());
			query4.setParameter("_s", authClient.getScope());
			List list2 = query4.getResultList();
			
			OAuthAccessToken aux1 = new OAuthAccessToken();
			aux1.setAccess_token(java.util.UUID.randomUUID().toString().replaceAll("-", ""));
			aux1.setExpires("" + (System.currentTimeMillis() + 1000*3600)); // 1h
			aux1.setUser(user);
			aux1.setScope(authClient.getScope()); 
			aux1.setAuthClient(authClient);
			
			OAuthRefreshToken aux2 = new OAuthRefreshToken();
			aux2.setRefresh_token(java.util.UUID.randomUUID().toString().replaceAll("-", ""));
			aux2.setExpires("" + (System.currentTimeMillis() + 1000*3600*24*7)); // a week ...
			aux2.setUser(user);
			aux2.setScope(authClient.getScope()); 
			aux2.setAuthClient(authClient);
			
			if(list != null && list.size() > 0) {
				OAuthAccessToken accessToken = (OAuthAccessToken) list.get(0);
				if(list2 != null && list2.size() > 0) {
					OAuthRefreshToken refreshToken = (OAuthRefreshToken) list2.get(0);
					
					if(refreshToken.getExpires().compareTo(System.currentTimeMillis() + "") > 0) {
						json = "{" + "\"access_token\":\"" + accessToken.getAccess_token() + "\", " +
								"\"token_type\":\"bearer\" , " + 
								"\"expires_in\":" + ((Long.parseLong(accessToken.getExpires()) - System.currentTimeMillis())/1000) + ", " + 
								"\"refresh_token\":\"" + refreshToken.getRefresh_token() + "\"" +
							 "}";
					}else {
						session.beginTransaction();
						session.persist(aux2);
						session.getTransaction().commit();
						json = "{" + "\"access_token\":\"" + accessToken.getAccess_token() + "\", " +
								"\"token_type\":\"bearer\" , " + 
								"\"expires_in\":" + ((Long.parseLong(accessToken.getExpires()) - System.currentTimeMillis())/1000) + ", " + 
								"\"refresh_token\":\"" + aux2.getRefresh_token() + "\"" +
							 "}";
					}
				}else {
					session.beginTransaction();
					session.persist(aux2);
					session.getTransaction().commit();
					json = "{" + "\"access_token\":\"" + accessToken.getAccess_token() + "\", " +
							"\"token_type\":\"bearer\" , " + 
							"\"expires_in\":" + ((Long.parseLong(accessToken.getExpires()) - System.currentTimeMillis())/1000) + ", " + 
							"\"refresh_token\":\"" + aux2.getRefresh_token() + "\"" +
						 "}";
				}
			}else {
				session.beginTransaction();
				session.persist(aux1);
				session.persist(aux2);
				session.getTransaction().commit();
				json = "{" + "\"access_token\":\"" + aux1.getAccess_token() + "\", " +
						"\"token_type\":\"bearer\" , " + 
						"\"expires_in\":" + ((Long.parseLong(aux1.getExpires()) - System.currentTimeMillis())/1000) + ", " + 
						"\"refresh_token\":\"" + aux2.getRefresh_token() + "\"" +
					 "}";
			}
		
		/*if(OAuth2.validatePostData("password", code, client_id, client_secret, redirect_uri)) {
			
			
			result = generateTokenByPassword(username, password, client_id, client_secret);
			//
		} 
		*/
	}catch(Exception e) {
		json = "{\"error\":\"" + e.getMessage() + "\"}";
		e.printStackTrace();
	}
		
		return json;
	}
	
	private static String generateTokenByAuthCode(String code, String client_id, String client_secret, String redirect_uri) {
		String json = "";
		
		OAuthClient authClient = new OAuthClient().find().andWhere("client_id", "=", client_id).one();
		OAuthorizationCode authorizationCode = new OAuthorizationCode().find().andWhere("authorization_code", "=", code).one();
		
		if(authClient == null)
			throw new RuntimeException("ClientId Inválido");
		
		if(!authClient.getClient_secret().equalsIgnoreCase(client_secret))
			throw new RuntimeException("ClientSecret Inválido");
		
		if(authorizationCode == null)
			throw new RuntimeException("AuthorizationCode inconsistente");
		
		if(!authorizationCode.getAuthClient().getClient_id().equalsIgnoreCase(authClient.getClient_id()))
			throw new RuntimeException("ClientId Inválido para o Code");
		
		if(!(authorizationCode.getExpires().compareTo(System.currentTimeMillis() + "") > 0))
			throw new RuntimeException("Code has been expired");
		
		//OAuthAccessToken accessToken = new OAuthAccessToken();
		
		Session session = authorizationCode.getEntityManagerFactory().openSession();
		Query query = session.createQuery("select t from OAuthAccessToken t where t.authClient.client_id = :_c and t.user.id =  :_u and t.scope = :_s ORDER BY t.id DESC");
		query.setParameter("_c", authClient.getClient_id());
		query.setParameter("_u", authorizationCode.getUser().getId());
		query.setParameter("_s", authClient.getScope());
		List list = query.getResultList();
		
		Query query4 = session.createQuery("select t from OAuthRefreshToken t where t.authClient.client_id = :_c and t.user.id =  :_u and t.scope = :_s ORDER BY t.id DESC");
		query4.setParameter("_c", authClient.getClient_id());
		query4.setParameter("_u", authorizationCode.getUser().getId());
		query4.setParameter("_s", authClient.getScope());
		List list2 = query4.getResultList();
		
		OAuthAccessToken aux = new OAuthAccessToken();
		aux.setAccess_token(java.util.UUID.randomUUID().toString().replaceAll("-", ""));
		aux.setExpires("" + (System.currentTimeMillis() + 1000*3600)); // 1h
		User user = new User();
		user.setId(authorizationCode.getUser().getId());
		aux.setUser(user);
		aux.setScope(authClient.getScope());
		aux.setAuthClient(authClient);
		
		OAuthRefreshToken aux2 = new OAuthRefreshToken();
		aux2.setRefresh_token(java.util.UUID.randomUUID().toString().replaceAll("-", ""));
		aux2.setExpires("" + (System.currentTimeMillis() + 1000*3600*24*7)); // a week ...
		aux2.setUser(user);
		aux2.setScope(authClient.getScope()); 
		aux2.setAuthClient(authClient);
		
		if(list != null && list.size() > 0) {
			OAuthAccessToken accessToken = (OAuthAccessToken) list.get(0);
			if(list2 != null && list2.size() > 0) {
				OAuthRefreshToken refreshToken = (OAuthRefreshToken) list2.get(0);
				
				if(refreshToken.getExpires().compareTo(System.currentTimeMillis() + "") > 0) {
					json = "{" + "\"access_token\":\"" + accessToken.getAccess_token() + "\", " +
							"\"token_type\":\"bearer\" , " + 
							"\"expires_in\":" + ((Long.parseLong(accessToken.getExpires()) - System.currentTimeMillis())/1000) + ", " + 
							"\"refresh_token\":\"" + refreshToken.getRefresh_token() + "\"" +
						 "}";
				}else {
					session.beginTransaction();
					session.persist(aux2);
					session.getTransaction().commit();
					json = "{" + "\"access_token\":\"" + accessToken.getAccess_token() + "\", " +
							"\"token_type\":\"bearer\" , " + 
							"\"expires_in\":" + ((Long.parseLong(accessToken.getExpires()) - System.currentTimeMillis())/1000) + ", " + 
							"\"refresh_token\":\"" + aux2.getRefresh_token() + "\"" +
						 "}";
				}
			}else {
				session.beginTransaction();
				session.persist(aux2);
				session.getTransaction().commit();
				json = "{" + "\"access_token\":\"" + accessToken.getAccess_token() + "\", " +
						"\"token_type\":\"bearer\" , " + 
						"\"expires_in\":" + ((Long.parseLong(accessToken.getExpires()) - System.currentTimeMillis())/1000) + ", " + 
						"\"refresh_token\":\"" + aux2.getRefresh_token() + "\"" +
					 "}";
			}
		}else {
			session.beginTransaction();
			session.persist(aux);
			session.persist(aux2);
			session.getTransaction().commit();
			json = "{" + "\"access_token\":\"" + aux.getAccess_token() + "\", " +
					"\"token_type\":\"bearer\" , " + 
					"\"expires_in\":" + ((Long.parseLong(aux.getExpires()) - System.currentTimeMillis())/1000) + ", " + 
					"\"refresh_token\":\"" + aux2.getRefresh_token() + "\"" +
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
		
		System.out.println(loginUrl); 
		//
		try {
			if(validateUri(response_type, client_id, redirect_uri, scope)) { 
				try {
						response.sendRedirect(loginUrl);
					}
				catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}else
				response.sendError(500, "Ocorreu um erro. O servidor oauth2 não pode continuar ...");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getAuthorizationCode(String userCode, String response_type, String client_id, String redirect_uri, String scope) {
			String result = null;
		
			OAuthClient authClient = new OAuthClient().find().andWhere("client_id", "=", client_id).one();
			
			//System.out.println(authClient);
			
			if(authClient != null) {
				
				if(!authClient.getScope().equalsIgnoreCase(scope))
					throw new RuntimeException("Scope Inválido");
				
				if(!authClient.getRedirect_uri().equalsIgnoreCase(redirect_uri))
					throw new RuntimeException("RedirectUri Inválido");
				
				if(!(authClient.getUser().getId() + "").equalsIgnoreCase(userCode))
					throw new RuntimeException("ClientId Inválido para o utilizador");
				
				if(!authClient.getGrant_types().equalsIgnoreCase(response_type.equalsIgnoreCase("code") ? "authorization_code" : ""))
					throw new RuntimeException("ResponseType inválido");
				
				OAuthorizationCode authorizationCode = new OAuthorizationCode();
				
				Session session = authorizationCode.getEntityManagerFactory().openSession();
				
				Query query = session.createQuery("select t from OAuthorizationCode t where client_id = :_c and user_id = :_u and scope = :_s "
						+ "and redirect_uri = :_uri ORDER BY t.id DESC");
				query.setParameter("_c", authClient.getClient_id() + "")
				.setParameter("_u", Integer.parseInt(userCode))
				.setParameter("_s", authClient.getScope())
				.setParameter("_uri", authClient.getRedirect_uri());
				
				List list = query.getResultList();
				
				OAuthorizationCode aux  = new OAuthorizationCode();
				aux.setAuthClient(authClient);
				aux.setExpires("" + (System.currentTimeMillis() + 1000*3600)); // 1h
				aux.setScope(authClient.getScope());
				aux.setRedirect_uri(authClient.getRedirect_uri());
				aux.setAuthorization_code(java.util.UUID.randomUUID().toString().replaceAll("-", "")); // RandomStringUtils.randomAlphanumeric(40) is not unique but random
				User user = new User();
				user.setId(Integer.parseInt(userCode));
				aux.setUser(user);
				
				if(list != null && list.size() > 0) {
					authorizationCode = (OAuthorizationCode) list.get(0);
					String time = System.currentTimeMillis() + "";
					if(authorizationCode.getExpires().compareTo(time + "") > 0) {
						result = authorizationCode.getAuthorization_code();
					}else {
						session.beginTransaction();
						session.persist(aux);
						session.getTransaction().commit();
						result = aux.getAuthorization_code();
					}
				}else { 
					session.beginTransaction();
					session.persist(aux);
					session.getTransaction().commit();
					result = aux.getAuthorization_code();
				}
				
			}else
				throw new RuntimeException("ClientId Inválido");
		
		return result;
	}
	
	public static String getAccessToken(String userCode, String response_type, String client_id, String redirect_uri, String scope) {
		String result = null;
		
		OAuthClient authClient = new OAuthClient().find().andWhere("client_id", "=", client_id).one();
		
		if(authClient != null) {
			
			if(!authClient.getScope().equalsIgnoreCase(scope))
				throw new RuntimeException("Scope Inválido para client_id");
			
			if(!authClient.getRedirect_uri().equalsIgnoreCase(redirect_uri))
				throw new RuntimeException("RedirectUri Inválido para client_id");
			
			OAuthAccessToken accessToken = new OAuthAccessToken();
			
			Session session = accessToken.getEntityManagerFactory().openSession();
			Query query = session.createQuery("select t from OAuthAccessToken t where t.authClient.client_id = :_c and t.user.id =  :_u and t.scope = :_s ORDER BY t.id DESC");
			query.setParameter("_c", authClient.getClient_id());
			query.setParameter("_u", Integer.parseInt(userCode));
			query.setParameter("_s", scope);
			
			List list = query.getResultList();
			
			OAuthAccessToken aux = new OAuthAccessToken();
			aux.setAccess_token(java.util.UUID.randomUUID().toString().replaceAll("-", ""));
			aux.setExpires("" + (System.currentTimeMillis() + 1000*3600)); // 1h
			User user = new User();
			user.setId(Integer.parseInt(userCode));
			aux.setUser(user);
			aux.setScope(authClient.getScope());
			aux.setAuthClient(authClient);
			
			if(list != null && list.size() > 0) {
				accessToken = (OAuthAccessToken) list.get(0);
				if(accessToken.getExpires().compareTo(System.currentTimeMillis() + "") > 0) {
					result = accessToken.getAccess_token();
				}else {
					session.beginTransaction();
					session.persist(aux);
					session.getTransaction().commit();
					
					result = aux.getAccess_token();
					
				}
			}else {
				session.beginTransaction();
				session.persist(aux);
				session.getTransaction().commit();
				
				result = aux.getAccess_token();
			}
		}else
			throw new RuntimeException("ClientId Inválido");
			
		return result;
	}
	
	public static boolean validateUri(String response_type, String client_id, String redirect_uri, String scope) {
		boolean flag = true && response_type != null && !response_type.isEmpty() && client_id != null && !client_id.isEmpty() && redirect_uri != null && 
				!redirect_uri.isEmpty() && scope != null && !scope.isEmpty();
		return flag;
	}
	
	public static boolean validatePostData(String grant_type, String code, String client_id, String client_secret, String redirect_uri) {
		boolean flag = false;
		switch(grant_type) {
			case "authorization_code":
				flag = (code != null && !code.isEmpty()) && (client_id != null && !client_id.isEmpty()) && (client_secret != null && !client_secret.isEmpty());
			break;
			default:break;
		}
		return flag;
	}
	
	public static String buildUrl(String redirectUrl, int type, String value) {
		boolean isQueryPresent = java.net.URI.create(redirectUrl).getQuery() != null;
		switch(type) {
			case 1: // ?code
				redirectUrl += isQueryPresent ? "&code=" + value : "?code=" + value;
			break;
			case 2: // #token
				redirectUrl += "#token=" + value;
			break;
			case 3: // ?error
				try {
					value = java.net.URLEncoder.encode(value, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				redirectUrl += isQueryPresent ? "&error=" + value : "?error=" + value;
			break;
			case 4: // #error 
				try {
					value = java.net.URLEncoder.encode(value, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				redirectUrl +=  "#error=" + value;
			break;
			default:break;
		}
		return redirectUrl;
	}
	
}
