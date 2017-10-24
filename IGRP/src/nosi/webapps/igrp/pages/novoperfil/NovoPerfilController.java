/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novoperfil;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.GroupService;

import java.io.IOException;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;

/*---- End ----*/
public class NovoPerfilController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoPerfil model = new NovoPerfil();		
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){			
			model.load();			
			ProfileType pt = new ProfileType();		
			pt.setCode(model.getCodigo());
			pt.setDescr(model.getDescricao());
			pt.setOrganization(new Organization().findOne(model.getOrganica()));
			if(model.getPerfil()!=0){
				pt.setProfiletype(new ProfileType().findOne(model.getPerfil()));
			}
			pt.setStatus(model.getActivo());
			pt.setApplication(new Application().findOne(model.getAplicacao()));	
			pt = pt.insert();
			if(pt!=null){

				//Cria grupo e utilizadores no Activiti
				GroupService group = new GroupService();
				group.setId(pt.getOrganization().getCode()+"."+pt.getCode());
				group.setName(pt.getOrganization().getName()+" - "+pt.getDescr());
				group.setType("assignment");
				group.create(group);
				Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
				return this.redirect("igrp", "novo-perfil", "index");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");				
			}
			
		}
		NovoPerfilView view = new NovoPerfilView(model);	
		view.aplicacao.setValue(new Application().getListApps());
		view.perfil.setValue(new ProfileType().getListProfiles());
		view.organica.setValue(new Organization().getListOrganizations());
		return this.renderView(view);
	}
	
	public Response actionEditar(@RParam(rParamName="p_id")String id) throws IOException, IllegalArgumentException, IllegalAccessException{
		
		NovoPerfil model = new NovoPerfil();
		ProfileType p = new ProfileType();
		p=p.findOne(Integer.parseInt(id));		
		model.setCodigo(p.getCode());
		model.setDescricao(p.getDescr());
		model.setAplicacao(p.getApplication().getId());
		if(p.getOrganization()!=null){
			model.setOrganica(p.getOrganization().getId());
		}
		model.setActivo(p.getStatus());
		if(p.getProfiletype()!=null){
			model.setPerfil(p.getProfiletype().getId());
		}
		if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
			model.load();			
			p.setCode(model.getCodigo());
			p.setDescr(model.getDescricao());
			p.setOrganization(new Organization().findOne(model.getOrganica()));
			if(model.getPerfil()!=0){
				p.setProfiletype(new ProfileType().findOne(model.getPerfil()));
			}
			p.setStatus(model.getActivo());
			p.setApplication(new Application().findOne(model.getAplicacao()));	
			p = p.update();
			if(p!=null){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Perfil atualizado com sucesso.");
				return this.redirect("igrp", "novo-perfil", "editar", new String[]{"p_id"}, new String[]{p.getId() + ""});
			}
			else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Erro ao atualizar o perfil.");
			
		}		
		NovoPerfilView view = new NovoPerfilView(model);		
		view.sectionheader_1_text.setValue("Gestão de Perfil - Atualizar");		
		view.btn_gravar.setLink("editar&p_id="+id);		
		view.aplicacao.setValue(new Application().getListApps());
		view.perfil.setValue(new ProfileType().getListProfiles());
		view.organica.setValue(new Organization().getListOrganizations());
		return this.renderView(view);
	}
	
}
