/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.registarutilizador;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.UserRole;
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class RegistarUtilizadorController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException, NoSuchAlgorithmException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		RegistarUtilizador model = new RegistarUtilizador();
		boolean isError = false;

		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){			
			model.load();			
			if(!model.getPassword().equals(model.getConfirmar_password())){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Password inconsistentes ... Tente de novo."));
				isError = true;
			}
				
			if(!isError){				
				User user = new User();				
				user.setName(model.getNome());
				user.setPass_hash(nosi.core.webapp.User.encryptToHash(model.getPassword(), "MD5"));
				user.setEmail(model.getEmail());
				user.setUser_name(model.getUsername());
				user.setStatus(1);
				user.setCreated_at(System.currentTimeMillis());
				user.setUpdated_at(System.currentTimeMillis());
				user.setAuth_key(nosi.core.webapp.User.generateAuthenticationKey());
				user.setActivation_key(nosi.core.webapp.User.generateActivationKey());
				user = user.insert();
				UserRole role = new UserRole();
				String role_name = Igrp.getInstance().getServlet().getInitParameter("role_name");
				role.setRole_name(role_name != null && !role_name.trim().isEmpty() ? role_name : "IGRP_ADMIN");
				role.setUser(user);
				role = role.insert();
				if(user!=null){
					Application app = new Application().find().andWhere("dad", "=", "tutorial").one();
					ProfileType prof = new ProfileType().find().andWhere("code","=","perfil.tutorial").andWhere("application", "=",app.getId()).one();
					Organization org = new Organization().find().andWhere("code","=","org.tutorial").andWhere("application", "=",app.getId()).one();
					//Atribui acesso a aplicação IGRP Tutorial
					Profile p1 = new Profile(app.getId(), "ENV",prof, user,org);
					p1.insert();
					Profile p2 = new Profile(prof.getId(), "PROF", prof, user, org);
					p2.insert();
					Core.setMessageSuccess(gt("Utilizador registado com sucesso."));
					Core.setMessageInfoLink(gt("Convidar "+user.getName()),"igrp","novo-utilizador","index&target=_blank&id="+user.getId());
					return this.redirect("igrp", "registar-utilizador", "index");
				}
				else
					Igrp.getInstance().getFlashMessage().addMessage("error", gt("Error ao registar uilizador."));
			}
			
		}
		
		RegistarUtilizadorView view = new RegistarUtilizadorView(model);
		view.title = "";
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	public void actionGuardar() throws IOException{
		
	}
	
	public Response actionEditar(@RParam(rParamName = "p_id") String idUser) throws IOException, IllegalArgumentException, IllegalAccessException{
		
		/*----#START-PRESERVED-AREA(EDITAR)----*/
		RegistarUtilizador model = new RegistarUtilizador();		
		User user = new User().findOne(Integer.parseInt(idUser));		
		model.setNome(user.getName());
		model.setUsername(user.getUser_name());
		model.setEmail(user.getEmail());		
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){			
			model.load();			
			boolean isError = false;
			if(!model.getPassword().equals(model.getConfirmar_password())){
				Core.setMessageError(gt("Password inconsistentes ... Tente de novo."));
				isError = true;
			}				
			if(!isError){
				user.setName(model.getNome());
				user.setPass_hash(nosi.core.webapp.User.encryptToHash(model.getPassword(), "MD5"));
				user.setEmail(model.getEmail());
				user.setUser_name(model.getUsername());
				user.setUpdated_at(System.currentTimeMillis());
				user = user.update();
				if(user !=null){
					Core.setMessageSuccess(gt("Utilizador atualizado com sucesso."));
					return this.redirect("igrp", "registar-utilizador", "editar", new String[]{"p_id"}, new String[]{user.getId() + ""});
				}
				else
					Core.setMessageError(gt("Error ao atualizar uilizador."));
			}			
		}		
		RegistarUtilizadorView view = new RegistarUtilizadorView(model);
		view.title = "Atualizar utilizador";
		view.btn_guardar.setLink("editar&p_id=" + idUser);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}
	
	public Response actionVoltar() throws IOException{
		/*----#START-PRESERVED-AREA(VOLTAR)----*/
		return this.redirect("red","teste","action");
		/*----#END-PRESERVED-AREA----*/
	}	
	

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
