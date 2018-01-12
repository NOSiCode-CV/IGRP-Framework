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
	@RParam(rParamName = "p_link_btn_ab")
	private String link_btn_ab;
	@RParam(rParamName = "p_link_btn_ab_desc")
	private String link_btn_ab_desc;
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
	
	public void setLink_btn_ab(String app,String page,String action){
		this.link_btn_ab = Config.getResolveUrl(app, page, action);
	}
	public String getLink_btn_ab(){
		return this.link_btn_ab;
	}
	public void setLink_btn_ab_desc(String link_btn_ab_desc){
		this.link_btn_ab_desc = link_btn_ab_desc;
	}
	public String getLink_btn_ab_desc(){
		return this.link_btn_ab_desc;
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
}
