package nosi.webapps.igrp.pages.editartransacao;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class EditarTransacao extends Model{		
	@RParam(rParamName = "p_descricao")
	private String descricao;
	@RParam(rParamName = "p_status")
	private int status;
	@RParam(rParamName = "p_status_check")
	private int status_check;
	@RParam(rParamName = "p_nada")
	private String nada;
	@RParam(rParamName = "p_aplicacao")
	private int aplicacao;
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_id")
	private int p_id;
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	
	public void setDescricao(String descricao){
		this.descricao = descricao;
	}
	public String getDescricao(){
		return this.descricao;
	}
	
	public void setStatus(int status){
		this.status = status;
	}
	public int getStatus(){
		return this.status;
	}
	public void setStatus_check(int status_check){
		this.status_check = status_check;
	}
	public int getStatus_check(){
		return this.status_check;
	}
	
	public void setNada(String nada){
		this.nada = nada;
	}
	public String getNada(){
		return this.nada;
	}
	
	public void setAplicacao(int aplicacao){
		this.aplicacao = aplicacao;
	}
	public int getAplicacao(){
		return this.aplicacao;
	}
	
	public void setCodigo(String codigo){
		this.codigo = codigo;
	}
	public String getCodigo(){
		return this.codigo;
	}
	
	public void setP_id(int p_id){
		this.p_id = p_id;
	}
	public int getP_id(){
		return this.p_id;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}


}
