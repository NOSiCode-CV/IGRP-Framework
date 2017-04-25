package nosi.webapps.igrp.pages.page;

import nosi.core.webapp.Model;

public class Page extends Model{		
	private float n_bi;
	private String nome;
	private String morada;
	private String data_nascimento;
	private String sexo;
	
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
	
	public void setMorada(String morada){
		this.morada = morada;
	}
	public String getMorada(){
		return this.morada;
	}
	
	public void setData_nascimento(String data_nascimento){
		this.data_nascimento = data_nascimento;
	}
	public String getData_nascimento(){
		return this.data_nascimento;
	}
	
	public void setSexo(String sexo){
		this.sexo = sexo;
	}
	public String getSexo(){
		return this.sexo;
	}

}
