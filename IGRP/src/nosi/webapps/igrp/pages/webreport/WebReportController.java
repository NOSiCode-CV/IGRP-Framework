/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.webreport;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateParam;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Part;

/*---- Import your packages here... ----*//*---- End ----*/

public class WebReportController extends Controller {		


	public void actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		WebReport model = new WebReport();
		model.setPage_title_text("<![CDATA[Web Report]]>");
		WebReportViewV2_2 view = new WebReportViewV2_2(model);
		model.setLink_add_source("www.web-report.cv");
//		WebReportView view = new WebReportView(model);
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
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
		}
		view.env_fk.setValue(new Application().getListApps());
		view.link_add_source.setValue("webapps?r=igrp/data-source/index&amp;dad=igrp");
		view.link_source.setValue("webapps?r=igrp/data-source/get-data-source&amp;dad=igrp");
		view.edit_name_report.setValue("webapps?r=igrp/web-report/save-edit-template&amp;dad=igrp");
		this.renderView(view);
		/*---- End ----*/
	}

	/*---- Insert your actions here... ----*/
	public void actionSaveEditTemplate() throws IOException{
		
		System.out.println("Editing...");
	}
	
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
	public void actionSaveGenWebReport() throws IllegalArgumentException, IllegalAccessException, IOException, ServletException{
		if(Igrp.getInstance().getRequest().getMethod().toLowerCase().equals("post")){
			Part fileXsl = Igrp.getInstance().getRequest().getPart("p_xslreport");
			Part fileTxt = Igrp.getInstance().getRequest().getPart("p_textreport");
			String title = Igrp.getInstance().getRequest().getParameter("p_title");
			String code = Igrp.getInstance().getRequest().getParameter("p_code");
			String env_fk = Igrp.getInstance().getRequest().getParameter("p_env_fk");
			String [] data_sources = Igrp.getInstance().getRequest().getParameterValues("p_datasorce_app");
			String [] keys = Igrp.getInstance().getRequest().getParameterValues("p_key");
			if(fileTxt!=null && fileXsl!=null && title!=null && code!=null && env_fk!=null){
				CLob clob_xsl = new CLob();
				CLob clob_html = new CLob();
				clob_xsl.setC_lob_content(FileHelper.convertToString(fileXsl));
				clob_xsl.setDt_created(new Date(System.currentTimeMillis()));
				clob_xsl = clob_xsl.insert();
				clob_html.setC_lob_content(FileHelper.convertToString(fileTxt));
				clob_html.setDt_created(new Date(System.currentTimeMillis()));
				clob_html = clob_html.insert();
				
				RepTemplate rt = new RepTemplate();
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
				if(keys!=null && keys.length>0){
					for(String key:keys){
						RepTemplateParam rtp = new RepTemplateParam();
						rtp.setId_template(rt.getId());
						rtp.setParameter(key);
						rtp.insert();
					}
				}
				if(data_sources!=null && data_sources.length>0){
					for(String dts:data_sources){
						RepTemplate rt1 = new RepTemplate();
						rt1.insertTemDataSource(rt.getId(), Integer.parseInt(dts));
					}
				}
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Operação efectuada com sucesso");
			}
		}
	}
	
	public void actionPreview(){
		System.out.println(Igrp.getInstance().getRequest());
	}
	/*---- End ----*/
}
