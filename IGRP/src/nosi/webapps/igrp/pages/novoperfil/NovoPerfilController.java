/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novoperfil;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.FlashMessage.Message;

import java.io.IOException;

import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;


public class NovoPerfilController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoPerfil model = new NovoPerfil();

		NovoPerfilView view = new NovoPerfilView(model);
			
		if(Igrp.getInstance().getRequest().getMethod() == "POST"){
			
			model.load();
			
			ProfileType pt = new ProfileType();
		
			pt.setCode(model.getCodigo());
			pt.setDescr(model.getDescricao());
			pt.setOrg_fk(model.getOrganica());
			pt.setSelf_fk(model.getPerfil());
			pt.setStatus(model.getActivo());
			pt.setEnv_fk(model.getAplicacao());
			
			if(pt.insert())
				System.out.println("Ok");
			else
				System.out.println("Error");
			
			
		}
		
		Object []applications =  new Application().getAll();
		Object []profiles = new ProfileType().getAll();
		Object []organizations = new Organization().getAll();
		/*
		view.aplicacao.addOption("-- Aplicação --", ""); // Prompt
		for(Object application : applications){ 
			Application obj = (Application)application;
			view.aplicacao.addOption(obj.getName(), obj.getId());
		}
		
		view.perfil.addOption("-- Perfil --", ""); // Prompt
		for(Object profile : profiles){
			ProfileType obj = (ProfileType)profile;
			view.perfil.addOption(obj.getDescr(), obj.getId());
		}
		
		view.organica.addOption("-- Orgânica --", ""); // Prompt
		for(Object organization : organizations){
			Organization obj = (Organization)organization;
			view.organica.addOption(obj.getName(), obj.getId());
		}
		*/
		this.renderView(view);
	}

	public void actionGravar() throws IOException{
		
	}
	
	public void actionVoltar() throws IOException{
		
		this.redirect("RED","Teste","Action");
	}
	
}
