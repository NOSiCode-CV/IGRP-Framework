package nosi.webapps.igrp.pages.novodominio;
import nosi.core.config.Config;
import nosi.core.webapp.Model;import java.sql.Date;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.QueryHelper;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class NovoDominio extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_dominio")
	private String dominio;
	@RParam(rParamName = "p_valor")
	private String valor;
	@RParam(rParamName = "p_description")
	private String description;
	@RParam(rParamName = "p_estado")
	private String estado;
	@RParam(rParamName = "p_ordem")
	private int ordem;
	@RParam(rParamName = "p_id")
	private int p_id;
	
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
	
	public void setDescription(String description){
		this.description = description;
	}
	public String getDescription(){
		return this.description;
	}
	
	public void setEstado(String estado){
		this.estado = estado;
	}
	public String getEstado(){
		return this.estado;
	}
	
	public void setOrdem(int ordem){
		this.ordem = ordem;
	}
	public int getOrdem(){
		return this.ordem;
	}
	
	public void setP_id(int p_id){
		this.p_id = p_id;
	}
	public int getP_id(){
		return this.p_id;
	}



}
