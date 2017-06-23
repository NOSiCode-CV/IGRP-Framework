/*Create Controller*/
package nosi.webapps.igrp.pages.webreport;

import nosi.core.webapp.Controller;
import java.io.IOException;

/*---- Import your packages here... ----*/
import nosi.core.config.Config;
import nosi.core.exception.NotFoundHttpException;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.TextField;
import nosi.core.gui.page.Page;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateParam;
import nosi.webapps.igrp.dao.User;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
/*---- End ----*/

public class WebReportController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		WebReport model = new WebReport();
		model.setPage_title_text("<![CDATA[Report Design]]>");
		WebReportViewV2_2 view = new WebReportViewV2_2(model);
//		WebReportView view = new WebReportView(model);
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			String id_ = Igrp.getInstance().getRequest().getParameter("p_id");
			String code_ = Igrp.getInstance().getRequest().getParameter("p_code");
			String title_ = Igrp.getInstance().getRequest().getParameter("p_title");
			
			String p_env_fk = Igrp.getInstance().getRequest().getParameter("p_env_fk");
			if(p_env_fk!=null && !p_env_fk.equals("")){
				RepSource ds = new RepSource();
				int env_fk = Integer.parseInt(p_env_fk);
				ds.setEnv_fk(env_fk);
				view.datasorce_app.setValue(ds.getListSources());
				RepTemplate  rep = new RepTemplate();
				rep.setEnv_fk(env_fk);
				List<WebReport.Table_1> data = new ArrayList<>(); 
				for(Object obj: rep.getAll()){
					RepTemplate r =(RepTemplate) obj;
					WebReport.Table_1 t1 = new WebReport().new Table_1();
					RepTemplateParam rtp = new RepTemplateParam();
					rtp.setId_template(t1.getId());
					String params = "";
					//Get parameters
					for(Object param:rtp.getAll()){
						RepTemplateParam p = (RepTemplateParam) param;
						params += "&amp;"+p.getParameter().toLowerCase()+"=?";
					}
					t1.setDescricao("r=igrp/web-report/get-link-report"+params);
					t1.setLink("webapps?r=igrp/web-report/load-template&amp;id="+r.getId()+"&amp;dad=igrp");
					t1.setId(r.getId());
					t1.setTitle(r.getName());
					t1.setLink_desc(r.getCode());
					data.add(t1);
				}
				view.table.addData(data);
			}
			
			if(id_!=null && !id_.equals("")){
				RepTemplate rt = new RepTemplate();
				rt.setId(Integer.parseInt(id_));
				rt = (RepTemplate) rt.getOne();
				rt.setCode(code_);
				rt.setName(title_);
				rt.setDt_updated(new Date(System.currentTimeMillis()));
				rt.update();
			}
		}
		view.env_fk.setValue(new Application().getListApps());
		view.link_add_source.setValue("webapps?r=igrp/data-source/index&amp;dad=igrp");
		view.link_source.setValue("webapps?r=igrp/data-source/get-data-source&amp;dad=igrp");
		view.edit_name_report.setValue("webapps?r=igrp/web-report/save-edit-template&amp;dad=igrp");
		view.prm_target.setValue("_blank");
		return this.renderView(view);
		/*---- End ----*/
	}

	/*---- Insert your actions here... ----*/
	public void actionSaveEditTemplate() throws IOException{
		
		System.out.println("Editing...");
	}
	
	//Load report, load all configuration of report
	public PrintWriter actionLoadTemplate() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("id");
		String json = "";
		if(id!=null && !id.equals("")){
			RepTemplate rt = new RepTemplate();
			rt.setId(Integer.parseInt(id));
			rt = (RepTemplate) rt.getOne();
			CLob clob = new CLob();
			clob.setId(rt.getHtml_content_fk());
			clob = (CLob) clob.getOne();
			Igrp.getInstance().getResponse().setContentType("application/json");
			String data_sources = "";
			for(Object obj:rt.getAllDataSources()){
				RepTemplate r = (RepTemplate) obj;
				data_sources+=""+r.getData_source_id()+",";
			}
			data_sources = (!data_sources.equals(""))?data_sources.substring(0, data_sources.length()-1):"";
			json = "{\"textreport\":\""+clob.getC_lob_content()+"\",\"datasorce_app\":\""+data_sources+"\"}";
		}
		return Igrp.getInstance().getResponse().getWriter().append(json);
	}
	
	public void actionGetLinkReport(){
		
	}
	
	//Save report
	public PrintWriter actionSaveGenWebReport() throws IllegalArgumentException, IllegalAccessException, IOException, ServletException{
		if(Igrp.getInstance().getRequest().getMethod().toLowerCase().equals("post")){
			Part fileXsl = Igrp.getInstance().getRequest().getPart("p_xslreport");
			Part fileTxt = Igrp.getInstance().getRequest().getPart("p_textreport");
			String title = Igrp.getInstance().getRequest().getParameter("p_title");
			String code = Igrp.getInstance().getRequest().getParameter("p_code");
			String env_fk = Igrp.getInstance().getRequest().getParameter("p_env_fk");
			String id = Igrp.getInstance().getRequest().getParameter("p_id");			
			String [] data_sources = Igrp.getInstance().getRequest().getParameterValues("p_datasorce_app");
			String [] keys = Igrp.getInstance().getRequest().getParameterValues("p_key");
			
			if(fileTxt!=null && fileXsl!=null && env_fk!=null){
				CLob clob_xsl = new CLob();
				CLob clob_html = new CLob();
				RepTemplate rt = new RepTemplate();
				//Save report if not exist
				if(title!=null && code!=null && (id==null || id.equals(""))){
					clob_xsl.setC_lob_content(FileHelper.convertToString(fileXsl));
					clob_xsl.setDt_created(new Date(System.currentTimeMillis()));
					clob_xsl = clob_xsl.insert();
					clob_html.setC_lob_content(FileHelper.convertToString(fileTxt));
					clob_html.setDt_created(new Date(System.currentTimeMillis()));
					clob_html = clob_html.insert();
					rt.setCode(code);
					rt.setName(title);
					rt.setEnv_fk(Integer.parseInt(env_fk));
					rt.setXsl_content_fk(clob_xsl.getId());
					rt.setHtml_content_fk(clob_html.getId());
					rt.setDt_created(new Date(System.currentTimeMillis()));
					rt.setDt_updated(new Date(System.currentTimeMillis()));
					rt.setUser_created_fk(Igrp.getInstance().getUser().getIdentity().getIdentityId());
					rt.setUser_updated_fk(Igrp.getInstance().getUser().getIdentity().getIdentityId());
					rt.setStatus(1);
					rt = rt.insert();	
				}
				//Update report if is exist
				if(id!=null && !id.equals("")){
					rt.setId(Integer.parseInt(id));
					rt = (RepTemplate) rt.getOne();
					clob_xsl.setId(rt.getXsl_content_fk());
					clob_xsl = (CLob) clob_xsl.getOne();
					clob_html.setId(rt.getHtml_content_fk());
					clob_html = (CLob) clob_html.getOne();					
					clob_xsl.setC_lob_content(FileHelper.convertToString(fileXsl));
					clob_html.setC_lob_content(FileHelper.convertToString(fileTxt));
					clob_xsl.update();
					clob_html.update();
				}

				RepTemplateParam rtp = new RepTemplateParam();
				rtp.delete();//Delete old params of report
				if(keys!=null && keys.length>0){
					for(String key:keys){
						rtp = new RepTemplateParam();
						rtp.setId_template(rt.getId());
						rtp.setParameter(key.toLowerCase());
						rtp.insert();//insert news params of report
					}
				}
				rt.deleteTemplateDataSource(rt.getId());//Delete old data source of report
				if(data_sources!=null && data_sources.length>0){
					for(String dts:data_sources){
						RepTemplate rt1 = new RepTemplate();
						rt1.insertTemplateDataSource(rt.getId(), Integer.parseInt(dts));// insert news data sources of report
					}
				}	
				return Igrp.getInstance().getResponse().getWriter().append("<messages><message type=\"success\">Operacao Efetuada com sucesso</message></messages>");
			}
		}	
		return Igrp.getInstance().getResponse().getWriter().append("<messages><message type=\"error\">Operacao falhada</message></messages>");
	}
	
	//Preview the report
	public PrintWriter actionPreview() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		String xml = "";
		if(id!=null && !id.equals("")){
			RepTemplate rt = new RepTemplate();
			rt.setId(Integer.parseInt(id));
			rt = (RepTemplate) rt.getOne();
			//Iterate data source per template
			for(Object obj:rt.getAllDataSources()){
				RepTemplate rep = (RepTemplate) obj;
				RepSource rs = new RepSource();
				rs.setId(rep.getData_source_id());
				rs = (RepSource) rs.getOne();
				String query = rs.getType_query();
				String []name_array = Igrp.getInstance().getRequest().getParameterValues("name_array");
				String []value_array = Igrp.getInstance().getRequest().getParameterValues("value_array");
				query = rs.getType().equals("object")?"SELECT * FROM "+query:query;
				query += !query.toLowerCase().contains("where")?" WHERE 1=1 ":"";				
				query += this.applyParams(query,name_array,value_array,rep,rs);
				xml += this.processXml(xml,query,rep,rs);
			}
			xml = this.genXml(xml,rt);
		}
		return Igrp.getInstance().getResponse().getWriter().append(xml);
	}	
	
	private String processXml(String xml,String query, RepTemplate rt, RepSource rs) {
		if(rs.getType().equals("object") || rs.getType().equals("query")){
			HashMap<String, Object> data = rs.executeQuery(query);
			return transformDataToXml(rt.getName(), data,rs.queryToXmlRows(query));
		}else if(rs.getType().equals("page")){
			Action ac = new Action();
			ac.setId(rs.getType_fk());
			ac = (Action) ac.getOne();
			String actionName = "";
			for(String aux : ac.getAction().split("-"))
				actionName += aux.substring(0, 1).toUpperCase() + aux.substring(1);
			actionName = "action" + actionName;
			String controllerPath = "nosi.webapps." + ac.getEnv().getDad().toLowerCase() + ".pages." + ac.getPage().toLowerCase() + "." + ac.getPage() + "Controller";
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

	//Mapping parameters an applying filters
	private String applyParams(String query, String[] name_array, String[] value_array, RepTemplate rt,RepSource rs) {
		if(value_array!=null && value_array.length > 0){
			Map<String, String> paramsUrl = (Map<String, String>) IntStream.range(0, name_array.length).boxed().collect(Collectors.toMap(i -> name_array[i], i -> value_array[i]));
			Set<Entry<String,String>> pUrl = paramsUrl.entrySet();
			for(Entry<String, String> p:pUrl){
				String param = p.getKey().toString().toLowerCase();
				param = param.replaceAll("p_", "");
				RepTemplateParam rtp = new RepTemplateParam();
				rtp.setId_template(rt.getId());
				rtp.setParameter(param);
				rtp = (RepTemplateParam) rtp.getOne();
				if(rtp.getParameter()!=null && p.getValue()!=null){
					query = query.replaceAll(":p_"+rtp.getParameter(), p.getValue());
					query += " AND "+rtp.getParameter()+"='"+p.getValue()+"'";
				}
			}					
		}else{
			query =rs.getType().equals("query")?query.replaceAll("\\w+=:\\w+", "1=1"):query;
		}
		return query;
	}

	private String genXml(String xml,RepTemplate rt){
		XMLWritter xmlW = new XMLWritter("rows", "webapps?r=igrp/web-report/get-xsl&amp;dad=igrp&amp;p_id="+rt.getXsl_content_fk(), "");
		xmlW.startElement("print_report");
			xmlW.setElement("name_app",rt.getEnv().getDad());
			xmlW.setElement("img_app",rt.getEnv().getImg_src());
			xmlW.setElement("link_qrcode", "por adicionar");
			xmlW.setElement("img_brasao", "por adicionar");
			xmlW.setElement("name_brasao", "por adicionar");
			xmlW.setElement("data_print",new Date(System.currentTimeMillis()).toString());
			xmlW.setElement("name_contraprova", "por adicionar");
			xmlW.setElement("value_contraprova", "por adicionar");
			int user_id = Igrp.getInstance().getUser().getIdentity().getIdentityId();
			User user = new User();
			user.setId(user_id);
			user = (User) user.getOne();
			xmlW.setElement("user_print",user.getName());
			xmlW.setElement("link_img",Config.getLinkImg2_2());
			xmlW.setElement("template", "fdghjm");
		xmlW.endElement();
		xmlW.addXml(xml);
		xmlW.endElement();
		return xmlW.toString();
	}
	
	//Get xsl content of report
	public PrintWriter actionGetXsl() throws IOException{
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		String xsl = "";
		if(id!=null && !id.equals("")){
			CLob c = new CLob();
			c.setId(Integer.parseInt(id));
			c = (CLob) c.getOne();
			xsl = c.getC_lob_content();
		}
		return Igrp.getInstance().getResponse().getWriter().append(xsl);
	}
	
	//Transform data source into xml
	private String transformDataToXml(String title,HashMap<String, Object> data,String tableRows) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("content");
			xml.setElement("title", title);
			IGRPForm form = new IGRPForm("form",(float)2.1);
			Set<Entry<String,Object>> d = data.entrySet();
			IGRPTable table = new IGRPTable("table",(float)2.1);
			for(Entry<String,Object> c:d){
				Field f = new TextField(null,c.getKey().toUpperCase());
				f.propertie().clear();
				f.propertie().add("name","p_"+c.getKey().toLowerCase());
				f.setValue(c.getValue());
				form.addField(f);
				table.addField(f);
			}
			table.addRowsXMl(tableRows);
			xml.addXml(form.toString());
			xml.addXml(table.toString());
		xml.endElement();
		return xml.toString();
	}
	/*---- End ----*/
}


