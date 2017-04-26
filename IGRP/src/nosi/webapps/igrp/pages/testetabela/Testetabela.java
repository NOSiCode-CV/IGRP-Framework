/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.testetabela;
import java.util.ArrayList;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Testetabela extends Model{	
	private ArrayList<Table1> table_1 = new ArrayList<>();
	
	@RParam(rParamName = "p_n_bi")
	private float n_bi;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_data_nascimento")
	private String data_nascimento;
	
	public void setN_bi(float n_bi){
		this.n_bi = n_bi;
	}
	public float getN_bi(){
		return this.n_bi;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setData_nascimento(String data_nascimento){
		this.data_nascimento = data_nascimento;
	}
	public String getData_nascimento(){
		return this.data_nascimento;
	}
	
	public void setTable1(Table1 table1){
		this.table_1.add(table1);
	}
	
	public ArrayList<Table1> getTable_1(){
		return this.table_1;
	}
	
	public class Table1{
		private float n_bi;
		private String nome;
		private String data_nascimento;
		
		public void setN_bi(float n_bi){
			this.n_bi = n_bi;
		}
		public float getN_bi(){
			return this.n_bi;
		}
		
		public void setNome(String nome){
			this.nome = nome;
		}
		public String getNome(){
			return this.nome;
		}
		
		public void setData_nascimento(String data_nascimento){
			this.data_nascimento = data_nascimento;
		}
		public String getData_nascimento(){
			return this.data_nascimento;
		}
	}

}
/*-------------------------*/