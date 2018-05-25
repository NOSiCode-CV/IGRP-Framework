package nosi.webapps.igrp_studio.pages.sql_tools;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;



import java.util.ArrayList;
import java.util.List;

public class Sql_tools extends Model{		
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
	@RParam(rParamName = "p_table_1_id")
	private String[] p_table_1_id;
	@RParam(rParamName = "p_table_1_del")
	private String[] p_table_1_del;
	
	public void setP_table_1_id(String[] p_table_1_id){
		this.p_table_1_id = p_table_1_id;
	}
	public String[] getP_table_1_id(){
		return this.p_table_1_id;
	}
	
	public void setP_table_1_del(String[] p_table_1_del){
		this.p_table_1_del = p_table_1_del;
	}
	public String[] getP_table_1_del(){
		return this.p_table_1_del;
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
