package nosi.webapps.igrp.pages.novoutilizador;

import nosi.core.webapp.mvc.Controller;
import nosi.core.webapp.util.Core;
import nosi.core.webapp.util.helpers.database.QueryInterface;
import nosi.core.webapp.util.helpers.database.ResultSet;
import nosi.core.webapp.workflow.activit.rest.entities.UserService;
import nosi.core.webapp.workflow.activit.rest.services.GroupServiceRest;
import nosi.core.webapp.workflow.activit.rest.services.UserServiceRest;

import java.io.IOException;

import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.exception.HttpException;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import nosi.core.exception.ServerErrorHttpException;
import nosi.core.ldap.LdapPerson;
import nosi.core.mail.EmailMessage.PdexTemplate;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.annotation.RParam;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import service.client.WSO2UserStub;
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
import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerService;
import org.wso2.carbon.um.ws.service.dao.xsd.ClaimDTO;

import com.google.gson.Gson;

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
			view.btn_gravar.addParameter("p_aplicacao", model.getAplicacao());
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
		if (new Profile().find().andWhere("type", "=", "ENV").andWhere("user", "=", Core.getCurrentUser().getId()).andWhere("type_fk", "=", idSDAD).one() != null)
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
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoUtilizador model = new NovoUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","NovoUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gravar)----*/

		if (Core.isHttpPost()) {
			Boolean sucess = false;
			if(this.getConfig().getAutenticationType().equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID.value())) 
				sucess = this.ldap(model);
			else 
				if(this.getConfig().getAutenticationType().equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_DATABASE.value())) 
					sucess = this.db(model); 
			this.addQueryString("p_aplicacao", model.getAplicacao());
			this.addQueryString("p_organica", model.getOrganica());
			this.addQueryString("p_perfil", model.getPerfil());
			if (!sucess) 
				this.addQueryString("p_email", model.getEmail());

		} else 
			throw new HttpException(javax.servlet.http.HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Method Not Allowed");
		
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

	private User checkGetUserLdap(String email) {
		ArrayList<LdapPerson> personArray = new ArrayList<LdapPerson>();
		User userLdap = null;
		try {
			URL url = new URL(settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL.value()));
			
			WSO2UserStub.disableSSL();
			WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
			stub.applyHttpBasicAuthentication(settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_USN.value()),
					settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_PWD.value()), 2);

			List<ClaimDTO> result;
			
				// TODO Auto-generated catch block				
				if(email.endsWith("cv")) {
					try {
						result = stub.getOperations().getUserClaimValues("gov.cv/"+email, "");
					} catch (Exception e1) {						
						try {
							result = stub.getOperations().getUserClaimValues(email, "");
						} catch (Exception e) {
							result = stub.getOperations().getUserClaimValues("porton.gov/"+email, "");
						}
					}
				}else {
					try {
						result = stub.getOperations().getUserClaimValues(email, "");
					} catch (Exception e) {
					result = stub.getOperations().getUserClaimValues("porton.gov/"+email, "");
					}
				}
					
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
			});
			personArray.add(ldapPerson);
		} catch (Exception e) {
			e.printStackTrace();
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

				userLdap.setUser_name(person.getMail().toLowerCase().trim());

				userLdap.setEmail(person.getMail().trim().toLowerCase());
//			The user is not activated because the email send is to activate/confirm the account
				userLdap.setStatus(0);
				userLdap.setCreated_at(System.currentTimeMillis());
				userLdap.setUpdated_at(System.currentTimeMillis());
				userLdap.setAuth_key(nosi.core.webapp.component.User.generateAuthenticationKey());
				userLdap.setActivation_key(nosi.core.webapp.component.User.generateActivationKey());
			}
		} else
			Core.setMessageError("Este utilizador não existe.");

		return userLdap;
	}

	private boolean addRoleToUser(User user) {
		String govCv = settings.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_GOVCV_ENABLED.toString(), "false"); 
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

			nosi.core.webservices.soap.client.SoapClient sc = Core.soapClient(wsdlUrl, namespaces, headers,
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
//		check & Get User from Ldap 
			User utiliz = Core.findUserByEmail(email.trim());
			User userLdap ;
			if(utiliz == null) 
				userLdap = checkGetUserLdap(email.trim());
			else 
				userLdap=utiliz;
			
			if (userLdap != null) {
//			Find user in the IGRP db too
				User u = Core.findUserByEmail(email.trim());
				if (u == null) {

//				If LDAP is ws02, the role is added to the server 
					String idsAutentikaEnabled = settings.getProperty(ConfigCommonMainConstants.IDS_AUTENTIKA_ENABLED.value(), "false"); 
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
			}else
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

		msg = PdexTemplate.getCorpoFormatado("Ativação igrpweb", "Caro(a) Sr(a). " + u.getName() + ", seja bem-vindo(a) !!!",
				new String[] { msg }, new String[] { "Ativar" }, new String[] { url_ }, "https://www.igrp.cv");

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
	return this.renderView(Core.remoteComboBoxXml(new Organization().getListOrganizations(Core.getParamInt("p_aplicacao")),new NovoUtilizadorView().organica,null) );
	}
	
	public Response actionGetXMLProfile() {
		this.format = Response.FORMAT_XML;
	return this.renderView( Core.remoteComboBoxXml(new ProfileType().getListProfiles(Core.getParamInt("p_aplicacao"),Core.getParamInt("p_organica")),new NovoUtilizadorView().perfil,null));
	}
	
	private Properties settings = this.configApp.getMainSettings();  
	
	
	
	public static void main(String[] args) { 
	        String wsdlUrl = "https://autentika.gov.cv/services/RemoteUserStoreManagerService?wsdl";
	        // An Map of Soap HTTP Headers 
	        Map<String, String> headers = new HashMap<String, String>();
	       // headers.put("SOAPAction", "\"http://ws.cdyne.com/ResolveIP\""); 
	        headers.put("Authorization", "Basic YWRtaW4uaWdycEBub3NpLmN2OiFHUlAmYWQhbSFu"); 

	        // An Map of Soap Envelope namespace 
	        Map<String, String> namespaces = new HashMap<String, String>();
	        namespaces.put("ser", "http://service.ws.um.carbon.wso2.org");
	        
	        Map<String, Object> bodyContent = new LinkedHashMap<String, Object>();
	        Map<String, Object> subContent = new LinkedHashMap<String, Object>(); 
	        subContent.put("ser:userName", "gov.cv/iekini.fernandes@nosi.cv"); 
	        subContent.put("ser:profileName", ""); 
	        bodyContent.put("ser:getUserClaimValues", subContent); 
	        
	        
	        nosi.core.webservices.soap.client.SoapClient sc = Core.soapClient(
	                        wsdlUrl, namespaces, headers, bodyContent, "soap", javax.xml.soap.SOAPConstants.SOAP_1_2_PROTOCOL); 
	        
	        System.out.println(sc.getRawEnvelopeRequest()); 
	        
	        if (sc.hasErrors()) 
	            sc.getErrors().forEach(System.out::println); 
	        else {
	            Map<String, Object> map = sc.getResponseBody("soapenv"); 
	            Map<String, Object> resp = (Map<String, Object>) map.get("ns:getUserClaimValuesResponse"); 
	            List<Map<String, Object>> returns = (List<Map<String, Object>>) resp.get("ns:return"); 
	           
	            if(returns != null) {
	            	returns.forEach(claim -> {
	            		System.out.println(claim.get("ax2730:claimUri") + "");
	            	});
	            }
	            
	        }
	        
	}
	
	

	/*----#end-code----*/
}
