package nosi.webapps.igrp.pages.pesquisarutilizador;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.json.JSONObject;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;

/*----#end-code----*/
		
public class PesquisarUtilizadorController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		model.load();
		PesquisarUtilizadorView view = new PesquisarUtilizadorView();
		view.nome.setParam(true);
		view.tb_email.setParam(true);
		view.id.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as ativo,'Doloremque officia natus anim dolor totam perspici' as nominho,'9' as range_1,'Lorem iste totam deserunt aliqua elit stract ipsum laudantium stract anim sed laudantium ut anim acc' as nome,'Sed consectetur unde voluptatem accusantium labore unde magna natus unde aperiam ut sit iste consect' as tb_email,'Stract amet officia sit dolor anim unde rem adipis' as perfile,'hidden-6aaf_9cca' as id "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.organica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.perfil.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/
		//model.setDocumento(this.getConfig().getResolveUrl("tutorial","Listar_documentos","index&p_type=utilizador"));
		
		
		
		
      if(!Core.getCurrentUser().getUser_name().equalsIgnoreCase("igrpweb@nosi.cv"))
			view.btn_editar.setVisible(false);
      
   		ArrayList<PesquisarUtilizador.Table_1> lista = new ArrayList<>();

      	int idApp = Core.toInt(model.getAplicacao());
		int idOrg = Core.toInt(model.getOrganica());
		int idProf = Core.toInt(model.getPerfil());

		Profile prof = new Profile();
		List<Profile> profiles = null;
		String dad = Core.getCurrentDad();
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			idApp = (new Application().find().andWhere("dad", "=", dad).one()).getId();		
          model.setAplicacao(""+idApp);
          view.aplicacao.propertie().add("disabled","true");
          Core.setAttribute("p_aplicacao",idApp);
		}
		ProfileType pp = Core.findProfileById(Core.getCurrentProfile());
		if (pp != null && pp.getCode().equalsIgnoreCase("ADMIN")) {
			profiles = prof.find().andWhere("type", "=", "PROF").andWhere("user.user_name", "=", model.getUsername())
					.andWhere("organization", "=", idOrg != 0 ? idOrg : null)
					.andWhere("profileType", "=", idProf != 0 ? idProf : null)
					.andWhere("profileType.application", "=", idApp != 0 ? idApp : null)
					.andWhere("user.email", "=", model.getEmail())
					.all();
		} else {
			Application app = Core.getCurrentApp();
			profiles = prof.find().andWhere("type", "=", "PROF").andWhere("user.user_name", "=", model.getUsername())
					.andWhere("organization", "=", idOrg != 0 ? idOrg : null)
					.andWhere("profileType", "=", idProf != 0 ? idProf : null)
					.andWhere("profileType.application", "=", idApp != 0 ? idApp : app.getId())
					.andWhere("user.email", "=", model.getEmail()).all();
		}
		// Preenchendo a tabela
		for (Profile p : profiles) {
			PesquisarUtilizador.Table_1 table1 = new PesquisarUtilizador.Table_1();
			
			int status = p.getUser()!=null?p.getUser().getStatus():0;
			
//			Checkbox has the id of the user if exists,otherwise will have the vallue 1 to be diferent from 0 (unchecked)
			table1.setAtivo(p.getUser()!=null?p.getUser().getIdentityId():1);
			if(status == 0) {
				table1.setAtivo_check(0);
			}else {				
				table1.setAtivo_check(table1.getAtivo());
			}
			
			table1.setTb_email(p.getUser().getEmail());
			table1.setNome(p.getUser().getUser_name());
			table1.setNominho(p.getUser().getName());
			table1.setPerfile(p.getProfileType().getApplication().getName() + "/"
					+ p.getProfileType().getOrganization().getName() + "/" + p.getProfileType().getDescr());
			table1.setId("" + p.getId());
			
			lista.add(table1);
		}	

		switch (this.getConfig().getAutenticationType()) {
		case "ldap":
			view.btn_adicionar_utilizador.setLink("igrp", "LdapUser", "index");
			break;
		case "db":
		default:
			view.btn_adicionar_utilizador.setLink("igrp", "PesquisarUtilizador", "adicionar_utilizador");
		}
		Properties settings = this.configApp.loadConfig("common", "main.xml");
		String aux = settings.getProperty("igrp.authentication.govcv.enbaled");		
		if ((aux != null && !aux.isEmpty() && aux.equals("true"))) {
			view.btn_adicionar_utilizador.setVisible(false);	
		}

		final Map<Object, Object> listApps = new Application().getListApps();
		listApps.put(Core.findApplicationByDad("igrp_studio").getId(), "IGRP Studio");
		view.aplicacao.setValue(listApps);
		view.organica.setValue(new Organization().getListOrganizations(idApp));
		view.perfil.setValue(new ProfileType().getListProfiles(idApp, idOrg));
		
		view.nome.setLabel("Username");
		view.nominho.setLabel("Nome");		
		
		view.table_1.addData(lista);

		view.btn_assiocar_etapa.setVisible(false);
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionConvidar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","NovoUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (convidar)  *//* End-Code-Block  */
		/*----#start-code(convidar)----*/
   
      // this.addQueryString("p_aplicacao",  model.getAplicacao());
        // this.addQueryString("p_organica",  model.getOrganica());
         //this.addQueryString("p_perfil",  model.getPerfil());
		if (Core.isNotNull(model.getEmail())) {
			User u = Core.findUserByEmail(model.getEmail());
			if (Core.isNotNull(u)) {
               	this.addQueryString("id", u.getId());
				return this.redirect("igrp", "NovoUtilizador", "index", this.queryString());
			}
		}     	
    
      
		/*----#end-code----*/
		return this.redirect("igrp","NovoUtilizador","index", this.queryString());	
	}
	
	public Response actionAdicionar_utilizador() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","RegistarUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (adicionar_utilizador)  *//* End-Code-Block  */
		/*----#start-code(adicionar_utilizador)----*/

		/*----#end-code----*/
		return this.redirect("igrp","RegistarUtilizador","index", this.queryString());	
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","PesquisarUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (pesquisar)  *//* End-Code-Block  */
		/*----#start-code(pesquisar)----*/
	
			
			return this.forward("igrp", "PesquisarUtilizador", "index");
	
	
		/*----#end-code----*/
			
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","RegistarUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (editar)  *//* End-Code-Block  */
		/*----#start-code(editar)----*/
		 
      if (Core.isNotNull(Core.getParam("p_tb_email"))) {
			User u = Core.findUserByEmail(Core.getParam("p_tb_email"));
			if (Core.isNotNull(u)) {
              this.addQueryString("p_id", u.getId());
				return this.redirect("igrp", "RegistarUtilizador", "editar", this.queryString());
			}
		}     	
      
		/*----#end-code----*/
		return this.redirect("igrp","RegistarUtilizador","index", this.queryString());	
	}
	
	public Response actionAssiocar_menu() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (assiocar_menu)  *//* End-Code-Block  */
		/*----#start-code(assiocar_menu)----*/
		int id=Core.getParamInt("p_id");
		this.addQueryString("p_id",id)
			.addQueryString("userEmail", Core.getParam("p_tb_email"))
			.addQueryString("p_type", "user")
			.addQueryString("env_fk",new Profile().findOne(id).getOrganization().getApplication().getId());  ;
	   	return this.redirect("igrp","MenuOrganica","index", this.queryString());
		
		/*----#end-code----*/
			
	}
	
	public Response actionAssiocar_transacao() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (assiocar_transacao)  *//* End-Code-Block  */
		/*----#start-code(assiocar_transacao)----*/
		this.addQueryString("p_id",Core.getParamInt("p_id"))
			.addQueryString("userEmail", Core.getParam("p_tb_email"))
			.addQueryString("p_type", "user");		
      	return this.redirect("igrp","TransacaoOrganica","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionAssiocar_etapa() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (assiocar_etapa)  *//* End-Code-Block  */
		/*----#start-code(assiocar_etapa)----*/
		Profile p = new Profile().findOne(Core.getParamInt("p_id"));
      	if(p!=null)
	          this.addQueryString("p_id",p.getProfileType().getId());
		this.addQueryString("type", "user").addQueryString("userEmail",Core.getParam("p_tb_email"));
      	return this.redirect("igrp","Etapaaccess","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionConvidar_user() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","NovoUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (convidar_user)  *//* End-Code-Block  */
		/*----#start-code(convidar_user)----*/
		Integer id = Core.getParamInt("p_id");		
		Profile p = new Profile().findOne(id);
	 	if(p!=null)
	          this.addQueryString("p_id",p.getProfileType().getId());
  		User u = Core.findUserByEmail(Core.getParam("tb_email"));
			if (u != null) 
			  this.addQueryString("id",u.getId());
   
		return this.forward("igrp","NovoUtilizador","index", this.queryString()); 
		/*----#end-code----*/
			
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarUtilizador model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","PesquisarUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (eliminar)  *//* End-Code-Block  */
		/*----#start-code(eliminar)----*/
		String id = Core.getParam("p_id");
		if (id != null) {
			Profile p = new Profile().findOne(id);
			this.addQueryString("p_aplicacao",model.getAplicacao());
			Profile delEnv = new Profile().find()
					.andWhere("type", "=", "ENV")
					.andWhere("type_fk", "=", p.getOrganization().getApplication().getId())
					.andWhere("organization.id", "=", p.getOrganization().getId())
					.andWhere("profileType.id", "=", p.getProfileType().getId())
					.andWhere("user.id", "=", p.getUser().getId())
					.one(); 								
			if(delEnv!= null)
				delEnv.delete();
			p.setType("INATIVE_" + p.getType());
			p = p.update();
			if (!p.hasError()) {
				Core.setMessageSuccess();	
				return this.redirect("igrp", "PesquisarUtilizador", "index", this.queryString());
			}
		}      
		Core.setMessageError();     
		return this.redirect("igrp", "PesquisarUtilizador", "index", this.queryString());
		/*----#end-code----*/
			
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/

/*
    public Response actionChangeStatus(){
      this.format = Response.FORMAT_JSON;
      String id = Core.getParam("p_id");
      String status = Core.getParam("p_ativo_check");
      
      boolean response = false;
      try {
    	  
          if(Core.isNotNull(id)) {
        	  
        	  Profile p = new Profile().findOne(Core.toInt(id));
             // System.out.println(p.getUser().getId()+" status");
              if(p != null) {
            	  p.getUser().getStatus()
                  p.setStatus(status.equals("true")?1:0);
                  p = p.update();
                 
                  if(!p.hasError())
                      response = true;
              }
          }
      }catch(Exception e) {

      }

      JSONObject json = new JSONObject();
      json.put("status", response);     

      return this.renderView(json.toString());
    }	
    
    
    */
    
    public Response actionChangeStatus(){
    	      this.format = Response.FORMAT_JSON;
    	      Integer id = Core.getParamInt("p_ativo");
    	      String status = Core.getParam("p_ativo_check");
    	      boolean response = false;
    	      try {
    	          if(id != null) {
    	              User u =Core.findUserById(id);
    	              if(u != null) {
    	                  u.setStatus(status.equals("true")?1:0);
    	                  u = u.update();
    	                  if(!u.hasError())
    	                      response = true;
    	              }
    	          }
    	      }catch(Exception e) {
    
    	      }
    	
    	      JSONObject json = new JSONObject();
    	      json.put("status", response);     
    	
    	      return this.renderView(json.toString());
    	    }	
    
    
    
	/*----#end-code----*/
}
