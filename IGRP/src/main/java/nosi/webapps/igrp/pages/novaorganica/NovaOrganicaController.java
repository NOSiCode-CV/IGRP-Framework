package nosi.webapps.igrp.pages.novaorganica;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.User;
import static nosi.core.i18n.Translator.gt;
/*----#end-code----*/
		
public class NovaOrganicaController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovaOrganica model = new NovaOrganica();
		model.load();
		NovaOrganicaView view = new NovaOrganicaView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.organizacao_pai.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
      String dad = Core.getCurrentDad();
      if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			model.setAplicacao("" + (Core.findApplicationByDad(dad)).getId());
          view.aplicacao.propertie().add("disabled","true");
			//setTable(model, data);
		}
	
		//model.setAplicacao(Core.getParam("id_app"));
		model.setAtivo(1);	
		// Organization organization = new Organization();
		view.aplicacao.setValue(new Application().getListApps());
		view.organizacao_pai.setVisible(false);
		// view.organica_pai.setValue(model.getAplicacao() != 0 ?
		// organization.getListOrganizations(model.getAplicacao()) : null);
	
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		NovaOrganica model = new NovaOrganica();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","NovaOrganica","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar)----*/
		if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			
			Organization organization = new Organization();	
			 String dad = Core.getCurrentDad();
		      if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
					model.setAplicacao("" + (Core.findApplicationByDad(dad)).getId());		  
				}
			organization.setCode(model.getCodigo()+"."+Core.findApplicationById(Core.toInt(model.getAplicacao())).getDad());
			organization.setApplication(new Application().findOne(model.getAplicacao()));
			/*
			 * if(model.getOrganica_pai()!=0){ organization.setOrganization(new
			 * Organization().findOne(model.getOrganica_pai())); }
			 */
			User u =  Core.getCurrentUser();              
             
			organization.setUser(u);
			organization.setStatus(model.getAtivo());
			organization.setName(model.getNome());
			organization = organization.insert();
			if (organization != null && !organization.hasError()) {
				Core.setMessageSuccess(gt("Orgânica registada com sucesso"));
				// Core.setMessageInfoLink(gt("Atribuir menu para Orgânica: " +
				// organization.getName()), "igrp",
				// "MenuOrganica", "index&target=_blank&id=" + organization.getId() +
				// "&type=org");
			} else
				Core.setMessageError("Ocorreu um erro.");
			return this.forward("igrp", "NovaOrganica", "index");
		}
		Core.setMessageError("Invalid request ...");

		/*----#end-code----*/
		return this.redirect("igrp","NovaOrganica","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	public Response actionEditar(@RParam(rParamName = "p_id") String idOrganica)
			throws IOException, IllegalArgumentException, IllegalAccessException {
		NovaOrganica model = new NovaOrganica();
		NovaOrganicaView view = new NovaOrganicaView();
        model.load();
     
		Organization organization =  Core.findOrganizationById(Integer.parseInt(idOrganica));       
		model.setCodigo(organization.getCode());
		model.setNome(organization.getName());
		model.setAplicacao("" + organization.getApplication().getId());

		/*
		 * if(organization.getOrganization()!=null){
		 * model.setOrganica_pai(organization.getOrganization().getId()); }
		 */
		model.setAtivo(organization.getStatus());
		view.aplicacao.setValue(new Application().getListApps());
		// view.organica_pai.setValue(model.getAplicacao() != 0 ?
		// organization.getListOrganizations() : null);
		view.sectionheader_1_text.setValue(gt("Gestão de Orgânica - Atualizar"));
		view.organizacao_pai.setVisible(false);
		view.btn_gravar.setLink("editar_&p_id=" + idOrganica);
      	view.setModel(model);
		return this.renderView(view);
	}

	public Response actionEditar_(@RParam(rParamName = "p_id") String idOrganica)
			throws IOException, IllegalArgumentException, IllegalAccessException {

		if (Igrp.getInstance().getRequest().getMethod().equals("POST")) {

			NovaOrganica model = new NovaOrganica();
            model.load();
			Organization organization = new Organization().findOne(Integer.parseInt(idOrganica));
			//model.setCodigo(organization.getCode());
			//model.setNome(organization.getName());
			//model.setAplicacao("" + organization.getApplication().getId());
			/*
			 * if(organization.getOrganization()!=null){
			 * model.setOrganica_pai(organization.getOrganization().getId()); }
			 */
			//model.setAtivo(organization.getStatus());
			 
			organization.setCode(model.getCodigo());
			organization.setName(model.getNome());
			organization.setApplication(new Application().findOne(model.getAplicacao()));
			/*
			 * if(model.getOrganica_pai()!=0){ organization.setOrganization(new
			 * Organization().findOne(model.getOrganica_pai())); }
			 */
			organization.setStatus(model.getAtivo());
			organization = organization.update();
			if (organization != null) {
				Core.setMessageSuccess("Organização atualizada com sucesso.");
			} else
				Core.setMessageError("Erro ao atualizar.");
			return this.forward("igrp", "NovaOrganica", "editar");
		}
		Core.setMessageError("Invalid request ...");
		return this.forward("igrp", "NovaOrganica", "editar");
	}

	/*----#end-code----*/
}
