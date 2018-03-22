/*-------------------------*/

/*Create Controller*/
package nosi.webapps.igrp_studio.pages.webreport;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.config.Config;
import nosi.core.gui.page.Page;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.GUIDGenerator;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.RepInstance;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateParam;
import nosi.webapps.igrp.dao.RepTemplateSource;
import nosi.webapps.igrp.dao.User;
/*----#END-PRESERVED-AREA----*/

public class WebReportController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		WebReport model = new WebReport();
		WebReportView view = new WebReportView(model);
		model.load();		
		if(Core.isNotNull(model.getEnv_fk())){
			RepSource ds = new RepSource();
			int env_fk = Integer.parseInt(model.getEnv_fk());
			view.datasorce_app.setValue(ds.getListSources(env_fk));
			RepTemplate  rep = new RepTemplate();
			List<WebReport.Gen_table> data = new ArrayList<>(); 
			for(RepTemplate r: rep.find().andWhere("application", "=", env_fk).all()){
				WebReport.Gen_table t1 = new WebReport.Gen_table();
				RepTemplateParam rtp = new RepTemplateParam();
				String params = "null";
				List<RepTemplateParam> listParams = rtp.find().andWhere("reptemplate", "=", r.getId()).all();
				if(listParams.size() > 0){
					params = "new Report()";
					//Get parameters
					for(RepTemplateParam p:listParams){
						params += ".addParam(\""+p.getParameter().toLowerCase()+"\",\"?\")";
					}
				}
				String link = "Core.getLinkReport(\""+r.getCode()+"\","+params+");";
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
		view.link_add_source.setValue(new Config().getResolveUrl("igrp","data-source","index&dad=igrp&id_env="+model.getEnv_fk()));
		view.p_link_source.setValue(new Config().getResolveUrl("igrp","data-source","get-data-source&dad=igrp"));
		view.p_edit_name_report.setValue(new Config().getResolveUrl("igrp_studio","web-report","save-edit-template&dad=igrp"));
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	
	public Response actionGravar()throws IllegalArgumentException, IllegalAccessException, IOException, ServletException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			Part fileXsl = Igrp.getInstance().getRequest().getPart("p_xslreport");
			Part fileTxt = Igrp.getInstance().getRequest().getPart("p_textreport");
			String title = Igrp.getInstance().getRequest().getParameter("p_title");
			String code = Igrp.getInstance().getRequest().getParameter("p_code");
			String env_fk = Igrp.getInstance().getRequest().getParameter("p_env_fk");
			String id = Igrp.getInstance().getRequest().getParameter("p_id");			
			String [] data_sources = Igrp.getInstance().getRequest().getParameterValues("p_datasorce_app");
			String [] keys = Igrp.getInstance().getRequest().getParameterValues("p_key");
			if(fileTxt!=null && fileXsl!=null && Core.isNotNull(env_fk)){
				CLob clob_xsl = new CLob();
				CLob clob_html = new CLob();
				RepTemplate rt = new RepTemplate();
				//Save report if not exist
				if(title!=null && code!=null && (id==null || id.equals(""))){
					clob_xsl.setC_lob_content(FileHelper.convertToString(fileXsl).getBytes());
					clob_xsl.setDt_created(new Date(System.currentTimeMillis()).toString());
					clob_xsl = clob_xsl.insert();
					clob_html.setC_lob_content(FileHelper.convertToString(fileTxt).getBytes());
					clob_html.setDt_created(new Date(System.currentTimeMillis()).toString());
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
					user = user.findOne(Igrp.getInstance().getUser().getIdentity().getIdentityId());
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

				RepTemplateParam rtp = new RepTemplateParam();
				rtp.deleteAll(rt.getId());//Delete old params of report
				if(keys!=null && keys.length>0){
					for(String key:keys){
						rtp = new RepTemplateParam();
						rtp.setReptemplate(rt);
						rtp.setParameter(key.toLowerCase());
						rtp.insert(); //insert news params of report 
					}
				}
				RepTemplateSource rts = new RepTemplateSource();
				rts.deleteAll(rt.getId());//Delete old data source of report
				if(data_sources!=null && data_sources.length>0){
					for(String dts:data_sources){
						rts = new RepTemplateSource(rt, new RepSource().findOne(Integer.parseInt(dts)));
						rts.insert();
					}
				}	
				return this.renderView(FlashMessage.MSG_SUCCESS);
			}
		}	
		return this.renderView(FlashMessage.MSG_ERROR);
		/*----#END-PRESERVED-AREA----*/
	}
	
	//Faz previsualizacao de report sem usar contra senha
	public Response actionPreview() throws IOException{
		/*----#START-PRESERVED-AREA(PREVIEW)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		String type = Igrp.getInstance().getRequest().getParameter("p_type");// se for 0 - preview, se for 1 - registar ocorencia 
		String xml = "";
		if(Core.isNotNull(id)){
			RepTemplate rt = new RepTemplate();
			rt = rt.findOne(Integer.parseInt(id));
			String []name_array = Igrp.getInstance().getRequest().getParameterValues("name_array");
			String []value_array = Igrp.getInstance().getRequest().getParameterValues("value_array");
			//Iterate data source per template
			for(RepTemplateSource rep:new RepTemplateSource().getAllDataSources(rt.getId())){
				xml += this.getData(rep,name_array,value_array);
			}
			xml = this.genXml(xml,rt,(type!=null && !type.equals(""))?Integer.parseInt(type):0);
			this.format = Response.FORMAT_XML;
			return this.renderView(xml);
		}
		return this.redirect("igrp", "ErrorPage", "exception");
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/	
	public Response actionGetContraprova() throws IOException{
		String contraprova = Igrp.getInstance().getRequest().getParameter("p_contraprova");
		RepInstance ri = new RepInstance().find().andWhere("contra_prova", "=",contraprova).one();
		String content = "";
		if(ri!=null){
			content = new String(ri.getXml_content().getC_lob_content());
			return this.renderView(content);
		}
		return this.redirect("igrp", "ErrorPage", "exception");
	}
	
	public Response actionSaveEditTemplate(){
		if(Igrp.getInstance().getRequest().getMethod().equalsIgnoreCase("post")){
			String id_ = Igrp.getInstance().getRequest().getParameter("p_id");
			String code_ = Igrp.getInstance().getRequest().getParameter("p_code");
			String title_ = Igrp.getInstance().getRequest().getParameter("p_title");
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
		}
		return this.renderView(FlashMessage.MSG_ERROR);
	}
		
	//Get xsl content of report
	public Response actionGetXsl() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
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
		String p_code = Igrp.getInstance().getRequest().getParameter("p_code");
		String []name_array = Igrp.getInstance().getRequest().getParameterValues("name_array");
		String []value_array = Igrp.getInstance().getRequest().getParameterValues("value_array");
		String params = "";
		if(name_array!=null && value_array!=null && name_array.length > 0 && value_array.length > 0){
			for(String n:name_array)
				params += ("&name_array="+n);
			for(String v:value_array)
				params += ("&value_array="+v);
		}
		RepTemplate rt = new RepTemplate().find().andWhere("code", "=", p_code).one();
		if(rt!=null)
			return this.redirect("igrp_studio", "WebReport", "preview&p_id="+rt.getId()+"&p_type=1"+params);
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
		}
		return "";
	}


	private String getDataForPage(RepTemplateSource rep) {
		Action ac = new Action().findOne(rep.getRepSource().getType_fk());
		if(ac!=null){
			String actionName = "";
			for(String aux : ac.getAction().split("-"))
				actionName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
			actionName = "action" + actionName;
			String controllerPath = this.getConfig().getPackage(ac.getApplication().getDad(), ac.getPage(), ac.getAction());
			Object ob = Page.loadPage(controllerPath,actionName);
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
		String rowsXml = rep.getRepSource().getSqlQueryToXml(query, name_array, value_array,rep.getRepTemplate(),rep.getRepSource());
		return this.processPreview(rowsXml,rep,rep.getRepSource());
	}


	//Load report, load all configuration of report
	public Response actionLoadTemplate() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("id");
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
		}
		return "";
	}
	
	
	/*Gen final XML for Web Report
	 * 
	 */
	private String genXml(String contentXml,RepTemplate rt,int type){
		String contra_prova = GUIDGenerator.getGUIDUpperCase();
		int user_id = Igrp.getInstance().getUser().getIdentity().getIdentityId();
		User user = new User();
		user = user.findOne(user_id);
		String content = this.getReport(contentXml, new Config().getResolveUrl("igrp_studio","web-report","get-xsl")+"&amp;dad=igrp&amp;p_id="+rt.getXsl_content().getId(), contra_prova, rt,user);
		if(type==1){
			RepInstance ri = new RepInstance();
			ri.setContra_prova(contra_prova);
			ri.setApplication(rt.getApplication());
			ri.setDt_created(new Date(System.currentTimeMillis()));
			ri.setReference(contra_prova);
			ri.setTemplate(rt);
			ri.setUser(user);
			CLob xsl = new CLob("", "application/xsl", rt.getXsl_content().getC_lob_content(), ri.getDt_created().toString());
			xsl = xsl.insert();
			
			if(xsl!=null){
				content = this.getReport(contentXml, new Config().getResolveUrl("igrp_studio","web-report","get-xsl")+"&amp;dad=igrp&amp;p_id="+xsl.getId(), contra_prova, rt,user);
				CLob xml = new CLob("", "application/xml", content.getBytes(), ri.getDt_created().toString());
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
			xmlW.setElement("link_qrcode",new Config().getResolveUrl("igrp_studio","web-report","contraprova")+ "&p_contraprova="+contra_prova);
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
		xml.endElement();
		return xml.toString();
	}
	/*----#END-PRESERVED-AREA----*/
}
