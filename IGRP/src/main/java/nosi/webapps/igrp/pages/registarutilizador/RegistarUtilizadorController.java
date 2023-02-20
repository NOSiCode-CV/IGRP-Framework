package nosi.webapps.igrp.pages.registarutilizador;

import nosi.core.webapp.Controller;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
import nosi.webapps.igrp.dao.User; //block import
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import static nosi.core.i18n.Translator.gt;
import java.util.Locale;
import nosi.core.webapp.RParam;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
/*----#end-code----*/
		
public class RegistarUtilizadorController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		RegistarUtilizador model = new RegistarUtilizador();
		model.load();
		RegistarUtilizadorView view = new RegistarUtilizadorView();
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGuardar() throws IOException, IllegalArgumentException, IllegalAccessException{
		RegistarUtilizador model = new RegistarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","RegistarUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (guardar)  *//* End-Code-Block  */
		/*----#start-code(guardar)----*/

	

		if(Core.isHttpPost()){			
			
			if(!model.getPassword().equals(model.getConfirmar_password())){
				Core.setMessageError("Password inconsistentes ... Tente de novo.");				
				 return this.forward("igrp","RegistarUtilizador","index", this.queryString());
			}
			final String username = model.getUsername().toLowerCase(Locale.ROOT).trim();
			User usrEmail = Core.findUserByEmail(model.getEmail());//verificar email
			User usrName = Core.findUserByUsername(username);//verificar username
			if(usrEmail != null || usrName != null) {
				Core.setMessageError("Email/Username já existe... por favor escolhe outro!!!");
				return this.forward("igrp","RegistarUtilizador","index", this.queryString());
			}				
						
				User user = new User();
				user.setName(model.getNome());
				
				user.setPass_hash(nosi.core.webapp.User.encryptToHash(username+ "" + model.getPassword(), "SHA-256"));
				user.setEmail(model.getEmail().toLowerCase(Locale.ROOT).trim());
				
				user.setUser_name(username);
				user.setStatus(1);
				user.setCreated_at(System.currentTimeMillis());
				user.setUpdated_at(System.currentTimeMillis());
				user.setAuth_key(nosi.core.webapp.User.generateAuthenticationKey());
				user.setActivation_key(nosi.core.webapp.User.generateActivationKey());
				
				user.setCni(model.getCni());
				user.setPhone(model.getTelefone());
				user.setMobile(model.getTelemovel());
				user.setUpdated_at(System.currentTimeMillis());              	
					try {
						if(Core.isNotNull(model.getForm_1_img_1()))
							user.setSignature_id(Core.saveFileNGetUuid(model.getForm_1_img_1()));
					} catch (Exception e) {
						e.printStackTrace();
					}
				
				
				user = user.insert();
				
				if(user.getId()!=null){
					Application app = new Application().find().andWhere("dad", "=", "tutorial").one();
					ProfileType prof = new ProfileType().find().andWhere("code","=","perfil.tutorial").andWhere("application", "=",app.getId()).one();
					Organization org = new Organization().find().andWhere("code","=","org.tutorial").andWhere("application", "=",app.getId()).one();
					//Atribui acesso a aplicação IGRP Tutorial
					Profile p1 = new Profile(app.getId(), "ENV",prof, user,org);
					p1=p1.insert();
					if(p1.getId()!=null) {
						Profile p2 = new Profile(prof.getId(), "PROF", prof, user, org);
						p2=p2.insert();
						if(p2.getId()!=null) {
								Core.setMessageSuccess(gt("Utilizador registado com sucesso."));
								Core.setMessageWarning("Deve convidar agora o utilizador.");
						}else {
							Core.setMessageError("Error ao registar uilizador.");
							Core.setMessageInfo("Perfil");
						}					
					}					
					return this.redirect("igrp", "RegistarUtilizador", "index");
				}
				else
					Core.setMessageError("Error ao registar uilizador.");
				
		}	
		/*----#end-code----*/
		return this.redirect("igrp","RegistarUtilizador","index", this.queryString());	
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/
public Response actionEditar(@RParam(rParamName = "p_id") String idUser,@RParam(rParamName = "settings") String sett) throws IOException, IllegalArgumentException, IllegalAccessException{
		
		RegistarUtilizadorView view = new RegistarUtilizadorView();
		RegistarUtilizador model = new RegistarUtilizador();	
	    model.load();
	    if(Core.isNotNull(sett)) {
	    	view.password.setVisible(false);
			view.confirmar_password.setVisible(false);
	    }
	    User user = Core.findUserById(Integer.parseInt(idUser));
		if(Core.isHttpPost()){
			boolean isError = false;
			if(!model.getPassword().equals(model.getConfirmar_password())){
				Core.setMessageError(gt("Password inconsistentes ... Tente de novo."));
				isError = true;
			}				
			if(!isError){
				user.setName(model.getNome());
				user.setPhone(model.getTelefone());
				user.setMobile(model.getTelemovel());
				if(Core.isNull(sett) && Core.isNotNull(model.getPassword()))
					user.setPass_hash(nosi.core.webapp.User.encryptToHash(model.getUsername() + "" + model.getPassword(), "SHA-256"));			
				user.setCni(model.getCni());
				user.setUpdated_at(System.currentTimeMillis());              	
					try {
						if(Core.isNotNull(model.getForm_1_img_1()))
							user.setSignature_id(Core.saveFileNGetUuid(model.getForm_1_img_1()));
					} catch (Exception e) {
						e.printStackTrace();
					}
              	
				user = user.update();
				if(user !=null){
					Core.setMessageSuccess(gt("Utilizador atualizado com sucesso."));
					this.addQueryString("p_id", user.getId());
					return this.redirect("igrp", "RegistarUtilizador", "editar", this.queryString());
				}
				else
					Core.setMessageError(gt("Error ao atualizar uilizador."));
			}			
		}	else {
	        model.setNome(user.getName());
			model.setUsername(user.getUser_name().toLowerCase().trim());
			model.setEmail(user.getEmail().toLowerCase(Locale.ROOT));
			model.setTelefone(user.getPhone());
			model.setTelemovel(user.getMobile());
			model.setCni(user.getCni());
		}	
		
		view.email.propertie().setProperty("readonly", "true");	
		view.username.propertie().setProperty("readonly", "true");	
		view.password.propertie().setProperty("required","false");
  		view.confirmar_password.propertie().setProperty("required","false");
		view.titulo_text.setValue("Atualizar utilizador");
		view.btn_guardar.setLink("editar&p_id=" + idUser);
 		view.setModel(model);
		return this.renderView(view);
	
	}

	/*----#end-code----*/
}
