package nosi.webapps.igrp.pages.pesquisarperfil;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

import nosi.webapps.igrp.dao.ProfileType;
/*----#end-code----*/
		
public class PesquisarPerfilController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		model.setHelp("igrp","Dominio","index");
		PesquisarPerfilView view = new PesquisarPerfilView();
		view.id.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Labore rem dolor doloremque adipiscing' as organica,'Labore unde natus deserunt omn' as perfil_pai,'1' as estado,'Mollit aperiam sit elit amet' as descricao,'Sed consectetur laudantium magna deserunt' as codigo,'hidden-5f2e_4b2b' as id "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/
		model.setHelp(this.getConfig().getResolveUrl("tutorial","Listar_documentos","index&p_type=perfil"));
		ArrayList<PesquisarPerfil.Table_1> lista = new ArrayList<>();
		ProfileType profileDb = new ProfileType();			
		int idOrg = model.getId_org();//.getParamInt("id_org",false);
		int idApp = model.getId_app(); // Core.getParamInt("id_app",false);
		String dad = Core.getCurrentDad();
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			 idApp = Core.findApplicationByDad(dad).getId();
		}
		//Preenchendo a tabela
		if(idApp!=0 && idOrg!=0)
			for(ProfileType p:profileDb.find()
				.andWhere("application", "=",idApp)
				.andWhere("organization", "=",idOrg).orderByAsc("id").all()){
				PesquisarPerfil.Table_1 table1 = new PesquisarPerfil.Table_1();
				
				table1.setCodigo(p.getCode());
				table1.setDescricao(p.getDescr());
				table1.setEstado(p.getStatus());
	          	table1.setEstado_check(1);
				if(p.getOrganization()!=null){
					table1.setOrganica(p.getOrganization().getName());
				}
				table1.setId(""+p.getId());
				
				table1.setPerfil_pai("-");
				if (Core.isNotNull(p.getProfiletype())) {
					table1.setPerfil_pai(p.getProfiletype().getDescr());
				}
			
				lista.add(table1);
			}
	     
		view.table_1.addData(lista);
        view.btn_eliminar.setVisible(false);
       view.btn_novo.addParameter("p_aplicacao", idApp)
       				.addParameter("p_organica", idOrg);
   	view.btn_associar_etapa.setVisible(new ProcessDefinitionIGRP().hasBPMN(Core.findApplicationById(idApp).getDad()));
    
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionNovo() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","NovoPerfil","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (novo)  *//* End-Code-Block  */
		/*----#start-code(novo)----*/
      
      //NOT IN USE. setlink() in actionIndex set because getParam dosent work for a variable and param of other page
      this.addQueryString("p_aplicacao",Core.getParam("p_aplicacao"));
      this.addQueryString("p_organica",Core.getParam("p_organica"));
		/*----#end-code----*/
		return this.redirect("igrp","NovoPerfil","index", this.queryString());	
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","NovoPerfil","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (editar)  *//* End-Code-Block  */
		/*----#start-code(editar)----*/
 			
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 this.addQueryString("isEdit","true");
		return this.redirect("igrp","NovoPerfil","editar", this.queryString());

		/*----#end-code----*/
			
	}
	
	public Response actionMenu() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","MenuOrganica","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (menu)  *//* End-Code-Block  */
		/*----#start-code(menu)----*/
     //p_id is a param (iskey=true) that will be send automatically
     this.addQueryString("p_type","perfil");
		int id = Core.getParamInt("p_id");
        if(id!=0){
			ProfileType p = new ProfileType().findOne(id);
		     this.addQueryString("env_fk",p.getApplication().getId());  
        }
      return this.forward("igrp","MenuOrganica","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionTransacao() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","TransacaoOrganica","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (transacao)  *//* End-Code-Block  */
		/*----#start-code(transacao)----*/
		//don't need to add p_id because its declared view.id.setParam(true);
        this.addQueryString("p_type","perfil");        
		return this.forward("igrp", "TransacaoOrganica", "index",this.queryString());		
		/*----#end-code----*/
			
	}
	
	public Response actionAssociar_etapa() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","PesquisarPerfil","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (associar_etapa)  *//* End-Code-Block  */
		/*----#start-code(associar_etapa)----*/
		
		this.loadQueryString().addQueryString("type", "prof");
      	return this.redirect("igrp","Etapaaccess","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionConvidar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","NovoUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (convidar)  *//* End-Code-Block  */
		/*----#start-code(convidar)----*/
	 return this.forward("igrp","NovoUtilizador","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","PesquisarPerfil","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (eliminar)  *//* End-Code-Block  */
		/*----#start-code(eliminar)----*/
		int id = Core.getParamInt("p_id");
        if(id!=0){
			ProfileType p = new ProfileType().findOne(id);
            if(p!=null && p.delete(id)){
              Core.setMessageSuccess();
              return this.forward("igrp","PesquisarPerfil","index");
            }
        }
		//return this.redirectError();
		/*----#end-code----*/
		return this.redirect("igrp","PesquisarPerfil","index", this.queryString());	
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
}
