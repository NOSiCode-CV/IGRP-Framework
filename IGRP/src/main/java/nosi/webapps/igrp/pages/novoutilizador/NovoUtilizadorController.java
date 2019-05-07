package nosi.webapps.igrp.pages.novoutilizador;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.exception.ServerErrorHttpException;
import nosi.core.ldap.LdapInfo;
import nosi.core.ldap.LdapPerson;
import nosi.core.ldap.NosiLdapAPI;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.activit.rest.GroupService;
import nosi.core.webapp.activit.rest.UserService;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import service.client.WSO2UserStub;
import nosi.core.config.Config;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import javax.xml.bind.JAXB;
import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerService;
import org.wso2.carbon.um.ws.service.dao.xsd.ClaimDTO;
import static nosi.core.i18n.Translator.gt;
/*----#end-code----*/
		
public class NovoUtilizadorController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoUtilizador model = new NovoUtilizador();
		model.load();
		NovoUtilizadorView view = new NovoUtilizadorView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.organica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.perfil.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/

		Integer id_prof = Core.getParamInt("p_id");
		String id = Core.getParam("id");
		String dad = Core.getCurrentDad();
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			Integer idApp = Core.findApplicationByDad(dad).getId();
			model.setAplicacao(idApp);
			view.aplicacao.propertie().add("disabled", "true");

		}
		if (id_prof != 0) {
			ProfileType prof = Core.findProfileById(id_prof);
			if (prof != null) {
				model.setAplicacao(prof.getApplication().getId());
				model.setOrganica(prof.getOrganization().getId());
				model.setPerfil(prof.getId());

			}
		}

		final Map<Object, Object> listApps = new Application().getListApps();
//		Adds IGRP studio to the list if user has the app to allow invites do the app
		final Integer idSDAD = Core.findApplicationByDad("igrp_studio").getId();
		if (new Profile().find().andWhere("type", "=", "ENV").andWhere("user", "=", Core.getCurrentUser().getId())
				.andWhere("type_fk", "=", idSDAD).one() != null)
			listApps.put(idSDAD, "IGRP Studio");
		view.aplicacao.setValue(listApps);
		view.organica.setValue(new Organization().getListOrganizations(model.getAplicacao()));
		view.perfil.setValue(new ProfileType().getListProfiles(model.getAplicacao(), model.getOrganica()));
//		If the combo app is disabled, you need to add in the button
      	if(Core.isNotNullOrZero(model.getAplicacao()))          
			view.btn_gravar.addParameter("p_aplicacao", model.getAplicacao());
		if (Core.isNotNullOrZero(id) && !id.trim().isEmpty()) {
//			Edit invite mode
			User u = Core.findUserById((Integer.parseInt(id)));
			view.email.setValue(u.getEmail());
			view.setPageTitle("Convite - atualizar");
		}

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoUtilizador model = new NovoUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","NovoUtilizador","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar)----*/
	
		if (Igrp.getMethod().equalsIgnoreCase("post")) {
			Boolean sucess;
			switch (this.getConfig().getAutenticationType()) {
			case "ldap":
				sucess = this.ldap(model);
				break;
			case "db":
			default:
				sucess = this.db(model);
			}
			this.addQueryString("p_aplicacao", model.getAplicacao());
			this.addQueryString("p_organica", model.getOrganica());
			this.addQueryString("p_perfil", model.getPerfil());
			if (!sucess) {
				this.addQueryString("p_email", model.getEmail());
			}

		} else
			throw new ServerErrorHttpException("Unsuported operation ...");

		/*----#end-code----*/
		return this.redirect("igrp","NovoUtilizador","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	private Boolean db(NovoUtilizador model) throws IllegalArgumentException, IllegalAccessException {

		Boolean ok = true;
		String[] arrayEmails = model.getEmail().split(";");
		for (int i = 0; i < arrayEmails.length; i++) {
			String email = arrayEmails[i];
			if (Core.isNull(email) && !email.contains("@"))
				continue;
			email = email.toLowerCase(Locale.ROOT).trim();
			User u = Core.findUserByEmail(email.trim());
			if (Core.isNotNull(u)) {
				Boolean insert = true;
				final Organization org = Core.findOrganizationById(model.getOrganica());
				final ProfileType prof = Core.findProfileById(model.getPerfil());
//			List of INACTIVE profiles
				final List<Profile> result = new Profile().find().andWhere("type", "=", "INATIVE_PROF")
						.andWhere("type_fk", "=", model.getPerfil()).andWhere("organization.id", "=", org.getId())
						.andWhere("profileType.id", "=", prof.getId()).andWhere("user.id", "=", u.getId()).all();
				for (Iterator<Profile> iterator = result.iterator(); iterator.hasNext();) {
					Profile profile = (Profile) iterator.next();
//				The profile was deleted before
					profile.setType("PROF");
					profile = profile.update();
//				 No need to insert
					insert = false;
					if (!profile.hasError()) {
//					List of invites to the app with this profile associated
						final Profile result2 = new Profile().find().andWhere("type", "=", "ENV")
								.andWhere("type_fk", "=", model.getAplicacao())
								.andWhere("organization.id", "=", org.getId())
								.andWhere("profileType.id", "=", prof.getId()).andWhere("user.id", "=", u.getId())
								.one();

						if (Core.isNull(result2)) {
//						Insert Env if was deleted before
							profile = new Profile(model.getAplicacao(), "ENV", prof, u, org).insert();
							if (profile.hasError()) {
								Core.setMessageError();
								ok = false;
							}
						}
						Core.setMessageSuccess(profile.getUser().getEmail() + " re-invited!");
					} else
						ok = false;
				}

				if (insert) {
					if (Core.isNotNull(new Profile().find().andWhere("type", "=", "PROF")
							.andWhere("type_fk", "=", model.getPerfil()).andWhere("organization.id", "=", org.getId())
							.andWhere("profileType.id", "=", prof.getId()).andWhere("user.id", "=", u.getId()).one())) {
//					 Already invited
						Core.setMessageError(u.getUser_name() + " está convidado para este perfil.");
						ok = false;
					} else {
//					Will insert profile
						Profile p = new Profile(model.getPerfil(), "PROF", prof, u, org).insert();
						if (!p.hasError()) {
//						Check if exists already a ENV						
							if (Core.isNull(new Profile().find().andWhere("type", "=", "ENV")
									.andWhere("type_fk", "=", model.getAplicacao())
									.andWhere("organization.id", "=", org.getId())
									.andWhere("profileType.id", "=", prof.getId()).andWhere("user.id", "=", u.getId())
									.one())) {
//							ENV not added, so must be inserted the application
								p = new Profile(model.getAplicacao(), "ENV", prof, u, org).insert();
								if (p.hasError()) {
									Core.setMessageError();
									ok = false;
								}
							}
							if (ok)
								Core.setMessageSuccess(email + " invited!");
						} else {
							Core.setMessageError(u.getUser_name() + " está convidado para este perfil.");
							ok = false;
						}
					}
				}
			} else {
				Core.setMessageError("E-mail: " + email + " não está adicionado. 1º (+) adicionar este utilizador.");
				ok = false;
			}

		}

		return ok;
	}

	private User checkGetUserLdap(String email, boolean viaIds, Object... obj) {
		ArrayList<LdapPerson> personArray = new ArrayList<LdapPerson>();
		User userLdap = null;

		Properties settings = (Properties) obj[0];

		if (viaIds) {
//			Will use ws02 configured in the main.xml file
			try {
				URL url = new URL(settings.getProperty("ids.wso2.RemoteUserStoreManagerService-wsdl-url"));
				WSO2UserStub.disableSSL();
				WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
				stub.applyHttpBasicAuthentication(settings.getProperty("ids.wso2.admin-usn"),
						settings.getProperty("ids.wso2.admin-pwd"), 2);
				
				String v = settings.getProperty("igrp.authentication.govcv.enbaled");
				if (v.equalsIgnoreCase("true"))
					email = "gov.cv/" + email; 

				List<ClaimDTO> result = stub.getOperations().getUserClaimValues(email, "");
				LdapPerson ldapPerson = new LdapPerson();
				result.forEach(user -> {
					switch (user.getClaimUri().getValue()) {
					case "http://wso2.org/claims/displayName":
						ldapPerson.setDisplayName(user.getValue().getValue());
						break;
					case "http://wso2.org/claims/givenname":
						ldapPerson.setGivenName(user.getValue().getValue());
						break;
					case "http://wso2.org/claims/emailaddress":
						ldapPerson.setUid(user.getValue().getValue());
						ldapPerson.setMail(user.getValue().getValue());
						break;
					case "http://wso2.org/claims/fullname":
						ldapPerson.setFullName(user.getValue().getValue());
						break;
					case "http://wso2.org/claims/lastname":
						ldapPerson.setLastName(user.getValue().getValue());
						break;
					}
					// System.out.println(obj.getClaimUri().getValue() + " = " +
					// obj.getValue().getValue());
				});
				personArray.add(ldapPerson);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
//			LDAP configureted in the ldap.xml will be used
			File file = new File(getClass().getClassLoader()
					.getResource(
							new Config().getBasePathConfig() + File.separator + "ldap" + File.separator + "ldap.xml")
					.getPath());
			LdapInfo ldapinfo = JAXB.unmarshal(file, LdapInfo.class);
			NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(),
					ldapinfo.getBase(), ldapinfo.getAuthenticationFilter(), ldapinfo.getEntryDN());

			personArray = ldap.getUser(email);
		}

		if (personArray != null && personArray.size() > 0) {
			for (int i = 0; i < personArray.size(); i++) {
				userLdap = new User();
				LdapPerson person = personArray.get(i);
				// System.out.println(person);
				if (person.getName() != null && !person.getName().isEmpty())
					userLdap.setName(person.getName());
				else if (person.getDisplayName() != null && !person.getDisplayName().isEmpty())
					userLdap.setName(person.getDisplayName());
				else
					userLdap.setName(person.getFullName());
				try {

					if (settings.getProperty("ids.wso2.enabled") != null
							&& settings.getProperty("ids.wso2.enabled").equalsIgnoreCase("true")) {
						// String aux = person.getMail().toLowerCase().split("@")[0];
						String aux = person.getMail().toLowerCase().trim();
						userLdap.setUser_name(aux);
					} else {
						String aux = person.getMail().toLowerCase().split("@")[0];
						// String aux = person.getMail().toLowerCase().trim();
						userLdap.setUser_name(aux);
					}

				} catch (Exception e) {
					e.printStackTrace();
					userLdap.setUser_name(person.getMail().trim().toLowerCase());
					Igrp.getInstance().getFlashMessage().addMessage("warning",
							gt("Something is wrong from LDAP server side."));
				}
				userLdap.setEmail(person.getMail().trim().toLowerCase());
//			The user is not activated because the email send is to activate/confirm the account
				userLdap.setStatus(0);
				userLdap.setCreated_at(System.currentTimeMillis());
				userLdap.setUpdated_at(System.currentTimeMillis());
				userLdap.setAuth_key(nosi.core.webapp.User.generateAuthenticationKey());
				userLdap.setActivation_key(nosi.core.webapp.User.generateActivationKey());
			}
		} else
			Core.setMessageError("Este utilizador não existe.");

		return userLdap;
	}

	private boolean addRoleToUser(Properties settings, User user) {
		
		if(settings.getProperty("igrp.authentication.govcv.enbaled").equalsIgnoreCase("true") 
				|| settings.getProperty("kriol.addrole.user")!=null && settings.getProperty("kriol.addrole.user").equalsIgnoreCase("false")){
			return true;
		}
		try {

			String wsdlUrl = "ids.wso2.RemoteUserStoreManagerService-wsdl-url";
			String username = settings.getProperty("ids.wso2.admin-usn");
			String password = settings.getProperty("ids.wso2.admin-pwd");
			String credentials = Base64.getEncoder().encodeToString((username + ":" + password).getBytes());

			String warName = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/")).getName();
			String roleName = Igrp.getInstance().getRequest().getRequestURL().toString()
					.replace(Igrp.getInstance().getRequest().getRequestURI(), "");
			roleName = roleName.replace("http://", "").replace("https://", "").replace(":", "0_58") + "0_47"
					+ warName.replace("-", "0_45").replace("/", "0_47");

			Map<String, String> headers = new HashMap<String, String>();
			headers.put("Authorization", "Basic " + credentials);

			Map<String, String> namespaces = new HashMap<String, String>();
			namespaces.put("SOAP-ENV", "http://www.w3.org/2003/05/soap-envelope");
			namespaces.put("ser", "http://service.ws.um.carbon.wso2.org");

			Map<String, Object> bodyContent = new HashMap<String, Object>();
			Map<String, Object> subContent = new LinkedHashMap<String, Object>();
			subContent.put("ser:userName", user.getUser_name());
			subContent.put("ser:newRoles", roleName);
			bodyContent.put("ser:updateRoleListOfUser", subContent);

			nosi.core.webapp.webservices.soap.SoapClient sc = Core.soapClient(wsdlUrl, namespaces, headers,
					bodyContent);

			if (sc.hasErrors()) { // Verifica se ocorreu algum erro ...
				System.out.println(Arrays.toString(sc.getErrors().toArray()));
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	private Boolean ldap(NovoUtilizador model) throws IllegalArgumentException, IllegalAccessException {

		Boolean ok = true;
		String[] arrayEmails = model.getEmail().split(";");
		for (int i = 0; i < arrayEmails.length; i++) {
			String email = arrayEmails[i];
			if (Core.isNull(email) && !email.contains("@"))
				continue;
			email = email.toLowerCase(Locale.ROOT).trim();
			Properties settings = loadIdentityServerSettings();
//		check & Get User from Ldap
			User userLdap = checkGetUserLdap(email.trim(), (settings.getProperty("ids.wso2.enabled") != null
					&& settings.getProperty("ids.wso2.enabled").equalsIgnoreCase("true")), settings);

			if (userLdap != null) {
//			Find user in the IGRP db too
				User u = Core.findUserByEmail(email.trim());
				if (u == null) {
//				If LDAP is ws02, the role is added to the server
					if (settings.getProperty("ids.wso2.enabled") != null
							&& settings.getProperty("ids.wso2.enabled").equalsIgnoreCase("true")
							&& !addRoleToUser(settings, userLdap)) {
						Core.setMessageError("Ocorreu um erro ao adicionar role ao " + email.trim());
						ok = false;
						continue;
					}
//				Insert the user in the user table
					u = userLdap.insert();
					if(u != null && !u.hasError()) {
						u = Core.findUserByEmail(email.trim());									
						sendEmailToInvitedUser(u, model);
						
					}else {						
						ok = false;
						continue;
					}				
					
				}
//			Checks if the u is not null and in the case if the user was recently added so NOT to use else
				if (Core.isNotNull(u)) {
					Boolean insert = true;					
					final Organization org = Core.findOrganizationById(model.getOrganica());
					final ProfileType prof = Core.findProfileById(model.getPerfil());
//					List of INACTIVE profiles
					final List<Profile> listInactiveProf = new Profile().find().andWhere("type", "=", "INATIVE_PROF")
							.andWhere("type_fk", "=", model.getPerfil()).andWhere("organization.id", "=", org.getId())
							.andWhere("profileType.id", "=", prof.getId()).andWhere("user.id", "=", u.getId()).all();
					for (Iterator<Profile> iterator = listInactiveProf.iterator(); iterator.hasNext();) {
						Profile profile = (Profile) iterator.next();
//					The profile was deleted before
						profile.setType("PROF");
						profile = profile.update();
//					 No need to insert
						insert = false;
						if (!profile.hasError()) {
//						List of invites to the app with this profile associated
							final Profile result2 = new Profile().find().andWhere("type", "=", "ENV")
									.andWhere("type_fk", "=", model.getAplicacao())
									.andWhere("organization.id", "=", org.getId())
									.andWhere("profileType.id", "=", prof.getId()).andWhere("user.id", "=", u.getId())
									.one();

							if (Core.isNull(result2)) {
//							Insert Env if was deleted before
								profile = new Profile(model.getAplicacao(), "ENV", prof, u, org).insert();
								if (profile.hasError()) {
									Core.setMessageError();
									ok = false;
								}else {
									// Associa utilizador a grupo no Activiti
									UserService userActiviti0 = new UserService();
									userActiviti0.setId(u.getUser_name());
									userActiviti0.setPassword("password.igrp");
									userActiviti0.setFirstName(u.getName());
									userActiviti0.setLastName("");
									userActiviti0.setEmail(u.getEmail().toLowerCase(Locale.ROOT));
									userActiviti0.create(userActiviti0);
									new GroupService().addUser(
											profile.getOrganization().getCode() + "." + profile.getProfileType().getCode(),
											userActiviti0.getId());									
								}
							}
							Core.setMessageSuccess(profile.getUser().getEmail() + " re-invited!");
						} else
							ok = false;
					}

					if (insert) {
						if (Core.isNotNull(new Profile().find().andWhere("type", "=", "PROF")
								.andWhere("type_fk", "=", model.getPerfil()).andWhere("organization.id", "=", org.getId())
								.andWhere("profileType.id", "=", prof.getId()).andWhere("user.id", "=", u.getId()).one())) {
//						 Already invited
							Core.setMessageError(u.getUser_name() + gt(" está convidado para este perfil."));
							ok = false;
						} else {
//						Will insert profile
							Profile p = new Profile(model.getPerfil(), "PROF", prof, u, org)
									.insert();
							if (!p.hasError()) {
//							Check if exists already a ENV						
								if (Core.isNull(new Profile().find().andWhere("type", "=", "ENV")
										.andWhere("type_fk", "=", model.getAplicacao())
										.andWhere("organization.id", "=", org.getId())
										.andWhere("profileType.id", "=", prof.getId()).andWhere("user.id", "=", u.getId())
										.one())) {
//								ENV not added, so must be inserted the application
									p = new Profile(model.getAplicacao(), "ENV", prof, u, org).insert();
									if (p.hasError()) {
										Core.setMessageError();
										ok = false;
									}else {
										// Associa utilizador a grupo no Activiti
										UserService userActiviti0 = new UserService();
										userActiviti0.setId(u.getUser_name());
										userActiviti0.setPassword("password.igrp");
										userActiviti0.setFirstName(u.getName());
										userActiviti0.setLastName("");
										userActiviti0.setEmail(u.getEmail().toLowerCase(Locale.ROOT));
										userActiviti0.create(userActiviti0);
										new GroupService().addUser(
												p.getOrganization().getCode() + "." + p.getProfileType().getCode(),
												userActiviti0.getId());										
									}
								}
								if (ok)
									Core.setMessageSuccess(email + " invited!");
							} else {
								Core.setMessageError(u.getUser_name() + gt(" está convidado para este perfil."));
								ok = false;
							}
						}
					}
						
			} else {
				Core.setMessageError("Este utilizador não existe no LDAP para convidar.");
				ok = false;				
			}
		}
		}
			return ok;
	}

	private Properties loadIdentityServerSettings() {
		return this.configApp.loadConfig("common", "main.xml");
	}
	
	private void sendEmailToInvitedUser(User u, NovoUtilizador model) {
		String url_ = Igrp.getInstance().getRequest().getRequestURL() + "?r=igrp/login/login&activation_key="
				+ u.getActivation_key();
		// System.out.println(url_);
		Organization orgEmail = new Organization().findOne(model.getOrganica());
		String msg = "" + "<p><b>Aplicação:</b> " + orgEmail.getApplication().getName() + "</p>"
				+ "			 <p><b>Organização:</b> " + orgEmail.getName() + "</p>"
				+ "			 <p><b>Link Activação:</b> <a href=\"" + url_ + "\">" + url_ + "</a></p>"
				+ "			 <p><b>Utilizador:</b> " + u.getUser_name() + "</p>";
		if(Core.mail("no-reply@nosi.cv", u.getEmail(), "IGRP - User activation", msg, "utf-8", "html", null, ""))			
			Core.setMessageInfo("Activation e-mail sent to: " + u.getEmail());
		else
			Core.setMessageError("Email not sent.");
		
	}

	public Response actionEditar(@RParam(rParamName = "p_id") String idProfile)
			throws IOException, IllegalArgumentException, IllegalAccessException {
		if (idProfile != null) {
			Profile p = new Profile().findOne(Integer.parseInt(idProfile));
			if (p != null) {
				NovoUtilizador model = new NovoUtilizador();
				model.setAplicacao(p.getProfileType().getApplication().getId());
				model.setOrganica(p.getOrganization().getId());
				model.setPerfil(p.getProfileType().getId());
				NovoUtilizadorView view = new NovoUtilizadorView();
				view.aplicacao.setValue(new Application().getListApps());
				view.organica.setValue(new Organization().getListOrganizations(model.getAplicacao()));
				view.perfil.setValue(new ProfileType().getListProfiles(model.getAplicacao(), model.getOrganica()));
				view.email.setValue(p.getUser().getEmail());
				view.btn_gravar.setLink("editarProfile&p_id=" + idProfile);
				view.setModel(model);
				return this.renderView(view);
			}
		}
		return this.redirectError();
	}

	public Response actionEditarProfile(@RParam(rParamName = "p_id") String id)
			throws IOException, IllegalArgumentException, IllegalAccessException {
		if (Igrp.getMethod().equalsIgnoreCase("post") && id != null) {
			NovoUtilizador model = new NovoUtilizador();
			model.load();
			Profile p = new Profile().findOne(Integer.parseInt(id));
			p.setOrganization(new Organization().findOne(model.getOrganica()));
			p.setProfileType(new ProfileType().findOne(model.getPerfil()));
			p.setType("PROF");
			User u = new User().find().andWhere("email", "=", model.getEmail()).one();
			if (u != null) {
				p.setUser(u);
				p.setType_fk(model.getPerfil());
				p = p.update();
				if (p != null) {
					Core.setMessageSuccess();
					return this.forward("igrp", "NovoUtilizador", "editar&p_id=" + id);
				} else {
					Core.setMessageError();
				}
			} else {
				Core.setMessageError("Email inválido");
			}
		}
		return this.redirectError();
	}
	/*----#end-code----*/
}
