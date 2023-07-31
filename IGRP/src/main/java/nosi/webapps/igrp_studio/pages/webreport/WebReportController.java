package nosi.webapps.igrp_studio.pages.webreport;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import nosi.core.config.ConfigDBIGRP;
import nosi.core.webapp.Report;
import nosi.core.gui.page.Page;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.bpmn.BPMNConstants;
import nosi.core.webapp.datasource.helpers.DataSourceHelpers;
import nosi.core.webapp.datasource.helpers.DataSourceParam;
import nosi.core.webapp.datasource.helpers.Parameters;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export_v2.common.Path;
import nosi.core.xml.XMLExtractComponent;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.RepInstance;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateSource;
import nosi.webapps.igrp.dao.RepTemplateSourceParam;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.pages.datasource.DataSourceController;

/*----#end-code----*/
		
public class WebReportController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		WebReport model = new WebReport();
		model.load();
		model.setLink_add_source("igrp_studio","WebReport","index");
		 //model.setLink_upload_img(this.getConfig().getResolveUrl("igrp","file","save-image-txt&p_page_name="+Core.getCurrentPage()));
		WebReportView view = new WebReportView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadGen_table(Core.query(null,"SELECT 'Perspiciatis sit unde adipisci' as title,'/IGRP/images/IGRP/IGRP2.3/app/igrp_studio/webreport/WebReport.xml' as link,'Officia sit labore voluptatem' as descricao,'6' as id "));
		view.chart_1.loadQuery(Core.query(null,"SELECT 'X1' as EixoX, 'Y1' as EixoY, 15 as EixoZ"
                                      +" UNION SELECT 'X2' as EixoX, 'Y2' as EixoY, 10 as EixoZ"
                                      +" UNION SELECT 'X2' as EixoX, 'Y2' as EixoY, 23 as EixoZ"
                                      +" UNION SELECT 'X3' as EixoX, 'Y3' as EixoY, 40 as EixoZ"));
		view.env_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.datasorce_app.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/
 		model.setLink_doc(this.getConfig().getResolveUrl("tutorial","Listar_documentos","index&p_type=report"));
 		
		if(Core.isNotNull(model.getEnv_fk())){
			Integer env_fk = Core.toInt(model.getEnv_fk());
			view.datasorce_app.setValue(this.dsh.getListSources(env_fk));
			RepTemplate  rep = new RepTemplate();
			List<WebReport.Gen_table> data = new ArrayList<>(); 
			for(RepTemplate r: rep.find().andWhere("status", "=", 1).andWhere("application", "=", env_fk).all()){
				StringBuilder params =new StringBuilder();
				WebReport.Gen_table t1 = new WebReport.Gen_table();
				List<RepTemplateSource> listParams = new RepTemplateSource().find().andWhere("repTemplate", "=", r.getId()).all();
				if(!listParams.isEmpty())
					for(RepTemplateSource param : listParams)
						if(param.getParameters() != null) 
							for(RepTemplateSourceParam p:param.getParameters()) 
								params.append(".addParam(\""+p.getParameter().toLowerCase()+"\",\"?\")");
				String link = "Core.getLinkReport(\""+r.getCode()+"\")"+params.toString()+"; //or PDF report - Response=> Core.getLinkReportPDF(\""+r.getCode()+"\",new nosi.core.webapp.Report()"+params+");"+"or report HTML - Response=> Core.getLinkReport(\""+r.getCode()+"\",new nosi.core.webapp.Report()"+params+");";
				t1.setDescricao(link);
				t1.setLink("igrp_studio", "web-report", "load-template&id="+r.getId());
				t1.setLink_desc(r.getCode());
				t1.setId(r.getId());
				t1.setTitle(r.getName());
				data.add(t1);
			}
			view.gen_table.addData(data);
			model.setLink_add_source(this.getConfig().getResolveUrl("igrp","data-source","index&target=_blank&id_env="+model.getEnv_fk()));
			model.setLink_upload_img(this.getConfig().getResolveUrl("igrp_studio","web-report","save-image&id_env="+model.getEnv_fk()));
			
		}else {
			model.setLink_add_source(this.getConfig().getResolveUrl("igrp","data-source","index&target=_blank"));
			model.setLink_upload_img(this.getConfig().getResolveUrl("igrp_studio","web-report","save-image"));
		}
		view.env_fk.setValue(new Application().getListApps());
		model.setLink_source(this.getConfig().getResolveUrl("igrp","data-source","get-data-source&target=_blank"));
		model.setEdit_name_report(this.getConfig().getResolveUrl("igrp_studio","web-report","save-edit-template"));
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		WebReport model = new WebReport();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","WebReport","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (gravar)  *//* End-Code-Block  */
		/*----#start-code(gravar)----*/
		try{
			Part fileXsl = Core.getFile("p_xslreport");
			Part fileTxt = Core.getFile("p_textreport");
			String title = Core.getParam("p_title_report");
			String code = Core.getParam("p_code");
			String env_fk = Core.getParam("p_env_fk");
			String id = Core.getParam("p_id");			
			String [] data_sources = Core.getParamArray("p_datasorce_app");
			
			if(fileTxt!=null && fileXsl!=null){
				CLob clob_xsl = new CLob();
				CLob clob_html = new CLob();
				RepTemplate rt = new RepTemplate();
				//Save report if not exist
				if(Core.isNotNullMultiple(env_fk,title,code) && (id==null || id.equals(""))){
					clob_xsl.setC_lob_content(FileHelper.convertToString(fileXsl).getBytes());
					clob_xsl.setDt_created(new Date(System.currentTimeMillis()));
					clob_xsl = clob_xsl.insert();
					clob_html.setC_lob_content(FileHelper.convertToString(fileTxt).getBytes());
					clob_html.setDt_created(new Date(System.currentTimeMillis()));
					clob_html = clob_html.insert();
					rt.setCode(code);
					rt.setName(title);
					Application app = new Application();
					app = app.findOne(Core.toInt(env_fk));
					rt.setApplication(app);
					rt.setXml_content(clob_html);
					rt.setXsl_content(clob_xsl);
					rt.setDt_created(new Date(System.currentTimeMillis()));
					rt.setDt_updated(new Date(System.currentTimeMillis()));
					User user = new User();
					user = user.findOne(Core.getCurrentUser().getId());
					rt.setUser_created(user);
					rt.setUser_updated(user);
					rt.setStatus(1);
					rt = rt.insert();	
				}
				//Update report if is exist
				if(Core.isNotNullMultiple(env_fk,id)){
					rt = rt.findOne(Core.toInt(id));
					clob_xsl = clob_xsl.findOne(rt.getXsl_content().getId());
					clob_html = clob_html.findOne(rt.getXml_content().getId());				
					clob_xsl.setC_lob_content(FileHelper.convertToString(fileXsl).getBytes());
					clob_html.setC_lob_content(FileHelper.convertToString(fileTxt).getBytes());
					clob_xsl.update();
					clob_html.update();
					rt.update();
				}
				
				RepTemplateSource rts = new RepTemplateSource();
				rts.deleteAll(rt.getId());//Delete old data source of report
				
				if(data_sources!=null && data_sources.length>0){
					for(String dts:data_sources){
						rts = new RepTemplateSource(rt, new RepSource().findOne(Core.toInt(dts)));
						rts.insert();
					}
				}
				String p_datasourcekeys= Core.getParam("p_datasourcekeys");
				if(Core.isNotNull(p_datasourcekeys)){
					Gson g = new Gson();
					@SuppressWarnings("unchecked")
					List<DataSourceParam> datasources = (List<DataSourceParam>) g.fromJson(p_datasourcekeys, new TypeToken<List<DataSourceParam>>(){}.getType());
					if (datasources != null) {
						for (DataSourceParam p : datasources) {
							if (Core.isNotNull(p.getId()))
								for (Parameters param : p.getParameters()) {
									ResultSet.Record recorde = Core
											.query(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,
													"SELECT id FROM tbl_rep_template_source")
											.where("rep_source_fk=:rep_source_fk AND rep_template_fk=:rep_template_fk")
											.addInt("rep_source_fk", Core.toInt(p.getId()))
											.addInt("rep_template_fk", rt.getId()).getSingleRecord();
									int idRepTempSource = recorde.getInt("id");
									RepTemplateSourceParam rTsp = new RepTemplateSourceParam().find()
											.andWhere("parameter", "=", param.getName())
											.andWhere("repTemplateSource.id", "=", idRepTempSource).one();
									if (rTsp == null)
										Core.insert(this.configApp.getBaseConnection(), "tbl_rep_template_source_param")
												.addString("parameter", param.getName())
												.addString("parameter_type", param.getType()!=null?param.getType():"")
												.addInt("rep_template_source_fk", idRepTempSource).execute();
								}
						}
					}
				}
				
				XMLWritter xml = new XMLWritter();
				xml.startElement("rows");
				xml.addXml(FlashMessage.MSG_SUCCESS);
				xml.setElement("report_id", rt.getId());
				xml.endElement();
				return this.renderView(xml.toString());
			}
		}catch(ServletException e){
			
        }	
		return this.renderView(FlashMessage.MSG_ERROR);
		/*----#end-code----*/
			
	}
	
	public Response actionPreview() throws IOException, IllegalArgumentException, IllegalAccessException{
		WebReport model = new WebReport();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","WebReport","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (preview)  *//* End-Code-Block  */
		/*----#start-code(preview)----*/
		
		String type = Core.getParam("p_type");// se for 0 - preview, se for 1 - registar ocorencia , 3 - retornar PDF e gravar
		Integer id = Core.getParamInt("p_rep_id");
		String contraProva= Core.getParam("ctpr");		
		if(Core.isNotNull(id)){
			String []name_array = Core.getParamArray("name_array");
			String []value_array = Core.getParamArray("value_array");
			RepTemplate rt = new RepTemplate();
			rt = rt.findOne(id);
			String genXml = genRenderXml(rt, type, contraProva, name_array, value_array);	
			
			if(type.equals(Report.PDF_SAVE))
				return new Report().processPDF(System.currentTimeMillis()+"_"+rt.getName(),rt.getXsl_content(), genXml,"false");
			
			this.format = Response.FORMAT_XML;			
			return this.renderView(genXml);
		}
		return this.redirect("igrp", "ErrorPage", "exception");
		/*----#end-code----*/
			
	}
	
	public Response actionPreview_pdf() throws IOException, IllegalArgumentException, IllegalAccessException{
		WebReport model = new WebReport();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp_studio","ListaEnv","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (preview_pdf)  *//* End-Code-Block  */
		/*----#start-code(preview_pdf)----*/
		
		String type = Report.PDF_PRV;// se for 0 - preview, se for 1 - registar ocorencia , 2 - retornar PDF, 3 - preview PDF with no save
		Integer id = Core.getParamInt("p_rep_id");
		String contraProva= Core.getParam("ctpr");		
		if(Core.isNotNull(id)){
			String []name_array = Core.getParamArray("name_array");
			String []value_array = Core.getParamArray("value_array");
			RepTemplate rt = new RepTemplate();
			rt = rt.findOne(id);
			String genXml = genRenderXml(rt, type, contraProva, name_array, value_array);				
		
			return new Report().processPDF(System.currentTimeMillis()+"_"+rt.getName(),rt.getXsl_content(), genXml,"false");
		}
		return this.redirect("igrp", "ErrorPage", "exception");
		
		/*----#end-code----*/
			
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/	
	
	
	
	
	/**
	 * @param id
	 * @param type save the report or not? 0 not save; 1 save the report to clob
	 * @param contraProva
	 * @param name_array
	 * @param value_array
	 * @return
	 */
	public String genRenderXml(RepTemplate rt, String type, String contraProva, String[] name_array, String[] value_array) {
		StringBuilder xml = new StringBuilder();
		
		
		List<RepTemplateSource> allRepTemplateSource = new RepTemplateSource().getAllDataSources(rt.getId()); 
		List<RepTemplateSource> allRepTemplateSourceTask  = allRepTemplateSource.stream().filter(p -> p.getRepSource().getType().equalsIgnoreCase("task")).collect(Collectors.toList()); 
		allRepTemplateSource.removeIf(p -> p.getRepSource().getType().equalsIgnoreCase("task")); 
		
		//Iterate data source per template
		for(RepTemplateSource rep : allRepTemplateSource)
			xml.append(this.getData(rep,name_array,value_array)); 
		
		String taskId = this.getCurrentTaskId(); 
		if(taskId != null && !taskId.isEmpty()) {
			String []allTasksId = taskId.split("-"); 
			if(allTasksId.length == allRepTemplateSourceTask.size()) 
				for(int i = 0; i < allRepTemplateSourceTask.size(); i++) 
					xml.append(this.getDataForTask(allRepTemplateSourceTask.get(i), allTasksId[i])); 
		}	
		
		return this.genXml(xml.toString(),rt,type,contraProva);
	}
	
	public Response actionGetContraprova() throws IOException{
		String contraprova = Core.getParam("ctprov");
		String did = Core.getParam("did");
		String outtype = Core.getParam("out");
		String toDownload = Core.getParam("todwn");
		
		contraprova=Core.decryptPublicPage(contraprova);
		return new Report().processRepContraProva(contraprova, did, outtype, toDownload);
	}

	
	
	public Response actionSaveEditTemplate(){
	
          String id = Core.getParam("p_id");
          String code = Core.getParam("p_code");
          String title = Core.getParam("p_title_report");
          if(Core.isNotNullMultiple(id,code,title)){
              RepTemplate rt = new RepTemplate();
              rt = rt.findOne(Core.toInt(id));
              rt.setCode(code);
              rt.setName(title);
              rt.setDt_updated(new Date(System.currentTimeMillis()));
              rt = rt.update();
              if(rt!=null){
                  return this.renderView(FlashMessage.MSG_SUCCESS);
              }
          }
		return this.renderView(FlashMessage.MSG_ERROR);
	}
		
	//Get xsl content of report
	public Response actionGetXsl() throws IOException{
		String id = Core.getParam("p_id");
		String xsl = "";
		if(Core.isNotNull(id)){
			CLob c = new CLob();
			c = c.findOne(Core.toInt(id));
			xsl = new String(c.getC_lob_content());
			this.format = Response.FORMAT_XSL;
			return this.renderView(xsl);
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}
	
	//Faz previsualizacao de report usando a contra senha
	public Response actionGetLinkReport() throws IOException{
		String p_code = Core.getParam("p_rep_code");
		RepTemplate rt = new RepTemplate().find().andWhere("code", "=", p_code).one();

		String []name_array = Core.getParamArray("name_array");
		String []value_array = Core.getParamArray("value_array");
		StringBuilder params = new StringBuilder();
		if(name_array!=null && value_array!=null && name_array.length > 0 && value_array.length > 0){
			for(String n:name_array)
				params.append(("&name_array="+n));
			for(String v:value_array)
				params.append(("&value_array="+v));
		}
		this.loadQueryString();
		this.removeQueryString("name_array");
		this.removeQueryString("value_array");		
		
		if(rt!=null)
			return this.redirect("igrp_studio", "WebReport", "preview&p_rep_id="+rt.getId()+"&p_type="+Report.XSLXML_SAVE+params.toString(),this.queryString());
		return this.redirect("igrp", "ErrorPage", "exception");
	}
	
	
	
	
	private String getData(RepTemplateSource rep,String []name_array,String []value_array) {
		String type = rep.getRepSource().getType().toLowerCase();
		switch (type) {
			case "object":
			case "query":
				return this.getDataForQueryOrObject(rep,name_array,value_array);
			case "page":
				return this.getDataForPage(rep);
			default:
				return "";
		}
	}


	private String getDataForTask(RepTemplateSource rep, String taskId) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("content");
		xml.writeAttribute("uuid", rep.getRepSource().getSource_identify());
		String processDefinitionKey = rep.getRepSource().getProcessid();
		if(processDefinitionKey!=null) {
			//Process_Test:01_01 => Process_Test
			processDefinitionKey = processDefinitionKey.contains(":") ? processDefinitionKey.substring(0,processDefinitionKey.indexOf(":")) : processDefinitionKey;
		}
		this.removeQueryString("p_" + BPMNConstants.PRM_PROCESS_DEFINITION_KEY); 
		this.removeQueryString("p_" + BPMNConstants.PRM_TASK_DEFINITION_KEY); 
		this.removeQueryString(BPMNConstants.PRM_TASK_ID); 
		this.addQueryString("p_" + BPMNConstants.PRM_PROCESS_DEFINITION_KEY, processDefinitionKey)
			.addQueryString("p_" + BPMNConstants.PRM_TASK_DEFINITION_KEY, rep.getRepSource().getTaskid())
			.addQueryString(BPMNConstants.PRM_TASK_ID, taskId);
		String content = this.call("igrp","Detalhes_tarefas","index",this.queryString()).getContent(); 
		this.restartQueryString();
		xml.addXml(XMLExtractComponent.extractXML(content));
		xml.addXml(ds.getDefaultForm(ds.getDefaultFieldsWithProc()));
		xml.endElement();
		return xml.toString();
	}

	private String getDataForPage(RepTemplateSource rep) {
		Action ac= new DataSourceController().getActionReport(rep.getRepSource());
			if(ac!=null){
				String actionName = "";
				for(String aux : ac.getAction().split("-"))
					actionName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
				actionName = "action" + actionName;
				Core.setAttribute("current_app_conn", ac.getApplication().getDad());	
				String controllerPath = this.getConfig().getPackage(ac.getApplication().getDad(), ac.getPage(), ac.getAction());			
				Object ob = Controller.loadPage(controllerPath,actionName);
				Core.removeAttribute("current_app_conn");
				if(ob!=null){
					Response resp = (Response) ob;
					String content = resp.getContent();
					int start = content.indexOf("<content");
					int end = content.indexOf("</rows>");
					content = (start!=-1 && end!=-1)?content.substring(start,end):"";
					content = content.replace("<content", "<content uuid=\""+rep.getRepSource().getSource_identify()+"\"");
					content = content.replace("</content>", ds.getDefaultForm(ds.getDefaultFieldsWithProc())+"</content>");
					return content;
				}
			}
		
		return "";
	}


	private String getDataForQueryOrObject(RepTemplateSource rep,String []name_array,String []value_array) {
		String query = rep.getRepSource().getType_query();
		query = rep.getRepSource().getType().equalsIgnoreCase("object")?("SELECT * FROM "+query):query;
		query += rep.getRepSource().getType().equalsIgnoreCase("query") && !query.toLowerCase().contains("where")?" WHERE 1=1 ":""; 
		String rowsXml = this.dsh.getSqlQueryToXml(query, name_array, value_array,rep.getRepTemplate(),rep.getRepSource());
		return this.processPreview(rowsXml,rep,rep.getRepSource());
	}

	private String getCurrentTaskId() {
		String[] nameArray = Core.getParamArray("name_array");
		String[] valueArray = Core.getParamArray("value_array");
		if(Core.isNotNullMultiple(nameArray,valueArray) && nameArray.length > 0 && valueArray.length > 0) {
			for(int i=0;i<nameArray.length;i++) {
				if(nameArray[i].equalsIgnoreCase(BPMNConstants.PRM_TASK_ID)) {
					return valueArray[i];
				}
			}
		}
		return null;
	}

	//Load report, load all configuration of report
	public Response actionLoadTemplate() throws IOException{
		String id = Core.getParam("id");
		String json = "";
		if(id!=null && !id.equals("")){
			RepTemplate rt = new RepTemplate().findOne(Core.toInt(id));
			CLob clob = new CLob().findOne(rt.getXml_content().getId());
			String data_sources = "";
			for(RepTemplateSource r:new RepTemplateSource().getAllDataSources(rt.getId())){
				data_sources+=""+r.getRepSource().getId()+",";
			}
			data_sources = (!data_sources.equals(""))?data_sources.substring(0, data_sources.length()-1):"";
			json = "{\"textreport\":"+new String(clob.getC_lob_content())+",\"datasorce_app\":\""+data_sources+"\"}";
		}
		this.format = Response.FORMAT_JSON;
		return this.renderView(json);
	}
	
	/*Process preview in different type
	 * 
	 */
	private String processPreview(String rowsXml, RepTemplateSource rts, RepSource rs) {
		if(rs.getType().equalsIgnoreCase("object") || rs.getType().equalsIgnoreCase("query")){
			return this.getContentXml(rs.getSource_identify(),rts.getRepSource().getName(),rowsXml);
		}else if(rs.getType().equalsIgnoreCase("page")){
			return this.getDataForPage(rts);
		}
		return "";
	}
	
	
	/*Gen final XML for Web Report
	 * 
	 */
	private String genXml(String contentXml,RepTemplate rt,String type, String contraProva){
		Core.setAttribute("current_app_conn", rt.getApplication().getDad());
		String packageFind = "nosi.webapps."+rt.getApplication().getDad().toLowerCase();
		if(Core.isNull(contraProva))
			contraProva = Report.generateContraProva(packageFind);
		else
			contraProva=Core.decryptPublicPage(contraProva);
		User user = null;
		if(Igrp.getInstance().getUser() != null && Igrp.getInstance().getUser().isAuthenticated()){
			user = new User();
			Integer user_id = Core.getCurrentUser().getId();			
			user = user.findOne(user_id);
		}		
		String content = this.getReport(contentXml, this.getConfig().getResolveUrl("igrp_studio","web-report","get-xsl").replace("&", "&amp;")+"&amp;dad=igrp&amp;p_id="+rt.getXsl_content().getId(), contraProva, rt,user,type);
		if(type.equals(Report.XSLXML_SAVE) || type.equals(Report.PDF_SAVE)){
//			Saves in the clob a report generated in this moment
			RepInstance ri = new RepInstance();
			ri.setContra_prova(contraProva);
			ri.setApplication(rt.getApplication());
			ri.setDt_created(new Date(System.currentTimeMillis()));
			ri.setReference(contraProva);
			ri.setTemplate(rt);
			ri.setUser(user);
			CLob xsl = new CLob(System.currentTimeMillis()+"_"+rt.getName()+".xsl", "application/xsl", rt.getXsl_content().getC_lob_content(), ri.getDt_created(),rt.getApplication());			
			xsl = xsl.insert();
			
			if(xsl!=null){
				content = this.getReport(contentXml, this.getConfig().getResolveUrl("igrp_studio","web-report","get-xsl").replace("&", "&amp;")+"&amp;dad=igrp&amp;p_id="+xsl.getId(), contraProva, rt,user,type);
				CLob xml = new CLob(System.currentTimeMillis()+"_"+rt.getName()+".xml", "application/xml", content.getBytes(), ri.getDt_created(),rt.getApplication());
				xml = xml.insert();
				ri.setXml_content(xml);
				ri.setXsl_content(xsl);
				ri.insert();
			}
		}
		return content;
	}
	
	private String getReport(String contentXml,String xslPath,String contra_prova,RepTemplate rt,User user, String type){
		XMLWritter xmlW = new XMLWritter("rows", xslPath, "");
		xmlW.startElement("print_report");
			xmlW.setElement("name_app",rt.getApplication().getDad());
			xmlW.setElement("img_app",rt.getApplication().getImg_src());
			switch (type) {
			case Report.PDF_PRV:
			case Report.PDF_SAVE:
				xmlW.setElement("link_qrcode",Core.getLinkContraProvaPDF(contra_prova,""+rt.getApplication().getId(),false));
				break;
			default:
				xmlW.setElement("link_qrcode",Core.getLinkContraProva(contra_prova));
				break;
			}
			xmlW.setElement("img_brasao", "brasao.png");
			xmlW.emptyTag("name_brasao");
			xmlW.setElement("data_print",new Date(System.currentTimeMillis()).toString());
			xmlW.setElement("name_contraprova", "Contra Prova");
			xmlW.setElement("value_contraprova", contra_prova);
			xmlW.setElement("user_print",user!=null?user.getName():"Anonimous");
			xmlW.setElement("link_img",this.getConfig().getLinkImg()+"/");
			xmlW.setElement("template", "por adicionar");
		xmlW.endElement();
		xmlW.addXml(contentXml);
		return xmlW.toString();
	}
	
	
	
	//Get content xml
	private String getContentXml(String uuid,String title,String content) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("content");
		xml.writeAttribute("uuid", uuid);
			xml.setElement("title", title);
			xml.addXml(content);
			xml.addXml(ds.getDefaultForm(ds.getDefaultFields()));
		xml.endElement();
		return xml.toString();
	}
	
	public Response actionGetReport() throws IOException {
		String code = Core.getParam("code");
		if(Core.isNotNull(code)) {
			this.loadQueryString();
			return Core.getLinkReport(code,this.queryString());
		}
		return this.redirectError();
	}
	
	/**
	 * Upload image file into server
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public Response actionSaveImage()  throws IOException, ServletException {
		boolean r = false;
		String fileName="";
		Integer id_env=  Core.getParamInt("id_env");
		String env="";
		if(Core.isNotNullOrZero(id_env))
			env=Core.findApplicationById(id_env).getDad();
		try {
			Part file = Core.getFile("p_file_name");
			if (file != null) {
				fileName = file.getSubmittedFileName();
				if(Core.isNotNull(fileName)) {
					fileName= fileName.replaceAll("\\s+", "_").replaceAll("\'", "");					
					int index = fileName.lastIndexOf(".");
					if(index!=-1) {
						String extensionName = fileName.substring(index+1);
						
						String workSpace = Path.getImageWorkSpace((env.equals("")?"":env+File.separator)+"reports");
						if(Core.isNotNull(workSpace))//Saving in your workspace case exists
							FileHelper.saveImage(workSpace, fileName,extensionName.toLowerCase(), file);
						//Saving into server
						r = FileHelper.saveImage(Path.getImageServer((env.equals("")?"":env+File.separator)+"reports"), fileName,extensionName.toLowerCase(), file);
					}
				}
			}
		} catch (ServletException e) {
		
		}
		String link = "?r=igrp_studio/WebReport/get-image&p_file_name="+fileName+"&env="+env;
		if(r)
			return this.renderView("{\"type\":\"success\",\"message\":\""+FlashMessage.MESSAGE_SUCCESS+"\",\"link\":\""+link+"\"}");
		else
			return this.renderView("{\"type\":\"error\",\"message\":\""+FlashMessage.MESSAGE_ERROR+"\",\"link\":\"\"}");
	}
	
	/**
	 * Read and display image from server
	 * @return
	 * @throws IOException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public Response actionGetImage()  throws IllegalArgumentException {
		Response resp = new Response();
		String fileName = Core.getParam("p_file_name");
		String env=Core.getParam("env");
		if(Core.isNotNull(fileName)) {
			String baseUrl = Igrp.getInstance().getRequest().getRequestURL().toString();	
			String url =  baseUrl.replace("app/webapps", "images")+"/IGRP/IGRP2.3/assets/img/"+(Core.isNull(env)?"":env+"/")+"reports/"+fileName;			
			return this.redirectToUrl(url);
		}
		resp.setContent(FlashMessage.MSG_ERROR);	
		return resp;
	}
	
	private DataSourceController ds = new DataSourceController();
	private DataSourceHelpers dsh = new DataSourceHelpers(); 
	/*----#end-code----*/
}
