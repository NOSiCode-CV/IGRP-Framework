package nosi.webapps.igrp.pages.novaorganica;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class NovaOrganica extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@RParam(rParamName = "p_documento")
	private IGRPLink documento;
	@RParam(rParamName = "p_documento_desc")
	private String documento_desc;

	@RParam(rParamName = "p_nome")
	private String nome;

	@RParam(rParamName = "p_codigo")
	private String codigo;

	@RParam(rParamName = "p_ativo")
	private int ativo;
	@RParam(rParamName = "p_ativo_check")
	private int ativo_check;

	@RParam(rParamName = "p_nada")
	private String nada;

	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;

	@RParam(rParamName = "p_organizacao_pai")
	private String organizacao_pai;

	@RParam(rParamName = "p_sep_igrp_plsql")
	private String sep_igrp_plsql;

	@RParam(rParamName = "p_plsql_code")
	private String plsql_code;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public IGRPLink setDocumento(String app,String page,String action){
		this.documento = new IGRPLink(app,page,action);
		return this.documento;
	}
	public IGRPLink getDocumento(){
		return this.documento;
	}
	public void setDocumento_desc(String documento_desc){
		this.documento_desc = documento_desc;
	}
	public String getDocumento_desc(){
		return this.documento_desc;
	}
	public IGRPLink setDocumento(String link){
		this.documento = new IGRPLink(link);
		return this.documento;
	}
	public IGRPLink setDocumento(Report link){
		this.documento = new IGRPLink(link);
		return this.documento;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setCodigo(String codigo){
		this.codigo = codigo;
	}
	public String getCodigo(){
		return this.codigo;
	}
	
	public void setAtivo(int ativo){
		this.ativo = ativo;
	}
	public int getAtivo(){
		return this.ativo;
	}
	public void setAtivo_check(int ativo_check){
		this.ativo_check = ativo_check;
	}
	public int getAtivo_check(){
		return this.ativo_check;
	}
	
	public void setNada(String nada){
		this.nada = nada;
	}
	public String getNada(){
		return this.nada;
	}
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setOrganizacao_pai(String organizacao_pai){
		this.organizacao_pai = organizacao_pai;
	}
	public String getOrganizacao_pai(){
		return this.organizacao_pai;
	}
	
	public void setSep_igrp_plsql(String sep_igrp_plsql){
		this.sep_igrp_plsql = sep_igrp_plsql;
	}
	public String getSep_igrp_plsql(){
		return this.sep_igrp_plsql;
	}
	
	public void setPlsql_code(String plsql_code){
		this.plsql_code = plsql_code;
	}
	public String getPlsql_code(){
		return this.plsql_code;
	}



}
