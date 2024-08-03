package nosi.webapps.igrp.pages.datasource;

import nosi.core.webapp.Controller;//
//
//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Properties;
import java.util.Set;
import java.util.stream.Collectors;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.services.ProcessDefinitionServiceRest;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import nosi.core.webapp.datasource.helpers.DataSourceHelpers;
import nosi.core.xml.XMLExtractComponent;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.User;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
/*----#end-code----*/
		
public class DataSourceController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		DataSource model = new DataSource();
		model.load();
		DataSourceView view = new DataSourceView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.tipo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.data_source.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.processo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.etapa.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/	
				
		view.tipo.setValue(this.getDatasourceType());
		view.servico.setVisible(false);
		view.btn_fechar.setVisible(false);
		view.processo.setVisible(false);
		view.query.setVisible(false);
		view.etapa.setVisible(false);
		view.pagina.setVisible(false);
		view.objecto.setVisible(false);
		view.data_source.setVisible(false);

		model.setId_env(Core.isNotNull(model.getId_env()) ? model.getId_env() : Core.getParam("id_env"));
		model.setDatasorce_app(Core.isNotNull(model.getDatasorce_app()) ? model.getDatasorce_app() : Core.getParam("p_datasorce_app"));

		final Integer envId = Core.toInt(model.getId_env());
		final Integer dataSourceId = Core.toInt(model.getDatasorce_app());
		final boolean notHasError = Core.isNull(Core.getParam("p_forward_error"));

		if (Core.isNullOrZero(envId)) {
			Core.setMessageError("Invalid data!");
			view.btn_gravar.setVisible(false);
			return this.renderView(view);
		}
		
		final Application application = Core.findApplicationById(envId);

		
		if (Core.isNotNullOrZero(dataSourceId) && notHasError) {

			final RepSource repSource = new RepSource().findOne(dataSourceId);

			model.setNome(repSource.getName());
			model.setObjecto(this.isTypeObject(repSource.getType_name()) ? repSource.getType_query() : "");
			model.setQuery(this.isTypeQuery(repSource.getType_name()) ? repSource.getType_query() : "");
			model.setEtapa(repSource.getTaskid());

			if (Core.isNull(Core.getParam("ichange"))) {
				model.setProcesso(repSource.getProcessid());
				model.setTipo(repSource.getType_name());
			}

			if (Objects.nonNull(repSource.getConfig_env()))
				model.setData_source(repSource.getConfig_env().getId().toString());

			if (this.isTypePage(repSource.getType_name())) {
				Action ac = getActionReport(repSource);
				

				if (ac != null) {
					model.setPagina(ac.getPage_descr());
					model.setId_pagina(ac.getId());
				} else {
					Core.setMessageError("Page not found!");
				}
			}
		}
		
		// habilita campos de acordo com tipo de datasource
		if (Core.isNotNull(model.getTipo())) {
			
			if (this.isTypeObject(model.getTipo())) {
				view.objecto.setVisible(true);
				view.data_source.setVisible(true);

			} else if (this.isTypeQuery(model.getTipo())) {
				view.query.setVisible(true);
				view.data_source.setVisible(true);

			} else if (this.isTypePage(model.getTipo())) {
				view.pagina.setVisible(true);
				view.pagina.setLookup("igrp", "LookupListPage", "index");
				view.pagina.addParam("p_prm_target", "_blank");
				view.pagina.addParam("p_id_pagina", "id");
				view.pagina.addParam("p_pagina", "descricao");
				view.pagina.addParam("p_env_fk", envId.toString());

			} else if (this.isTypeTask(model.getTipo())) {
				final ProcessDefinitionIGRP processRest = new ProcessDefinitionIGRP();
				view.etapa.setVisible(true);
				view.processo.setVisible(true);
				view.processo.setValue(processRest.mapToComboBoxByKey(application.getDad()));
				
				if (Core.isNotNull(model.getProcesso()))
					view.etapa.setValue(processRest.mapToComboBoxByProcessKey(model.getProcesso(), application.getDad()));
			}
		}	
		
		view.data_source.setValue(this.getDataSourceMap(envId));
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		DataSource model = new DataSource();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","DataSource","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (gravar)  *//* End-Code-Block  */
		/*----#start-code(gravar)----*/		
		
		final Integer dataSourceId = Core.toInt(model.getDatasorce_app());
		final Integer envId = Core.toInt(model.getId_env());
		final boolean hasDataSource = Core.isNotNull(model.getData_source());
		final boolean isTypeObject = this.isTypeObject(model.getTipo());
		final boolean isTypePage =  this.isTypePage(model.getTipo());
		final boolean isTypeQuery =  this.isTypeQuery(model.getTipo());
		final boolean isTypeTask =  this.isTypeTask(model.getTipo());
		final Application application = Core.findApplicationById(envId);
		final User currentUser = Core.getCurrentUser();
		final Date currentDate = Core.getCurrentDateUtil();
		final Config_env configEnv = hasDataSource ? new Config_env().findOne(Core.toInt(model.getData_source())) : null;		
		this.addQueryString("id_env", envId);

		if (isTypeObject || isTypeQuery) {
			if (!hasDataSource) {
				Core.setMessageError("Por favor selecione um  <strong>Data Source</strong>!");
				this.addQueryString("p_forward_error", "true");
				return this.forward("igrp", "DataSource", "index", this.queryString());
			}

			if (isTypeObject && !DatabaseMetadaHelper.tableOrViewExists(configEnv, null, model.getObjecto().trim())) {
				Core.setMessageError("Objecto <strong>" + model.getObjecto().trim() + "</strong> não encontrado na base de dados!");
				this.addQueryString("p_forward_error", "true");
				return this.forward("igrp", "DataSource", "index", this.queryString());
			}

			if (isTypeQuery && !Core.validateQuery(configEnv, model.getQuery().trim())) {
				Core.setMessageError("Query Inválido!");
				this.addQueryString("p_forward_error", "true");
				return this.forward("igrp", "DataSource", "index", this.queryString());
			}
		}

		RepSource repSource = Core.isNullOrZero(dataSourceId) ? new RepSource() : new RepSource().findOne(dataSourceId);

		repSource.setName(model.getNome());
		repSource.setType(model.getTipo());
		repSource.setType_name(model.getTipo());
		repSource.setType_fk(isTypePage ? model.getId_pagina() : null);
		repSource.setApplication(application);
		repSource.setApplication_source(application);
		repSource.setConfig_env(configEnv);
		
		if (isTypeQuery)
			repSource.setType_query(model.getQuery().trim());
		else if (isTypeObject)
			repSource.setType_query(model.getObjecto().trim());
		else if (isTypePage) {
			Action page = new Action().findOne(model.getId_pagina());
			repSource.setType_query(application.getDad()+"::"+page.getPage());
		}else
			repSource.setType_query(null);
			

		if (isTypeTask) {
			final ProcessDefinitionService processDefService = this.getProcessDefinitionService(model.getProcesso(), application.getDad());
			repSource.setProcessid(processDefService.getKey());
			repSource.setApplication_source(Core.findApplicationByDad(processDefService.getTenantId()));
			repSource.setTaskid(model.getEtapa());
			repSource.setFormkey(this.getTaskKey(model, application));
		} else {
			repSource.setProcessid(null);
			repSource.setApplication_source(null);
			repSource.setTaskid(null);
			repSource.setFormkey(null);
		}		
		
		repSource.setUser_updated(currentUser);
		repSource.setDt_updated(currentDate);
		if (Core.isNotNullOrZero(dataSourceId))
			repSource = repSource.update();
		else {
			repSource.setStatus(1);
			repSource.setDt_created(currentDate);
			repSource.setUser_created(currentUser);
			repSource = repSource.insert();
		}
		
		if (Objects.nonNull(repSource)) {
			this.addQueryString("p_datasorce_app", repSource.getId().toString());
			
			if (Core.isNotNullOrZero(dataSourceId))
				Core.setMessageSuccess("DataSource atualizado com sucesso.");
			else
				Core.setMessageSuccess();
			
			return this.forward("igrp", "DataSource", "index", this.queryString());
		}
		
		/*----#end-code----*/
		return this.redirect("igrp","DataSource","index", this.queryString());	
	}
	
	public Response actionFechar() throws IOException, IllegalArgumentException, IllegalAccessException{
		DataSource model = new DataSource();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","datasource","index",this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(fechar)----*/		
		
		/*----#end-code----*/
		
		return this.redirect("igrp","datasource","index", this.queryString());	
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/
	
	//Print data source in xml format
	public Response actionGetDataSource() {
		final String [] ids = Igrp.getInstance().getRequest().getParameterValues("p_id");
		final String templateId = Igrp.getInstance().getRequest().getParameter("p_template_id");
		final XMLWritter xml = new XMLWritter();
		xml.startElement("rows");
		
		if (Objects.nonNull(ids)) {
			for (String id : ids) {
				xml.addXml(this.loadDataSource((int) Float.parseFloat(id),
						(templateId != null && !templateId.isEmpty()) ? (int) Float.parseFloat(templateId) : 0));
			}
		}
		xml.endElement();
		return this.renderView(xml.toString());
	}

	// Load data source
	private String loadDataSource(int id, int templateId) {
		
		final RepSource rep = new RepSource().findOne(id);
		
		if (Objects.nonNull(rep)) {
			if (this.isTypeObject(rep.getType()) || this.isTypeQuery(rep.getType())) {
				final String query = this.isTypeObject(rep.getType()) ? "SELECT * FROM " + rep.getType_query() : rep.getType_query();
				final Set<Properties> columns = new DataSourceHelpers().getColumns(rep, templateId, query);
				return this.transformToXml(rep, columns);
				
			} else if (this.isTypePage(rep.getType())) {
				
				Action ac = getActionReport(rep);
				if(ac==null)
				    return "";
				return this.getDSPageOrTask(rep, ac.getApplication().getDad(), ac.getPage(), "index",ac.getPage_descr(),templateId);
				
			} else if (this.isTypeTask(rep.getType())) {				
				return this.getDSPageOrTask(rep, rep.getApplication_source().getDad(), rep.getFormkey(), "index",
						"Task: " + rep.getTaskid(),templateId);
			}
		}
		return null;
	}

	public Action getActionReport(final RepSource repSource) {
		Action ac = null;
		// First will check if you the app::page is valid
		if (repSource.getType_query() != null) {
			String[] appPage = repSource.getType_query().split("::");
			if (appPage.length >= 2)
				ac = new Action().findByPage(appPage[1], appPage[0]);
		} else if (Core.isNotNull(repSource.getType_fk())) {
			ac = new Action().findOne(repSource.getType_fk());
		}
		if(ac==null)
		    System.out.print("DataSourceController - Action/Page for report is null.");
		return ac;
	}
	
	public String getDSPageOrTask(RepSource rep, String app, String page, String action, String title, int templateId) {
		XMLWritter xml = new XMLWritter();
		Set<String> keys = new DataSourceHelpers().getParamsName(rep, templateId);
		xml.startElement("content");
		xml.writeAttribute("uuid", rep.getSource_identify());
		xml.setElement("title", title);
		xml.setElement("data_source_id", rep.getId());
		this.addQueryString("current_app_conn", app);
		String content = this.call(app, page, action, this.queryString()).getContent();
		Core.removeAttribute("current_app_conn");
		content = XMLExtractComponent.extractXML(content);
		List<Field> list = this.getDefaultFields();
		if (rep.getType().equalsIgnoreCase("task")) {
			list = getDefaultFieldsWithProc();
		}	
		//To check if the field is a param
       for (String keyParam : keys) {
          content = content.replace("<" + keyParam, "<" + keyParam + " key=\"true\"");
       }
		xml.addXml(this.getDefaultForm(list));
		xml.addXml(content);
		xml.endElement();
		return xml.toString();
	}
	
	public List<Field> getDefaultFieldsWithProc() {
		final List<Field> list = this.getDefaultFields();
		final Field definitionId = new TextField(null, "p_prm_definitionid");
		definitionId.setLabel(Core.gt("id processo"));
		definitionId.setValue(Core.getParam("report_p_prm_definitionid"));
		list.add(definitionId);
		return list;
	}
	
	public List<Field> getDefaultFields(){
		User currentUser = Core.getCurrentUser(); 
		Application currentApp = Core.getCurrentApp(); 
		Integer currentOrgId = Core.getCurrentOrganization(); 
		Integer currentProf = Core.getCurrentProfile(); 
		
		List<Field> fields = new ArrayList<>();
		Field dataAtual = new TextField(null, "p_data_atual");
		dataAtual.setLabel(Core.gt("data atual"));
		dataAtual.setValue(Core.getCurrentDate());
		
		Field userAtual = new TextField(null,"p_user_atual");
		userAtual.setLabel(Core.gt("user atual"));
		userAtual.setValue(currentUser != null ? currentUser.getName() : "");
		
		Field emailAtual = new TextField(null,"p_email_atual");
		emailAtual.setLabel(Core.gt("email atual"));
		emailAtual.setValue(currentUser != null ? currentUser.getEmail() : "");
		
		Field application = new TextField(null,"p_application");
		application.setLabel(Core.gt("aplicação atual"));
		application.setValue(currentApp != null ? currentApp.getName() : "");

		Field organization = new TextField(null,"p_organization");
		organization.setLabel(Core.gt("orgânica atual"));
		Organization org = new Organization().findOne(currentOrgId != null ? currentOrgId : -1);
		if(org!=null)
			organization.setValue(org.getName());

		Field profile = new TextField(null,"p_profile");
		profile.setLabel(Core.gt("perfil atual"));
		ProfileType prof = new ProfileType().findOne(currentProf != null ? currentProf : -1); 
		if(prof!=null)
			profile.setValue(prof.getDescr());
		
		fields.add(userAtual);
		fields.add(dataAtual);
		fields.add(emailAtual);
		fields.add(organization);
		fields.add(profile);
		fields.add(application);
		return fields;
	}
	
	public String getDefaultForm(List<Field> fields) {
		IGRPForm formProcess = new IGRPForm("default_form_report");
		fields.forEach(formProcess::addField);
		return formProcess.toString();
	}
	//Transform columns to xml
	private String transformToXml(RepSource rep,Set<Properties> columns) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("content");
			xml.writeAttribute("uuid", rep.getSource_identify());
			xml.setElement("title", rep.getName());
			xml.setElement("data_source_id", rep.getId());
			IGRPForm form = new IGRPForm("form");
			IGRPTable table = new IGRPTable("table");
			for (Properties p : columns) {
				Field f = new TextField(null,p.getProperty("tag"));
				f.propertie().add("name",p.getProperty("tag"));
				f.propertie().add("key",p.getProperty("key"));
				f.propertie().add("java-type", p.getProperty("type", "String"));
				f.setLabel(p.getProperty("tag"));
				form.addField(f);
				table.addField(f);
			}			
			xml.addXml(this.getDefaultForm(this.getDefaultFields()));
			xml.addXml(form.toString());
			xml.addXml(table.toString());			
		xml.endElement();
		return xml.toString();
	}
	
	private boolean isTypeTask(String type) {
		return "task".equalsIgnoreCase(type);
	}

	private boolean isTypeObject(String type) {
		return "object".equalsIgnoreCase(type);
	}

	private boolean isTypePage(String type) {
		return "page".equalsIgnoreCase(type);
	}

	private boolean isTypeQuery(String type) {
		return "query".equalsIgnoreCase(type);
	}
	
	private Map<String, String> getDatasourceType() {
		final Map<String, String> datasourceType = new HashMap<>();
		datasourceType.put(null, "-- Selecionar --");
		datasourceType.put("Task", "Etapa");
		datasourceType.put("Object", "Objeto");
		datasourceType.put("Page", "Página");
		datasourceType.put("Query", "Query");
		return datasourceType;
	}
	
	private Map<Object, Object> getDataSourceMap(final Integer envId) {
		final Map<Object, Object> dataSourceMap = new Config_env().getListDSbyEnv(envId);
		if (Objects.nonNull(dataSourceMap) && dataSourceMap.size() == 2)
			dataSourceMap.remove(null);
		return dataSourceMap;
	}
	
	private ProcessDefinitionService getProcessDefinitionService(final String process, final String dad) {
		return new ProcessDefinitionServiceRest().getLatestProcessDefinitionByKey(process, dad);
	}
	
	private String getTaskKey(DataSource model, final Application app) {
		final List<TaskService> task = new TaskServiceRest().getTasksByProcessKey(model.getProcesso(), app.getDad())
				.stream().filter(n -> n.getTaskDefinitionKey().equalsIgnoreCase(model.getEtapa()))
				.collect(Collectors.toList());
		return !task.isEmpty() ? task.get(0).getFormKey() : "";
	}
	
	/*----#end-code----*/
}
