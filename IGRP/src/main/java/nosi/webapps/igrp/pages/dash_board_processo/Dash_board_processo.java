package nosi.webapps.igrp.pages.dash_board_processo;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Dash_board_processo extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	
	private List<Table_2> table_2 = new ArrayList<>();	
	public void setTable_2(List<Table_2> table_2){
		this.table_2 = table_2;
	}
	public List<Table_2> getTable_2(){
		return this.table_2;
	}

	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}


	public static class Table_2 extends IGRPTable.Table{
		private String nome_processo;
		private String process_id;
		private String process_key;
		public void setNome_processo(String nome_processo){
			this.nome_processo = nome_processo;
		}
		public String getNome_processo(){
			return this.nome_processo;
		}

		public void setProcess_id(String process_id){
			this.process_id = process_id;
		}
		public String getProcess_id(){
			return this.process_id;
		}

		public void setProcess_key(String process_key){
			this.process_key = process_key;
		}
		public String getProcess_key(){
			return this.process_key;
		}

	}

	public void loadTable_2(BaseQueryInterface query) {
		this.setTable_2(this.loadTable(query,Table_2.class));
	}

}
