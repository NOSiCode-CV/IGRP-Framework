package nosi.webapps.igrp.pages.dominio;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.ConfigDBIGRP;
import java.util.LinkedHashMap;
import java.util.List;
import nosi.webapps.igrp.dao.Domain;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;

/*----#end-code----*/
		
public class DominioController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dominio model = new Dominio();
		model.load();
		DominioView view = new DominioView();
		view.id_dom.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadFormlist_1(Core.query(null,"SELECT 'Officia natus sit sit ipsum' as description,'Officia magna accusantium consectetur omnis' as key,'1' as estado,'hidden-6e0f_93ab' as ordem "));
		model.loadTable_1(Core.query(null,"SELECT 'Anim voluptatem perspiciatis m' as dominio,'hidden-9145_3054' as id_dom "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.lst_dominio.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/			
		model.setDocumento(this.getConfig().getResolveUrl("tutorial","Listar_documentos","index&p_type=dominio"));
        view.aplicacao.setValue(DomainHeper.getApplications());
		
		
		String dad = Core.getCurrentDad();		
  		 if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {	
           	model.setApp(Core.findApplicationByDad(dad).getId());
  			model.setAplicacao(model.getApp());
  	        view.aplicacao.propertie().add("disabled","true");			
  		}
  		Integer app=model.getAplicacao();
//  		Mudar para value para mostrar escolhido logo
     	 final BaseQueryInterface domainQuery = DomainHeper.getDomainQuery(app);
		
     	
		if(domainQuery.getSingleResult()==null) {
			LinkedHashMap<Object,Object> mapDom=new LinkedHashMap<>();
	     	mapDom.put(null,gt("++ Adicione um domínio ++"));
			view.lst_dominio.setValue(mapDom);
		}else
			view.lst_dominio.setQuery(domainQuery, gt("-- Selecione ou adicione um domínio ++"));	

		if(Core.isNotNull(model.getLst_dominio())) {  
			model.setFormlist_1(DomainHeper.getDomainItemQuery(model.getLst_dominio(),app));
    	}
      
		if(Core.isNotNullOrZero(app)) {
			 view.btn_gravar_domain.addParameter("p_aplicacao",app);
			 view.btn_guardar_item_domain.addParameter("p_aplicacao",app);
		}
        view.btn_gravar_domain.setVisible(Core.isNull(model.getLst_dominio()));           
     	view.btn_guardar_item_domain.setVisible(Core.isNotNull(model.getLst_dominio()));
     // view.formlist_1.setVisible(Core.isNotNull(model.getLst_dominio()));
     		 
     	
     	
     	
     	
     	//cod pa table de lista de dominio
     	if(Core.isNotNull(model.getAplicacao())) {
     		view.table_1.setVisible(true);
     		
     		model.loadTable_1(Core.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,"SELECT DISTINCT dominio as id_dom, dominio  as dominio FROM tbl_domain WHERE env_fk=:env_fk").addInt("env_fk", model.getAplicacao()));
     		
     		/*
     		List<Domain> list_domain = new Domain().find().andWhere("application","=",model.getAplicacao()).all();
     		List<Dominio.Table_1> tabe = new ArrayList<>();
     		
     		for(Domain d : list_domain) {
     			Dominio.Table_1 row = new Dominio.Table_1();
     			row.setDominio(d.getDominio());
     			tabe.add(row);
     		}
     		model.setTable_1(tabe);*/
     	}else {
     		view.table_1.setVisible(false);
     	}
     	
     	
     	
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGuardar_item_domain() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dominio model = new Dominio();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_dom",Core.getParam("p_id_dom"));
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(guardar_item_domain)----*/
		
		if(DomainHeper.saveItemDomain(model)) {
			Core.setMessageSuccess();
			this.addQueryString("p_aplicacao", model.getAplicacao());
			this.addQueryString("p_lst_dominio", model.getLst_dominio());
          	this.addQueryString("target", Core.getParam("target"));
			return this.redirect("igrp","Dominio","index", this.queryString());
		}else {
			Core.setMessageError();
			return this.forward("igrp","Dominio","index", this.queryString());
		}
		/*----#end-code----*/
			
	}
	
	public Response actionGravar_domain() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dominio model = new Dominio();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_dom",Core.getParam("p_id_dom"));
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gravar_domain)----*/
		
		if(DomainHeper.saveDomain(model)) {
			Core.setMessageSuccess();
			this.addQueryString("p_aplicacao", model.getAplicacao());
		//this.addQueryString("p_lst_dominio", model.getNovo_dominio());
          this.addQueryString("target", Core.getParam("target"));
			return this.redirect("igrp","Dominio","index", this.queryString());
		}else {
			Core.setMessageError();
			return this.forward("igrp","Dominio","index", this.queryString());
		}
		/*----#end-code----*/
			
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dominio model = new Dominio();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_dom",Core.getParam("p_id_dom"));
		  return this.forward("igrp","NovoDominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(editar)----*/
		
		this.addQueryString("p_id_dom",Core.getParam("p_id_dom"));
		/*----#end-code----*/
		return this.redirect("igrp","NovoDominio","index", this.queryString());	
	}
	
	public Response actionDelete() throws IOException, IllegalArgumentException, IllegalAccessException{
		Dominio model = new Dominio();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id_dom",Core.getParam("p_id_dom"));
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(delete)----*/
		
		
		boolean dom = false;
		List<Domain> list_domain = new Domain().find().andWhere("dominio","=",Core.getParam("p_id_dom")).all();
 		for(Domain d : list_domain) {
			d.delete();
			if(!d.hasError()) {
				dom = true;
			}
 		}

		if(dom) {
			Core.setMessageSuccess();
		}else {
			Core.setMessageError();
		}
		
		
		
		
		
		/*----#end-code----*/
		return this.redirect("igrp","Dominio","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/



	/*----#end-code----*/
}
