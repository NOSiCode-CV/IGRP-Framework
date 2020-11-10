package cv.nosi.webapps.igrp.pages.locketapa;

import java.util.ArrayList;
import java.util.List;

import cv.nosi.core.gui.components.IGRPTable;
import cv.nosi.core.webapp.annotation.RParam;
import cv.nosi.core.webapp.mvc.Model;
import cv.nosi.core.webapp.util.helpers.database.BaseQueryInterface;

public class Locketapa extends Model{		

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
		private int codigo;
		private int codigo_check;
		private String organica;
		private String perfil;
		private String processid;
		private String taskid;
		public void setCodigo(int codigo){
			this.codigo = codigo;
		}
		public int getCodigo(){
			return this.codigo;
		}
		public void setCodigo_check(int codigo_check){
			this.codigo_check = codigo_check;
		}
		public int getCodigo_check(){
			return this.codigo_check;
		}

		public void setOrganica(String organica){
			this.organica = organica;
		}
		public String getOrganica(){
			return this.organica;
		}

		public void setPerfil(String perfil){
			this.perfil = perfil;
		}
		public String getPerfil(){
			return this.perfil;
		}

		public void setProcessid(String processid){
			this.processid = processid;
		}
		public String getProcessid(){
			return this.processid;
		}

		public void setTaskid(String taskid){
			this.taskid = taskid;
		}
		public String getTaskid(){
			return this.taskid;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
