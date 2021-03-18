package nosi.webapps.igrp.pages.icons_list;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Icons_list extends Model{		

	@RParam(rParamName = "p_fwl_search")
	private String fwl_search;

	@RParam(rParamName = "p_choose_icon")
	private String choose_icon;
	
	public void setFwl_search(String fwl_search){
		this.fwl_search = fwl_search;
	}
	public String getFwl_search(){
		return this.fwl_search;
	}
	
	public void setChoose_icon(String choose_icon){
		this.choose_icon = choose_icon;
	}
	public String getChoose_icon(){
		return this.choose_icon;
	}



}
