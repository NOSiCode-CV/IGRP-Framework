package nosi.webapps.igrp.pages.settings;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Settings extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_email")
	private String email;
	@RParam(rParamName = "p_username")
	private String username;
	@RParam(rParamName = "p_telefone")
	private String telefone;
	@RParam(rParamName = "p_telemovel")
	private String telemovel;
	@RParam(rParamName = "p_ultimo_acesso_igrp")
	private String ultimo_acesso_igrp;
	@RParam(rParamName = "p_ultimo_acesso_rede_estado")
	private String ultimo_acesso_rede_estado;
	@RParam(rParamName = "p_password_expira_em")
	private String password_expira_em;
	@RParam(rParamName = "p_view_1_img")
	private String view_1_img;
	@RParam(rParamName = "p_idioma")
	private String idioma;
	@RParam(rParamName = "p_separator_1")
	private String separator_1;
	@RParam(rParamName = "p_perfil")
	private String perfil;
	@RParam(rParamName = "p_organica")
	private String p_organica;
	
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
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	public String getUsername(){
		return this.username;
	}
	
	public void setTelefone(String telefone){
		this.telefone = telefone;
	}
	public String getTelefone(){
		return this.telefone;
	}
	
	public void setTelemovel(String telemovel){
		this.telemovel = telemovel;
	}
	public String getTelemovel(){
		return this.telemovel;
	}
	
	public void setUltimo_acesso_igrp(String ultimo_acesso_igrp){
		this.ultimo_acesso_igrp = ultimo_acesso_igrp;
	}
	public String getUltimo_acesso_igrp(){
		return this.ultimo_acesso_igrp;
	}
	
	public void setUltimo_acesso_rede_estado(String ultimo_acesso_rede_estado){
		this.ultimo_acesso_rede_estado = ultimo_acesso_rede_estado;
	}
	public String getUltimo_acesso_rede_estado(){
		return this.ultimo_acesso_rede_estado;
	}
	
	public void setPassword_expira_em(String password_expira_em){
		this.password_expira_em = password_expira_em;
	}
	public String getPassword_expira_em(){
		return this.password_expira_em;
	}
	
	public void setView_1_img(String view_1_img){
		this.view_1_img = view_1_img;
	}
	public String getView_1_img(){
		return this.view_1_img;
	}
	
	public void setIdioma(String idioma){
		this.idioma = idioma;
	}
	public String getIdioma(){
		return this.idioma;
	}
	
	public void setSeparator_1(String separator_1){
		this.separator_1 = separator_1;
	}
	public String getSeparator_1(){
		return this.separator_1;
	}
	
	public void setPerfil(String perfil){
		this.perfil = perfil;
	}
	public String getPerfil(){
		return this.perfil;
	}
	
	public void setP_organica(String p_organica){
		this.p_organica = p_organica;
	}
	public String getP_organica(){
		return this.p_organica;
	}


}
