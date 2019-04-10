package nosi.webapps.igrp.pages.novoperfil;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.Igrp;
import nosi.core.webapp.activit.rest.GroupService;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
/*----#end-code----*/
		
public class NovoPerfilController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoPerfil model = new NovoPerfil();
		model.load();
		NovoPerfilView view = new NovoPerfilView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.organica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.perfil_pai.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.primeira_pagina.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/

		model.setActivo(1);
		view.aplicacao.setValue(new Application().getListApps());
		view.organica.setValue(Core.isNotNullOrZero(model.getAplicacao())
				? new Organization().getListOrganizations(model.getAplicacao())
				: null);
		// Perfil pai/Parent profile ocult (not in use)
		view.perfil_pai.setVisible(false);
		view.btn_gravar.setTitle("Adicionar");
		view.btn_gravar.addParameter("p_aplicacao",model.getAplicacao());
		
		if(Core.isNotNullOrZero(model.getAplicacao()))
			view.primeira_pagina.setValue(new Action().getListActions(model.getAplicacao()));

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovoPerfil model = new NovoPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","NovoPerfil","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar)----*/
	   		ProfileType pt = new ProfileType();  
	   		pt.setCode(model.getCodigo()+"."+Core.findApplicationById(model.getAplicacao()).getDad());			
			pt.setDescr(model.getNome());
			pt.setOrganization(new Organization().findOne(model.getOrganica()));
			/*
			 * if(model.getPerfil_pai()!=0){ pt.setProfiletype(new
			 * ProfileType().findOne(model.getPerfil())); }
			 */
			pt.setStatus(model.getActivo());
			pt.setApplication(new Application().findOne(model.getAplicacao()));
			pt.setFirstPage(new Action().findOne(model.getPrimeira_pagina()));
			pt = pt.insert();
			if (pt != null) {
				/*
				// Cria grupo e utilizadores no Activiti
				GroupService group = new GroupService();
				group.setId(pt.getOrganization().getCode() + "." + pt.getCode());
				group.setName(pt.getOrganization().getName() + " - " + pt.getDescr());
				group.setType("assignment");
				group.create(group);		
				*/
              if(insertProfile(pt) != null){    
  				Core.setMessageSuccess("Perfil criado com sucesso");	         
                this.addQueryString("p_nome","");
                this.addQueryString("p_codigo","");                          
                } else{
                  Core.setMessageError();
                }			
				
			} else {
				Core.setMessageError();
			}	
	
	
		return this.forward("igrp", "NovoPerfil", "index",this.queryString());
		/*----#end-code----*/
			
	}
	
/*----#start-code(custom_actions)----*/
	
	private Profile insertProfile(ProfileType pt) throws IOException {
		Profile prof = new Profile();
		prof.setUser(Core.getCurrentUser());
		prof.setType("PROF");
		prof.setType_fk(pt.getId());
		// ProfileType p = new ProfileType().findOne(Integer.parseInt(id));
		prof.setOrganization(pt.getOrganization());
		prof.setProfileType(pt);
		prof = prof.insert();
		return prof;
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException {
     String idProf=Core.getParam("p_id");
		NovoPerfil model = new NovoPerfil();
		model.load();
      	NovoPerfilView view = new NovoPerfilView();
		ProfileType p = new ProfileType().findOne(Integer.parseInt(idProf));
		model.setCodigo(p.getCode());
		model.setNome(p.getDescr());
		model.setAplicacao(p.getApplication().getId());
		if (p.getOrganization() != null) {
			model.setOrganica(p.getOrganization().getId());
		}
		model.setActivo(p.getStatus());
		if (p.getProfiletype() != null) {
			// model.setPerfil_pai(p.getProfiletype().getId());
		}
		if(p.getFirstPage() != null)
			model.setPrimeira_pagina(p.getFirstPage().getId());
		view.sectionheader_1_text.setValue("Gestão de Perfil - Atualizar");
		view.btn_gravar.setTitle("Gravar");      
		view.btn_gravar.setLink("GravarEdicao&p_id="+idProf);
		view.aplicacao.setValue(new Application().getListApps());
		
		if(Core.isNotNullOrZero(model.getAplicacao()))
			view.primeira_pagina.setValue(new Action().getListActions(model.getAplicacao()));
		/*
		 * view.perfil.setValue( model.getAplicacao() != 0 && model.getOrganica() != 0 ?
		 * new ProfileType().getListProfiles(model.getAplicacao(), model.getOrganica())
		 * : null);
		 */
		view.perfil_pai.setVisible(false);
		view.organica.setValue(Core.isNotNullOrZero(model.getAplicacao())
				? new Organization().getListOrganizations(model.getAplicacao())
				: null);
		view.setModel(model);
		return this.renderView(view);
	}

	public Response actionGravarEdicao() throws IllegalArgumentException, IllegalAccessException, IOException {
		String idProf=Core.getParam("p_id");
      if (Igrp.getInstance().getRequest().getMethod().equals("POST")) {
			NovoPerfil model = new NovoPerfil();
           	model.load();
			ProfileType p = new ProfileType().findOne(Integer.parseInt(idProf));  
			GroupService group = new GroupService();  
			group.delete(p.getOrganization().getCode() + "." + p.getCode());
			p.setCode(model.getCodigo());
			p.setDescr(model.getNome());
			p.setOrganization(new Organization().findOne(model.getOrganica()));
			/*
			 * if(model.getPerfil_pai()!=0){ p.setProfiletype(new
			 * ProfileType().findOne(model.getPerfil())); }
			 */
			p.setStatus(model.getActivo());
			p.setApplication(new Application().findOne(model.getAplicacao()));
			p.setFirstPage(new Action().findOne(model.getPrimeira_pagina()));
			p = p.update();
			if (p != null) {
				group.setId(p.getOrganization().getCode() + "." + p.getCode());
				group.setName(p.getOrganization().getName() + " - " + p.getDescr());
				group.setType("assignment");
				group.create(group);		
				Core.setMessageSuccess("Perfil atualizado com sucesso.");              
			} else
				Core.setMessageError("Erro ao atualizar o perfil.");
          //this.addQueryString("p_id",id); 
		 return this.forward("igrp", "NovoPerfil", "editar");
		}

		Core.setMessageError("Invalid operation ...");
        return this.forward("igrp", "NovoPerfil", "editar");
	
	}

	/*----#end-code----*/
}
