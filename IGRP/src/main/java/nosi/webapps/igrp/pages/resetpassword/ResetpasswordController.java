package nosi.webapps.igrp.pages.resetpassword;

import nosi.core.webapp.Controller;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import static nosi.core.i18n.Translator.gt;
import java.util.Base64;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.integration.autentika.RemoteUserStoreManagerServiceSoapClient;
import nosi.core.integration.autentika.dto.UpdateCredentialByAdminRequestDTO;
import nosi.webapps.igrp.dao.User;
/*----#end-code----*/
		
public class ResetpasswordController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Resetpassword model = new Resetpassword();
		model.load();
		model.setSign_in("igrp","Dominio","index");
		ResetpasswordView view = new ResetpasswordView();
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/
		model.setSign_in("webapps?r=igrp/login/login");
		String token = Core.getParam("t");
		try {
			if(token == null || token.isEmpty()) 
				throw new RuntimeException("Invalid or expired token.");
			User user = new User().find().andWhere("password_reset_token", "=", token).one();
			if(user != null) {
				model.setUsername(user.getEmail());
				String aux = new String(Base64.getUrlDecoder().decode(user.getPassword_reset_token()));
				String time = aux.split("_")[1];
				if(time.compareTo(System.currentTimeMillis() + "") <= 0 || user.getStatus() == 0) 
					throw new Exception("Invalid or expired token.");
			}else
				throw new Exception("Invalid or expired token."); 
		}catch(Exception e) {
			Core.setMessageError(gt("Token inválido ou expirado."));
			Core.setMessageInfo(gt("Favor solicitar um novo reset."));
			return redirect("igrp","Resetbyemail","index", this.queryString());
		}
		view.btn_guardar.setLink("guardar&t=" + token); 
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGuardar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Resetpassword model = new Resetpassword();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","Resetpassword","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (guardar)  *//* End-Code-Block  */
		/*----#start-code(guardar)----*/
		String token = Core.getParam("t");
		User user = null;
		try {
			if(token == null || token.isEmpty()) 
				throw new Exception("Invalid or expired token.");
			user = new User().find().andWhere("password_reset_token", "=", token).one();
			if(user != null) {
				String aux = new String(Base64.getUrlDecoder().decode(user.getPassword_reset_token()));
				String[] arr = aux.split("_");
				String time = arr[1];
				if(time.compareTo(System.currentTimeMillis() + "") <= 0 || user.getStatus() == 0) 
					throw new Exception("Invalid or expired token.");
			}else
				throw new Exception("Invalid or expired token."); 
		}catch(Exception e) {
			this.addQueryString("t", token);		
			Core.setMessageError(gt("Token inválido ou expirado."));
			Core.setMessageInfo(gt("Favor solicitar um novo reset."));
			return forward("igrp","Resetbyemail","index", this.queryString());
		}
		String username = user.getUser_name();
		String pwd = model.getNova_senha();
		String pwdConfirm = model.getConfirmar_nova_senha();
		if(!pwd.equals(pwdConfirm)) 
			Core.setMessageError("Password inconsistentes. Tente novamente !"); 
		else {
			String authenticationType = this.getConfig().getAutenticationType(); 
			if(authenticationType.equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_DATABASE.value())) {
				if(db(username, pwd)) 				
					return redirectToUrl("webapps?r=igrp/login/login"); 
			}else 
				if(authenticationType.equals(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE_LDAP.value()) && (ldap(username, pwd)))
						{
					return redirectToUrl("webapps?r=igrp/login/login");
				}
		}
		this.addQueryString("t", token);
		/*----#end-code----*/
		return this.redirect("igrp","Resetpassword","index", this.queryString());	
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/
	
	private boolean db(String username, String password) {
		boolean flag = false;
		User u = Core.findUserByUsername(username);
		if(u != null) {
			u.setPass_hash(nosi.core.webapp.User.encryptToHash(username + "" + password, "SHA-256"));
			u = u.update();
			if(u != null) {
				Core.setMessageSuccess("Password alterado com sucesso. Faça o login para continuar.");
				flag = true;
			}else
				Core.setMessageError();
		}else 
			Core.setMessageError();
		return flag;
	}
	
	private boolean ldap(String username, String password) {

		String wsdlUrl = ConfigCommonMainConstants.IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL.environmentValue();
		String uid = ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_USN.environmentValue();
		String pwd = ConfigCommonMainConstants.IDS_AUTENTIKA_ADMIN_PWD.environmentValue();

		var client = new RemoteUserStoreManagerServiceSoapClient(wsdlUrl, uid, pwd);
		if (!client.isExistingUser(username)) {
			Core.setMessageError(gt("Ocorreu um erro. Utilizador inválido."));
			return false;
		}
		var updateCredentialByAdminRequestDTO = new UpdateCredentialByAdminRequestDTO();
		updateCredentialByAdminRequestDTO.setUserName(username);
		updateCredentialByAdminRequestDTO.setNewCredential(password);
		if (!client.updateCredentialByAdmin(updateCredentialByAdminRequestDTO))
			Core.setMessageError();
		else {
			Core.setMessageSuccess(gt("Password alterado com sucesso. Faça o login para continuar."));
			return true;
		}
		return false;
	}
	
/*----#end-code----*/
}
