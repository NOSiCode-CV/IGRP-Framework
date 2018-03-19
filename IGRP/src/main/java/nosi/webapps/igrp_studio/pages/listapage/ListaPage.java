package nosi.webapps.igrp_studio.pages.listapage;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;
import java.util.List;

public class ListaPage extends Model{		
	@RParam(rParamName = "p_infopanel_1_title")
	private String infopanel_1_title;
	@RParam(rParamName = "p_infopanel_1_val")
	private String infopanel_1_val;
	@RParam(rParamName = "p_infopanel_1_url")
	private String infopanel_1_url;
	@RParam(rParamName = "p_infopanel_1_bg")
	private String infopanel_1_bg;
	@RParam(rParamName = "p_infopanel_1_icn")
	private String infopanel_1_icn;
	@RParam(rParamName = "p_infopanel_2_title")
	private String infopanel_2_title;
	@RParam(rParamName = "p_infopanel_2_val")
	private String infopanel_2_val;
	@RParam(rParamName = "p_infopanel_2_url")
	private String infopanel_2_url;
	@RParam(rParamName = "p_infopanel_2_bg")
	private String infopanel_2_bg;
	@RParam(rParamName = "p_infopanel_2_icn")
	private String infopanel_2_icn;
	@RParam(rParamName = "p_infopanel_3_title")
	private String infopanel_3_title;
	@RParam(rParamName = "p_infopanel_3_val")
	private String infopanel_3_val;
	@RParam(rParamName = "p_infopanel_3_url")
	private String infopanel_3_url;
	@RParam(rParamName = "p_infopanel_3_bg")
	private String infopanel_3_bg;
	@RParam(rParamName = "p_infopanel_3_icn")
	private String infopanel_3_icn;
	@RParam(rParamName = "p_env_fk")
	private String env_fk;
	@RParam(rParamName = "p_link_btn_nova_pagina")
	private String link_btn_nova_pagina;
	@RParam(rParamName = "p_link_btn_nova_pagina_desc")
	private String link_btn_nova_pagina_desc;
	@RParam(rParamName = "p_crud_generator")
	private String crud_generator;
	@RParam(rParamName = "p_crud_generator_desc")
	private String crud_generator_desc;
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
	
	public void setInfopanel_1_title(String infopanel_1_title){
		this.infopanel_1_title = infopanel_1_title;
	}
	public String getInfopanel_1_title(){
		return this.infopanel_1_title;
	}
	
	public void setInfopanel_1_val(String infopanel_1_val){
		this.infopanel_1_val = infopanel_1_val;
	}
	public String getInfopanel_1_val(){
		return this.infopanel_1_val;
	}
	
	public void setInfopanel_1_url(String infopanel_1_url){
		this.infopanel_1_url = infopanel_1_url;
	}
	public String getInfopanel_1_url(){
		return this.infopanel_1_url;
	}
	
	public void setInfopanel_1_bg(String infopanel_1_bg){
		this.infopanel_1_bg = infopanel_1_bg;
	}
	public String getInfopanel_1_bg(){
		return this.infopanel_1_bg;
	}
	
	public void setInfopanel_1_icn(String infopanel_1_icn){
		this.infopanel_1_icn = infopanel_1_icn;
	}
	public String getInfopanel_1_icn(){
		return this.infopanel_1_icn;
	}
	
	public void setInfopanel_2_title(String infopanel_2_title){
		this.infopanel_2_title = infopanel_2_title;
	}
	public String getInfopanel_2_title(){
		return this.infopanel_2_title;
	}
	
	public void setInfopanel_2_val(String infopanel_2_val){
		this.infopanel_2_val = infopanel_2_val;
	}
	public String getInfopanel_2_val(){
		return this.infopanel_2_val;
	}
	
	public void setInfopanel_2_url(String infopanel_2_url){
		this.infopanel_2_url = infopanel_2_url;
	}
	public String getInfopanel_2_url(){
		return this.infopanel_2_url;
	}
	
	public void setInfopanel_2_bg(String infopanel_2_bg){
		this.infopanel_2_bg = infopanel_2_bg;
	}
	public String getInfopanel_2_bg(){
		return this.infopanel_2_bg;
	}
	
	public void setInfopanel_2_icn(String infopanel_2_icn){
		this.infopanel_2_icn = infopanel_2_icn;
	}
	public String getInfopanel_2_icn(){
		return this.infopanel_2_icn;
	}
	
	public void setInfopanel_3_title(String infopanel_3_title){
		this.infopanel_3_title = infopanel_3_title;
	}
	public String getInfopanel_3_title(){
		return this.infopanel_3_title;
	}
	
	public void setInfopanel_3_val(String infopanel_3_val){
		this.infopanel_3_val = infopanel_3_val;
	}
	public String getInfopanel_3_val(){
		return this.infopanel_3_val;
	}
	
	public void setInfopanel_3_url(String infopanel_3_url){
		this.infopanel_3_url = infopanel_3_url;
	}
	public String getInfopanel_3_url(){
		return this.infopanel_3_url;
	}
	
	public void setInfopanel_3_bg(String infopanel_3_bg){
		this.infopanel_3_bg = infopanel_3_bg;
	}
	public String getInfopanel_3_bg(){
		return this.infopanel_3_bg;
	}
	
	public void setInfopanel_3_icn(String infopanel_3_icn){
		this.infopanel_3_icn = infopanel_3_icn;
	}
	public String getInfopanel_3_icn(){
		return this.infopanel_3_icn;
	}
	
	public void setEnv_fk(String env_fk){
		this.env_fk = env_fk;
	}
	public String getEnv_fk(){
		return this.env_fk;
	}
	
	public void setLink_btn_nova_pagina(String app,String page,String action){
		this.link_btn_nova_pagina = new Config().getResolveUrl(app, page, action);
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
	
	public void setCrud_generator(String app,String page,String action){
		this.crud_generator = new Config().getResolveUrl(app, page, action);
	}
	public String getCrud_generator(){
		return this.crud_generator;
	}
	public void setCrud_generator_desc(String crud_generator_desc){
		this.crud_generator_desc = crud_generator_desc;
	}
	public String getCrud_generator_desc(){
		return this.crud_generator_desc;
	}
	
	public void setBtn_import(String app,String page,String action){
		this.btn_import = new Config().getResolveUrl(app, page, action);
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
		private int status_page;
		private int status_page_check;
		private String descricao_page;
		private String nome_page;
		private String p_id_page;
		public void setStatus_page(int status_page){
			this.status_page = status_page;
		}
		public int getStatus_page(){
			return this.status_page;
		}
		public void setStatus_page_check(int status_page_check){
			this.status_page_check = status_page_check;
		}
		public int getStatus_page_check(){
			return this.status_page_check;
		}

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
			this.aplicacao = new Config().getResolveUrl(app, page, action);
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
