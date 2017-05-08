/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novoperfil;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;

import java.io.IOException;

import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;


public class NovoPerfilController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoPerfil model = new NovoPerfil();

		NovoPerfilView view = new NovoPerfilView(model);
			
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			
			model.load();
			
			ProfileType pt = new ProfileType();
		
			pt.setCode(model.getCodigo());
			pt.setDescr(model.getDescricao());
			pt.setOrg_fk(model.getOrganica());
			pt.setSelf_fk(model.getPerfil());
			pt.setStatus(model.getActivo());
			pt.setEnv_fk(model.getAplicacao());
		
			if(pt.insert()){
				Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
				this.redirect("igrp", "pesquisar-perfil", "index");
				return;
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");				
			}
			
		}
		view.aplicacao.setValue(new Application().getListApps());
		view.perfil.setValue(new ProfileType().getListProfiles());
		view.organica.setValue(new Organization().getListOrganizations());
		this.renderView(view);
	}

	public void actionGravar() throws IOException{
		
	}
	
	public void actionVoltar() throws IOException{
		
		this.redirect("RED","Teste","Action");
	}
	
}
