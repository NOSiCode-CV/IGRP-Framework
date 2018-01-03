
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


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		ChangePassword model = new ChangePassword();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			
			model.load();
			
			if(!model.getPassword_1().equals(model.getConfirm_password())) {
				Core.setMessageError(gt("Password inconsistentes ... Tente de novo !"));
				return this.forward("igrp","ChangePassword","index");
			}
			
			switch(Config.getAutenticationType()) {
				case "ldap": return ldap(model.getPassword_1());
				case "db": return db(model.getPassword_1());
				default:;
			}
			
		}
		return this.redirect("igrp","ChangePassword","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	private Response db(String password) throws IOException {
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		User user = Core.getCurrentUser();
		user.setPass_hash(nosi.core.webapp.User.encryptToHash(password, "MD5"));
		user.setUpdated_at(System.currentTimeMillis());
		user = user.update();
		if(user !=null)
			Core.setMessageSuccess(gt("Senha atualizada com sucesso."));
		else
			return this.forward("igrp","ChangePassword","index");
		
		return this.redirect("igrp","ChangePassword","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	private Response ldap(String password) throws IOException {
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		File file = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/config/ldap/ldap.xml"));
		LdapInfo ldapinfo = JAXB.unmarshal(file, LdapInfo.class);
		NosiLdapAPI ldap = new NosiLdapAPI(ldapinfo.getUrl(), ldapinfo.getUsername(), ldapinfo.getPassword(), ldapinfo.getBase(), ldapinfo.getType());
		
		LdapPerson person = ldap.getUserLastInfo(Core.getCurrentUser().getEmail().trim());
		
		String error = ldap.getError();
		if(person != null) {
			person.setPwdLastSet(password);
			ldap.changePassword(person);
			error = ldap.getError();
			if(error != null) {
				Core.setMessageError("Ocorreu um erro. LDAP error: " + error);
				return this.forward("igrp","ChangePassword","index");
			}else
				Core.setMessageSuccess(gt("Password alterado com sucesso."));
		}else {
			Core.setMessageError(gt(error != null ? error : "Ocorreu um erro. Email inválido."));
			return this.forward("igrp","ChangePassword","index");
		}
		return this.redirect("igrp","ChangePassword","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	
	/*----#END-PRESERVED-AREA----*/
}
