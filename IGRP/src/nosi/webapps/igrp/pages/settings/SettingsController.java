/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.settings;

import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.Permission;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.http.Cookie;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;

public class SettingsController extends Controller {		

public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Settings model = new Settings();
		model.load();
		
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			String data = model.getOrganica()+"-"+model.getPerfil();
			Igrp.getInstance().getResponse().addCookie(new Cookie(Permission.getCurrentEnv(),data));
			
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "OK - [APLICAR] Operação efectuada com sucesso");
		}
		
		model.setPerfil(Permission.getCurrentPerfilId() + "");
		model.setOrganica(Permission.getCurrentOrganization() + "");
		
		User user = (User) Igrp.getInstance().getUser().getIdentity();
		
		SettingsView view = new SettingsView(model);
		
		view.nome.setValue(user.getName());
		view.email.setValue(user.getEmail());
		view.username.setValue(user.getUser_name());
		/*view.telefone.setValue(user.getPhone());
		view.telemovel.setValue(user.getMobile());
		view.password_expira_em.setValue(user.getValid_until());
		*/
		
		HashMap<String,String> organizations =  new Organization().getListMyOrganizations();
		view.organica.setValue(organizations);
		
		HashMap<String,String> profiles =  new ProfileType().getListMyProfiles();
		view.perfil.setValue(profiles);
		
		HashMap<String, String> idioma = new HashMap<String, String>();
		idioma.put("", "--- Selecionar Idioma ---");
		idioma.put("PT", "PortuguÃªs");
		idioma.put("EN", "InglÃªs");
		idioma.put("FR", "FrancÃªs");
		idioma.put("ES", "Espanhol");
		view.idioma.setValue(idioma);
		
		return this.renderView(view);
	}

	public Response actionAplicar() throws IOException{
		return this.redirect("RED","Teste","Action");
	}	
}
