package nosi.webapps.igrp.pages.settings;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.i18n.I18nManager;
import nosi.core.webapp.Igrp;
import java.util.HashMap;
import javax.servlet.http.Cookie;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import nosi.core.webapp.helpers.ApplicationPermition;
import nosi.core.webapp.security.Permission;
/*----#end-code----*/
		
public class SettingsController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Settings model = new Settings();
		model.load();
		model.setView_1_img("/IGRP/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg");
		SettingsView view = new SettingsView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.idioma.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.perfil.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		String ichange = Igrp.getInstance().getRequest().getParameter("ichange");
		// String ichange = Core.getParam("ichange");
	
		
		if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			boolean success = true;
			if (Core.isNotNull(ichange)) {
				try {
					if(Core.isNotNull(model.getPerfil())){
						ProfileType prof = new ProfileType().findOne(model.getPerfil());
						ApplicationPermition appP = new ApplicationPermition(prof.getOrganization().getApplication().getId(),
								prof.getOrganization().getApplication().getDad(), prof.getOrganization().getId(), prof.getId(),
								prof.getOrganization().getCode(),prof.getCode());
						Igrp.getInstance().getRequest().getSession().setAttribute(appP.getDad(),appP);
						new Permission().setCookie(appP);
					}
					if (Core.isNotNull(model.getIdioma())) {
						Igrp.getInstance().getI18nManager().newIgrpCoreLanguage(model.getIdioma());
						Cookie cookie = new Cookie("igrp_lang", model.getIdioma());
						cookie.setMaxAge(I18nManager.cookieExpire);
						Igrp.getInstance().getResponse().addCookie(cookie);
					}
				}catch(Exception e) {
					success = false;
				}
			}
			if(success)
				Core.setMessageSuccess("Dados gravados com sucesso!");
			return redirect("igrp", "Settings", "index");
		} 
		// Fetch all cookies 
		for (Cookie cookie : Igrp.getInstance().getRequest().getCookies()) {
			if (cookie.getName().equals("igrp_lang")) {
				model.setIdioma(cookie.getValue());
			}
			if (cookie.getName().equals(Core.getCurrentDad())) {
				ApplicationPermition appP = new Permission().getApplicationPermition();
				model.setPerfil(""+appP.getProfId());
			}
		}
		if (Core.isNull(model.getPerfil()))
			model.setPerfil(Core.getCurrentProfile() + "");
		// if(Core.isNotNull(model.getOrganica()))
		// model.setOrganica(Permission.getCurrentOrganization() + "");

		User user = (User) Igrp.getInstance().getUser().getIdentity();

		

		view.btn_alterar_senha.setLink("igrp", "ChangePassword", "index&target=_blank");

		view.nome.setValue(user.getName());
		view.email.setValue(user.getEmail());
		view.username.setValue(user.getUser_name());
		view.sectionheader_1_text.setValue(Core.gt("Área Pessoal") + ": " + user.getName());
		view.telefone.setValue(user.getPhone());
		view.telemovel.setValue(user.getMobile());
		view.password_expira_em.setValue(user.getValid_until());

		// HashMap<String,String> organizations = new
		// Organization().getListMyOrganizations();
		// view.organica.setValue(organizations);

		HashMap<String, String> profiles = new ProfileType().getListMyProfiles();
		view.perfil.setValue(profiles);

		HashMap<String, String> idioma = getIdiomaMap();
		view.idioma.setValue(idioma);
		
	
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}


	
	public Response actionAlterar_senha() throws IOException, IllegalArgumentException, IllegalAccessException{
		Settings model = new Settings();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","ChangePassword","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(alterar_senha)----*/
		
		/*----#end-code----*/
		return this.redirect("igrp","ChangePassword","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	public HashMap<String, String> getIdiomaMap() {
		HashMap<String, String> idioma = new HashMap<String, String>();
		idioma.put(null, Core.gt("-- Selecionar --"));
		idioma.put("pt_PT", Core.gt("Português"));
		idioma.put("en_US", Core.gt("Inglês"));
		idioma.put("fr_FR", Core.gt("Francês"));
		idioma.put("es_ES", Core.gt("Espanhol"));
		return idioma;
	}
	/*----#end-code----*/
}
