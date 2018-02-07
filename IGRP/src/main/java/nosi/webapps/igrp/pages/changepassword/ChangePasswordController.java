
package nosi.webapps.igrp.pages.changepassword;
import nosi.core.config.Config;
import nosi.core.ldap.LdapInfo;
import nosi.core.ldap.LdapPerson;
import nosi.core.ldap.NosiLdapAPI;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;

import java.io.File;
import java.io.IOException;

import javax.xml.bind.JAXB;

import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.User;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class ChangePasswordController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/  
		ChangePassword model = new ChangePassword();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		ChangePasswordView view = new ChangePasswordView(model);
		view.email_1.setValue(Core.getCurrentUser().getEmail().trim());
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGuardar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		ChangePassword model = new ChangePassword();
		if(Igrp.getMethod().equalsIgnoreCase("post")){

			model.load();
		
			if(!model.getPassword_1().equals(model.getConfirm_password())) {
				Core.setMessageError(gt("Password inconsistentes ... Tente de novo !"));
				return this.forward("igrp","ChangePassword","index");
			}
			
			if (model.getPassword_1().equals(model.getOld_password())) {
				Core.setMessageError(gt("A nova senha não pode ser igual a senha anterior ... Tente de novo !"));
				return this.forward("igrp","ChangePassword","index");
			}
			
			switch(Config.getAutenticationType()) {
				case "ldap": return ldap(model.getOld_password(), model.getPassword_1());
				case "db": return db(model.getOld_password(), model.getPassword_1());
				default:;
			}
			
		}
		return this.redirect("igrp","ChangePassword","index");
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	private Response db(String currentPassword, String newPassword) throws IOException {
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		User user = Core.getCurrentUser();
		if(!user.getPass_hash().equals(nosi.core.webapp.User.encryptToHash(currentPassword, "MD5"))) {
			Core.setMessageError(gt("Senha atual inválida. Tente de novo !!! "));
			return this.forward("igrp","ChangePassword","index");
		} 
		user.setPass_hash(nosi.core.webapp.User.encryptToHash(newPassword, "MD5"));
		user.setUpdated_at(System.currentTimeMillis());
		user = user.update();
		if(user !=null)
			Core.setMessageSuccess(gt("Senha atualizada com sucesso."));
		else
			return this.forward("igrp","ChangePassword","index");
		
		return this.redirect("igrp","ChangePassword","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	private Response ldap(String currentPassword, String newPassword) throws IOException {
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		User user = Core.getCurrentUser();
		if(!user.getPass_hash().equals(nosi.core.webapp.User.encryptToHash(currentPassword, "MD5"))) {
			Core.setMessageError(gt("Senha atual inválida. Tente de novo !!! "));
			return this.forward("igrp","ChangePassword","index");
		} 

		File file = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/ldap/ldap.xml"));
		LdapInfo ldapinfo = JAXB.unmarshal(file, LdapInfo.class);
		NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(), ldapinfo.getBase(), ldapinfo.getAuthenticationFilter(), ldapinfo.getEntryDN());
		
		LdapPerson person = ldap.getUserLastInfo(Core.getCurrentUser().getEmail().trim());
		
		String error = ldap.getError();
		if(person != null) {
			person.setPwdLastSet(newPassword);
			person.setUid(user.getUser_name());
			ldap.changePassword(person);
			error = ldap.getError();
			if(error != null) {
				Core.setMessageError("Ocorreu um erro. LDAP error: " + error);
				return this.forward("igrp","ChangePassword","index");
			}else { 
				user.setPass_hash(nosi.core.webapp.User.encryptToHash(newPassword, "MD5"));
				user.setUpdated_at(System.currentTimeMillis());
				user = user.update();
				Core.setMessageSuccess(gt("Password alterado com sucesso."));
			}
		}else {
			Core.setMessageError(gt(error != null ? error : "Ocorreu um erro. Email inválido."));
			return this.forward("igrp","ChangePassword","index");
		}
		return this.redirect("igrp","ChangePassword","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	
	/*----#END-PRESERVED-AREA----*/
}
