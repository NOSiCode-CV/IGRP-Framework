/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.registarutilizador;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.User;
import java.io.IOException;


public class RegistarUtilizadorController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		RegistarUtilizador model = new RegistarUtilizador();
		
		System.out.println(Igrp.getInstance().getFlashMessage().getMessages("success").size());
		
		if(Igrp.getInstance().getRequest().getMethod() == "POST"){
			model.load();
			User user = new User();
			user.setName(model.getNome());
			user.setPass_hash(model.getPassword());
			user.setEmail(model.getEmail());
			user.setUser_name(model.getUsername());
			user.setStatus(1);
			user.setCreated_at(10);
			user.setUpdated_at(12);// System.currentTimeMillis()
			user.setAuth_key("XPTO");
			
			if(user.insert()){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Utilizador registado com sucesso");
				this.redirect("igrp", "registar-utilizador", "index");
			}
			else
				Igrp.getInstance().getFlashMessage().addMessage("error", "Error ao registar uilizador.");;
			
		}
		
		
		RegistarUtilizadorView view = new RegistarUtilizadorView(model);
		this.renderView(view);
	}

	public void actionGuardar() throws IOException{
		
	}
	
	public void actionVoltar() throws IOException{
			this.redirect("red","teste","action");
	}
	
}
