package nosi.webapps.igrp_studio.pages.listaenv;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
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
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}


	public static class Table_1{
		private int status;
		private int status_check;
		private String name;
		private String dad;
		private String t_page_builder;
		private String t_page_builder_desc;
		private String p_id;
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

		public void setName(String name){
			this.name = name;
		}
		public String getName(){
			return this.name;
		}

		public void setDad(String dad){
			this.dad = dad;
		}
		public String getDad(){
			return this.dad;
		}

		public void setT_page_builder(String app,String page,String action){
			this.t_page_builder = new Config().getResolveUrl(app, page, action);
		}
		public String getT_page_builder(){
			return this.t_page_builder;
		}
		public void setT_page_builder_desc(String t_page_builder_desc){
			this.t_page_builder_desc = t_page_builder_desc;
		}
		public String getT_page_builder_desc(){
			return this.t_page_builder_desc;
		}

		public void setP_id(String p_id){
			this.p_id = p_id;
		}
		public String getP_id(){
			return this.p_id;
		}

	}
}
