package nosi.webapps.tutorial.pages.defaultpage;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class DefaultPage extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_infopanel_1_title")
	private String infopanel_1_title;
	@RParam(rParamName = "p_infopanel_1_val")
	private String infopanel_1_val;
	@RParam(rParamName = "p_infopanel_1_url")
	private String infopanel_1_url;
	@RParam(rParamName = "p_infopanel_1_bg")
	private String infopanel_1_bg;
	@RParam(rParamName = "p_infopanel_1_icn")
	private String infopanel_1_icn;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setInfopanel_1_title(String infopanel_1_title){
		this.infopanel_1_title = infopanel_1_title;
	}
	public String getInfopanel_1_title(){
		return this.infopanel_1_title;
	}
	
	public void setInfopanel_1_val(String infopanel_1_val){
		this.infopanel_1_val = infopanel_1_val;
	}
	public String getInfopanel_1_val(){
		return this.infopanel_1_val;
	}
	
	public void setInfopanel_1_url(String infopanel_1_url){
		this.infopanel_1_url = infopanel_1_url;
	}
	public String getInfopanel_1_url(){
		return this.infopanel_1_url;
	}
	
	public void setInfopanel_1_bg(String infopanel_1_bg){
		this.infopanel_1_bg = infopanel_1_bg;
	}
	public String getInfopanel_1_bg(){
		return this.infopanel_1_bg;
	}
	
	public void setInfopanel_1_icn(String infopanel_1_icn){
		this.infopanel_1_icn = infopanel_1_icn;
	}
	public String getInfopanel_1_icn(){
		return this.infopanel_1_icn;
	}



}
