package nosi.webapps.igrp.pages.defaultpagina;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public class DefaultpaginaModel extends Model{
	
	@RParam(rParamName = "p_cod")
	private int cod;
	
	@RParam(rParamName = "p_nome")
	private String nome;
	
	@RParam(rParamName = "p_contato")
	private short []contato;
	
	
	public DefaultpaginaModel(){
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
