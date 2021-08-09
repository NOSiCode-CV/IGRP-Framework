package nosi.webapps.igrp_studio.pages.config_error_msg;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

import nosi.core.validator.constraints.*;

public class Config_error_msg extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@NotNull()
	@RParam(rParamName = "p_application")
	private String application;

	@NotNull()
	@RParam(rParamName = "p_msg")
	private String msg;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}

	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setApplication(String application){
		this.application = application;
	}
	public String getApplication(){
		return this.application;
	}
	
	public void setMsg(String msg){
		this.msg = msg;
	}
	public String getMsg(){
		return this.msg;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String application_tab;
		private String msg_table;
		private String id_config;
		public void setApplication_tab(String application_tab){
			this.application_tab = application_tab;
		}
		public String getApplication_tab(){
			return this.application_tab;
		}

		public void setMsg_table(String msg_table){
			this.msg_table = msg_table;
		}
		public String getMsg_table(){
			return this.msg_table;
		}

		public void setId_config(String id_config){
			this.id_config = id_config;
		}
		public String getId_config(){
			return this.id_config;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
