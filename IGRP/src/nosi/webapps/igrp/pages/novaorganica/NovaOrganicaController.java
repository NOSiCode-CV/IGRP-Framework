/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novaorganica;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Organization;

import java.io.IOException;
import java.util.HashMap;


public class NovaOrganicaController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovaOrganica model = new NovaOrganica();
		NovaOrganicaView view = new NovaOrganicaView(model);
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			
			model.load();
			
			Organization organization = new Organization();
			organization.setCode(model.getCodigo());
			organization.setEnv_fk(model.getAplicacao());
			organization.setSelf_fk(model.getOrganica_pai());
			organization.setStatus(model.getAtivo());
			organization.setName(model.getNome());
			
			if(organization.insert())
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Orgânica registada com sucesso");
			else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ocorreu um erro.");
			
		}
		
		HashMap<Integer,String> applications =  new Application().getListApps();
		HashMap<String,String> organizations =  new Organization().getListApps();
		
		view.aplicacao.setValue(applications);
		
		view.organica_pai.setValue(organizations);
		
		this.renderView(view);
	}
}
