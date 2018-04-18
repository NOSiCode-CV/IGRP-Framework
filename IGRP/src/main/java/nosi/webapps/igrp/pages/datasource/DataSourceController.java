
package nosi.webapps.igrp.pages.datasource;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;
/*----#start-code(packages_import)----*/
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.databse.helpers.Query;
import nosi.core.xml.XMLExtractComponent;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.User;
import java.sql.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import java.util.stream.Collectors;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.TaskService;
/*----#end-code----*/


public class DataSourceController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		DataSource model = new DataSource();
		model.load();
		DataSourceView view = new DataSourceView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		
		view.data_source.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.processo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.etapa.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		
		----#gen-example */
		/*----#start-code(index)----*/	
	
		view.tipo.setQuery(Core.query(null,"SELECT 'Task' as ID,'Etapa' as NAME UNION SELECT 'Object' as ID,'Objeto' as NAME UNION SELECT 'Page' as ID,'Pagina' as NAME UNION SELECT 'Query' as ID,'Query' as NAME"),"--- Selecionar Tipo Data Source ---");
		view.processo.setVisible(false);
		view.query.setVisible(false);
		view.servico.setVisible(false);
		view.etapa.setVisible(false);
		view.pagina.setVisible(false);
		view.objecto.setVisible(false);
		model.setId_env(Core.isNotNull(model.getId_env())?model.getId_env():Core.getParam("id_env"));
		if(Core.isNotNull(model.getId_env())) {
			String id = Core.getParam("p_datasorce_app");
			if(Core.isNotNull(id)){
				RepSource rep = new RepSource().findOne(Integer.parseInt(id));
				model.setNome(rep.getName());
				model.setObjecto(rep.getType_name().equalsIgnoreCase("object")?rep.getType_query():"");
				model.setQuery(rep.getType_name().equalsIgnoreCase("query")?rep.getType_query():"");
				model.setTipo(rep.getType_name());
			}
			view.pagina.setLookup("igrp","LookupListPage","index");
			view.pagina.addParam("p_prm_target","_blank");
			view.pagina.addParam("p_id_pagina", "p_id");
			view.pagina.addParam("p_pagina", "descricao");
			view.pagina.addParam("p_aplicacao", "p_id_aplicacao");
			view.data_source.setValue(new Config_env().getListEnv(Integer.parseInt(model.getId_env())));
			
			//habilita botao de acordo com tipo de objeto
			if(Core.isNotNull(model.getTipo())){
				if(model.getTipo().equalsIgnoreCase("object")){
					view.objecto.setVisible(true);
				}else if(model.getTipo().equalsIgnoreCase("page")){
					view.pagina.setVisible(true);
				}else if(model.getTipo().equalsIgnoreCase("query")){
					view.query.setVisible(true);
				}else if(model.getTipo().equalsIgnoreCase("task")){
					view.etapa.setVisible(true);
					view.processo.setVisible(true);
				}
			}
			if(Core.isNotNull(id)){
				view.btn_gravar.setLink("gravar&p_datasorce_app="+id);
			}
			view.btn_fechar.setVisible(false);
		}
		view.processo.setValue(new ProcessDefinitionService().mapToComboBox(Core.isNotNull(model.getId_env())?new Integer(model.getId_env()):0));
		view.nome.setVisible(true);
		if(Core.isNotNull(model.getProcesso())) {
			view.etapa.setValue(new TaskService().mapToComboBox(model.getProcesso()));
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		DataSource model = new DataSource();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL

		 return this.forward("igrp","DataSource","index", this.queryString()); //if submit, loads the values
		}
		
		----#gen-example */
		/*----#start-code(gravar)----*/		
		
  		this.addQueryString("p_id_env",model.getId_env());
		if(Core.isNotNull(model.getId_env())){
			RepSource rep = new RepSource();
			rep.setName(model.getNome());
			rep.setType(model.getTipo());
			rep.setType_name(model.getTipo());
			rep.setType_query(model.getQuery());
			if((model.getTipo().equalsIgnoreCase("object") || model.getTipo().equalsIgnoreCase("query") || model.getTipo().equalsIgnoreCase("page")) && Core.isNull(model.getData_source())) {
				Core.setMessageError("Por favor selecione uma data source");
				return this.forward("igrp","DataSource","index", this.queryString());
			}
			if(Core.isNotNull(model.getData_source()))
				rep.setConfig_env(new Config_env().findOne(Integer.parseInt(model.getData_source())));
			if(model.getTipo().equalsIgnoreCase("object")){
				rep.setType_query(model.getObjecto());
			}
			if(model.getTipo().equalsIgnoreCase("page")){				
				rep.setType_fk(Integer.parseInt(model.getId_pagina()));
			}
			if(model.getTipo().equalsIgnoreCase("object") || model.getTipo().equalsIgnoreCase("query")){
				String query = rep.getType_query();
				query = rep.getType().equalsIgnoreCase("object")?"SELECT * FROM "+query:query;
				if(!Query.validateQuery(rep.getConfig_env(),query)){
					Igrp.getInstance().getFlashMessage().addMessage("error","Query Invalido");
					return this.forward("igrp","DataSource","index&id_env="+model.getId_env());
				}
			}
			if(model.getTipo().equalsIgnoreCase("task")) {
				ProcessDefinitionService p = new ProcessDefinitionService().getProcessDefinition(model.getProcesso());
				rep.setProcessid(p.getKey());
				rep.setTaskid(model.getEtapa());
				rep.setApplication_source(new Application().findOne(Core.toInt(p.getTenantId())));
				List<TaskService> task = p.getTasks(model.getProcesso()).stream().filter(n->n.getTaskDefinitionKey().equalsIgnoreCase(model.getEtapa())).collect(Collectors.toList());
				rep.setFormkey((task!=null && !task.isEmpty())?task.get(0).getFormKey():"");
			}
			Application app = new Application().findOne(Integer.parseInt(model.getId_env()));
			rep.setApplication(app);
			rep.setStatus(1);
			rep.setApplication_source(app);
			Date dt = new Date(System.currentTimeMillis());
			rep.setDt_created(dt);
			rep.setDt_updated(dt);
			User user = new User().findOne(Igrp.getInstance().getUser().getIdentity().getIdentityId());
			rep.setUser_created(user);
			rep.setUser_updated(user);
			String id = Core.getParam("p_datasorce_app");
			if(Core.isNotNull(id)){
				rep.setId(Integer.parseInt(id));
				rep = rep.update();
			}else{
				rep = rep.insert();
			}
			if(rep!=null)
				Core.setMessageSuccess();
		}else{
			Core.setMessageError();
			return this.forward("igrp","DataSource","index", this.queryString());
		}
		/*----#end-code----*/
		return this.redirect("igrp","DataSource","index", this.queryString());	
	}
	
	public Response actionFechar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		/*----#start-code(fechar)----*/		
		
		/*----#end-code----*/
		
		return this.redirect("igrp","datasource","index");	
	}
	
	/*----#start-code(custom_actions)----*/
	
	//Print data source in xml format
	public Response actionGetDataSource() throws IOException{
		String [] p_id = Igrp.getInstance().getRequest().getParameterValues("p_id");
		String p_template_id = Igrp.getInstance().getRequest().getParameter("p_template_id");
		XMLWritter xml = new XMLWritter();
		xml.startElement("rows");
		if(p_id!=null && p_id.length > 0){
			for(String id:p_id){
				xml.addXml(this.loadDataSource((int)Float.parseFloat(id),(p_template_id!=null && !p_template_id.equals(""))?(int)Float.parseFloat(p_template_id):0));
			}
		}
		xml.endElement();
		return this.renderView(xml.toString());
	}

	//Load data source
	private String loadDataSource(int id,int template_id) {
		RepSource rep = new RepSource().findOne(id);
		if(rep!=null){
			Set<Properties> columns = new HashSet<>();
			String title = rep.getName();
			if(rep.getType().equalsIgnoreCase("object") || rep.getType().equalsIgnoreCase("query")){
				String query = rep.getType_query();
				query = rep.getType().equalsIgnoreCase("object")?"SELECT * FROM "+query:query;
				columns = rep.getColumns(rep.getConfig_env(),template_id,query);
				return this.transformToXml(title,columns);
			}else if(rep.getType().equalsIgnoreCase("page")){
				Action ac = new Action().findOne(rep.getType_fk());
				return this.getDSPageOrTask(rep.getType(),ac.getApplication().getDad(), ac.getPage(), "index",ac.getPage_descr());
			}else if(rep.getType().equalsIgnoreCase("task")) {
				return this.getDSPageOrTask(rep.getType(),rep.getApplication_source().getDad(), rep.getFormkey(), "index","Task: "+rep.getTaskid());
			}
		}
		return null;
	}
	
	public String getDSPageOrTask(String type,String app,String page,String action,String title) {
		XMLExtractComponent comp = new XMLExtractComponent();
		XMLWritter xml = new XMLWritter();
		xml.startElement("content");
		xml.setElement("title", title);
		String content = this.call(app,page,action).getContent();
		content = comp.extractXML(content);
		if(type.equalsIgnoreCase("task")) {
			xml.addXml(this.getFormProcessId());
		}
		xml.addXml(content);
		xml.endElement();
		return xml.toString();
	}
	
	public String getFormProcessId() {
		IGRPForm formProcess = new IGRPForm("form_process_definition");
		Field p_prm_definitionid = new TextField(null, "p_prm_definitionid");
		p_prm_definitionid.setValue(Core.getParam("report_p_prm_definitionid"));
		formProcess.addField(p_prm_definitionid);
		return formProcess.toString();
	}

	//Transform columns to xml
	private String transformToXml(String title,Set<Properties> columns) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("content");
			xml.setElement("title", title);
			IGRPForm form = new IGRPForm("form");
			IGRPTable table = new IGRPTable("table");
			Iterator<Properties> listColumns = columns.iterator();
			while(listColumns.hasNext()){
				Properties p = listColumns.next();
				Field f = new TextField(null,p.getProperty("tag"));
				f.propertie().add("name",p.getProperty("tag"));
				f.propertie().add("key",p.getProperty("key"));
				form.addField(f);
				table.addField(f);
			}
			xml.addXml(form.toString());
			xml.addXml(table.toString());
		xml.endElement();
		return xml.toString();
	}
	
	/*----#end-code----*/
	}
