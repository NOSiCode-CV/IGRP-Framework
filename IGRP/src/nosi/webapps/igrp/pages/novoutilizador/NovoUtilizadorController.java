/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novoutilizador;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;

import java.io.IOException;


public class NovoUtilizadorController extends Controller {		

	public void actionIndex() throws IOException{
		NovoUtilizador model = new NovoUtilizador();
		
		NovoUtilizadorView view = new NovoUtilizadorView(model);
		view.aplicacao.setValue(new Application().getListApps());
		view.organica.setValue(new Organization().getListOrganizations());
		view.perfil.setValue(new ProfileType().getListProfiles());
		String id = Igrp.getInstance().getRequest().getParameter("id");
		if(id!=null && !id.equals("")){
			User u =  (User) new User().findIdentityById(Integer.parseInt(id));
			view.email.setValue(u.getEmail());
		}
		this.renderView(view);
	}

	public void actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoUtilizador model = new NovoUtilizador();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			Profile p = new Profile();
			p.setOrg_fk(model.getOrganica());
			p.setProf_type_fk(model.getPerfil());
			p.setType("PROF");
			
			Profile p1 = new Profile();
			p1.setOrg_fk(model.getOrganica());
			p1.setProf_type_fk(model.getPerfil());
			p1.setType("ENV");
			p1.setType_fk(model.getAplicacao());
			User u = (User) new User().findIdentityByEmail(model.getEmail());
			if(u!=null){
				p.setUser_fk(u.getId());
				p1.setUser_fk(u.getId());
				p.setType_fk(model.getPerfil());
				if(p.insert() && p1.insert()){
					Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
				}else{
					Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");
				}
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error","Email inválido");
			}
		}
		this.redirect("igrp", "novo-utilizador", "index");
	}
	
}
