package nosi.webapps.igrp_studio.pages.webreport;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.gui.page.Page;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.GUIDGenerator;
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
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.pages.datasource.DataSourceController;
import nosi.core.webapp.datasource.helpers.DataSourceHelpers;
import nosi.core.webapp.datasource.helpers.DataSourceParam;
import nosi.core.webapp.datasource.helpers.Parameters;
/*----#end-code----*/
		
public class WebReportController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		WebReport model = new WebReport();
		model.load();
		model.setLink_add_source("igrp_studio","WebReport","index");
		WebReportView view = new WebReportView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadGen_table(Core.query(null,"SELECT 'Dolor ipsum adipiscing omnis o' as title,'/IGRP/images/IGRP/IGRP2.3/app/igrp_studio/webreport/WebReport.xml' as link,'Amet anim sed labore officia' as descricao,'4' as id "));
		view.chart_1.loadQuery(Core.query(null,"SELECT 'X1' as EixoX, 'Y1' as EixoY, 15 as valor"
                                      +" UNION SELECT 'X2' as EixoX, 'Y2' as EixoY, 10 as valor"
                                      +" UNION SELECT 'X2' as EixoX, 'Y2' as EixoY, 23 as valor"
                                      +" UNION SELECT 'X3' as EixoX, 'Y3' as EixoY, 40 as valor"));
		view.env_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.datasorce_app.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/

		if(Core.isNotNull(model.getEnv_fk())){
			int env_fk = Integer.parseInt(model.getEnv_fk());
			view.datasorce_app.setValue(this.dsh.getListSources(env_fk));
			RepTemplate  rep = new RepTemplate();
			List<WebReport.Gen_table> data = new ArrayList<>(); 
			for(RepTemplate r: rep.find().andWhere("application", "=", env_fk).all()){
				WebReport.Gen_table t1 = new WebReport.Gen_table();
				List<RepTemplateSource> listParams = new RepTemplateSource().find().andWhere("repTemplate", "=", r.getId()).all();
				if(listParams.size() > 0){
					//Get parameters
					for(RepTemplateSource param:listParams){
						if(param.getParameters()!=null) {
							param.getParameters().stream().forEach(p->{
								params += ".addParam(\""+p.getParameter().toLowerCase()+"\",\"?\")";
							});
						}
					}
				}
				String link = "Core.getLinkReport(\""+r.getCode()+"\")"+params+";";
				t1.setDescricao(link);
				t1.setLink("igrp_studio", "web-report", "load-template&id="+r.getId());
				t1.setLink_desc(r.getCode());
				t1.setId(r.getId());
				t1.setTitle(r.getName());
				data.add(t1);
			}
			view.gen_table.addData(data);
		}
		view.env_fk.setValue(new Application().getListApps());
		model.setLink_add_source(this.getConfig().getResolveUrl("igrp","data-source","index&dad=igrp&target=_blank&id_env="+model.getEnv_fk()));
		model.setLink_source(this.getConfig().getResolveUrl("igrp","data-source","get-data-source&dad=igrp&target=_blank"));
		model.setEdit_name_report(this.getConfig().getResolveUrl("igrp_studio","web-report","save-edit-template&dad=igrp"));
		model.setLink_upload_img(this.getConfig().getResolveUrl("igrp_studio","web-report","save-image&dad=igrp"));
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
		 return this.forward("igrp_studio","WebReport","index", this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar)----*/
		try{
			Part fileXsl = Core.getFile("p_xslreport");
			Part fileTxt = Core.getFile("p_textreport");
			String title = Core.getParam("p_title_report");
			String code = Core.getParam("p_code");
			String env_fk = Core.getParam("p_env_fk");
			String id = Core.getParam("p_id");			
			String [] data_sources = Core.getParamArray("p_datasorce_app");
			//String [] keys = Igrp.getInstance().getRequest().getParameterValues("p_key");
			if(fileTxt!=null && fileXsl!=null && Core.isNotNull(env_fk)){
				CLob clob_xsl = new CLob();
				CLob clob_html = new CLob();
				RepTemplate rt = new RepTemplate();
				//Save report if not exist
				if(title!=null && code!=null && (id==null || id.equals(""))){
					clob_xsl.setC_lob_content(FileHelper.convertToString(fileXsl).getBytes());
					clob_xsl.setDt_created(new Date(System.currentTimeMillis()));
					clob_xsl = clob_xsl.insert();
					clob_html.setC_lob_content(FileHelper.convertToString(fileTxt).getBytes());
					clob_html.setDt_created(new Date(System.currentTimeMillis()));
					clob_html = clob_html.insert();
					rt.setCode(code);
					rt.setName(title);
					Application app = new Application();
					app = app.findOne(Integer.parseInt(env_fk));
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
				if(Core.isNotNull(id)){
					rt = rt.findOne(Integer.parseInt(id));
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
						rts = new RepTemplateSource(rt, new RepSource().findOne(Integer.parseInt(dts)));
						rts.insert();
					}
				}
				String p_datasourcekeys= Core.getParam("p_datasourcekeys");
				if(p_datasourcekeys!=null) {
					Gson g = new Gson();
					@SuppressWarnings("unchecked")
					List<DataSourceParam> datasources = (List<DataSourceParam>) g.fromJson(p_datasourcekeys, new TypeToken<List<DataSourceParam>>(){}.getType());
					if(datasources!=null) {
						for(DataSourceParam p:datasources) {
							for(Parameters param:p.getParameters()) {
								ResultSet.Record record = Core.query(this.configApp.getBaseConnection(), "SELECT id FROM tbl_rep_template_source")
														.where("rep_source_fk=:rep_source_fk AND rep_template_fk=:rep_template_fk")
														.addInt("rep_source_fk", Core.toInt(p.getId()))
														.addInt("rep_template_fk", rt.getId())
														.getSingleRecord();								
								Core.insert(this.configApp.getBaseConnection(),"tbl_rep_template_source_param")
									.addString("parameter", param.getName())
									.addString("parameter_type", param.getType())
									.addInt("rep_template_source_fk", record.getInt("id"))
									.execute();
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
		 return this.forward("igrp_studio","WebReport","index", this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(preview)----*/
		String id = Core.getParam("p_rep_id");
		String type = Core.getParam("p_type");// se for 0 - preview, se for 1 - registar ocorencia 
		String xml = "";
		if(Core.isNotNull(id)){
			RepTemplate rt = new RepTemplate();
			rt = rt.findOne(Integer.parseInt(id));
			String []name_array = Core.getParamArray("name_array");
			String []value_array = Core.getParamArray("value_array");
			//Iterate data source per template
			for(RepTemplateSource rep:new RepTemplateSource().getAllDataSources(rt.getId())){
				xml += this.getData(rep,name_array,value_array);
			}
			xml = this.genXml(xml,rt,(type!=null && !type.equals(""))?Integer.parseInt(type):0);
			this.format = Response.FORMAT_XML;
			return this.renderView(xml);
		}
		return this.redirect("igrp", "ErrorPage", "exception");
		/*----#end-code----*/
			
	}
	
/*----#start-code(custom_actions)----*/	
	public Response actionGetContraprova() throws IOException{
		String contraprova = Core.getParam("p_contraprova");
		RepInstance ri = new RepInstance().find().andWhere("contra_prova", "=",contraprova).one();
		String content = "";
		if(ri!=null){
			content = new String(ri.getXml_content().getC_lob_content());
			return this.renderView(content);
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}
	
	public Response actionSaveEditTemplate(){
	
          String id_ = Core.getParam("p_id");
          String code_ = Core.getParam("p_code");
          String title_ = Core.getParam("p_title_report");
          if(Core.isNotNull(id_)){
              RepTemplate rt = new RepTemplate();
              rt = rt.findOne(Integer.parseInt(id_));
              rt.setCode(code_);
              rt.setName(title_);
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
			c = c.findOne(Integer.parseInt(id));
			xsl = new String(c.getC_lob_content());
			this.format = Response.FORMAT_XSL;
			return this.renderView(xsl);
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}
	
	//Faz previsualizacao de report usando a contra senha
	public Response actionGetLinkReport() throws IOException{
		String p_code = Core.getParam("p_rep_code");
		String []name_array = Core.getParamArray("name_array");
		String []value_array = Core.getParamArray("value_array");
		String params = "";
		if(name_array!=null && value_array!=null && name_array.length > 0 && value_array.length > 0){
			for(String n:name_array)
				params += ("&name_array="+n);
			for(String v:value_array)
				params += ("&value_array="+v);
		}
		this.loadQueryString();
		this.removeQueryString("name_array");
		this.removeQueryString("value_array");
		RepTemplate rt = new RepTemplate().find().andWhere("code", "=", p_code).one();
		if(rt!=null)
			return this.redirect("igrp_studio", "WebReport", "preview&p_rep_id="+rt.getId()+"&p_type=1"+params,this.queryString());
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
			case "task":
				return this.getDataForTask(rep);
		}
		return "";
	}


	private String getDataForTask(RepTemplateSource rep) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("content");
		String processDefinitionKey = rep.getRepSource().getProcessid();
		if(processDefinitionKey!=null) {
			//Process_Test:01_01 => Process_Test
			processDefinitionKey = processDefinitionKey.contains(":")?processDefinitionKey.substring(0,processDefinitionKey.indexOf(":")):processDefinitionKey;
		}
		String taskId = this.getCurrentTaskId();
		this.loadQueryString();
		this.addQueryString("processDefinitionKey", processDefinitionKey)
			.addQueryString("taskDefinitionKey", rep.getRepSource().getTaskid())
			.addQueryString("taskId", taskId);
		String content = this.call("igrp","Detalhes_tarefas","index",this.queryString()).getContent();
		xml.addXml(new XMLExtractComponent().extractXML(content));
		xml.addXml(ds.getDefaultForm(ds.getDefaultFieldsWithProc()));
		xml.endElement();
		return xml.toString();
	}



	private String getCurrentTaskId() {
		String[] nameArray = Core.getParamArray("name_array");
		String[] valueArray = Core.getParamArray("value_array");
		if(nameArray.length > 0 && valueArray.length > 0) {
			for(int i=0;i<nameArray.length;i++) {
				if(nameArray[i].equalsIgnoreCase("taskId")) {
					return valueArray[i];
				}
			}
		}
		return null;
	}



	private String getDataForPage(RepTemplateSource rep) {
		Action ac = new Action().findOne(rep.getRepSource().getType_fk());
		if(ac!=null){
			String actionName = "";
			for(String aux : ac.getAction().split("-"))
				actionName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
			actionName = "action" + actionName;
			Core.setAttribute("current_app_conn", ac.getApplication().getDad());			
			String controllerPath = this.getConfig().getPackage(ac.getApplication().getDad(), ac.getPage(), ac.getAction());			
			Object ob = Page.loadPage(controllerPath,actionName);
			Core.removeAttribute("current_app_conn");
			if(ob!=null){
				Response resp = (Response) ob;
				if(resp!=null){
					String content = resp.getContent();
					int start = content.indexOf("<content");
					int end = content.indexOf("</rows>");
					content = (start!=-1 && end!=-1)?content.substring(start,end):"";
					return content;
				}
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


	//Load report, load all configuration of report
	public Response actionLoadTemplate() throws IOException{
		String id = Core.getParam("id");
		String json = "";
		if(id!=null && !id.equals("")){
			RepTemplate rt = new RepTemplate().findOne(Integer.parseInt(id));
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
			return this.getContentXml(rts.getRepSource().getName(),rowsXml);
		}else if(rs.getType().equalsIgnoreCase("page")){
			return this.getDataForPage(rts);
		}else if(rs.getType().equalsIgnoreCase("task")){
			return this.getDataForTask(rts);
		}
		return "";
	}
	
	
	/*Gen final XML for Web Report
	 * 
	 */
	private String genXml(String contentXml,RepTemplate rt,int type){
		String contra_prova = GUIDGenerator.getGUIDUpperCase();
		int user_id = Core.getCurrentUser().getId();
		User user = new User();
		user = user.findOne(user_id);
		String content = this.getReport(contentXml, this.getConfig().getResolveUrl("igrp_studio","web-report","get-xsl").replaceAll("&", "&amp;")+"&amp;dad=igrp&amp;p_id="+rt.getXsl_content().getId(), contra_prova, rt,user);
		if(type==1){
			RepInstance ri = new RepInstance();
			ri.setContra_prova(contra_prova);
			ri.setApplication(rt.getApplication());
			ri.setDt_created(new Date(System.currentTimeMillis()));
			ri.setReference(contra_prova);
			ri.setTemplate(rt);
			ri.setUser(user);
			CLob xsl = new CLob("", "application/xsl", rt.getXsl_content().getC_lob_content(), ri.getDt_created());
			xsl = xsl.insert();
			
			if(xsl!=null){
				content = this.getReport(contentXml, this.getConfig().getResolveUrl("igrp_studio","web-report","get-xsl").replaceAll("&", "&amp;")+"&amp;dad=igrp&amp;p_id="+xsl.getId(), contra_prova, rt,user);
				CLob xml = new CLob("", "application/xml", content.getBytes(), ri.getDt_created());
				xml = xml.insert();
				ri.setXml_content(xml);
				ri.setXsl_content(xsl);
				ri.insert();
			}
		}
		return content;
	}
	
	private String getReport(String contentXml,String xslPath,String contra_prova,RepTemplate rt,User user){
		XMLWritter xmlW = new XMLWritter("rows", xslPath, "");
		xmlW.startElement("print_report");
			xmlW.setElement("name_app",rt.getApplication().getDad());
			xmlW.setElement("img_app",rt.getApplication().getImg_src());
			xmlW.setElement("link_qrcode",this.getConfig().getResolveUrl("igrp_studio","web-report","contraprova")+ "&p_contraprova="+contra_prova);
			xmlW.setElement("img_brasao", "brasao.png");
			xmlW.emptyTag("name_brasao");
			xmlW.setElement("data_print",new Date(System.currentTimeMillis()).toString());
			xmlW.setElement("name_contraprova", "Contra Prova");
			xmlW.setElement("value_contraprova", contra_prova);
			xmlW.setElement("user_print",user.getName());
			xmlW.setElement("link_img",this.getConfig().getLinkImg()+"/");
			xmlW.setElement("template", "por adicionar");
		xmlW.endElement();
		xmlW.addXml(contentXml);
		return xmlW.toString();
	}
	
	
	
	//Get content xml
	private String getContentXml(String title,String content) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("content");
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
		try {
			Part file = Core.getFile("p_file_name");
			if (file != null) {
				fileName = file.getSubmittedFileName();
				if(Core.isNotNull(fileName)) {
					int index = fileName.indexOf(".");
					if(index!=-1) {
						String extensionName = fileName.substring(index+1);
						String workSapce = Path.getImageWorkSpace();
						if(Core.isNotNull(workSapce))//Saving in your workspace case exists
							r = FileHelper.saveImage(workSapce, fileName,extensionName.toLowerCase(), file);
						//Saving into server
						r = FileHelper.saveImage(Path.getImageServer(), fileName,extensionName.toLowerCase(), file);
					}
				}
			}
		} catch (ServletException e) {
			r = false;
		}
		String baseUrl = Igrp.getInstance().getRequest().getRequestURL().toString();
		String link = baseUrl.toString()+"?r=igrp_studio/WebReport/get-image&p_file_name="+fileName;
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
	public Response actionGetImage()  throws IOException, IllegalArgumentException, IllegalAccessException {
		Response resp = new Response();
		String fileName = Core.getParam("p_file_name");
		if(Core.isNotNull(fileName)) {
			String baseUrl = Igrp.getInstance().getRequest().getRequestURL().toString();
			return this.redirectToUrl(baseUrl.toString().replaceAll("app/webapps", "images")+"/IGRP/IGRP2.3/assets/img/reports/"+fileName);
		}
		resp.setContent(FlashMessage.MSG_ERROR);	
		return resp;
	}
	
	private DataSourceController ds = new DataSourceController();
	private DataSourceHelpers dsh = new DataSourceHelpers();
	private String params = "";
	/*----#end-code----*/
}
