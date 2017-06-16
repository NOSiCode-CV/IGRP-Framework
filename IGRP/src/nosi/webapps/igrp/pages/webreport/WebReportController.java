/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.webreport;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.RepSource;

import java.io.IOException;

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
				RepSource rep = new RepSource();
				rep.setEnv_fk(Integer.parseInt(p_env_fk));
				view.datasorce_app.setValue(rep.getListSources());
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
	public void actionSaveEditTemplate(){
		
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
			System.out.println(FileHelper.convertToString(fileXsl));
			System.out.println(FileHelper.convertToString(fileTxt));
//			System.out.println(title);
//			System.out.println(code);
//			System.out.println(env_fk);
//			for(String ds:data_sources){
//				System.out.println(ds);
//			}
		}
	}
	
	public void actionPreview(){
		System.out.println(Igrp.getInstance().getRequest());
	}
	/*---- End ----*/
}
