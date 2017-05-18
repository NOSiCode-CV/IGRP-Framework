/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novaorganica;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
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
		HashMap<String,String> profiles =  new ProfileType().getListProfiles();
		
		view.aplicacao.setValue(applications);
		
		view.organica_pai.setValue(profiles);
		
		this.renderView(view);
	}
	
	public void actionEditar(@RParam(rParamName = "p_id") String idOrganica) throws IOException, IllegalArgumentException, IllegalAccessException{
		NovaOrganica model = new NovaOrganica();
		
		Organization organization = new Organization();
		organization.setId(Integer.parseInt(idOrganica));
		organization = (Organization) organization.getOne();
		
		model.setCodigo(organization.getCode());
		model.setNome(organization.getName());
		model.setAplicacao(organization.getEnv_fk());
		model.setOrganica_pai(organization.getSelf_fk());
		model.setAtivo(organization.getStatus());
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			model.load();
			organization.setCode(model.getCodigo());
			organization.setName(model.getNome());
			organization.setEnv_fk(model.getAplicacao());
			organization.setSelf_fk(model.getOrganica_pai());
			organization.setStatus(model.getAtivo());
			
			if(organization.update())
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Orgânica actualizada com sucesso.");
			else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Erro ao atualizar.");
			
			this.redirect("igrp", "nova-organica", "editar", new String[]{"p_id"}, new String[]{organization.getId() + ""});
		}
		
		NovaOrganicaView view = new NovaOrganicaView(model);
		
		HashMap<Integer,String> applications =  new Application().getListApps();
		HashMap<String,String> profiles =  new ProfileType().getListProfiles();
		
		view.aplicacao.setValue(applications);
		
		view.organica_pai.setValue(profiles);
		
		view.sectionheader_1_text.setValue("Gestão de Orgânica - Atualizar");
		
		view.btn_gravar.setLink("editar&amp;p_id=" + idOrganica);
		
		
		this.renderView(view);
	}
	
}
