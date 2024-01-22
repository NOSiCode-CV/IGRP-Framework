package nosi.core.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import nosi.core.authentication.AuthenticationManager;
import nosi.core.authentication.OAuth2OpenIdAuthenticationManager;
import nosi.core.webapp.ApplicationManager;
import nosi.core.webapp.Core;

import java.io.IOException;
import java.util.Optional;


@WebFilter
public class AuthenticationFilter implements Filter {
       
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException  {
		
		HttpServletRequest httpServletRequest =   (HttpServletRequest) request;
		HttpServletResponse httpServletResponse =   (HttpServletResponse) response;
		
		if(AuthenticationManager.isSessionExists(httpServletRequest)) {
			
			if(ApplicationManager.isInWhiteList(httpServletRequest) || ApplicationManager.isPublic(httpServletRequest)) {
				chain.doFilter(request, response);
				return;
			}
				
			//If the request is "app/page/action" will return a url encrypted
			Optional<String> url = ApplicationManager.buildAppLink(httpServletRequest);
			if(url.isPresent()) {
				httpServletResponse.sendRedirect(url.get());
				return;
			}
			if(Core.isNotNull(request.getParameter("errorMsg")))
				request.setAttribute("jakarta.servlet.error.message", request.getParameter("errorMsg") );		
			
			chain.doFilter(request, response);
			
		}else {
			
			//Public pages without session or don't need login
			if(ApplicationManager.isPublic(httpServletRequest) && !ApplicationManager.isLoginPage(httpServletRequest)) {
				if(request.getParameter("target")==null) {
					httpServletResponse.sendRedirect(ApplicationManager.buildPublicTargetLink(httpServletRequest));
					return;					
				}
				chain.doFilter(request, response);
			}else {
				// Go to autentika
				Optional<String> url = ApplicationManager.buildOAuth2AuthorizeLink(httpServletRequest);
				if(url.isPresent() && Core.isNull(httpServletRequest.getParameter("code"))) {
					httpServletResponse.sendRedirect(url.get());
					return;
				}
				
				// Process callback from autentika
				url = ApplicationManager.processCallback(httpServletRequest);
				if(url.isPresent()) {
					String destination = url.get();
					if(destination.equals(OAuth2OpenIdAuthenticationManager.OAUTH2_OPENID_PAGE)) 
						httpServletRequest.getRequestDispatcher(destination).forward(httpServletRequest, httpServletResponse);
					else
						httpServletResponse.sendRedirect(destination);
					return;
				}
				
				// got to login
				httpServletRequest.getRequestDispatcher(ApplicationManager.LOGIN_PAGE).forward(httpServletRequest, httpServletResponse);
			}
			
		}
		
	}

}
