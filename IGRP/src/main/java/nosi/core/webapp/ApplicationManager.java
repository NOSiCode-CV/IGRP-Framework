package nosi.core.webapp;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;
import java.util.regex.Pattern;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import nosi.core.authentication.OAuth2OpenIdAuthenticationManager;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.core.webapp.security.PagesScapePermission;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

public final class ApplicationManager {

	public final static String LOGIN_PAGE = "/app/webapps?r=igrp/login/login";
	private static final Logger LOGGER = LogManager.getLogger(ApplicationManager.class);

	private ApplicationManager() {}
	
	public static Optional<String> buildAppLink(HttpServletRequest request) {
		Optional<String> url = Optional.empty();
		String page = request.getParameter("r");
		String dad = request.getParameter("dad");
		if (page != null && page.split("/").length == 3) {
			page = EncrypDecrypt.encryptURL(page, request.getRequestedSessionId()).replace(" ", "+");
			dad = dad != null && !dad.trim().isEmpty() ? String.format("&dad=%s", dad) : "";
			StringBuilder additionalParams = new StringBuilder("");
			Enumeration<String> paramNames = request.getParameterNames();
			while(paramNames.hasMoreElements()) {
				String paramName = paramNames.nextElement();
				if(!"r".equals(paramName) && !"dad".equals(paramName)) // skipping "r" and "dad" param
					additionalParams.append(String.format("&%s=%s", paramName, encodeParameterValue(request.getParameter(paramName))));
			}
			url = Optional.of(String.format("%s?r=%s%s%s", requestUrl(request), page, dad, additionalParams));
		}
		return url;
	}

	public static boolean isPublic(HttpServletRequest request) {
		String r = request.getParameter("r");
		final String isPublic = request.getParameter("isPublic");
		if (r == null || isPublic == null || !Arrays.asList("1", "2").contains(isPublic))
			return false;
		if (PagesScapePermission.PAGES_WIDTHOUT_LOGIN.contains(r.toLowerCase()))
			return true;
		if ("2".equals(isPublic)) {
			r = r.replace(" ", "+");
			r = EncrypDecrypt.decryptURL(r, EncrypDecrypt.SECRET_KEY_PUBLIC_PAGE);
		}
		String[] c = r.split("/");
		if (c.length > 1)
			return new Action().isPublicPage(c[0], c[1]);
		return false;
	}

	public static boolean isInWhiteList(HttpServletRequest request) {
		String r = request.getParameter("r");
		if (r == null)
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
		String redirectUri = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.value());
		String clientId = settings.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_ID.value());
		if (ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value().equals(authenticationType)
				&& !"".equals(authorizeEndpoint)
				&& /**Too many redirect on sight*/ !request.getRequestURL().toString().endsWith(OAuth2OpenIdAuthenticationManager.CALLBACK_PATH)) {
			rememberRoute(request);
			return Optional.of(String.format("%s?response_type=code&client_id=%s&scope=openid+email+profile&redirect_uri=%s", authorizeEndpoint, clientId, redirectUri));
		}
		return Optional.empty();
	}
	
	public static Optional<String> processCallback(HttpServletRequest request) {
		Properties settings = loadConfig();
		String authenticationType = settings.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.value());
		if (!ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value().equals(authenticationType)
				|| /**Too many redirect on sight*/ !request.getRequestURL().toString().endsWith(OAuth2OpenIdAuthenticationManager.CALLBACK_PATH))
			return Optional.empty();
		if(OAuth2OpenIdAuthenticationManager.isSignOutRequest(request))
			return Optional.of(requestUrl(request));
		try {
			OAuth2OpenIdAuthenticationManager.authorizationCodeSwap(request);
			Optional<String> returnUrl = buildAppLinkFromStateParam(request);
			if(returnUrl.isEmpty())
				returnUrl = buildAppLinkFromSession(request);
			return returnUrl.isPresent() ? returnUrl : Optional.of(homeUrl(request));
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
			request.setAttribute(OAuth2OpenIdAuthenticationManager.OAUTH2_OPENID_ERROR_PARAM_NAME, e.getMessage());
			return Optional.of(OAuth2OpenIdAuthenticationManager.OAUTH2_OPENID_PAGE);
		}
	}

	public static String homeUrl(HttpServletRequest request) {
		return String.format("%s?r=igrp/home/index", requestUrl(request));
	}

	public static String requestUrl(HttpServletRequest request) {
		String url = request.getRequestURL().toString();
		url = url.replaceFirst("/callback", "/webapps");
		String clientRequestProtocol = request.getHeader("X-Forwarded-Proto");
		if(clientRequestProtocol != null && !clientRequestProtocol.trim().isEmpty()) {
			int index = url.indexOf("://");
			if(index != -1)
				url = String.format("%s%s", clientRequestProtocol, url.substring(index));
		}
		System.out.println("X-Forwarded-Proto: " + clientRequestProtocol);
		System.out.println("RequestUrl : " + url);
		return url;
	}
	
	private static Map<String, String> extractStateValues(String state){
		Map<String, String> stateValues = new HashMap<String, String>();
		if(state == null || state.trim().isEmpty())
			return stateValues;
		String[] aux = state.split("/"); // Ex.: ENV/id/APP;ORG;PROF/p_id=1;p_type=3
		if (aux.length >= 2) {
			stateValues.put("type", aux[0]);
			stateValues.put("value", aux[1]);
			if (aux.length > 2) {
				stateValues.put("context", aux[2]);
				if (aux.length == 4)
					stateValues.put("params", aux[3]);
			}
			if (stateValues.containsKey("context")) {
				String[] allContext = stateValues.get("context").split(";");
				if (allContext.length > 0) {
					if (allContext[0] != null && !allContext[0].isEmpty())
						stateValues.put("dad", allContext[0]);
					if (allContext.length == 3) {
						if(allContext[1] != null && !allContext[1].isEmpty())
							stateValues.put("orgCode", allContext[1]);
						if(allContext[2] != null && !allContext[2].isEmpty())
							stateValues.put("profCode", allContext[2]);
					}
				}
			}
		}
		return stateValues;
	}
	
	private static Optional<String> buildPageRouteWhenTypeEnv(String dad) {
		Application application = new Application().findByDad(dad);
		if (application != null) {
			dad = application.getDad();
			nosi.webapps.igrp.dao.Action ac = application.getAction();
			String page = String.format("tutorial/DefaultPage/index&dad=%s", dad);
			if (ac != null && ac.getApplication() != null) {
				page = String.format("%s/%s/index", ac.getApplication().getDad().toLowerCase(), ac.getPage());
				if (ac.getAction_descr() != null)
					page = String.format("%s&dad=%s&title=%s", page, dad, URLEncoder.encode(ac.getAction_descr(), Charset.forName("utf-8")));
			}
			return Optional.of(page);
		}
		return Optional.empty();
	}
	
	private static Optional<String> buildPageRouteWhenTypePage(String dad, String actionId) {
		Action ac = new Action().findOne(Integer.valueOf(actionId));
		if (ac != null && ac.getApplication() != null) {
			Application envIgrpWeb = new Application().find().andWhere("dad", "=", dad).one();
			if (envIgrpWeb == null) {
				Application envIgrpPlSql = new Application().find().andWhere("plsql_code", "=", dad).one();
				if (envIgrpPlSql != null)
					dad = envIgrpPlSql.getDad();
			}
			String page = String.format("%s/%s/index", ac.getApplication().getDad().toLowerCase(), ac.getPage());
			if (ac.getAction_descr() != null)
				page = String.format("%s&title=%s", page, URLEncoder.encode(ac.getAction_descr(), Charset.forName("utf-8")));
			return Optional.of(page);
		}
		return Optional.empty();
	}

	public static Optional<String> buildAppLinkFromStateParam(HttpServletRequest request) {
		String state = request.getParameter("state");
		Map<String, String> stateValues = extractStateValues(state);
		String pageRoute = null;
		if(stateValues.containsKey("type")) {
			String type = stateValues.get("type");
			switch (type) {
				case "ENV":
					Optional<String> env = buildPageRouteWhenTypeEnv(stateValues.get("dad"));
					if(env.isPresent())
						pageRoute = env.get();
				break;
				case "PAGE":
					Optional<String> page = buildPageRouteWhenTypePage(stateValues.get("dad"), stateValues.get("value"));
					if(page.isPresent())
						pageRoute = page.get();
				break;
			}
		}
		if(pageRoute != null) {
			String[] splittedPageRoute = pageRoute.split(Pattern.quote("&"));
			String encryptedPageRoute = EncrypDecrypt.encryptURL(splittedPageRoute[0], request.getRequestedSessionId()).replace(" ", "+");
			String additionalParams = extractAdditionalParams(pageRoute);
			return Optional.of(String.format("%s?r=%s%s", requestUrl(request), encryptedPageRoute, additionalParams));
		}
		return Optional.empty();
	}
	
	private static String extractAdditionalParams(String pageRoute) {
		int index = pageRoute.indexOf("&");
		if(index != -1 && (index + 1 < pageRoute.length()))
			return pageRoute.substring(pageRoute.indexOf("&") + 1);
		return "";
	}
	
	public static Optional<String> buildAppLinkFromSession(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session == null)
			return Optional.empty();
		String returnRoute = (String) session.getAttribute("returnRoute");
		session.removeAttribute("returnRoute");
		if(!(returnRoute instanceof String) || returnRoute == null)
			return Optional.empty();
		
		JSONObject json = new JSONObject(returnRoute);
		String appCode = json.optString("appCode");
		String pageCode = json.optString("pageCode");
		String dad = json.optString("dad");
		if(appCode.isEmpty() || pageCode.isEmpty())
			return Optional.empty();
		String actionCode = json.optString("actionCode", "index");
		
		JSONArray additionalParams = json.optJSONArray("additionalParams");
		StringBuilder additionalParamsQueryString = new StringBuilder("");
		if(additionalParams != null) 
			for(int i = 0; i < additionalParams.length(); i++) {
				JSONObject param = additionalParams.optJSONObject(i);
				if(param != null && param.keySet().stream().anyMatch(p -> p.equals("paramName")))
					additionalParamsQueryString.append(String.format("&%s=%s", param.optString("paramName"), encodeParameterValue(param.optString("paramValue"))));
			}
		
		
		dad = !dad.isEmpty() ? String.format("&dad=%s", dad) : dad;
		
		String jsonLookup = encodeParameterValue(json.optString("jsonLookup"));
		
		System.out.println("buildAppLinkFromSession (jsonLookup): " + jsonLookup);
		
		String route = EncrypDecrypt.encryptURL(String.format("%s/%s/%s", appCode, pageCode, actionCode), session.getId()).replace(" ", "+");
		return Optional.of(String.format("%s?r=%s%s%s", requestUrl(request), route, dad, additionalParams));
	}
	
	private static void rememberRoute(HttpServletRequest request) {
		String r = request.getParameter("r");
		String dad = request.getParameter("dad");
		if (r != null) {
			String[] arr = r.split("/");
			if (arr.length == 3) {
				HttpSession session = request.getSession(true);
				JSONObject route = new JSONObject();
				route.put("appCode", arr[0]);
				route.put("pageCode", arr[1]);
				route.put("actionCode", arr[2]);
				if(dad != null && !dad.isEmpty())
					route.put("dad", dad);
				JSONArray additionalParams = new JSONArray();
				Enumeration<String> paramNames = request.getParameterNames();
				while(paramNames.hasMoreElements()) {
					String paramName = paramNames.nextElement();
					if(!"r".equals(paramName) && !"dad".equals(paramName)) {
						JSONObject param = new JSONObject();
						param.put(paramName, request.getParameter(paramName));
						additionalParams.put(param);
					}
				}
				route.put("additionalParams", additionalParams);
				session.setAttribute("returnRoute", route.toString());
			}
		}
	}
	
	public static Properties loadConfig() {
		Properties config = new Properties();
		try {
			config.loadFromXML(
					Thread.currentThread().getContextClassLoader().getResourceAsStream("config/common/main.xml"));
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
		}
		return config;
	}
	
	public static String encodeParameterValue(String value) {
		try {
			return URLEncoder.encode(URLDecoder.decode(value, "utf-8"), "utf-8");
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
		}
		return value;
	}
	
}
