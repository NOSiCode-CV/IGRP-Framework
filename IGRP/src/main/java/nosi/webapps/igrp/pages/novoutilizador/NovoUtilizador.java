package nosi.webapps.igrp.pages.novoutilizador;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import java.sql.Date;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.QueryHelper;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class NovoUtilizador extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_email")
	private String email;
	@RParam(rParamName = "p_nada")
	private String nada;
	@RParam(rParamName = "p_aplicacao")
	private int aplicacao;
	@RParam(rParamName = "p_organica")
	private int organica;
	@RParam(rParamName = "p_perfil")
	private int perfil;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
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
	
	public void setPerfil(int perfil){
		this.perfil = perfil;
	}
	public int getPerfil(){
		return this.perfil;
	}



}
