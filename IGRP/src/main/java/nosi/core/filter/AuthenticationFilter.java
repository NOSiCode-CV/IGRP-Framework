package nosi.core.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import nosi.core.authentication.AuthenticationManager;
import nosi.core.authentication.OAuth2OpenIdAuthenticationManager;
import nosi.core.webapp.ApplicationManager;

import java.io.IOException;
import java.util.Optional;

@WebFilter
public class AuthenticationFilter implements Filter {
       
	public AuthenticationFilter() {}

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException  {
		
		HttpServletRequest httpServletRequest =   (HttpServletRequest) request;
		HttpServletResponse httpServletResponse =   (HttpServletResponse) response;
		
		if((ApplicationManager.isInWhiteList(httpServletRequest) || ApplicationManager.isPublic(httpServletRequest)) && !ApplicationManager.isLoginPage(httpServletRequest)) {
			chain.doFilter(request, response);
			return;
		}
		
		if(AuthenticationManager.isSessionExists(httpServletRequest)) {
			
			Optional<String> url = ApplicationManager.buildAppLink(httpServletRequest);
			if(url.isPresent() && !ApplicationManager.isLoginPage(httpServletRequest)) {
				httpServletResponse.sendRedirect(url.get());
				return;
			}
			
			chain.doFilter(request, response);
			
		}else {
			
			// Go to autentika
			Optional<String> url = ApplicationManager.buildOAuth2AuthorizeLink(httpServletRequest);
			if(url.isPresent()) {
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

	public void init(FilterConfig fConfig) throws ServletException {}

}
