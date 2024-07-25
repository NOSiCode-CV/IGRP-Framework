package nosi.webapps.igrp.pages.etapaaccess;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Etapaaccess extends Model{		

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


	public static class Table_1 extends IGRPTable.Table{
		private String id;
		private String id_check;
		private String descricao;
		private String processid;
		private String task_id;
		private Integer env_fk;
		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}
		public void setId_check(String id_check){
			this.id_check = id_check;
		}
		public String getId_check(){
			return this.id_check;
		}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

		public void setProcessid(String processid){
			this.processid = processid;
		}
		public String getProcessid(){
			return this.processid;
		}

		public void setTask_id(String task_id){
			this.task_id = task_id;
		}
		public String getTask_id(){
			return this.task_id;
		}

		public void setEnv_fk(Integer env_fk){
			this.env_fk = env_fk;
		}
		public Integer getEnv_fk(){
			return this.env_fk;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}