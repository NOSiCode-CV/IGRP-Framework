package nosi.core.webapp;

import java.util.Arrays;
import java.util.Optional;
import java.util.Properties;
import java.util.regex.Pattern;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import nosi.core.authentication.OAuth2OpenIdAuthenticationManager;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.core.webapp.security.PagesScapePermission;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

public final class ApplicationManager {
	
	public final static String LOGIN_LINK = "/app/webapps?r=igrp/login/login";
	
	private static final Logger LOGGER = LogManager.getLogger(ApplicationManager.class);
	
	private ApplicationManager() {}
	
	public static Optional<String> buildAppLinkFromStateParam(HttpServletRequest request) {
		Optional<String> url = Optional.empty();
		String state = request.getParameter("state");
		if(state != null) {
			String []aux = state.split("/"); // Ex.: ENV/id/APP;ORG;PROF/p_id=1;p_type=3
			if(aux.length >= 2) { 
				String type = aux[0]; 
				String value = aux[1]; 
				String context = null; 
				String params = null; 
				String dad = null;
				String orgCode = null;
				String profCode = null; 
				String page = null;
				if(aux.length > 2) {
					context = aux[2]; 
					if(aux.length == 4)
						params = aux[3];
				}	
				if(context != null) {
					String []allContext = context.split(";"); 
					if(allContext.length > 0) { 
						if(allContext[0] != null && !allContext[0].isEmpty())
							dad = allContext[0]; 
						if(allContext.length == 3) {
							orgCode = allContext[1] != null && !allContext[1].isEmpty() ? allContext[1] : null; 
							profCode = allContext[2] != null && !allContext[2].isEmpty() ? allContext[2] : null; 
							// inject session and cookie 
							if(orgCode != null && profCode != null)
								/*injectOrgNProf(orgCode, profCode)*/; 
						}
					}
				}
				switch (type) {
					case "ENV":
						Application application = new Application().findByDad(dad); 
						if(application != null) {
							dad = application.getDad(); 
							nosi.webapps.igrp.dao.Action ac = application.getAction(); 
							page = "tutorial/DefaultPage/index&title=";
							if(ac != null && ac.getApplication()!=null) 
								page = ac.getApplication().getDad().toLowerCase() + "/" + ac.getPage() + "/index&title="+ac.getAction_descr();
						}
					break;
					case "PAGE":
						Action ac = new Action().findOne(Integer.valueOf(value));
						if(ac != null && ac.getApplication() != null) { 
							Application envIgrpWeb = new Application().find().andWhere("dad", "=", dad).one(); 
							if(envIgrpWeb == null) {
								Application envIgrpPlSql = new Application().find().andWhere("plsql_code", "=", dad).one(); 
								if(envIgrpPlSql != null) dad = envIgrpPlSql.getDad(); 
							}
							page = ac.getApplication().getDad().toLowerCase() + "/" + ac.getPage() + "/index&title="+ac.getAction_descr(); 
						}
					break;
					case "ACTI":
						//Core.startTask(taskId)
					break;
					default: page = "igrp/home/index";
				}
				String []pageNTitle = page.split(Pattern.quote("&"));
				page = EncrypDecrypt.encryptURL(pageNTitle[0], request.getRequestedSessionId()).replace(" ", "+");
				url = Optional.of(String.format("app/webapps?r=%s&dad=%s%s", page, dad, pageNTitle.length > 1 ? "&" + pageNTitle[1] : ""));
			}
		}
		return url;
	}
	
	public static Optional<String> buildAppLink(HttpServletRequest request) {
		Optional<String> url = Optional.empty();
		String page = request.getParameter("r");
		if(page != null && page.split("/").length == 3) {
			page = EncrypDecrypt.encryptURL(page, request.getRequestedSessionId()).replace(" ", "+");
			url = Optional.of(String.format("app/webapps?r=%s", page));
		}
		return url;
	}
	
	public static boolean isPublic(HttpServletRequest request) {
		String r = request.getParameter("r");
		final String isPublic = request.getParameter("isPublic");
		if(r == null || isPublic == null || !Arrays.asList("1", "2").contains(isPublic))
			return false;
		if(PagesScapePermission.PAGES_WIDTHOUT_LOGIN.contains(r.toLowerCase()))
			return true;
		if("2".equals(isPublic)) {
			r = r.replace(" ", "+");	
			r = EncrypDecrypt.decryptURL(r, EncrypDecrypt.SECRET_KEY_PUBLIC_PAGE);
		}
		String[] c = r.split("/");
		if(c.length > 1)
			return new Action().isPublicPage(c[0], c[1]);
		return false;
	}
	
	public static boolean isInWhiteList(HttpServletRequest request) {
		String r = request.getParameter("r");
		if(r == null)
			return false;
		return PagesScapePermission.PAGES_SCAPE_ENCRYPT.contains(r.toLowerCase());
	}
	
	public static boolean isLoginPage(HttpServletRequest request) {
		String r = request.getParameter("r");
		return "igrp/login/login".equals(r);
	}
	
	public static Optional<String> buildOAuth2AuthorizeLink(HttpServletRequest request) {
		Properties settings = loadConfig();
		String authenticationType = settings.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.value()); 
		String authorizeEndpoint = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_AUTHORIZE.value(), "");
		Optional<String> optionalUrl = Optional.empty();
		if(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value().equals(authenticationType) && !"".equals(authorizeEndpoint)) {
			HttpSession session = request.getSession(); // false 
			if(session.getAttribute("oauth2-openid-authorizationCode") != null) // avoiding too many redirect
				return optionalUrl;
			session.setAttribute("oauth2-openid-authorizationCode", "1");
			String redirectUri = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.value());
			String clientId = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_ID.value());
			String r = request.getParameter("r");
			String state = null;
			if(r != null) {
				String []arr = r.split("/");
				if(arr.length == 3) {
					Action page = new Action().find().andWhere("application.dad", "=", arr[0]).andWhere("page", "=", arr[1]).one();
					if(page != null)
						state = String.format("&state=PAGE/%s/%s", page.getId(), arr[0]);
				}
			}
			optionalUrl = Optional.of(String.format("%s?response_type=code&client_id=%s&scope=openid+email+profile%s&redirect_uri=%s", authorizeEndpoint, clientId, state != null ? state : "", redirectUri));
		}
		return optionalUrl;
	}
	
	public static Properties loadConfig() {
		Properties config = new Properties();
		try {
			config.loadFromXML(Thread.currentThread().getContextClassLoader().getResourceAsStream("config/common/main.xml"));
		} catch (Exception e) {
			LOGGER.error(e);
		}
		return config;
	}
	
	public static Optional<String> processCallback(HttpServletRequest request) {
		Optional<String> url = Optional.empty();
		Properties settings = loadConfig();
		String authenticationType = settings.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.value());
		if(!ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value().equals(authenticationType))
			return url;
		HttpSession session = request.getSession(false);
		String isAuthorizationCodeGrantType = (String) session.getAttribute("oauth2-openid-authorizationCode");
		session.removeAttribute("oauth2-openid-authorizationCode");
		if("1".equals(isAuthorizationCodeGrantType)) {
			try {
				OAuth2OpenIdAuthenticationManager.authorizationCodeSwap(request);
				Optional<String> urlFromState = buildAppLinkFromStateParam(request);
				return urlFromState.isPresent() ? urlFromState : Optional.of(homeUrl(request));
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("oauth2_openid_error", e.getMessage());
				return Optional.of(OAuth2OpenIdAuthenticationManager.OAUTH2_OPENID_PAGE);
			}
		}
		return url;
	}
	
	public static String homeUrl(HttpServletRequest request) {
		return String.format("%s?r=igrp/home/index", request.getRequestURL());
	}

}
