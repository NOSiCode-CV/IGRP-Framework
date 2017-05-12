/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.registarutilizador;
import nosi.core.gui.components.IGRPButton;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
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
	
	public void actionEditar(@RParam(rParamName = "p_id") String idUser) throws IOException, IllegalArgumentException, IllegalAccessException{
		
		RegistarUtilizador model = new RegistarUtilizador();
		
		User user = (User) new User();
		user.setId(Integer.parseInt(idUser));
		user = (User) user.getOne();
		
		model.setNome(user.getName());
		model.setUsername(user.getUser_name());
		model.setEmail(user.getEmail());
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			
			model.load();
			
			boolean isError = false;

			if(!model.getPassword().equals(model.getConfirmar_password())){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Password inconsistentes ... Tente de novo.");
				isError = true;
			}
				
			if(!isError){
				user.setName(model.getNome());
				user.setPass_hash(model.getPassword());
				user.setEmail(model.getEmail());
				user.setUser_name(model.getUsername());
				user.setUpdated_at(System.currentTimeMillis());
				
				if(user.update()){
					Igrp.getInstance().getFlashMessage().addMessage("success", "Utilizador atualizado com sucesso.");
					this.redirect("igrp", "registar-utilizador", "editar", new String[]{"p_id"}, new String[]{user.getId() + ""});
					return;
				}
				else
					Igrp.getInstance().getFlashMessage().addMessage("error", "Error ao atualizar uilizador.");
			}
			
		}
		
		RegistarUtilizadorView view = new RegistarUtilizadorView(model);
		view.title = "Atualizar utilizador";
		view.btn_guardar.setLink("editar&amp;p_id=" + idUser);
		this.renderView(view);
	}
	
	public void actionVoltar() throws IOException{
			this.redirect("red","teste","action");
	}	
	
}
