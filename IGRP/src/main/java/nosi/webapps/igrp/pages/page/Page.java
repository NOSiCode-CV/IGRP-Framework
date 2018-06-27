package nosi.webapps.igrp.pages.page;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;





public class Page extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_page_descr")
	private String page_descr;
	@RParam(rParamName = "p_page")
	private String page;
	@RParam(rParamName = "p_status")
	private int status;
	@RParam(rParamName = "p_status_check")
	private int status_check;
	@RParam(rParamName = "p_gen_auto_code")
	private int gen_auto_code;
	@RParam(rParamName = "p_gen_auto_code_check")
	private int gen_auto_code_check;
	@RParam(rParamName = "p_nada")
	private String nada;
	@RParam(rParamName = "p_env_fk")
	private String env_fk;
	@RParam(rParamName = "p_componente")
	private int componente;
	@RParam(rParamName = "p_componente_check")
	private int componente_check;
	@RParam(rParamName = "p_extras")
	private String extras;
	@RParam(rParamName = "p_primeira_pagina")
	private int primeira_pagina;
	@RParam(rParamName = "p_primeira_pagina_check")
	private int primeira_pagina_check;
	@RParam(rParamName = "p_criar_menu")
	private int criar_menu;
	@RParam(rParamName = "p_criar_menu_check")
	private int criar_menu_check;
	@RParam(rParamName = "p_modulo")
	private String modulo;
	@RParam(rParamName = "p_novo_modulo")
	private IGRPLink novo_modulo;
	@RParam(rParamName = "p_novo_modulo_desc")
	private String novo_modulo_desc;
	@RParam(rParamName = "p_version")
	private String version;
	@RParam(rParamName = "p_id")
	private String id;
	@RParam(rParamName = "p_table_name")
	private String table_name;
	@RParam(rParamName = "p_xsl_src")
	private String xsl_src;
	@RParam(rParamName = "p_img_src")
	private String img_src;
	@RParam(rParamName = "p_action")
	private String action;
	@RParam(rParamName = "p_page_type")
	private String page_type;
	@RParam(rParamName = "p_flg_menu")
	private String flg_menu;
	@RParam(rParamName = "p_flg_transaction")
	private String flg_transaction;
	@RParam(rParamName = "p_self_id")
	private String self_id;
	@RParam(rParamName = "p_self_fw_id")
	private String self_fw_id;
	@RParam(rParamName = "p_db_connection")
	private String db_connection;
	@RParam(rParamName = "p_flg_offline")
	private String flg_offline;
	@RParam(rParamName = "p_flg_internet")
	private String flg_internet;
	@RParam(rParamName = "p_proc_name")
	private String proc_name;
	@RParam(rParamName = "p_action_descr")
	private String action_descr;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setPage_descr(String page_descr){
		this.page_descr = page_descr;
	}
	public String getPage_descr(){
		return this.page_descr;
	}
	
	public void setPage(String page){
		this.page = page;
	}
	public String getPage(){
		return this.page;
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
	
	public void setNada(String nada){
		this.nada = nada;
	}
	public String getNada(){
		return this.nada;
	}
	
	public void setEnv_fk(String env_fk){
		this.env_fk = env_fk;
	}
	public String getEnv_fk(){
		return this.env_fk;
	}
	
	public void setComponente(int componente){
		this.componente = componente;
	}
	public int getComponente(){
		return this.componente;
	}
	public void setComponente_check(int componente_check){
		this.componente_check = componente_check;
	}
	public int getComponente_check(){
		return this.componente_check;
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
	public void setPrimeira_pagina_check(int primeira_pagina_check){
		this.primeira_pagina_check = primeira_pagina_check;
	}
	public int getPrimeira_pagina_check(){
		return this.primeira_pagina_check;
	}
	
	public void setCriar_menu(int criar_menu){
		this.criar_menu = criar_menu;
	}
	public int getCriar_menu(){
		return this.criar_menu;
	}
	public void setCriar_menu_check(int criar_menu_check){
		this.criar_menu_check = criar_menu_check;
	}
	public int getCriar_menu_check(){
		return this.criar_menu_check;
	}
	
	public void setModulo(String modulo){
		this.modulo = modulo;
	}
	public String getModulo(){
		return this.modulo;
	}
	
	public IGRPLink setNovo_modulo(String app,String page,String action){
		this.novo_modulo = new IGRPLink(app,page,action);
		return this.novo_modulo;
	}
	public IGRPLink getNovo_modulo(){
		return this.novo_modulo;
	}
	public void setNovo_modulo_desc(String novo_modulo_desc){
		this.novo_modulo_desc = novo_modulo_desc;
	}
	public String getNovo_modulo_desc(){
		return this.novo_modulo_desc;
	}
	public IGRPLink setNovo_modulo(String link){
		this.novo_modulo = new IGRPLink(link);
		return this.novo_modulo;
	}
	public IGRPLink setNovo_modulo(Report link){
		this.novo_modulo = new IGRPLink(link);
		return this.novo_modulo;
	}
	
	public void setVersion(String version){
		this.version = version;
	}
	public String getVersion(){
		return this.version;
	}
	
	public void setId(String id){
		this.id = id;
	}
	public String getId(){
		return this.id;
	}
	
	public void setTable_name(String table_name){
		this.table_name = table_name;
	}
	public String getTable_name(){
		return this.table_name;
	}
	
	public void setXsl_src(String xsl_src){
		this.xsl_src = xsl_src;
	}
	public String getXsl_src(){
		return this.xsl_src;
	}
	
	public void setImg_src(String img_src){
		this.img_src = img_src;
	}
	public String getImg_src(){
		return this.img_src;
	}
	
	public void setAction(String action){
		this.action = action;
	}
	public String getAction(){
		return this.action;
	}
	
	public void setPage_type(String page_type){
		this.page_type = page_type;
	}
	public String getPage_type(){
		return this.page_type;
	}
	
	public void setFlg_menu(String flg_menu){
		this.flg_menu = flg_menu;
	}
	public String getFlg_menu(){
		return this.flg_menu;
	}
	
	public void setFlg_transaction(String flg_transaction){
		this.flg_transaction = flg_transaction;
	}
	public String getFlg_transaction(){
		return this.flg_transaction;
	}
	
	public void setSelf_id(String self_id){
		this.self_id = self_id;
	}
	public String getSelf_id(){
		return this.self_id;
	}
	
	public void setSelf_fw_id(String self_fw_id){
		this.self_fw_id = self_fw_id;
	}
	public String getSelf_fw_id(){
		return this.self_fw_id;
	}
	
	public void setDb_connection(String db_connection){
		this.db_connection = db_connection;
	}
	public String getDb_connection(){
		return this.db_connection;
	}
	
	public void setFlg_offline(String flg_offline){
		this.flg_offline = flg_offline;
	}
	public String getFlg_offline(){
		return this.flg_offline;
	}
	
	public void setFlg_internet(String flg_internet){
		this.flg_internet = flg_internet;
	}
	public String getFlg_internet(){
		return this.flg_internet;
	}
	
	public void setProc_name(String proc_name){
		this.proc_name = proc_name;
	}
	public String getProc_name(){
		return this.proc_name;
	}
	
	public void setAction_descr(String action_descr){
		this.action_descr = action_descr;
	}
	public String getAction_descr(){
		return this.action_descr;
	}



}
