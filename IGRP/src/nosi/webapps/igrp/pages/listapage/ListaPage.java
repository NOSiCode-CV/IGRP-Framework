/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.listapage;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class ListaPage extends Model{		
	@RParam(rParamName = "p_env_fk")
	private String env_fk;
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
	
	public void setEnv_fk(String env_fk){
		this.env_fk = env_fk;
	}
	public String getEnv_fk(){
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
		private String page;
		private String page_descr;
		private String action_descr;
		private String version;
		private int status;
		private int p_id;
		
		public int getP_id() {
			return p_id;
		}
		public void setP_Id(int id) {
			this.p_id = id;
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

		public void setAction_descr(String action_descr){
			this.action_descr = action_descr;
		}
		public String getAction_descr(){
			return this.action_descr;
		}

		public void setVersion(String version){
			this.version = version;
		}
		public String getVersion(){
			return this.version;
		}

		public void setStatus(int status){
			this.status = status;
		}
		public int getStatus(){
			return this.status;
		}

	}
}
/*-------------------------*/