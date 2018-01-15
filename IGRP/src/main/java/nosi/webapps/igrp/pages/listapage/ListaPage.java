package nosi.webapps.igrp.pages.listapage;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class ListaPage extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
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
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
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
			this.aplicacao = Config.getResolveUrl(app, page, action);
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
