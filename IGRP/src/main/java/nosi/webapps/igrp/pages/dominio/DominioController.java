package nosi.webapps.igrp.pages.dominio;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import static nosi.core.i18n.Translator.gt;
import java.util.LinkedHashMap;
import java.util.List;
import nosi.core.webapp.Core.MimeType;
import nosi.core.config.Config;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.application.ApplicationExport;
import nosi.core.webapp.import_export_v2.exports.domain.DomainExport;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Domain;
import nosi.webapps.igrp.dao.ImportExportDAO;
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
		model.loadFormlist_1(Core.query(null,"SELECT 'Stract ipsum voluptatem sed sit' as description,'Aperiam deserunt aperiam ut voluptatem' as key,'1' as estado,'hidden-4023_78fb' as ordem "));
		model.loadTable_1(Core.query(null,"SELECT 'Officia ipsum sed dolor ut' as dominio,'hidden-fc8f_a031' as id_dom "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.lst_dominio.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
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
		view.lst_dominio.setQuery(domainQuery, gt("-- Selecione/Adicione um domínio --"));
		if(view.lst_dominio.getListOptions()==null){
			LinkedHashMap<Object,Object> mapDom=new LinkedHashMap<>();
			mapDom.put(null,gt("++ Adicione um domínio ++"));
			view.lst_dominio.setValue(mapDom);
		}
		if(Core.isNotNull(model.getLst_dominio())) {
			model.setFormlist_1(DomainHeper.getDomainItemQuery(model.getLst_dominio(),app));
    	}
      
		if(Core.isNotNullOrZero(app)) {
			 view.btn_gravar_domain.addParameter("p_aplicacao",app);
			 view.btn_guardar_item_domain.addParameter("p_aplicacao",app);
		} else
			view.btn_download.setVisible(false);

        view.btn_gravar_domain.setVisible(Core.isNull(model.getLst_dominio()));           
     	view.btn_guardar_item_domain.setVisible(Core.isNotNull(model.getLst_dominio()));
     	//cod pa table de lista de dominio
     	if(Core.isNotNull(model.getAplicacao())) {
     		view.table_1.setVisible(true);
     		model.loadTable_1(Core.query(this.configApp.getBaseConnection(), "SELECT DISTINCT dominio as id_dom, dominio  as dominio FROM tbl_domain WHERE env_fk=:env_fk").addInt("env_fk", model.getAplicacao()));
     	} else {
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
		/* Start-Code-Block (guardar_item_domain)  *//* End-Code-Block  */
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
		/* Start-Code-Block (gravar_domain)  *//* End-Code-Block  */
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
		/* Start-Code-Block (editar)  *//* End-Code-Block  */
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
		/* Start-Code-Block (delete)  *//* End-Code-Block  */
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
	
	public Response actionDownload() throws IOException, IllegalArgumentException, IllegalAccessException{
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
		/* Start-Code-Block (download)  *//* End-Code-Block  */
		/*----#start-code(download)----*/

		final String domain = Core.getParam("p_id_dom");
		final Application app = new Application().findOne(model.getAplicacao());

		final Export export = new Export();
		new DomainExport(app.getId()).export(export, new String[]{domain});
		new ApplicationExport(app).export(export,null);

		final byte[] bytes = export.execute();
		if (bytes != null && bytes.length > 0) {
			final ImportExportDAO importExport = new ImportExportDAO(domain, this.getConfig().getUserName(), DateHelper.getCurrentDataTime(), "Export Domain");
			importExport.insert();
			final String fileName = app.getName() + "-" + domain + "_igrp_v." + Config.VERSION;
			return this.xSend(bytes, fileName + ".jar", MimeType.APPLICATION_JAR, true);
		}
		
		/*----#end-code----*/
		return this.redirect("igrp","Dominio","index", this.queryString());	
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/



	/*----#end-code----*/
}
