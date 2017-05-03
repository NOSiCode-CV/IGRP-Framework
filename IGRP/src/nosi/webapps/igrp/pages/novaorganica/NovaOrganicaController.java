/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novaorganica;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;

import java.io.IOException;


public class NovaOrganicaController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovaOrganica model = new NovaOrganica();
		NovaOrganicaView view = new NovaOrganicaView(model);
		
		if(Igrp.getInstance().getRequest().getMethod() == "POST"){
			
			model.load();
			
			System.out.println(model.getOrganica_pai());
			
			Organization organization = new Organization();
			organization.setCode(model.getCodigo());
			organization.setEnv_fk(model.getAplicacao());
			organization.setSelf_fk(model.getOrganica_pai());
			organization.setStatus(model.getAtivo());
			organization.setName(model.getNome());
			
			if(organization.insert())
				System.out.println("Success");
			else
				System.out.println("Failure");
			
		}
		
		Object []applications =  new Application().getAll();
		Object []organizations = new Organization().getAll();
		
		view.aplicacao.addOption("-- Aplicação --", ""); // Prompt
		for(Object application : applications){ 
			Application obj = (Application)application;
			view.aplicacao.addOption(obj.getName(), obj.getId());
		}
			
		view.organica_pai.addOption("-- Orgânica --", ""); // Prompt
		for(Object organization : organizations){
			Organization obj = (Organization)organization;
			view.organica_pai.addOption(obj.getName(), obj.getId());
		}
		
		this.renderView(view);
	}

	public void actionGravar() throws IOException{
		
	}
	
	public void actionVoltar() throws IOException{
		
		this.redirect("RED","Teste","Action");
	}
	
}
