package nosi.webapps.igrp.pages.settings;

import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;

import java.io.IOException;

/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import nosi.core.i18n.I18nManager;

import java.util.HashMap;
import javax.servlet.http.Cookie;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.core.webapp.mvc.Controller;
import nosi.core.webapp.security.Permission;
/*----#end-code----*/
import nosi.core.webapp.util.Core;
import nosi.core.webapp.util.helpers.ApplicationPermition;
import nosi.core.webapp.util.helpers.database.QueryInterface;
import nosi.core.webapp.util.helpers.database.ResultSet;
		
public class SettingsController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Settings model = new Settings();
		model.load();
		model.setView_1_img("../images/IGRP/IGRP2.3/assets/img/jon_doe.jpg");
		SettingsView view = new SettingsView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.idioma.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.perfil.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		String showMsgSuccess = Core.getParam("showMsgSuccess"); 
		if(showMsgSuccess != null && showMsgSuccess.equals("true")) 
			Core.setMessageSuccess("Dados gravados com sucesso!"); 
		
		if(this.getConfig().getAutenticationType().equalsIgnoreCase("ldap"))
			view.btn_alterar_senha.setVisible(false);
		
		String ichange = Igrp.getInstance().getRequest().getParameter("ichange");
		
		if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			boolean success = true;
			if (Core.isNotNull(ichange)) {
				try {
					if(Core.isNotNull(model.getPerfil())){
						ProfileType prof = new ProfileType().findOne(model.getPerfil());
						ApplicationPermition appP = new ApplicationPermition(prof.getOrganization().getApplication().getId(),
								prof.getOrganization().getApplication().getDad(), prof.getOrganization().getId(), prof.getId(),
								prof.getOrganization().getCode(),prof.getCode());
						Core.addToSession(appP.getDad(), appP); 
						new Permission().setCookie(appP); 
					}
					if (Core.isNotNull(model.getIdioma())) {
						Cookie cookie = new Cookie("igrp_lang", model.getIdioma());
						cookie.setMaxAge(I18nManager.COOKIE_EXPIRE);
						Igrp.getInstance().getResponse().addCookie(cookie);
					}
				}catch(Exception e) {
					success = false;
				}
			}
			if(success)
				this.addQueryString("showMsgSuccess", "true"); 
			
			return redirect("igrp", "Settings", "index", this.queryString());
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
			view.btn_alterar_senha.setLink("igrp", "ChangePassword", "index&target=_blank");
		model.setNome(Core.getCurrentUser().getName());
		model.setEmail(Core.getCurrentUser().getEmail());
		model.setUsername(Core.getCurrentUser().getUser_name());
		view.sectionheader_1_text.setValue(Core.gt("Área Pessoal") + ": " + Core.getCurrentUser().getName());
		model.setTelefone(Core.getCurrentUser().getPhone());
		model.setTelemovel(Core.getCurrentUser().getMobile());
		model.setPassword_expira_em(Core.getCurrentUser().getValid_until());
		
		//hidden the fields for now
		view.ultimo_acesso_rede_estado.setVisible(false);
		view.ultimo_acesso_igrp.setVisible(false);
		view.password_expira_em.setVisible(false);
		
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
		  return this.forward("igrp","ChangePassword","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(alterar_senha)----*/
		this.addQueryString("settings","true"); 
		/*----#end-code----*/
		return this.redirect("igrp","ChangePassword","index", this.queryString());	
	}
	
	public Response actionEditar_perfil() throws IOException, IllegalArgumentException, IllegalAccessException{
		Settings model = new Settings();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","RegistarUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(editar_perfil)----*/
		this.addQueryString("p_id",Core.getCurrentUser().getId());
		this.addQueryString("settings","settings");
      	return this.redirect("igrp","RegistarUtilizador","editar", this.queryString());
		/*----#end-code----*/
			
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
