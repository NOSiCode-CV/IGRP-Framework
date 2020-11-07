package cv.nosi.webapps.igrp_studio.pages.sql_tools;

import java.util.ArrayList;
import java.util.List;

import cv.nosi.core.gui.components.IGRPLink;
import cv.nosi.core.gui.components.IGRPTable;
import cv.nosi.core.webapp.annotation.RParam;
import cv.nosi.core.webapp.mvc.Model;
import cv.nosi.core.webapp.util.helpers.database.BaseQueryInterface;
import cv.nosi.core.webapp.util.report.Report;

public class Sql_tools extends Model{		

	@RParam(rParamName = "p_help")
	private IGRPLink help;
	@RParam(rParamName = "p_help_desc")
	private String help_desc;

	@RParam(rParamName = "p_application")
	private String application;

	@RParam(rParamName = "p_data_source")
	private String data_source;

	@RParam(rParamName = "p_separator_1")
	private String separator_1;

	@RParam(rParamName = "p_sql")
	private String sql;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}

	
	public IGRPLink setHelp(String app,String page,String action){
		this.help = new IGRPLink(app,page,action);
		return this.help;
	}
	public IGRPLink getHelp(){
		return this.help;
	}
	public void setHelp_desc(String help_desc){
		this.help_desc = help_desc;
	}
	public String getHelp_desc(){
		return this.help_desc;
	}
	public IGRPLink setHelp(String link){
		this.help = new IGRPLink(link);
		return this.help;
	}
	public IGRPLink setHelp(Report link){
		this.help = new IGRPLink(link);
		return this.help;
	}
	
	public void setApplication(String application){
		this.application = application;
	}
	public String getApplication(){
		return this.application;
	}
	
	public void setData_source(String data_source){
		this.data_source = data_source;
	}
	public String getData_source(){
		return this.data_source;
	}
	
	public void setSeparator_1(String separator_1){
		this.separator_1 = separator_1;
	}
	public String getSeparator_1(){
		return this.separator_1;
	}
	
	public void setSql(String sql){
		this.sql = sql;
	}
	public String getSql(){
		return this.sql;
	}


	public static class Table_1 extends IGRPTable.Table{
	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
