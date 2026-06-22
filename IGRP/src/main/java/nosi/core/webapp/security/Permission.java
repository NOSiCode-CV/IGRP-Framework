package nosi.core.webapp.security;
/**
 * @author Emanuel Pereira
 * May 29, 2017
 */

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.ApplicationPermition;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Share;
import nosi.webapps.igrp.dao.Transaction;
import nosi.webapps.igrp.dao.User;

public class Permission {

	/** Kept for backward compatibility. Prefer {@link StandardCharsets#UTF_8} in new code. */
	public static final String ENCODE = "UTF-8";

	public static final int MAX_AGE = 60 * 60 * 24; // 24h

	private ApplicationPermition applicationPermition;

	// Guardar permissão por sessão (um registo por utilizador + DAD)
	private static final String SESSION_PERM_PREFIX = "APP_PERM";
	// Cookie do último perfil escolhido (por DAD)
	private static final String LAST_PROFILE_COOKIE_PREFIX = "igrp_last_prof_";
	private static final ThreadLocal<Map<String, Boolean>> permissionCache =
			ThreadLocal.withInitial(HashMap::new);

	// DTO estável para serialização do cookie de último perfil
	public static class LastProfileDTO {
		private Integer appId;
		private String dad;
		private Integer profId;
		private Integer orgId;

		public LastProfileDTO() {} // no-args requerido pelo deserializador
		public LastProfileDTO(Integer appId, String dad, Integer profId, Integer orgId) {
			this.appId = appId; this.dad = dad; this.profId = profId; this.orgId = orgId;
		}
		public Integer getAppId() { return appId; }
		public void setAppId(Integer appId) { this.appId = appId; }
		public String getDad() { return dad; }
		public void setDad(String dad) { this.dad = dad; }
		public Integer getProfId() { return profId; }
		public void setProfId(Integer profId) { this.profId = profId; }
		public Integer getOrgId() { return orgId; }
		public void setOrgId(Integer orgId) { this.orgId = orgId; }
	}

	// ====== SESSION HELPERS ======

	private String makeSessionKey(String dad, Integer userId) {
		return SESSION_PERM_PREFIX + ":" + (userId != null ? userId : -1) + ":" + dad;
	}

	private void setSessionPerm(ApplicationPermition appP) {
		if (appP == null) return;
		final HttpSession session = Igrp.getInstance() != null && Igrp.getInstance().getRequest() != null
				? Igrp.getInstance().getRequest().getSession(false)
				: null;
		final User currentUser = Core.getCurrentUser();
		if (session != null && currentUser != null) {
			session.setAttribute(makeSessionKey(appP.getDad(), currentUser.getIdentityId()), appP);
		}
	}

	private ApplicationPermition getSessionPerm(String dad) {
		final HttpSession session = Igrp.getInstance() != null && Igrp.getInstance().getRequest() != null
				? Igrp.getInstance().getRequest().getSession(false)
				: null;
		final User currentUser = Core.getCurrentUser();
		if (session == null || currentUser == null) return null;
		Object obj = session.getAttribute(makeSessionKey(dad, currentUser.getIdentityId()));
		return (obj instanceof ApplicationPermition) ? (ApplicationPermition) obj : null;
	}

	// ====== RESET ======

	public void resetAppPermission(String dad) {
		if (Core.isNull(dad) || Igrp.getInstance() == null) return;
		try {
			final HttpServletRequest request = Igrp.getInstance().getRequest();
			final HttpServletResponse response = Igrp.getInstance().getResponse();
			final HttpSession session = request != null ? request.getSession(false) : null;
			final User currentUser = Core.getCurrentUser();
			if (session != null) {
				if (currentUser != null) {
					session.removeAttribute(makeSessionKey(dad, currentUser.getIdentityId()));
				}
				session.removeAttribute(dad);
			}
			if (request != null && response != null) {
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (Cookie c : cookies) {
						if (c == null || c.getName() == null) continue;
						String n = c.getName();
						if (n.equalsIgnoreCase(dad) || n.equalsIgnoreCase(LAST_PROFILE_COOKIE_PREFIX + dad.toLowerCase())) {
							Cookie del = new Cookie(n, "");
							del.setMaxAge(0);
							del.setHttpOnly(true);
							del.setSecure(true);
							response.addCookie(del);
						}
					}
				}
			}
		} catch (Exception ignored) {
		} finally {
			this.applicationPermition = null;
		}
	}

	// ====== LAST PROFILE COOKIE ======

	protected void setLastProfileCookie(ApplicationPermition appP) {
		if (appP == null || Core.isNull(appP.getDad())) return;
		try {
			LastProfileDTO dto = new LastProfileDTO(appP.getAppId(), appP.getDad(), appP.getProfId(), appP.getOgrId());
			String json = Core.toJson(dto);
			Cookie c = new Cookie(LAST_PROFILE_COOKIE_PREFIX + appP.getDad().toLowerCase(),
					URLEncoder.encode(json, ENCODE));
			c.setMaxAge(MAX_AGE);
			c.setHttpOnly(true);
			c.setSecure(true);
			Igrp.getInstance().getResponse().addCookie(c);
		} catch (Exception ignored) {}
	}

	private ApplicationPermition getApplicationPermitionFromLastProfileCookie(String dad) {
		final nosi.webapps.igrp.dao.User currentUser = Core.getCurrentUser();
		if (currentUser == null) return null;
		if (Core.isNull(dad) || Igrp.getInstance() == null || Igrp.getInstance().getRequest() == null) {
			return null;
		}
		try {
			Cookie[] cookies = Igrp.getInstance().getRequest().getCookies();
			if (cookies == null) return null;
			String cookieName = LAST_PROFILE_COOKIE_PREFIX + dad.toLowerCase();
			Optional<Cookie> opt = Arrays.stream(cookies)
					.filter(c -> cookieName.equalsIgnoreCase(c.getName()))
					.findFirst();
			if (!opt.isPresent() || opt.get().getValue() == null) return null;

			String json = URLDecoder.decode(opt.get().getValue(), ENCODE);
			if (Core.isNull(json)) return null;

			LastProfileDTO dto = (LastProfileDTO) Core.fromJson(json, LastProfileDTO.class);
			if (dto == null || Core.isNull(dto.getDad()) || dto.getAppId() == null
					|| dto.getProfId() == null || dto.getOrgId() == null)
				return null;

			if (!new nosi.webapps.igrp.dao.Application().getPermissionApp(dto.getAppId(), currentUser.getId()))
				return null;

			nosi.webapps.igrp.dao.Profile profCheck = new nosi.webapps.igrp.dao.Profile().find().limit(1)
					.andWhere("user.id", "=", currentUser.getId())
					.andWhere("organization.id", "=", dto.getOrgId())
					.andWhere("profileType.id", "=", dto.getProfId())
					.andWhere("type", "=", "PROF")
					.one();

			if (profCheck == null || profCheck.getOrganization() == null
					|| profCheck.getOrganization().getApplication() == null)
				return null;
			if (!profCheck.getOrganization().getApplication().getId().equals(dto.getAppId()))
				return null;

			return new nosi.core.webapp.helpers.ApplicationPermition(
					dto.getAppId(),
					dto.getDad().toLowerCase(),
					dto.getOrgId(),
					dto.getProfId(),
					profCheck.getOrganization().getCode(),
					profCheck.getProfileType() != null ? profCheck.getProfileType().getCode() : null);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean hasApp1PagPermition(String app, String appP, String page, String action){ // check permission on app
		if(Igrp.getInstance().getUser() != null && Igrp.getInstance().getUser().isAuthenticated()){
			if(PagesScapePermission.PAGES_SHAREDS.contains((appP + "/" + page + "/" + action).toLowerCase()))
				return true;
			if(appP.equals("tutorial")) // default page purpose
				return true;
			if(app.equals(appP) || appP.equals("igrp") || appP.equals("igrp_studio"))
				return (new Application().getPermissionApp(app) && new Menu().getPermissionMen(appP, page));
			else {

				return new Share().getPermissionPage(app,appP,new Action().findByPage(page, appP).getId());
			}
		}
		return PagesScapePermission.PAGES_WIDTHOUT_LOGIN.contains((appP+"/"+page+"/"+action).toLowerCase());
	}

	public boolean hasMenuPagPermition(HttpServletRequest request,String dad, String appP, String page, String action){ // check permission on dad with request

		//User Component Identity
		nosi.core.webapp.User userCI= new nosi.core.webapp.User();
		userCI.init(request);

		if(userCI.isAuthenticated()){
			if(PagesScapePermission.PAGES_SHAREDS.contains((appP + "/" + page + "/" + action).toLowerCase()))
				return true;
			if(appP.equals("tutorial")) // default page purpose
				return true;
			if(appP.equals(dad) || appP.equals("igrp") || appP.equals("igrp_studio"))
				return (new Menu().getPermissionMenID(userCI.getIdentity().getIdentityId(),dad, page));
			else {
				final boolean permissionMenID = new Menu().getPermissionMenID(userCI.getIdentity().getIdentityId(), dad, page);
				if(!permissionMenID)
					System.err.println("Permission.hasMenuPagPermition.permissionMenID is false");
				final boolean permissionSharePage = new Share().getPermissionPage(dad, appP, new Action().findByPage(page, appP).getId());
				if(!permissionSharePage)
					System.err.println("Permission.hasMenuPagPermition.permissionSharePage is false");
				return permissionMenID //Checks if the app destiny in the DAD has this page in the menu
						&& permissionSharePage;
			}
		}
		System.err.println("Permission.hasMenuPagPermition: not authenticated");
		return PagesScapePermission.PAGES_WIDTHOUT_LOGIN.contains((appP+"/"+page+"/"+action).toLowerCase());
	}

	public  boolean isPermission(String transaction){
		return permissionCache.get().computeIfAbsent(transaction,
				key -> new Transaction().getPermission(key));
	}

	// ====== ORG / PROFILE CHANGE ======

	public void changeOrgAndProfile(String dad) {
		final User currentUser = Core.getCurrentUser();
		if (Core.isNull(dad) || currentUser == null) return;

		Application appDAD = Core.findApplicationByDad(dad);
		ProfileType profType = new ProfileType();
		Organization org = new Organization();
		Profile prof = new Profile();
		final HttpSession session = Igrp.getInstance().getRequest().getSession();
		if (appDAD != null && session != null) {
			int id_user = currentUser.getIdentityId();

			if (appDAD.getPermissionApp(appDAD.getId())) {
				// 1) Tentar usar a escolha já existente (sessão/cookie)
				ApplicationPermition appP = this.getApplicationPermition(dad);
				if (appP != null) {
					Profile chosen = new Profile().find().limit(1)
							.andWhere("user.id", "=", id_user)
							.andWhere("organization.id", "=", appP.getOgrId())
							.andWhere("profileType.id", "=", appP.getProfId())
							.andWhere("type", "=", "PROF")
							.one();
					if (chosen != null && chosen.getOrganization() != null
							&& chosen.getOrganization().getApplication() != null
							&& chosen.getOrganization().getApplication().getId().equals(appDAD.getId())) {
						org = chosen.getOrganization();
						profType = chosen.getProfileType();
						this.setSessionPerm(appP);
						this.setLastProfileCookie(appP);
						this.applicationPermition = appP;
					} else {
						appP = null; // força fallback
					}
				}
				// 2) Fallback: não havia escolha válida -> usar primeiro perfil do utilizador nesta app
				if (this.applicationPermition == null) {
					prof = prof.getByUserPerfil(id_user, appDAD.getId());
					if (prof != null) {
						org = prof.getOrganization();
						profType = prof.getProfileType();
						ApplicationPermition newAppP = new ApplicationPermition(
								appDAD.getId(),
								dad,
								org.getId(),
								profType.getId(),
								org.getCode(),
								profType.getCode()
						);
						this.setSessionPerm(newAppP);
						this.setLastProfileCookie(newAppP);
						this.applicationPermition = newAppP;
					}
				}
			}
			((User) Igrp.getInstance().getUser().getIdentity()).setAplicacao(appDAD);
			((User) Igrp.getInstance().getUser().getIdentity()).setProfile(profType);
			((User) Igrp.getInstance().getUser().getIdentity()).setOrganica(org);
		}
	}

	// ====== COOKIE (legacy write, kept for retro-compatibility) ======

	public void setCookie(ApplicationPermition appP) {
		String json = Core.toJson(appP);
        Cookie cookie = null;
        try {
            cookie = new Cookie(appP.getDad(), URLEncoder.encode(json, ENCODE));
        } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
        }
        cookie.setMaxAge(MAX_AGE);
		cookie.setHttpOnly(true);
		cookie.setSecure(true);
		Igrp.getInstance().getResponse().addCookie(cookie);
	}

	// Only read the legacy cookie (kept for retro-compatibility)
	private ApplicationPermition getApplicationPermitionFromCookie(String dad) {
		Optional<Cookie> cookies = Igrp.getInstance() != null && Igrp.getInstance().getRequest().getCookies() != null
				? Arrays.stream(Igrp.getInstance().getRequest().getCookies())
				.filter(c -> c.getName().equalsIgnoreCase(dad)).findFirst()
				: Optional.empty();
		String json = cookies.map(Cookie::getValue).orElse(null);
		if (json != null) {
            try {
                json = URLDecoder.decode(json, ENCODE);
            } catch (UnsupportedEncodingException e) {
				e.printStackTrace();
            }
            if (Core.isNotNull(json)) {
				return (ApplicationPermition) Core.fromJson(json, ApplicationPermition.class);
			}
		}
		return null;
	}

	// ====== CURRENT CONTEXT GETTERS ======

	public String getCurrentEnv() {
		ApplicationPermition appP = this.getApplicationPermition();
		return appP != null && !appP.getDad().isEmpty() ? appP.getDad() : Core.getCurrentDadParam();
	}

	public Integer getCurrentPerfilId() {
		ApplicationPermition appP = this.getApplicationPermition();
		if (appP != null && appP.getProfId() != null)
			return appP.getProfId();
		return -1;
	}

	public Integer getCurrentOrganization() {
		ApplicationPermition appP = this.getApplicationPermition();
		if (appP != null && appP.getOgrId() != null)
			return appP.getOgrId();
		return -1;
	}

	public Integer getCurrentEnvId() {
		ApplicationPermition appP = this.getApplicationPermition();
		return appP != null ? appP.getAppId() : -1;
	}

	public String getCurrentPerfilCode() {
		ApplicationPermition appP = this.getApplicationPermition();
		if (appP != null)
			return appP.getCode_profile();
		return "";
	}

	public String getCurrentOrganizationCode() {
		ApplicationPermition appP = this.getApplicationPermition();
		if (appP != null)
			return appP.getCode_organization();
		return "";
	}

	// ====== PERMISSION RESOLUTION ======

	public ApplicationPermition getApplicationPermition() {
		String dad = Core.getParam("dad");
		if (Core.isNull(dad))
			return null;
		// 1) Sessão (preferido)
		ApplicationPermition appPermition = this.getSessionPerm(dad);
		// 2) Validar acesso
		if (appPermition == null || appPermition.getAppId() == null
				|| !new Application().getPermissionApp(appPermition.getAppId(), Core.getCurrentUser().getId())) {
			changeOrgAndProfile(dad);
			appPermition = getApplicationPermition(dad);
		}
		return appPermition;
	}

	public ApplicationPermition getApplicationPermition(String dad) {
		// 1) Sessão
		ApplicationPermition appP = this.getSessionPerm(dad);
		// 2) Cookie antigo (commented out — kept for reference)
//		if (appP == null) {
//			appP = this.getApplicationPermitionFromCookie(dad);
//			if (appP != null && new Application().getPermissionApp(appP.getAppId())) {
//				this.setSessionPerm(appP);
//			} else {
//				appP = null;
//			}
//		}
		// 3) "Último perfil"
		if (appP == null) {
			ApplicationPermition fromLast = this.getApplicationPermitionFromLastProfileCookie(dad);
			if (fromLast != null) {
				this.setSessionPerm(fromLast);
				appP = fromLast;
			}
		}
		return appP;
	}

	public ApplicationPermition getApplicationPermitionBeforeCookie() {
		return applicationPermition;
	}

	// ====== CACHE CLEANUP ======

	/**
	 * Deve ser chamado no final de cada request HTTP (ex: num Filter)
	 */
	public static void clearCache() {
		permissionCache.remove();
	}
}