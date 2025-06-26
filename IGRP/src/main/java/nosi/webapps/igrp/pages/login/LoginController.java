package nosi.webapps.igrp.pages.login;

import static nosi.core.i18n.Translator.gt;

import java.io.IOException;

import nosi.core.webapp.*;

import java.util.Optional;

import nosi.core.authentication.AuthenticationManager;
import nosi.core.authentication.DBAuthenticationManager;
import nosi.core.authentication.LdapAuthenticationManager;
import nosi.core.authentication.OAuth2OpenIdAuthenticationManager;
import nosi.core.config.ConfigCommonMainConstants;
import org.slf4j.LoggerFactory;

/*----#end-code----*/

public class LoginController extends Controller {

	/*----#start-code(custom_actions)----*/

	private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	public Response actionLogin() throws Exception {

		if (Igrp.getInstance().getUser().isAuthenticated())
			return redirect("igrp", "home", "index");
		
		Optional<Response> optionalResponse = createResponseApplyingActivation();
		if (optionalResponse.isPresent())
			return optionalResponse.get();

		Login model = new Login();
		LoginView view = new LoginView(model);

		if (Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("POST")) {

			optionalResponse = createResponseForRetrieveAccount();
			if (optionalResponse.isPresent())
				return optionalResponse.get();

			model.load();

			optionalResponse = signIn(model.getUser(), model.getPassword());
			if (optionalResponse.isPresent())
				return optionalResponse.get();

			return redirect("igrp", "login", "login", this.queryString());
		}

		String aux = ConfigCommonMainConstants.IGRP_AUTHENTICATION_GOVCV_ENABLED.environmentValue();
		boolean isDb = this.getConfig().getAutenticationType().equals("db");
		if ("true".equals(aux) || isDb) {
			view.user.setLabel("Username");
			view.user.propertie().setProperty("type", "text");
		}

		return this.renderView(view, true);
	}

	public Response actionLogout() throws Exception {
		try {
			final var currentUser = Core.getCurrentUser();
			DBAuthenticationManager.signOut(currentUser, Igrp.getInstance().getRequest(), Igrp.getInstance().getResponse());
			Optional<String> signOutUrl = OAuth2OpenIdAuthenticationManager.signOut(currentUser);
			if(signOutUrl.isPresent())
				return redirectToUrl(signOutUrl.get());
		} catch (Exception e) {
			Core.setMessageError(gt("Ocorreu um erro no logout."));
			LOGGER.error(e.getMessage(), e);
		}

		return this.redirect("igrp", "login", "login");
	}

	public Optional<Response> createResponseApplyingActivation() {
		try {
			String activationKey = Igrp.getInstance().getRequest().getParameter("activation_key");
			if(activationKey == null || activationKey.trim().isEmpty())
				return Optional.empty();
			if(AuthenticationManager.accountActivation(activationKey)) {
				Core.setMessageSuccess("Ativação bem sucedida. Faça o login !!!");
				return Optional.of(redirect("igrp", "login", "login", this.queryString()));
			}
		} catch (Exception e) {
			Core.setMessageError("Ooops! Ocorreu um erro na activação.");
			LOGGER.error(e.getMessage(), e);
		}
		/*
		 * try { String oidc =
		 * this.configApp.getMainSettings().getProperty("ids.wso2.oauth2-openid.enabled"
		 * ); if(oidc != null && oidc.equalsIgnoreCase("true")) return
		 * redirectToUrl(createUrlForOAuth2OpenIdRequest());
		 * 
		 * return redirect("igrp", "login", "login", this.queryString()); } catch
		 * (Exception e) { }
		 */	
		
		return Optional.empty();
	}

	private Optional<Response> signIn(String username, String password) throws IOException {
		String authenticationType = this.getConfig().getAutenticationType();
		if ((authenticationType.equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_DATABASE.value())
				&& loginWithDb(username, password))
				|| (authenticationType.equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_LDAP.value())
						&& loginWithLdap(username, password))) {
//			TODO: see if is possible to remember the previous route
//

			 final Optional<String> returnRoute = ApplicationManager.buildAppLinkFromSession(Igrp.getInstance().getRequest());
			if(returnRoute.isPresent())
				return Optional.of(redirectToUrl(returnRoute.get()));
			// Previous here ...
			return Optional.of(redirect("igrp", "home", "index")); // By default go to home index url
		}
		return Optional.empty();
	}

	private boolean loginWithDb(String username, String password) {
		try {
			return DBAuthenticationManager.authenticate(username, password, Igrp.getInstance().getRequest());
		} catch (Exception e) {
			Core.setMessageError(e.getMessage());
			LOGGER.error(e.getMessage(), e);
		}
		return false;
	}

	private boolean loginWithLdap(String username, String password) {
		try {
			return LdapAuthenticationManager.authenticate(username, password, Igrp.getInstance().getRequest());
		} catch (Exception e) {
			Core.setMessageError(e.getMessage());
			LOGGER.error(e.getMessage(), e);
		}
		return false;
	}

	private Optional<Response> createResponseForRetrieveAccount() throws Exception {
		// Go to password recover page ...
		String p_button2 = Igrp.getInstance().getRequest().getParameter("p_button2");
		if ("p_button2".equals(p_button2))
			return Optional.of(redirect("igrp", "Resetbyemail", "index&target=_blank&isPublic=1"));
		return Optional.empty();
	}

	/*----#end-code----*/
}
