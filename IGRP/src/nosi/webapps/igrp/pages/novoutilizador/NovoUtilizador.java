/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.novoutilizador;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class NovoUtilizador extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_email")
	private String email;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_organica")
	private String organica;
	@RParam(rParamName = "p_perfil")
	private String perfil;
	@RParam(rParamName = "p_portal")
	private String portal;
	
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
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setOrganica(String organica){
		this.organica = organica;
	}
	public String getOrganica(){
		return this.organica;
	}
	
	public void setPerfil(String perfil){
		this.perfil = perfil;
	}
	public String getPerfil(){
		return this.perfil;
	}
	
	public void setPortal(String portal){
		this.portal = portal;
	}
	public String getPortal(){
		return this.portal;
	}


}
/*-------------------------*/