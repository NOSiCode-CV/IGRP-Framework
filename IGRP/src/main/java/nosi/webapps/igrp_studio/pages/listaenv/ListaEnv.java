package nosi.webapps.igrp_studio.pages.listaenv;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class ListaEnv extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	
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
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}


	public static class Table_1 extends IGRPTable.Table{
		private int status;
		private int status_check;
		private IGRPLink name;
		private String name_desc;
		private String dad;
		private IGRPLink t_page_builder;
		private String t_page_builder_desc;
		private String id;
		public void setStatus(int status){
			this.status = status;
		}
		public int getStatus(){
			return this.status;
		}
		public void setStatus_check(int status_check){
			this.status_check = status_check;
		}
		public int getStatus_check(){
			return this.status_check;
		}

		public IGRPLink setName(String app,String page,String action){
			this.name = new IGRPLink(app,page,action);
			return this.name;
		}
		public IGRPLink getName(){
			return this.name;
		}
		public void setName_desc(String name_desc){
			this.name_desc = name_desc;
		}
		public String getName_desc(){
			return this.name_desc;
		}
	public IGRPLink setName(String link){
		this.name = new IGRPLink(link);
		return this.name;
	}
	public IGRPLink setName(Report link){
		this.name = new IGRPLink(link);
		return this.name;
	}

		public void setDad(String dad){
			this.dad = dad;
		}
		public String getDad(){
			return this.dad;
		}

		public IGRPLink setT_page_builder(String app,String page,String action){
			this.t_page_builder = new IGRPLink(app,page,action);
			return this.t_page_builder;
		}
		public IGRPLink getT_page_builder(){
			return this.t_page_builder;
		}
		public void setT_page_builder_desc(String t_page_builder_desc){
			this.t_page_builder_desc = t_page_builder_desc;
		}
		public String getT_page_builder_desc(){
			return this.t_page_builder_desc;
		}
	public IGRPLink setT_page_builder(String link){
		this.t_page_builder = new IGRPLink(link);
		return this.t_page_builder;
	}
	public IGRPLink setT_page_builder(Report link){
		this.t_page_builder = new IGRPLink(link);
		return this.t_page_builder;
	}

		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
