package nosi.webapps.igrp.pages.listaenv;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class ListaEnv extends Model{		
	@RParam(rParamName = "p_dad")
	private String dad;
	@RParam(rParamName = "p_nome")
	private String nome;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}
	
	public void setDad(String dad){
		this.dad = dad;
	}
	public String getDad(){
		return this.dad;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}


	public static class Table_1{
		private String dad;
		private String name;
		private int status;
		private int status_check;
		private String p_id;
		public void setDad(String dad){
			this.dad = dad;
		}
		public String getDad(){
			return this.dad;
		}

		public void setName(String name){
			this.name = name;
		}
		public String getName(){
			return this.name;
		}

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

		public void setP_id(String p_id){
			this.p_id = p_id;
		}
		public String getP_id(){
			return this.p_id;
		}

	}
}
