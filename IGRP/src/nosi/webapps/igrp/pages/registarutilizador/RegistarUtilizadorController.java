/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.registarutilizador;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.User;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class RegistarUtilizadorController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException, NoSuchAlgorithmException{
		RegistarUtilizador model = new RegistarUtilizador();
		boolean isError = false;
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			
			model.load();
			
			if(!model.getPassword().equals(model.getConfirmar_password())){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Password inconsistentes ... Tente de novo.");
				isError = true;
			}
				
			if(!isError){
				//MessageDigest m = MessageDigest.getInstance("MD5");
				//m.update(model.getPassword().getBytes());
				User user = new User();
				user.setName(model.getNome());
				user.setPass_hash(model.getPassword());
				user.setEmail(model.getEmail());
				user.setUser_name(model.getUsername());
				user.setStatus(1);
				user.setCreated_at(System.currentTimeMillis());
				user.setUpdated_at(System.currentTimeMillis());
				user.setAuth_key("NOTSETYET");
				
				if(user.insert()){
					Igrp.getInstance().getFlashMessage().addMessage("success", "Utilizador registado com sucesso.");
					this.redirect("igrp", "registar-utilizador", "index");
				}
				else
					Igrp.getInstance().getFlashMessage().addMessage("error", "Error ao registar uilizador.");
			}
			
		}
		
		RegistarUtilizadorView view = new RegistarUtilizadorView(model);
		view.title = "";
		this.renderView(view);
	}

	public void actionGuardar() throws IOException{
		
	}
	
	public void actionVoltar() throws IOException{
			this.redirect("red","teste","action");
	}	
	
}
