
package nosi.webapps.igrp.pages.ldapuser;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.exception.ServerErrorHttpException;
import nosi.core.ldap.LdapInfo;
import nosi.core.ldap.LdapPerson;
import nosi.core.ldap.NosiLdapAPI;
import java.io.File;
import java.io.IOException;

import javax.xml.bind.JAXB;

import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.UserRole;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;

/*----#END-PRESERVED-AREA----*/

public class LdapUserController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		LdapUser model = new LdapUser();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		LdapUserView view = new LdapUserView(model);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		LdapUser model = new LdapUser();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			
			File file = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/ldap/ldap.xml"));
			LdapInfo ldapinfo = JAXB.unmarshal(file, LdapInfo.class);
			NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(), ldapinfo.getBase(), ldapinfo.getAuthenticationFilter(), ldapinfo.getEntryDN());
			LdapPerson person = new LdapPerson(); 
			person.setCn(model.getCommon_name().trim()); 
			person.setSn(model.getSurname().trim());
			try {
				String aux = model.getEmail_1().trim().split("@")[0];
				person.setUid(aux);
			}catch(Exception e) {
				person.setUid(model.getEmail_1().trim());
			}
			person.setMail(model.getEmail_1().trim());
			person.setDisplayName(model.getCommon_name().trim() + " " + model.getSurname().trim());
			person.setGivenName(model.getCommon_name().trim() + " " + model.getSurname().trim());
			ldap.createUser(person);
			String error = ldap.getError();
			if(error != null) {
				Core.setMessageError(error);
				return this.forward("igrp","LdapUser","index");
			}else 
				Core.setMessageSuccess(gt("Utilizador registado com sucesso."));
				
			/** End **/
			
			/*if(model.save(model)){
				Core.setMessageSuccess(gt("Mesagem de Sucesso"));
			 }else{
				Core.setMessageError(gt("Mesagem de Erro"));
			 return this.forward("igrp","LdapUser","index");
			}
			*/
		}
		return this.redirect("igrp","LdapUser","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	public Response actionIndex_(@RParam(rParamName = "email") String email) throws IOException, IllegalArgumentException, IllegalAccessException{
	
		LdapUser model = new LdapUser();

		File file = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/ldap/ldap.xml"));
		LdapInfo ldapinfo = JAXB.unmarshal(file, LdapInfo.class);
		NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(), ldapinfo.getBase(), ldapinfo.getAuthenticationFilter(), ldapinfo.getEntryDN());
		
		LdapPerson person = ldap.getUserLastInfo(email.trim());
		String uid = "";
		
		if(person != null) {
			model.setCommon_name(person.getCn());
			model.setSurname(person.getSn());
			model.setEmail_1(person.getMail());
			uid = person.getUid();
		}else 
			throw new ServerErrorHttpException(gt("Ocorreu um erro. O utilizador pode não existir."));
		
		Igrp.getInstance();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			person.setCn(model.getCommon_name().trim());
			person.setSn(model.getSurname().trim());
			person.setMail(model.getEmail_1().trim());
			person.setDisplayName(person.getCn() + " " + person.getSn());
			person.setGivenName(person.getCn() + " " + person.getSn());
			try {
				person.setUid(model.getEmail_1().trim().split("@")[0]);
			}catch(Exception e) {
				person.setUid(model.getEmail_1().trim());
			}
			ldap.updateUser(person, uid);
			String error = ldap.getError();
			if(error != null) {
				Core.setMessageError(gt("Ocorreu um erro. LDAP error: ") + error);
			}else {
				String oldName = ldapinfo.getEntryDN().replaceAll(":_placeholder", uid);
				String newName = ldapinfo.getEntryDN().replaceAll(":_placeholder", person.getUid());
				
				ldap.renameEntry(oldName, newName);
				error = ldap.getError();
				
				if(error != null) {
					Core.setMessageSuccess(gt("Ocorreu um erro. LDAP error: " ) + error);
				}else{
					User u = new User().find().andWhere("email", "=", email).one();
					if(u != null) {
						
						UserRole role = new UserRole().find().andWhere("role_name", "=", "IGRP_ADMIN").andWhere("user.user_name", "=", u.getUser_name()).one();
						
						//System.out.println(role.getId()); 
						
						role.delete(role.getId());
						
						u.setName(person.getDisplayName());
						u.setEmail(person.getMail());
						u.setUser_name(person.getUid());
						u.setUpdated_at(System.currentTimeMillis());
						u = u.update();
						if(u != null) {
							role = new UserRole();
							role.setRole_name("IGRP_ADMIN");
							role.setUser(u);
							role = role.insert();
							Core.setMessageSuccess(gt("Utilizador atualizado com sucesso."));
						}else
							Core.setMessageSuccess(gt("Ocorreu um erro. Favor contactar o administrador. "));
					}else {
						Core.setMessageError(gt("Utilizador inválido. "));
					}
				}
			}
			return redirect("igrp", "ldap-user", "index_&email=" + person.getMail().trim());	
		}
		LdapUserView view = new LdapUserView(model);
		view.btn_gravar.setLink("igrp", "ldap-user", "index_&email=" + email);
		return this.renderView(view);
		
	}
	
	/*----#END-PRESERVED-AREA----*/
}
