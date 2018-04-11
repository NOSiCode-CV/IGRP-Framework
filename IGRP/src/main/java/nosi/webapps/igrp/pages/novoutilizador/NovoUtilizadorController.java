package nosi.webapps.igrp.pages.novoutilizador;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.exception.ServerErrorHttpException;
import nosi.core.ldap.LdapInfo;
import nosi.core.ldap.LdapPerson;
import nosi.core.ldap.NosiLdapAPI;
import nosi.core.mail.EmailMessage;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.GroupService;
import nosi.core.webapp.activit.rest.UserService;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.UserRole;
import service.client.WSO2UserStub;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.xml.bind.JAXB;

import org.wso2.carbon.um.ws.service.RemoteUserStoreManagerService;
import org.wso2.carbon.um.ws.service.dao.xsd.ClaimDTO;

import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class NovoUtilizadorController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		NovoUtilizador model = new NovoUtilizador();
		model.load();
		String p_id_prof = Igrp.getInstance().getRequest().getParameter("p_id_prof");
		String id = Igrp.getInstance().getRequest().getParameter("id");
		if(Core.isNotNull(p_id_prof)){
			ProfileType prof = new ProfileType().findOne(Integer.parseInt(p_id_prof));
			model.setAplicacao(prof.getApplication().getId());
			model.setOrganica(prof.getOrganization().getId());
			model.setPerfil(prof.getId());
		}
		
		NovoUtilizadorView view = new NovoUtilizadorView(model);
		view.aplicacao.setValue(new Application().getListApps());
		view.organica.setValue(new Organization().getListOrganizations(model.getAplicacao()));
		view.perfil.setValue(new ProfileType().getListProfiles(model.getAplicacao(), model.getOrganica()));
		
		if(id!=null && !id.trim().isEmpty() && !id.equals("0")){
			User u =  (User) new User().findIdentityById(Integer.parseInt(id));
			view.email.setValue(u.getEmail());
			view.setPageTitle("Convite - atualizar");
		}
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		Igrp.getInstance();
		if(Igrp.getMethod().equalsIgnoreCase("post")) {
			switch(this.getConfig().getAutenticationType()) {
				case "ldap":
					this.ldap();
				break;
				case "db":
				default: this.db();
		}
	}else
		throw new ServerErrorHttpException("Unsuported operation ...");
	return this.redirect("igrp", "novo-utilizador", "index");
	/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	private void db() throws IllegalArgumentException, IllegalAccessException {
		NovoUtilizador model = new NovoUtilizador();
		model.load();
		Profile p = new Profile();
		p.setOrganization(new Organization().findOne(model.getOrganica()));
		p.setProfileType(new ProfileType().findOne(model.getPerfil()));
		p.setType("PROF");
		User u = new User().find().andWhere("email", "=", model.getEmail()).one();
		if(u!=null){
			p.setUser(u);
			p.setType_fk(model.getPerfil());
			p = p.insert();
			if(p!=null){
				p = new Profile();
				p.setUser(u);
				p.setOrganization(new Organization().findOne(model.getOrganica()));
				p.setProfileType(new ProfileType().findOne(model.getPerfil()));
				p.setType("ENV");
				p.setType_fk(model.getAplicacao());
				p = p.insert();
				if(p!=null){
					//Associa utilizador a grupo no Activiti
					UserService userActiviti0 = new UserService();
					userActiviti0.setId(u.getUser_name());
					userActiviti0.setPassword("password.igrp");
					userActiviti0.setFirstName(u.getName());
					userActiviti0.setLastName("");
					userActiviti0.setEmail(u.getEmail());
					userActiviti0.create(userActiviti0);	
					new GroupService().addUser(p.getOrganization().getCode()+"."+p.getProfileType().getCode(),userActiviti0.getId());
					Igrp.getInstance().getFlashMessage().addMessage("success",gt("Operação efetuada com sucesso"));
				}else{
					Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta Operação"));
				}
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta Operação"));
			}
		}else{
			Igrp.getInstance().getFlashMessage().addMessage("error",gt("Email inválido"));
		}
	}
	
	private User invite(String email, boolean viaIds, Object ...obj) {
		ArrayList<LdapPerson> personArray = new ArrayList<LdapPerson>();
		User userLdap = null;
	
		if(viaIds) {
			try {
				Properties settings = (Properties) obj[0];
				
				URL url =  new URL(settings.getProperty("RemoteUserStoreManagerService-wsdl-url"));
		        WSO2UserStub.disableSSL();
		        WSO2UserStub stub = new WSO2UserStub(new RemoteUserStoreManagerService(url));
		        stub.applyHttpBasicAuthentication(settings.getProperty("admin-usn"), settings.getProperty("admin-pwd"), 2);
		         
	           List<ClaimDTO> result = stub.getOperations().getUserClaimValues(email, "");
	           LdapPerson ldapPerson = new LdapPerson();
	           result.forEach(user -> {
	            	switch(user.getClaimUri().getValue()){
	            		case "http://wso2.org/claims/displayName": ldapPerson.setDisplayName(user.getValue().getValue()); break;
	            		case "http://wso2.org/claims/givenname": ldapPerson.setGivenName(user.getValue().getValue()); break;
	            		case "http://wso2.org/claims/emailaddress": 
	            			ldapPerson.setUid(user.getValue().getValue());
	            			ldapPerson.setMail(user.getValue().getValue()); 
	            		break;
	            		case "http://wso2.org/claims/fullname": ldapPerson.setFullName(user.getValue().getValue()); break;
	            		case "http://wso2.org/claims/lastname": ldapPerson.setLastName(user.getValue().getValue()); break;
	            	}
	               // System.out.println(obj.getClaimUri().getValue() + " = " + obj.getValue().getValue());
	            });
	            personArray.add(ldapPerson);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			File file = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/ldap/ldap.xml"));
			LdapInfo ldapinfo = JAXB.unmarshal(file, LdapInfo.class);
			NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(), ldapinfo.getBase(), ldapinfo.getAuthenticationFilter(), ldapinfo.getEntryDN());
			
			personArray = ldap.getUser(email);
		}
			
			if (personArray != null && personArray.size() > 0) {
				for (int i = 0; i < personArray.size(); i++) {
					userLdap = new User();
					LdapPerson person = personArray.get(i);
					//System.out.println(person);
					if(person.getName() != null && !person.getName().isEmpty())
						userLdap.setName(person.getName());
					else
						if(person.getDisplayName() != null && !person.getDisplayName().isEmpty())
							userLdap.setName(person.getDisplayName());
						else
							userLdap.setName(person.getFullName());
					try {
						String aux = person.getMail().toLowerCase().split("@")[0];
						userLdap.setUser_name(aux);
					}catch(Exception e) {
						e.printStackTrace();
						userLdap.setUser_name(person.getMail().trim().toLowerCase());
						Igrp.getInstance().getFlashMessage().addMessage("warning",gt("Something is wrong from LDAP server side."));
					}
					userLdap.setEmail(person.getMail().trim().toLowerCase());
					userLdap.setStatus(0);
					userLdap.setCreated_at(System.currentTimeMillis());
					userLdap.setUpdated_at(System.currentTimeMillis());
					userLdap.setAuth_key(nosi.core.webapp.User.generateAuthenticationKey());
					userLdap.setActivation_key(nosi.core.webapp.User.generateActivationKey());
				}
		}else 
			Igrp.getInstance().getFlashMessage().addMessage("error", gt("Este utilizador não existe."));
		
		return userLdap;
	}
	
	private void sendEmailToInvitedUser(User u, NovoUtilizador model) {
		String url_ = Igrp.getInstance().getRequest().getRequestURL() + "?r=igrp/login/login&activation_key=" + u.getActivation_key();
		//System.out.println(url_);
		Organization orgEmail = new Organization().findOne(model.getOrganica());
		String msg = ""
				+ "<p><b>Aplicação:</b> "  +  orgEmail.getApplication().getName() + "</p>" + 
				"			 <p><b>Orgânica:</b> " + orgEmail.getName() + "</p>" + 
				"			 <p><b>Link Activação:</b> <a href=\"" +  url_ + "\">" + url_ + "</a></p>" + 
				"			 <p><b>Utilizador:</b> " + u.getUser_name() + "</p>";
		try {
			EmailMessage.newInstance().setTo(u.getEmail()).setFrom("igrpframeworkjava@gmail.com").setSubject("IGRP - User activation")
			.setMsg(msg, "utf-8", "html").send();
		} catch (IOException e) {
			System.out.println("Email não foi enviado ..."); 
			e.printStackTrace();
		}
	}
	
	private void ldap() throws IllegalArgumentException, IllegalAccessException {
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		NovoUtilizador model = new NovoUtilizador();
		model.load();
		Profile p = new Profile();
		p.setOrganization(new Organization().findOne(model.getOrganica()));
		p.setProfileType(new ProfileType().findOne(model.getPerfil()));
		p.setType("PROF");
		
		String email = model.getEmail().trim();
		
		Properties settings = loadIdentityServerSettings();
		User userLdap = null;
		userLdap = invite(email, (settings.getProperty("enabled") != null && settings.getProperty("enabled").equalsIgnoreCase("true")), settings);
		
			if(userLdap != null) {
				User u = new User().find().andWhere("email", "=", model.getEmail()).one();
				if(u == null) {
					u = userLdap.insert();
					UserRole role = new UserRole();
					String role_name = Igrp.getInstance().getServlet().getInitParameter("role_name");
					role.setRole_name(role_name != null && !role_name.trim().isEmpty() ? role_name : "IGRP_ADMIN");
					role.setUser(u);
					role = role.insert();
					
					if(u != null)
						sendEmailToInvitedUser(u, model);
				}
				p.setUser(u);
				p.setType_fk(model.getPerfil());
				p = p.insert();
				if(p!=null){
					p = new Profile();
					p.setUser(u);
					p.setOrganization(new Organization().findOne(model.getOrganica()));
					p.setProfileType(new ProfileType().findOne(model.getPerfil()));
					p.setType("ENV");
					p.setType_fk(model.getAplicacao());
					p = p.insert();
					if(p!=null){
						//Associa utilizador a grupo no Activiti
						UserService userActiviti0 = new UserService();
						userActiviti0.setId(u.getUser_name());
						userActiviti0.setPassword("password.igrp");
						userActiviti0.setFirstName(u.getName());
						userActiviti0.setLastName("");
						userActiviti0.setEmail(u.getEmail());
						userActiviti0.create(userActiviti0);	
						new GroupService().addUser(p.getOrganization().getCode()+"."+p.getProfileType().getCode(),userActiviti0.getId());
						Igrp.getInstance().getFlashMessage().addMessage("success",gt("Operação efetuada com sucesso"));
					}else{
						Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta Operação"));
					}
				}else{
					Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta Operação"));
				}
				
			}else {
				Igrp.getInstance().getFlashMessage().addMessage("error", gt("Este utilizador não existe no LDAP. LDAP error !"));
			}
		
		/** End **/
	}

	private Properties loadIdentityServerSettings() {
		String path = Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/") + "ids";
		String fileName = "wso2-ids.xml";
		File file = new File(path + File.separator + fileName);
		FileInputStream fis = null;
		Properties props = new Properties();
		try {
			fis = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			fis = null;	
		}
		try {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return props;
	}

	public Response actionEditar(@RParam(rParamName = "p_id") String idProfile) throws IOException, IllegalArgumentException, IllegalAccessException{
		if(idProfile!=null){
			Profile p = new Profile().findOne(Integer.parseInt(idProfile));
			if(p!=null){
				NovoUtilizador model = new NovoUtilizador();
				model.setAplicacao(p.getProfileType().getApplication().getId());
				model.setOrganica(p.getOrganization().getId());
				model.setPerfil(p.getProfileType().getId());
				NovoUtilizadorView view = new NovoUtilizadorView(model);
				view.aplicacao.setValue(new Application().getListApps());
				view.organica.setValue(new Organization().getListOrganizations(model.getAplicacao()));
				view.perfil.setValue(new ProfileType().getListProfiles(model.getAplicacao(), model.getOrganica()));
				view.email.setValue(p.getUser().getEmail());
				view.btn_gravar.setLink("editarProfile&p_id="+idProfile);
				return this.renderView(view);
			}
		}
		return this.redirectError();
	}
	
	public Response actionEditarProfile(@RParam(rParamName = "p_id") String id) throws IOException, IllegalArgumentException, IllegalAccessException{
		if(Igrp.getMethod().equalsIgnoreCase("post") && id!=null){
			NovoUtilizador model = new NovoUtilizador();
			model.load();
			Profile p = new Profile().findOne(Integer.parseInt(id));
			p.setOrganization(new Organization().findOne(model.getOrganica()));
			p.setProfileType(new ProfileType().findOne(model.getPerfil()));
			p.setType("PROF");
			User u = new User().find().andWhere("email", "=", model.getEmail()).one();
			if(u!=null){
				p.setUser(u);
				p.setType_fk(model.getPerfil());
				p = p.update();
				if(p!=null){
					Core.setMessageSuccess();
					return this.forward("igrp", "novo-utilizador", "editar&p_id="+id);
				}else{
					Core.setMessageError();
				}
			}else{
				Core.setMessageError(gt("Email inválido"));
			}
		}
		return this.redirectError();
	}
	/*----#END-PRESERVED-AREA----*/
}
