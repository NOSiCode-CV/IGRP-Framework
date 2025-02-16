package nosi.core.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import nosi.core.authentication.AuthenticationManager;
import nosi.core.webapp.ApplicationManager;
import nosi.core.webapp.Core;

import java.io.IOException;
import java.util.Map;
import java.util.Optional;



@WebFilter
public class AuthenticationFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;

//		try {
			if (AuthenticationManager.isSessionExists(httpServletRequest)) {
				Integer timeout = (Integer) httpServletRequest.getSession().getAttribute("oldTimeout");
				if(Core.isNotNullOrZero(timeout)){
					httpServletRequest.getSession().setMaxInactiveInterval(timeout);
				}else
					httpServletRequest.getSession().setMaxInactiveInterval(16 * 60); // Convert to seconds

				if (ApplicationManager.isInWhiteList(httpServletRequest) || ApplicationManager.isPublic(httpServletRequest)) {
					chain.doFilter(request, response);
					return;
				}

				Optional<String> url = ApplicationManager.buildAppLink(httpServletRequest);
				if (url.isPresent()) {
					httpServletResponse.sendRedirect(url.get());
					return;
				}
				if (Core.isNotNull(request.getParameter("errorMsg")))
					request.setAttribute("jakarta.servlet.error.message", request.getParameter("errorMsg"));

				chain.doFilter(request, response);

			} else {
				if(Core.isNull(httpServletRequest.getSession().getAttribute("oldTimeout")))
					httpServletRequest.getSession().setAttribute("oldTimeout",httpServletRequest.getSession().getMaxInactiveInterval());
				httpServletRequest.getSession().setMaxInactiveInterval(60);
				if (ApplicationManager.isPublic(httpServletRequest) && !ApplicationManager.isLoginPage(httpServletRequest)) {
					if (request.getParameter("target") == null) {
						httpServletResponse.sendRedirect(ApplicationManager.buildPublicTargetLink(httpServletRequest));
						return;
					}
					chain.doFilter(request, response);
				} else {
					final String code = httpServletRequest.getParameter("code");
					Optional<String> url;
					if(Core.isNull(code)){
						url = ApplicationManager.buildOAuth2AuthorizeLink(httpServletRequest);
						if (url.isPresent()) {
							httpServletResponse.sendRedirect(url.get());
							return;
						}
					}
					url = ApplicationManager.processCallback(httpServletRequest);
					if (url.isPresent()) {
						String destination = url.get();
						//if (destination.equals(OAuth2OpenIdAuthenticationManager.OAUTH2_OPENID_PAGE))
							httpServletRequest.getRequestDispatcher(destination).forward(httpServletRequest, httpServletResponse);
//						else
//							httpServletRequest.sendRedirect(destination);
						return;
					}
					//TODO: db login is not going to the previous route if the session expires
					//ApplicationManager.rememberRoute(httpServletRequest);

					httpServletRequest.getRequestDispatcher(ApplicationManager.LOGIN_PAGE + "&dad=" + request.getParameter("dad")).forward(httpServletRequest, httpServletResponse);
				}
			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			httpServletResponse.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error occurred.");
//		}
	}
}
