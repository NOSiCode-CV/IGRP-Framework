/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.novaorganica;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class NovaOrganica extends Model{		
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_ativo")
	private String ativo;
	@RParam(rParamName = "p_organica_pai")
	private String organica_pai;
	
	public void setCodigo(String codigo){
		this.codigo = codigo;
	}
	public String getCodigo(){
		return this.codigo;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setAtivo(String ativo){
		this.ativo = ativo;
	}
	public String getAtivo(){
		return this.ativo;
	}
	
	public void setOrganica_pai(String organica_pai){
		this.organica_pai = organica_pai;
	}
	public String getOrganica_pai(){
		return this.organica_pai;
	}


}
/*-------------------------*/