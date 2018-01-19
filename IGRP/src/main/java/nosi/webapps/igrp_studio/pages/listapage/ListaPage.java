package nosi.webapps.igrp_studio.pages.listapage;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import nosi.core.webapp.helpers.Permission;

import java.util.ArrayList;
import java.util.List;

public class ListaPage extends Model{		
	@RParam(rParamName = "p_quickbuttonbox_1_tit")
	private String quickbuttonbox_1_tit;
	@RParam(rParamName = "p_quickbuttonbox_1_val")
	private String quickbuttonbox_1_val;
	@RParam(rParamName = "p_quickbuttonbox_1_url")
	private String quickbuttonbox_1_url;
	@RParam(rParamName = "p_quickbuttonbox_1_bg")
	private String quickbuttonbox_1_bg;
	@RParam(rParamName = "p_quickbuttonbox_1_icn")
	private String quickbuttonbox_1_icn;
	@RParam(rParamName = "p_quickbuttonbox_2_tit")
	private String quickbuttonbox_2_tit;
	@RParam(rParamName = "p_quickbuttonbox_2_val")
	private String quickbuttonbox_2_val;
	@RParam(rParamName = "p_quickbuttonbox_2_url")
	private String quickbuttonbox_2_url;
	@RParam(rParamName = "p_quickbuttonbox_2_bg")
	private String quickbuttonbox_2_bg;
	@RParam(rParamName = "p_quickbuttonbox_2_icn")
	private String quickbuttonbox_2_icn;
	@RParam(rParamName = "p_quickbuttonbox_3_tit")
	private String quickbuttonbox_3_tit;
	@RParam(rParamName = "p_quickbuttonbox_3_val")
	private String quickbuttonbox_3_val;
	@RParam(rParamName = "p_quickbuttonbox_3_url")
	private String quickbuttonbox_3_url;
	@RParam(rParamName = "p_quickbuttonbox_3_bg")
	private String quickbuttonbox_3_bg;
	@RParam(rParamName = "p_quickbuttonbox_3_icn")
	private String quickbuttonbox_3_icn;
	@RParam(rParamName = "p_env_fk")
	private String env_fk;
	@RParam(rParamName = "p_link_btn_nova_pagina")
	private String link_btn_nova_pagina;
	@RParam(rParamName = "p_link_btn_nova_pagina_desc")
	private String link_btn_nova_pagina_desc;
	@RParam(rParamName = "p_btn_import")
	private String btn_import;
	@RParam(rParamName = "p_btn_import_desc")
	private String btn_import_desc;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}
	
	private List<Myapps_list> myapps_list = new ArrayList<>();	
	public void setMyapps_list(List<Myapps_list> myapps_list){
		this.myapps_list = myapps_list;
	}
	public List<Myapps_list> getMyapps_list(){
		return this.myapps_list;
	}
	
	public void setQuickbuttonbox_1_tit(String quickbuttonbox_1_tit){
		this.quickbuttonbox_1_tit = quickbuttonbox_1_tit;
	}
	public String getQuickbuttonbox_1_tit(){
		return this.quickbuttonbox_1_tit;
	}
	
	public void setQuickbuttonbox_1_val(String quickbuttonbox_1_val){
		this.quickbuttonbox_1_val = quickbuttonbox_1_val;
	}
	public String getQuickbuttonbox_1_val(){
		return this.quickbuttonbox_1_val;
	}
	
	public void setQuickbuttonbox_1_url(String quickbuttonbox_1_url){
		this.quickbuttonbox_1_url = quickbuttonbox_1_url;
	}
	public String getQuickbuttonbox_1_url(){
		return this.quickbuttonbox_1_url;
	}
	
	public void setQuickbuttonbox_1_bg(String quickbuttonbox_1_bg){
		this.quickbuttonbox_1_bg = quickbuttonbox_1_bg;
	}
	public String getQuickbuttonbox_1_bg(){
		return this.quickbuttonbox_1_bg;
	}
	
	public void setQuickbuttonbox_1_icn(String quickbuttonbox_1_icn){
		this.quickbuttonbox_1_icn = quickbuttonbox_1_icn;
	}
	public String getQuickbuttonbox_1_icn(){
		return this.quickbuttonbox_1_icn;
	}
	
	public void setQuickbuttonbox_2_tit(String quickbuttonbox_2_tit){
		this.quickbuttonbox_2_tit = quickbuttonbox_2_tit;
	}
	public String getQuickbuttonbox_2_tit(){
		return this.quickbuttonbox_2_tit;
	}
	
	public void setQuickbuttonbox_2_val(String quickbuttonbox_2_val){
		this.quickbuttonbox_2_val = quickbuttonbox_2_val;
	}
	public String getQuickbuttonbox_2_val(){
		return this.quickbuttonbox_2_val;
	}
	
	public void setQuickbuttonbox_2_url(String quickbuttonbox_2_url){
		this.quickbuttonbox_2_url = quickbuttonbox_2_url;
	}
	public String getQuickbuttonbox_2_url(){
		return this.quickbuttonbox_2_url;
	}
	
	public void setQuickbuttonbox_2_bg(String quickbuttonbox_2_bg){
		this.quickbuttonbox_2_bg = quickbuttonbox_2_bg;
	}
	public String getQuickbuttonbox_2_bg(){
		return this.quickbuttonbox_2_bg;
	}
	
	public void setQuickbuttonbox_2_icn(String quickbuttonbox_2_icn){
		this.quickbuttonbox_2_icn = quickbuttonbox_2_icn;
	}
	public String getQuickbuttonbox_2_icn(){
		return this.quickbuttonbox_2_icn;
	}
	
	public void setQuickbuttonbox_3_tit(String quickbuttonbox_3_tit){
		this.quickbuttonbox_3_tit = quickbuttonbox_3_tit;
	}
	public String getQuickbuttonbox_3_tit(){
		return this.quickbuttonbox_3_tit;
	}
	
	public void setQuickbuttonbox_3_val(String quickbuttonbox_3_val){
		this.quickbuttonbox_3_val = quickbuttonbox_3_val;
	}
	public String getQuickbuttonbox_3_val(){
		return this.quickbuttonbox_3_val;
	}
	
	public void setQuickbuttonbox_3_url(String quickbuttonbox_3_url){
		this.quickbuttonbox_3_url = quickbuttonbox_3_url;
	}
	public String getQuickbuttonbox_3_url(){
		return this.quickbuttonbox_3_url;
	}
	
	public void setQuickbuttonbox_3_bg(String quickbuttonbox_3_bg){
		this.quickbuttonbox_3_bg = quickbuttonbox_3_bg;
	}
	public String getQuickbuttonbox_3_bg(){
		return this.quickbuttonbox_3_bg;
	}
	
	public void setQuickbuttonbox_3_icn(String quickbuttonbox_3_icn){
		this.quickbuttonbox_3_icn = quickbuttonbox_3_icn;
	}
	public String getQuickbuttonbox_3_icn(){
		return this.quickbuttonbox_3_icn;
	}
	
	public void setEnv_fk(String env_fk){
		this.env_fk = env_fk;
	}
	public String getEnv_fk(){
		return this.env_fk;
	}
	
	public void setLink_btn_nova_pagina(String app,String page,String action){
		this.link_btn_nova_pagina = Config.getResolveUrl(app, page, action);
	}
	public String getLink_btn_nova_pagina(){
		return this.link_btn_nova_pagina;
	}
	public void setLink_btn_nova_pagina_desc(String link_btn_nova_pagina_desc){
		this.link_btn_nova_pagina_desc = link_btn_nova_pagina_desc;
	}
	public String getLink_btn_nova_pagina_desc(){
		return this.link_btn_nova_pagina_desc;
	}
	
	public void setBtn_import(String app,String page,String action){
		this.btn_import = Config.getResolveUrl(app, page, action);
	}
	public String getBtn_import(){
		return this.btn_import;
	}
	public void setBtn_import_desc(String btn_import_desc){
		this.btn_import_desc = btn_import_desc;
	}
	public String getBtn_import_desc(){
		return this.btn_import_desc;
	}


	public static class Table_1{
		private String descricao_page;
		private String nome_page;
		private String p_id_page;
		public void setDescricao_page(String descricao_page){
			this.descricao_page = descricao_page;
		}
		public String getDescricao_page(){
			return this.descricao_page;
		}

		public void setNome_page(String nome_page){
			this.nome_page = nome_page;
		}
		public String getNome_page(){
			return this.nome_page;
		}

		public void setP_id_page(String p_id_page){
			this.p_id_page = p_id_page;
		}
		public String getP_id_page(){
			return this.p_id_page;
		}

	}
	public static class Myapps_list{
		private String icon;
		private String aplicacao;
		private String aplicacao_desc;
		public void setIcon(String icon){
			this.icon = icon;
		}
		public String getIcon(){
			return this.icon;
		}

		public void setAplicacao(String app,String page,String action){
			this.aplicacao = "webapps?r="+app+"/"+page+"/"+(action.contains("&amp;")?action:action.replace("&", "&amp;"))+"&amp;dad="+app;
		}
		public String getAplicacao(){
			return this.aplicacao;
		}
		public void setAplicacao_desc(String aplicacao_desc){
			this.aplicacao_desc = aplicacao_desc;
		}
		public String getAplicacao_desc(){
			return this.aplicacao_desc;
		}

	}
}
