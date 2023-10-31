package nosi.webapps.igrp_studio.pages.env;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Env extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@RParam(rParamName = "p_name")
	private String name;

	@RParam(rParamName = "p_dad")
	private String dad;

	@RParam(rParamName = "p_description")
	private String description;

	@RParam(rParamName = "p_status")
	private int status;
	@RParam(rParamName = "p_status_check")
	private int status_check;

	@RParam(rParamName = "p_gen_auto_code")
	private int gen_auto_code;
	@RParam(rParamName = "p_gen_auto_code_check")
	private int gen_auto_code_check;

	@RParam(rParamName = "p_personalizacoes")
	private String personalizacoes;

	@RParam(rParamName = "p_img_src")
	private String img_src;

	@RParam(rParamName = "p_templates")
	private String templates;

	@RParam(rParamName = "p_template_theme_24_")
	private String template_theme_24_;

	@RParam(rParamName = "p_action_fk")
	private String action_fk;

	@RParam(rParamName = "p__nada")
	private String _nada;

	@RParam(rParamName = "p_flg_external")
	private String flg_external;

	@RParam(rParamName = "p_host")
	private String host;

	@RParam(rParamName = "p_plsql_codigo")
	private String plsql_codigo;

	@RParam(rParamName = "p__nada2")
	private String _nada2;

	@RParam(rParamName = "p_flg_old")
	private int flg_old;
	@RParam(rParamName = "p_flg_old_check")
	private int flg_old_check;

	@RParam(rParamName = "p_link_menu")
	private String link_menu;

	@RParam(rParamName = "p_link_center")
	private String link_center;

	@RParam(rParamName = "p_apache_dad")
	private String apache_dad;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setName(String name){
		this.name = name;
	}
	public String getName(){
		return this.name;
	}
	
	public void setDad(String dad){
		this.dad = dad;
	}
	public String getDad(){
		return this.dad;
	}
	
	public void setDescription(String description){
		this.description = description;
	}
	public String getDescription(){
		return this.description;
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
	
	public void setGen_auto_code(int gen_auto_code){
		this.gen_auto_code = gen_auto_code;
	}
	public int getGen_auto_code(){
		return this.gen_auto_code;
	}
	public void setGen_auto_code_check(int gen_auto_code_check){
		this.gen_auto_code_check = gen_auto_code_check;
	}
	public int getGen_auto_code_check(){
		return this.gen_auto_code_check;
	}
	
	public void setPersonalizacoes(String personalizacoes){
		this.personalizacoes = personalizacoes;
	}
	public String getPersonalizacoes(){
		return this.personalizacoes;
	}
	
	public void setImg_src(String img_src){
		this.img_src = img_src;
	}
	public String getImg_src(){
		return this.img_src;
	}
	
	public void setTemplates(String templates){
		this.templates = templates;
	}
	public String getTemplates(){
		return this.templates;
	}
	
	public void setTemplate_theme_24_(String template_theme_24_){
		this.template_theme_24_ = template_theme_24_;
	}
	public String getTemplate_theme_24_(){
		return this.template_theme_24_;
	}
	
	public void setAction_fk(String action_fk){
		this.action_fk = action_fk;
	}
	public String getAction_fk(){
		return this.action_fk;
	}
	
	public void set_nada(String _nada){
		this._nada = _nada;
	}
	public String get_nada(){
		return this._nada;
	}
	
	public void setFlg_external(String flg_external){
		this.flg_external = flg_external;
	}
	public String getFlg_external(){
		return this.flg_external;
	}
	
	public void setHost(String host){
		this.host = host;
	}
	public String getHost(){
		return this.host;
	}
	
	public void setPlsql_codigo(String plsql_codigo){
		this.plsql_codigo = plsql_codigo;
	}
	public String getPlsql_codigo(){
		return this.plsql_codigo;
	}
	
	public void set_nada2(String _nada2){
		this._nada2 = _nada2;
	}
	public String get_nada2(){
		return this._nada2;
	}
	
	public void setFlg_old(int flg_old){
		this.flg_old = flg_old;
	}
	public int getFlg_old(){
		return this.flg_old;
	}
	public void setFlg_old_check(int flg_old_check){
		this.flg_old_check = flg_old_check;
	}
	public int getFlg_old_check(){
		return this.flg_old_check;
	}
	
	public void setLink_menu(String link_menu){
		this.link_menu = link_menu;
	}
	public String getLink_menu(){
		return this.link_menu;
	}
	
	public void setLink_center(String link_center){
		this.link_center = link_center;
	}
	public String getLink_center(){
		return this.link_center;
	}
	
	public void setApache_dad(String apache_dad){
		this.apache_dad = apache_dad;
	}
	public String getApache_dad(){
		return this.apache_dad;
	}



}
