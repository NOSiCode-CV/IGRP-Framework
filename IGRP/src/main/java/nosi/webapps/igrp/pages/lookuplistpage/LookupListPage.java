package nosi.webapps.igrp.pages.lookuplistpage;
import nosi.core.config.Config;
import nosi.core.webapp.Model;import java.sql.Date;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.QueryHelper;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class LookupListPage extends Model{		
	@RParam(rParamName = "p_componentes")
	private String componentes;
	@RParam(rParamName = "p_paginas")
	private String paginas;
	@RParam(rParamName = "p_env_fk")
	private String env_fk;
	@RParam(rParamName = "p_page")
	private String page;
	@RParam(rParamName = "p_page_descr")
	private String page_descr;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_nome_componente")
	private String nome_componente;
	@RParam(rParamName = "p_descricao_componente")
	private String descricao_componente;
	@RParam(rParamName = "p_task_id")
	private String p_task_id;
	@RParam(rParamName = "p_process_id")
	private String p_process_id;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}
	
	@SeparatorList(name = Formlist_1.class)
	private List<Formlist_1> formlist_1 = new ArrayList<>();	
	public void setFormlist_1(List<Formlist_1> formlist_1){
		this.formlist_1 = formlist_1;
	}
	public List<Formlist_1> getFormlist_1(){
		return this.formlist_1;
	}
	
	public void setComponentes(String componentes){
		this.componentes = componentes;
	}
	public String getComponentes(){
		return this.componentes;
	}
	
	public void setPaginas(String paginas){
		this.paginas = paginas;
	}
	public String getPaginas(){
		return this.paginas;
	}
	
	public void setEnv_fk(String env_fk){
		this.env_fk = env_fk;
	}
	public String getEnv_fk(){
		return this.env_fk;
	}
	
	public void setPage(String page){
		this.page = page;
	}
	public String getPage(){
		return this.page;
	}
	
	public void setPage_descr(String page_descr){
		this.page_descr = page_descr;
	}
	public String getPage_descr(){
		return this.page_descr;
	}
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setNome_componente(String nome_componente){
		this.nome_componente = nome_componente;
	}
	public String getNome_componente(){
		return this.nome_componente;
	}
	
	public void setDescricao_componente(String descricao_componente){
		this.descricao_componente = descricao_componente;
	}
	public String getDescricao_componente(){
		return this.descricao_componente;
	}
	
	public void setP_task_id(String p_task_id){
		this.p_task_id = p_task_id;
	}
	public String getP_task_id(){
		return this.p_task_id;
	}
	
	public void setP_process_id(String p_process_id){
		this.p_process_id = p_process_id;
	}
	public String getP_process_id(){
		return this.p_process_id;
	}


	public static class Table_1{
		private String nome_pagina;
		private String descricao;
		private String p_id;
		public void setNome_pagina(String nome_pagina){
			this.nome_pagina = nome_pagina;
		}
		public String getNome_pagina(){
			return this.nome_pagina;
		}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

		public void setP_id(String p_id){
			this.p_id = p_id;
		}
		public String getP_id(){
			return this.p_id;
		}

	}
	public static class Formlist_1{
		private Pair selecionar;
		private Pair selecionar_check;
		private Pair titulo;
		private Pair t_nome_componente;
		private Pair t_descricao_componente;
		public void setSelecionar(Pair selecionar){
			this.selecionar = selecionar;
		}
		public Pair getSelecionar(){
			return this.selecionar;
		}
		
		public void setSelecionar_check(Pair selecionar_check){
			this.selecionar_check = selecionar_check;
		}
		public Pair getSelecionar_check(){
			return this.selecionar_check;
		}

		public void setTitulo(Pair titulo){
			this.titulo = titulo;
		}
		public Pair getTitulo(){
			return this.titulo;
		}

		public void setT_nome_componente(Pair t_nome_componente){
			this.t_nome_componente = t_nome_componente;
		}
		public Pair getT_nome_componente(){
			return this.t_nome_componente;
		}

		public void setT_descricao_componente(Pair t_descricao_componente){
			this.t_descricao_componente = t_descricao_componente;
		}
		public Pair getT_descricao_componente(){
			return this.t_descricao_componente;
		}

	}

	public void loadTable_1(QueryHelper query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
