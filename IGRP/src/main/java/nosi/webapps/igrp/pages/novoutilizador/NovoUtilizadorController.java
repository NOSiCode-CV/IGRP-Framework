package nosi.webapps.igrp.pages.novoutilizador;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.util.List; //block import
import java.util.LinkedHashMap; //block import
import nosi.webapps.igrp.dao.User; //block import
import static nosi.core.i18n.Translator.gt;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import nosi.core.authentication.ldap.LdapPerson;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.exception.ServerErrorHttpException;
import nosi.core.mail.EmailMessage.PdexTemplate;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.activit.rest.entities.UserService;
import nosi.core.webapp.activit.rest.services.GroupServiceRest;
import nosi.core.webapp.activit.rest.services.UserServiceRest;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.core.integration.autentika.RemoteUserStoreManagerServiceSoapClient;
import nosi.core.integration.autentika.dto.RemoteUserStoreManagerServiceConstants;
import nosi.core.integration.autentika.dto.UserClaimValuesRequestDTO;
import nosi.core.integration.autentika.dto.UserClaimValuesResponseDTO;

/*----#end-code----*/

public class NovoUtilizadorController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException {
		NovoUtilizador model = new NovoUtilizador();
		model.load();
		NovoUtilizadorView view = new NovoUtilizadorView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.email.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.organica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.perfil.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/

		Integer id_prof = Core.getParamInt("p_id");
		String id = Core.getParam("id");
		String dad = Core.getCurrentDad();
		try {
			User userfilter = new User().find();

			List<User> userList = userfilter.all();
			view.email.setValue(Core.toMap(userList, "email", "email"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			Integer idApp = Core.findApplicationByDad(dad).getId();
			model.setAplicacao(idApp);
			view.aplicacao.propertie().add("disabled", "true");
			view.btn_gravar.addParameter(view.aplicacao.getParamTag(), model.getAplicacao());
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

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException {
		NovoUtilizador model = new NovoUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","NovoUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (gravar) *//* End-Code-Block */
		/*----#start-code(gravar)----*/

		if (Core.isHttpPost()) {
			boolean sucess = false;
			if (this.getConfig().getAutenticationType()
					.equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value()))
				sucess = this.ldap(model);
			else if (this.getConfig().getAutenticationType()
					.equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_DATABASE.value()))
				sucess = this.db(model);
			this.addQueryString("p_aplicacao", model.getAplicacao());
			this.addQueryString("p_organica", model.getOrganica());
			this.addQueryString("p_perfil", model.getPerfil());
			if (!sucess)
				this.addQueryString("p_email", model.getEmail());

		} else
			throw new ServerErrorHttpException("Unsuported operation ...");

		/*----#end-code----*/
		return this.redirect("igrp", "NovoUtilizador", "index", this.queryString());
	}
	/* Start-Code-Block (custom-actions) *//* End-Code-Block */
	/*----#start-code(custom_actions)----*/

	private Boolean db(NovoUtilizador model) throws IllegalArgumentException, IllegalAccessException {

		Boolean ok = true;
		String[] arrayEmails = model.getEmail();
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
					Profile profile = iterator.next();
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

	private User checkGetUserLdap(String email) {
		ArrayList<LdapPerson> personArray = new ArrayList<>();
		User userLdap = null;
		String wsdlUrl = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL.value());
		String uid = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_USN.value()); 
		String pwd = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_PWD.value());
		RemoteUserStoreManagerServiceSoapClient client = new RemoteUserStoreManagerServiceSoapClient(wsdlUrl, uid, pwd);
		UserClaimValuesResponseDTO result = null; 
		if(email.endsWith("cv")) {
			UserClaimValuesRequestDTO request = new UserClaimValuesRequestDTO();
			request.setUserName(RemoteUserStoreManagerServiceConstants.GOVCV_TENANT + "/" + email);
			result = client.getUserClaimValues(request);
			if(result == null || result.getClaimDTOs().isEmpty()) {
				request.setUserName(email);
				result = client.getUserClaimValues(request);
				if(result == null || result.getClaimDTOs().isEmpty()) {
					request.setUserName(RemoteUserStoreManagerServiceConstants.PORTONGOV_TENANT + "/" + email);
					result = client.getUserClaimValues(request);
				}
			}
		}else {
			UserClaimValuesRequestDTO request = new UserClaimValuesRequestDTO();
			request.setUserName(email);
			result = client.getUserClaimValues(request);
			if(result == null || result.getClaimDTOs().isEmpty()) {
				request.setUserName(RemoteUserStoreManagerServiceConstants.PORTONGOV_TENANT + "/" + email);
				result = client.getUserClaimValues(request);
			}
		}
		if(result != null && !result.getClaimDTOs().isEmpty()) {
			LdapPerson ldapPerson = new LdapPerson();
			result.getClaimDTOs().forEach(user -> {
				switch (user.getClaimUri()) {
				case RemoteUserStoreManagerServiceConstants.DISPLAYNAME_CLAIM_URI:
					ldapPerson.setDisplayName(user.getValue());
					break;
				case RemoteUserStoreManagerServiceConstants.GIVENNAME_CLAIM_URI:
					ldapPerson.setGivenName(user.getValue());
					break;
				case RemoteUserStoreManagerServiceConstants.EMAIL_CLAIM_URI:
					ldapPerson.setUid(user.getValue());
					ldapPerson.setMail(user.getValue());
					break;
				case RemoteUserStoreManagerServiceConstants.FULLNAME_CLAIM_URI:
					ldapPerson.setFullName(user.getValue());
					break;
				case RemoteUserStoreManagerServiceConstants.LASTNAME_CLAIM_URI:
					ldapPerson.setLastName(user.getValue());
					break;
				}
			});
			personArray.add(ldapPerson);
		}
		if (!personArray.isEmpty()) {
			for (int i = 0; i < personArray.size(); i++) {
				userLdap = new User();
				LdapPerson person = personArray.get(i);
				// System.out.println(person);
				if (person.getName() != null && !person.getName().isEmpty())
					userLdap.setName(person.getName());
				else if (person.getDisplayName() != null && !person.getDisplayName().isEmpty())
					userLdap.setName(person.getDisplayName());
				else if (person.getFullName() != null && !person.getFullName().isEmpty())
					userLdap.setName(person.getFullName());
				else 
					userLdap.setName(person.getMail().substring(0,person.getMail().indexOf("@")));
				userLdap.setUser_name(person.getMail().toLowerCase().trim());
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

	private boolean addRoleToUser(User user) {
		String govCv = settings.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_GOVCV_ENABLED.toString(),
				"false");
		String kriolAddRole = settings.getProperty(ConfigCommonMainConstants.KRIOL_ADD_ROLE_USER.value(), "false");
		if (govCv.equals("true") || kriolAddRole.equals("false"))
			return true;
		try {
			String wsdlUrl = "ids.wso2.RemoteUserStoreManagerService-wsdl-url";
			String username = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_USN.value());
			String password = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_PWD.value());
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
		String[] arrayEmails = model.getEmail();
		for (int i = 0; i < arrayEmails.length; i++) {
			String email = arrayEmails[i];
			if (Core.isNull(email) && !email.contains("@"))
				continue;
			email = email.toLowerCase(Locale.ROOT).trim();
//		check & Get User from Ldap 
			User utiliz = Core.findUserByEmail(email.trim());
			User userLdap;
			if (utiliz == null)
				userLdap = checkGetUserLdap(email.trim());
			else
				userLdap = utiliz;

			if (userLdap != null) {
//			Find user in the IGRP db too
				User u = Core.findUserByEmail(email.trim());
				if (u == null) {

//				If LDAP is ws02, the role is added to the server 
					String idsAutentikaEnabled = settings
							.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ENABLED.value(), "false");
					if (idsAutentikaEnabled.equals("true") && !addRoleToUser(userLdap)) {
						Core.setMessageError("Ocorreu um erro ao adicionar role ao " + email.trim());
						ok = false;
						continue;
					}

//				Insert the user in the user table
					u = userLdap.insert();
					if (u != null && !u.hasError()) {
						u = Core.findUserByEmail(email.trim());
						sendEmailToInvitedUser(u, model);

					} else {
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
					UserServiceRest userRest = new UserServiceRest();
					GroupServiceRest groupRest = new GroupServiceRest();
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
								} else {
									// Associa utilizador a grupo no Activiti
									UserService userActiviti0 = new UserService();
									userActiviti0.setId(u.getUser_name());
									userActiviti0.setPassword("password.igrp");
									userActiviti0.setFirstName(u.getName());
									userActiviti0.setLastName("");
									userActiviti0.setEmail(u.getEmail().toLowerCase(Locale.ROOT));
									userRest.create(userActiviti0);
									groupRest.addUser(profile.getOrganization().getCode() + "."
											+ profile.getProfileType().getCode(), userActiviti0.getId());
								}
							}
							Core.setMessageSuccess(profile.getUser().getEmail() + " re-invited!");
						} else
							ok = false;
					}

					if (insert) {
						if (Core.isNotNull(new Profile().find().andWhere("type", "=", "PROF")
								.andWhere("type_fk", "=", model.getPerfil())
								.andWhere("organization.id", "=", org.getId())
								.andWhere("profileType.id", "=", prof.getId()).andWhere("user.id", "=", u.getId())
								.one())) {
//						 Already invited
							Core.setMessageError(u.getName() + gt(" está convidado para este perfil."));
							ok = false;
						} else {
//						Will insert profile
							Profile p = new Profile(model.getPerfil(), "PROF", prof, u, org).insert();
							if (!p.hasError()) {
//							Check if exists already a ENV 				
								if (Core.isNull(new Profile().find().andWhere("type", "=", "ENV")
										.andWhere("type_fk", "=", model.getAplicacao())
										.andWhere("organization.id", "=", org.getId())
										.andWhere("profileType.id", "=", prof.getId())
										.andWhere("user.id", "=", u.getId()).one())) {
//								ENV not added, so must be inserted the application
									p = new Profile(model.getAplicacao(), "ENV", prof, u, org).insert();
									if (p.hasError()) {
										Core.setMessageError();
										ok = false;
									} else {
										// Associa utilizador a grupo no Activiti
										UserService userActiviti0 = new UserService();
										userActiviti0.setId(u.getUser_name());
										userActiviti0.setPassword("password.igrp");
										userActiviti0.setFirstName(u.getName());
										userActiviti0.setLastName("");
										userActiviti0.setEmail(u.getEmail().toLowerCase(Locale.ROOT));
										userRest.create(userActiviti0);
										groupRest.addUser(
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

				}
			} else
				ok = false;
		}
		return ok;
	}

	private void sendEmailToInvitedUser(User u, NovoUtilizador model) {
		String url_ = Igrp.getInstance().getRequest().getRequestURL() + "?r=igrp/login/login&activation_key="
				+ u.getActivation_key();

		Organization orgEmail = new Organization().findOne(model.getOrganica());

		String msg = "" + "<p><b>Aplicação:</b> " + orgEmail.getApplication().getName() + "</p>"
				+ "			 <p><b>Organização:</b> " + orgEmail.getName() + "</p>" + "			 <p><b>Utilizador:</b> "
				+ u.getEmail() + "</p>";

		msg = PdexTemplate.getCorpoFormatado("Ativação igrpweb",
				"Caro(a) Sr(a). " + u.getName() + ", seja bem-vindo(a) !!!", new String[] { msg },
				new String[] { "Ativar" }, new String[] { url_ }, "https://www.igrp.cv");

		if (Core.mail("no-reply@nosi.cv", u.getEmail(), "igrpweb - User activation", msg, "utf-8", "html", null, ""))
			Core.setMessageInfo("Activation e-mail sent to: " + u.getEmail());
		else
			Core.setMessageError("Email não enviado.");

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
		if (Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post") && id != null) {
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

	public Response actionGetXMLOrganizations() {
		this.format = Response.FORMAT_XML;
		return this.renderView(
				Core.remoteComboBoxXml(new Organization().getListOrganizations(Core.getParamInt("p_aplicacao")),
						new NovoUtilizadorView().organica, null));
	}

	public Response actionGetXMLProfile() {
		this.format = Response.FORMAT_XML;
		return this.renderView(Core.remoteComboBoxXml(
				new ProfileType().getListProfiles(Core.getParamInt("p_aplicacao"), Core.getParamInt("p_organica")),
				new NovoUtilizadorView().perfil, null));
	}

	private Properties settings = this.configApp.getMainSettings();

	/*----#end-code----*/
}
