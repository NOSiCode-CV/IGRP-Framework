/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.listapage;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class ListaPage extends Model{		
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
		private String versao_page;
		private int status_page;
		private int status_page_check;
		private int id;
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

		public void setVersao_page(String versao_page){
			this.versao_page = versao_page;
		}
		public String getVersao_page(){
			return this.versao_page;
		}

		public void setStatus_page(int status_page){
			this.status_page = status_page;
		}
		public int getStatus_page(){
			return this.status_page;
		}

		public int getStatus_page_check() {
			return status_page_check;
		}
		public void setStatus_page_check(int status_page_check) {
			this.status_page_check = status_page_check;
		}
		public void setId(int p_id_page){
			this.id = p_id_page;
		}
		public int getId(){
			return this.id;
		}

	}
}
/*-------------------------*/