/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novaorganica;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.User;

import java.io.IOException;
import java.util.HashMap;


public class NovaOrganicaController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovaOrganica model = new NovaOrganica();
		NovaOrganicaView view = new NovaOrganicaView(model);		
		Organization organization = new Organization();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){			
			model.load();			
			organization.setCode(model.getCodigo());
			organization.setApplication(new Application().findOne(model.getAplicacao()));
			if(model.getOrganica_pai()!=0){
				organization.setOrganization(new Organization().findOne(model.getOrganica_pai()));
			}
			User u = (User) Igrp.getInstance().getUser().getIdentity();
			organization.setUser(u);
			organization.setStatus(model.getAtivo());
			organization.setName(model.getNome());
			organization = organization.insert();
			if(organization!=null)
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Orgânica registada com sucesso");
			else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ocorreu um erro.");			
		}
		
		HashMap<Integer,String> applications =  new Application().getListApps();		
		view.aplicacao.setValue(applications);		
		view.organica_pai.setValue(organization.getListOrganizations());		
		return this.renderView(view);
	}
	
	public Response actionEditar(@RParam(rParamName = "p_id") String idOrganica) throws IOException, IllegalArgumentException, IllegalAccessException{
		NovaOrganica model = new NovaOrganica();
		
		Organization organization = new Organization().findOne(Integer.parseInt(idOrganica));		
		model.setCodigo(organization.getCode());
		model.setNome(organization.getName());
		model.setAplicacao(organization.getApplication().getId());
		if(organization.getOrganization()!=null){
			model.setOrganica_pai(organization.getOrganization().getId());
		}
		model.setAtivo(organization.getStatus());		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			model.load();
			organization.setCode(model.getCodigo());
			organization.setName(model.getNome());
			organization.setApplication(new Application().findOne(model.getAplicacao()));
			if(model.getOrganica_pai()!=0){
				organization.setOrganization(new Organization().findOne(model.getOrganica_pai()));
			}
			organization.setStatus(model.getAtivo());
			organization = organization.update();
			if(organization!=null){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Orgânica actualizada com sucesso.");
				return this.redirect("igrp", "nova-organica", "editar", new String[]{"p_id"}, new String[]{organization.getId() + ""});
			}else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Erro ao atualizar.");
		}		
		NovaOrganicaView view = new NovaOrganicaView(model);		
		HashMap<Integer,String> applications =  new Application().getListApps();
		view.aplicacao.setValue(applications);		
		view.organica_pai.setValue(organization.getListOrganizations());		
		view.sectionheader_1_text.setValue("Gestão de Orgânica - Atualizar");		
		view.btn_gravar.setLink("editar&p_id=" + idOrganica);	
		return this.renderView(view);
	}
	
}
