/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.novodominio;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class NovoDominio extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_dominio")
	private String dominio;
	@RParam(rParamName = "p_valor")
	private String valor;
	@RParam(rParamName = "p_significado")
	private String significado;
	@RParam(rParamName = "p_tipo")
	private String tipo;
	@RParam(rParamName = "p_tabela_view")
	private String tabela_view;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setDominio(String dominio){
		this.dominio = dominio;
	}
	public String getDominio(){
		return this.dominio;
	}
	
	public void setValor(String valor){
		this.valor = valor;
	}
	public String getValor(){
		return this.valor;
	}
	
	public void setSignificado(String significado){
		this.significado = significado;
	}
	public String getSignificado(){
		return this.significado;
	}
	
	public void setTipo(String tipo){
		this.tipo = tipo;
	}
	public String getTipo(){
		return this.tipo;
	}
	
	public void setTabela_view(String tabela_view){
		this.tabela_view = tabela_view;
	}
	public String getTabela_view(){
		return this.tabela_view;
	}


}
/*-------------------------*/