/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novoutilizador;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.config.Config;
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

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import javax.xml.bind.JAXB;
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class NovoUtilizadorController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		NovoUtilizador model = new NovoUtilizador();
		model.load();
		String p_id_prof = Igrp.getInstance().getRequest().getParameter("p_id_prof");
		if(p_id_prof!=null && !p_id_prof.equals("")){
			ProfileType prof = new ProfileType().findOne(Integer.parseInt(p_id_prof));
			model.setAplicacao(prof.getApplication().getId());
			model.setOrganica(prof.getOrganization().getId());
			model.setPerfil(prof.getId());
		}
		
		NovoUtilizadorView view = new NovoUtilizadorView(model);
		view.aplicacao.setValue(new Application().getListApps());
		view.organica.setValue(new Organization().getListOrganizations(model.getAplicacao()));
		view.perfil.setValue(new ProfileType().getListProfiles(model.getAplicacao(), model.getOrganica()));
		String id = Igrp.getInstance().getRequest().getParameter("id");
		if(id!=null && !id.equals("")){
			User u =  (User) new User().findIdentityById(Integer.parseInt(id));
			view.email.setValue(u.getEmail());
		}
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		if(Igrp.getInstance().getMethod().equalsIgnoreCase("post")) {
			switch(Config.getAutenticationType()) {
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
					Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta operação"));
				}
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta operação"));
			}
		}else{
			Igrp.getInstance().getFlashMessage().addMessage("error",gt("Email inválido"));
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
		/** Begin ldap AD logic here **/
		File file = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/ldap/ldap.xml"));
		LdapInfo ldapinfo = JAXB.unmarshal(file, LdapInfo.class);
		NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(), ldapinfo.getBase());
		
		User userLdap = null;
		
		ArrayList<LdapPerson> personArray = ldap.getUser(email);
		if (personArray != null && personArray.size() > 0) {
			for (int i = 0; i < personArray.size(); i++) {
				userLdap = new User();
				LdapPerson person = personArray.get(i);
				userLdap.setName(person.getName());
				try {
					String aux = person.getUserPrincipalName().toLowerCase().split("@")[0];
					userLdap.setUser_name(aux);
				}catch(Exception e) {
					e.printStackTrace();
					Igrp.getInstance().getFlashMessage().addMessage("warning",gt("Something is wrong from LDAP server side."));
				}
				userLdap.setEmail(person.getMail());
				userLdap.setStatus(1);
				userLdap.setCreated_at(System.currentTimeMillis());
				userLdap.setUpdated_at(System.currentTimeMillis());
				userLdap.setAuth_key(nosi.core.webapp.User.generateAuthenticationKey());
				userLdap.setActivation_key(nosi.core.webapp.User.generateActivationKey());
			}
			if(userLdap != null) {
				User u = new User().find().andWhere("email", "=", model.getEmail()).one();
				if(u == null) {
					u = userLdap.insert();
					UserRole role = new UserRole();
					String role_name = Igrp.getInstance().getServlet().getInitParameter("role_name");
					role.setRole_name(role_name != null && !role_name.trim().isEmpty() ? role_name : "IGRP_ADMIN");
					role.setUser(u);
					role = role.insert();
					
					String url_ = Igrp.getInstance().getRequest().getRequestURL() + "?r=igrp/login/login&activation_key=" + u.getActivation_key();
					Organization orgEmail = new Organization().findOne(model.getOrganica());
					String msg = ""
							+ "<p><b>Aplicação:</b> " + orgEmail.getApplication().getDescription() + "</p>" + 
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
						Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta operação"));
					}
				}else{
					Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta operação"));
				}
				
			}else {
				Igrp.getInstance().getFlashMessage().addMessage("error", gt("Este utilizador não existe no LDAP. LDAP error !"));
			}
		} else {
			Igrp.getInstance().getFlashMessage().addMessage("error", gt("Este utilizador não existe no LDAP."));
		}
		
		/** End **/
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
