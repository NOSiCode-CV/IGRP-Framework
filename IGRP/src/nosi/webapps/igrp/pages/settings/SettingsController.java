/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.settings;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.i18n.I18nManager;
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
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class SettingsController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{		
		/*----#START-PRESERVED-AREA(INDEX)----*/
		Settings model = new Settings();
		
		model.load();
		
		// Fetch all cookies 
		for(Cookie cookie : Igrp.getInstance().getRequest().getCookies()) {
			if(cookie.getName().equals("igrp_lang")) {
				model.setIdioma(cookie.getValue());
			}
			if(cookie.getName().equals("igrp")) {
				try {
					String []aux = cookie.getValue().split("-");
					model.setOrganica(aux[0]);
					model.setPerfil(aux[1]);
				}catch(Exception e) {
					// Do nothing 
				}
			}
		}
		
		model.setPerfil(Permission.getCurrentPerfilId() + "");
		model.setOrganica(Permission.getCurrentOrganization() + "");
		
		User user = (User) Igrp.getInstance().getUser().getIdentity();
		
		SettingsView view = new SettingsView(model);
		
		view.nome.setValue(user.getName());
		view.email.setValue(user.getEmail());
		view.username.setValue(user.getUser_name());
		view.sectionheader_1_text.setValue(gt("Minha Área Pessoal") + ": " + user.getName());
		/*view.telefone.setValue(user.getPhone());
		view.telemovel.setValue(user.getMobile());
		view.password_expira_em.setValue(user.getValid_until());
		*/
		
		HashMap<String,String> organizations =  new Organization().getListMyOrganizations();
		view.organica.setValue(organizations);
		
		HashMap<String,String> profiles =  new ProfileType().getListMyProfiles();
		view.perfil.setValue(profiles);
		
		HashMap<String, String> idioma = new HashMap<String, String>();
		idioma.put("", gt("-- Selecionar Idioma --"));
		idioma.put("pt_PT", gt("PortuguÃªs"));
		idioma.put("en_US", gt("Inglês"));
		idioma.put("fr_FR", gt("Francês"));
		idioma.put("es_ES", gt("Espanhol"));
		view.idioma.setValue(idioma);
		
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	public Response actionAplicar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(APLICAR)----*/
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			Settings model = new Settings();
			model.load();
			String data = model.getOrganica()+"-"+model.getPerfil();
			Igrp.getInstance().getResponse().addCookie(new Cookie(Permission.getCurrentEnv(),data));
			
			if(model.getIdioma() != null && !model.getIdioma().isEmpty()) {
				Igrp.getInstance().getI18nManager().newIgrpCoreLanguage(model.getIdioma());
				Cookie cookie = new Cookie("igrp_lang", model.getIdioma());
				cookie.setMaxAge(I18nManager.cookieExpire);
				Igrp.getInstance().getResponse().addCookie(cookie);
			}

			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, gt("OK - [APLICAR] Operação efectuada com sucesso"));
		
		}
		return this.redirect("igrp", "settings", "index");
		/*----#END-PRESERVED-AREA----*/
	}	
	
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}