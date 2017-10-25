/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.listaenv;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class ListaEnv extends Model{			
	@RParam(rParamName = "p_dad")
	private String dad;
	@RParam(rParamName = "p_nome")
	private String nome;
	
	public String getNome() {
		return nome;
	}
	public void setName(String nome) {
		this.nome = nome;
	}
	
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}


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
		private int status_check;
		
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
		public int getStatus_check() {
			return status_check;
		}
		public void setStatus_check(int status_check) {
			this.status_check = status_check;
		}
		
	}
}
/*-------------------------*/