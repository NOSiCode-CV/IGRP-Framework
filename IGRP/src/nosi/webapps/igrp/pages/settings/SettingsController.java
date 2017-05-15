/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.settings;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.Cookie;

import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;



public class SettingsController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Settings model = new Settings();
		model.load();
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			Igrp.getInstance().getResponse().addCookie(new Cookie("_perf", model.getPerfil()));
			Igrp.getInstance().getResponse().addCookie(new Cookie("_org", model.getOrganica()));
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "OK - [APLICAR] Operação efectuada com sucesso");
			/*
			 * this.redirect("igrp", "home", "index");
			 * return;
			 * */
		}
		
		model.setPerfil(nosi.core.webapp.User.getCurrentPerfilId() + "");
		model.setOrganica(nosi.core.webapp.User.getCurrentOrganization() + "");
		
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
		idioma.put("PT", "Português");
		idioma.put("EN", "Inglês");
		idioma.put("FR", "Francês");
		idioma.put("ES", "Espanhol");
		view.idioma.setValue(idioma);
		
		this.renderView(view);
	}

	public void actionAplicar() throws IOException{
		this.redirect("RED","Teste","Action");
	}
	
}
