/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.novaorganica;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class NovaOrganica extends Model{	
	
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	
	@RParam(rParamName = "p_codigo")
	private String codigo;
	
	@RParam(rParamName = "p_nome")
	private String nome;
	
	@RParam(rParamName = "p_aplicacao")
	private int aplicacao;
	
	@RParam(rParamName = "p_ativo")
	private int ativo;
	
	@RParam(rParamName = "p_organica_pai")
	private int organica_pai;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
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
	
	public void setAplicacao(int aplicacao){
		this.aplicacao = aplicacao;
	}
	public int getAplicacao(){
		return this.aplicacao;
	}
	
	public void setAtivo(int ativo){
		this.ativo = ativo;
	}
	public int getAtivo(){
		return this.ativo;
	}
	
	public void setOrganica_pai(int organica_pai){
		this.organica_pai = organica_pai;
	}
	public int getOrganica_pai(){
		return this.organica_pai;
	}


}
/*-------------------------*/