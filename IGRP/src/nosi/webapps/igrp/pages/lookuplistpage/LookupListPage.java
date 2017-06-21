/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.lookuplistpage;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class LookupListPage extends Model{		
	@RParam(rParamName = "p_env_fk")
	private int env_fk;
	@RParam(rParamName = "p_page")
	private String page;
	@RParam(rParamName = "p_page_descr")
	private String page_descr;

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}
	
	public void setEnv_fk(int env_fk){
		this.env_fk = env_fk;
	}
	public int getEnv_fk(){
		return this.env_fk;
	}
	
	public void setPage(String page){
		this.page = page;
	}
	public String getPage(){
		return this.page;
	}
	
	public void setPage_descr(String page_descr){
		this.page_descr = page_descr;
	}
	public String getPage_descr(){
		return this.page_descr;
	}


	public class Table_1{
		private String nome_page;
		private String descricao_page;
		private String nome_page_desc;
		private String descricao_page_desc;
		private int p_id;
		public void setNome_page(String nome_page){
			this.nome_page = nome_page;
		}
		public String getNome_page(){
			return this.nome_page;
		}

		public void setDescricao_page(String descricao_page){
			this.descricao_page = descricao_page;
		}
		public String getDescricao_page(){
			return this.descricao_page;
		}

		public void setP_id(int p_id){
			this.p_id = p_id;
		}
		public int getP_id(){
			return this.p_id;
		}
		public String getNome_page_desc() {
			return nome_page_desc;
		}
		public void setNome_page_desc(String nome_page_desc) {
			this.nome_page_desc = nome_page_desc;
		}
		public String getDescricao_page_desc() {
			return descricao_page_desc;
		}
		public void setDescricao_page_desc(String descricao_page_desc) {
			this.descricao_page_desc = descricao_page_desc;
		}

	}
}
/*-------------------------*/