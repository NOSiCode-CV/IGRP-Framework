package nosi.webapps.igrp.pages.defaultPagina;

import nosi.core.webapp.Model;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public class DefaultPaginaModel extends Model{
	
	private int cod;
	private String nome;
	private String []contato;
	
	
	public DefaultPaginaModel(){
		//this.nome = "imarcelf";
	}

	public int getCod() {
		return cod;
	}

	public void setCod(int cod) {
		this.cod = cod;
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String[] getContato() {
		return contato;
	}
	
	public void setContato(String[] contato) {
		this.contato = contato;
	}
	
}
