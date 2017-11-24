/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novaorganica;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.User;
import java.io.IOException;

import static nosi.core.i18n.Translator.gt;

/*----#END-PRESERVED-AREA----*/

public class NovaOrganicaController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		NovaOrganica model = new NovaOrganica();
		model.load();
		NovaOrganicaView view = new NovaOrganicaView(model);		
		Organization organization = new Organization();
		view.aplicacao.setValue(new Application().getListApps());		
		view.organica_pai.setValue(model.getAplicacao() != 0 ? organization.getListOrganizations() : null);		
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}
	
	public Response actionGuardar() throws IOException, IllegalArgumentException, IllegalAccessException{
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			NovaOrganica model = new NovaOrganica();		
			Organization organization = new Organization();
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
			if(organization!=null){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, gt("Orgânica registada com sucesso"));
			}else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Ocorreu um erro."));			
		return this.redirect("igrp", "nova-organica", "index");
		}
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Invalid request ..."));			
		return this.redirect("igrp", "nova-organica", "index");
	}
	
	public Response actionEditar(@RParam(rParamName = "p_id") String idOrganica) throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(EDITAR)----*/
		NovaOrganica model = new NovaOrganica();
		
		Organization organization = new Organization().findOne(Integer.parseInt(idOrganica));		
		model.setCodigo(organization.getCode());
		model.setNome(organization.getName());
		model.setAplicacao(organization.getApplication().getId());
		if(organization.getOrganization()!=null){
			model.setOrganica_pai(organization.getOrganization().getId());
		}
		model.setAtivo(organization.getStatus());		
			
		NovaOrganicaView view = new NovaOrganicaView(model);		
		view.aplicacao.setValue(new Application().getListApps());		
		view.organica_pai.setValue(model.getAplicacao() != 0 ? organization.getListOrganizations() : null);		
		view.sectionheader_1_text.setValue(gt("Gestão de Orgânica - Atualizar"));		
		view.btn_gravar.setLink("editar_&p_id=" + idOrganica);	
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	public Response actionEditar_(@RParam(rParamName = "p_id") String idOrganica) throws IOException, IllegalArgumentException, IllegalAccessException{
		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			
			NovaOrganica model = new NovaOrganica();
			Organization organization = new Organization().findOne(Integer.parseInt(idOrganica));		
			model.setCodigo(organization.getCode());
			model.setNome(organization.getName());
			model.setAplicacao(organization.getApplication().getId());
			if(organization.getOrganization()!=null){
				model.setOrganica_pai(organization.getOrganization().getId());
			}
			model.setAtivo(organization.getStatus());	
			
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
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, gt("Orgânica actualizada com sucesso."));
			}else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Erro ao atualizar."));
			return this.redirect("igrp", "nova-organica", "editar", new String[]{"p_id"}, new String[]{organization.getId() + ""});
		}
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, gt("Invalid request ..."));
		return this.redirect("igrp", "nova-organica", "editar", new String[]{"p_id"}, new String[]{idOrganica + ""});
	}
	
	/*----#END-PRESERVED-AREA----*/
	
}