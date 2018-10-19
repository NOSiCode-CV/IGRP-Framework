
package nosi.webapps.igrp.pages.settings;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.i18n.I18nManager;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.ApplicationPermition;

import java.io.IOException;
import java.util.HashMap;
import nosi.core.webapp.Core;
import javax.servlet.http.Cookie;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class SettingsController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		Settings model = new Settings();
		String ichange = Igrp.getInstance().getRequest().getParameter("ichange");
		// String ichange = Core.getParam("ichange");
		model.load();
		
		if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			boolean success = true;
			if (Core.isNotNull(ichange)) {
				try {
					if(Core.isNotNull(model.getPerfil())){
						ProfileType prof = new ProfileType().findOne(model.getPerfil());
						ApplicationPermition appP = new ApplicationPermition(prof.getOrganization().getApplication().getDad(), prof.getOrganization().getId(), prof.getId());
						Igrp.getInstance().getRequest().getSession().setAttribute(appP.getDad(),appP);
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
				try {
					String[] aux = cookie.getValue().split("-");
					// model.setOrganica(aux[0]);
					model.setPerfil(aux[1]);
				} catch (Exception e) {
					// Do nothing
				}
			}
		}
		if (Core.isNull(model.getPerfil()))
			model.setPerfil(Core.getCurrentProfile() + "");
		// if(Core.isNotNull(model.getOrganica()))
		// model.setOrganica(Permission.getCurrentOrganization() + "");

		User user = (User) Igrp.getInstance().getUser().getIdentity();

		SettingsView view = new SettingsView(model);

		view.btn_alterar_senha.setLink("igrp", "ChangePassword", "index&target=_blank");

		view.nome.setValue(user.getName());
		view.email.setValue(user.getEmail());
		view.username.setValue(user.getUser_name());
		view.sectionheader_1_text.setValue(gt("Área Pessoal") + ": " + user.getName());
		view.telefone.setValue(user.getPhone());
		view.telemovel.setValue(user.getMobile());
		view.password_expira_em.setValue(user.getValid_until());

		// HashMap<String,String> organizations = new
		// Organization().getListMyOrganizations();
		// view.organica.setValue(organizations);

		HashMap<String, String> profiles = new ProfileType().getListMyProfiles();
		view.perfil.setValue(profiles);

		HashMap<String, String> idioma = new HashMap<String, String>();
		idioma.put(null, gt("-- Selecionar --"));
		idioma.put("pt_PT", gt("Português"));
		idioma.put("en_US", gt("Inglês"));
		idioma.put("fr_FR", gt("Francês"));
		idioma.put("es_ES", gt("Espanhol"));
		view.idioma.setValue(idioma);

		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionAlterar_senha() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(ALTERAR_SENHA)----*/
		Settings model = new Settings();
		if (Igrp.getMethod().equalsIgnoreCase("post")) {
			model.load();
		}
		return this.redirect("igrp", "ChangePassword", "index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/

	/*----#END-PRESERVED-AREA----*/
}
