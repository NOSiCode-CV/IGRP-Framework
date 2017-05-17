/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novoperfil;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;

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
	
	public void actionEditar(@RParam(rParamName="p_id")String id) throws IOException, IllegalArgumentException, IllegalAccessException{
		
		NovoPerfil model = new NovoPerfil();
		ProfileType p = new ProfileType();
		p.setId(Integer.parseInt(id));
		p = (ProfileType) p.getOne();
		
		model.setCodigo(p.getCode());
		model.setDescricao(p.getDescr());
		model.setAplicacao(p.getEnv_fk());
		model.setOrganica(p.getOrg_fk());
		model.setActivo(p.getStatus());
		model.setPerfil(p.getSelf_fk());
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			model.load();
			
			p.setCode(model.getCodigo());
			p.setDescr(model.getDescricao());
			p.setEnv_fk(model.getAplicacao());
			p.setOrg_fk(model.getOrganica());
			p.setSelf_fk(model.getPerfil());
			p.setStatus(model.getActivo());
			
			if(p.update())
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Perfil atualizado com sucesso.");
			else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Erro ao atualizar o perfil.");
			
			this.redirect("igrp", "novo-perfil", "editar", new String[]{"p_id"}, new String[]{p.getId() + ""});
			return; // exit here
			
		}
		
		NovoPerfilView view = new NovoPerfilView(model);
		
		view.sectionheader_1_text.setValue("Gestão de Perfil - Atualizar");
		
		view.btn_gravar.setLink("editar&amp;p_id="+id);
		
		view.aplicacao.setValue(new Application().getListApps());
		view.perfil.setValue(new ProfileType().getListProfiles());
		view.organica.setValue(new Organization().getListOrganizations());
		this.renderView(view);
	}
	
}
