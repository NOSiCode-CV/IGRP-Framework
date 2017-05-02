/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.listaenv;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class ListaEnv extends Model{		

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}


	public class Table_1{
		private int id;
		private String dad;
		private String name;
		private String host;
		private int status;		
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
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

		public void setHost(String host){
			this.host = host;
		}
		public String getHost(){
			return this.host;
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