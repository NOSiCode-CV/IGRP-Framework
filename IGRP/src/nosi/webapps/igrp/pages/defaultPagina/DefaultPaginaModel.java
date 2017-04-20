package nosi.webapps.igrp.pages.defaultPagina;

import nosi.core.webapp.Model;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public class DefaultPaginaModel extends Model{
	
	private int cod;
	private String nome;
	private short []contato;
	private DefaultPaginaModel model1;
	
	
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

	public short[] getContato() {
		return contato;
	}
	
	public void setContato(short[] contato) {
		this.contato = contato;
	}
	
}
