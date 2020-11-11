package nosi.webapps.igrp.pages.novoperfil;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class NovoPerfil extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@RParam(rParamName = "p_nome")
	private String nome;

	@RParam(rParamName = "p_codigo")
	private String codigo;

	@RParam(rParamName = "p_activo")
	private int activo;
	@RParam(rParamName = "p_activo_check")
	private int activo_check;

	@RParam(rParamName = "p_nada")
	private String nada;

	@RParam(rParamName = "p_aplicacao")
	private int aplicacao;

	@RParam(rParamName = "p_organica")
	private int organica;

	@RParam(rParamName = "p_perfil_pai")
	private int perfil_pai;

	@RParam(rParamName = "p_extras")
	private String extras;

	@RParam(rParamName = "p_primeira_pagina")
	private int primeira_pagina;

	@RParam(rParamName = "p_igrp_code")
	private String igrp_code;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
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
	
	public void setActivo(int activo){
		this.activo = activo;
	}
	public int getActivo(){
		return this.activo;
	}
	public void setActivo_check(int activo_check){
		this.activo_check = activo_check;
	}
	public int getActivo_check(){
		return this.activo_check;
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
	
	public void setOrganica(int organica){
		this.organica = organica;
	}
	public int getOrganica(){
		return this.organica;
	}
	
	public void setPerfil_pai(int perfil_pai){
		this.perfil_pai = perfil_pai;
	}
	public int getPerfil_pai(){
		return this.perfil_pai;
	}
	
	public void setExtras(String extras){
		this.extras = extras;
	}
	public String getExtras(){
		return this.extras;
	}
	
	public void setPrimeira_pagina(int primeira_pagina){
		this.primeira_pagina = primeira_pagina;
	}
	public int getPrimeira_pagina(){
		return this.primeira_pagina;
	}
	
	public void setIgrp_code(String igrp_code){
		this.igrp_code = igrp_code;
	}
	public String getIgrp_code(){
		return this.igrp_code;
	}



}
