/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.lookuplistpage;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;
import java.util.List;

public class LookupListPage extends Model{		
	@RParam(rParamName = "p_env_fk")
	private int env_fk;
	@RParam(rParamName = "p_page")
	private String page;
	@RParam(rParamName = "p_page_descr")
	private String page_descr;

	private List<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> gettable_1(){
		return this.table_1;
	}
	
	public void setEnv_fk(int env_fk){
		this.env_fk = env_fk;
	}
	public int getEnv_fk(){
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


	public static class Table_1{
		private String nome_pagina;
		private String descricao;
		private String p_id;
		private Integer p_id_aplicacao;
		
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
		public Integer getP_id_aplicacao() {
			return p_id_aplicacao;
		}
		public void setP_id_aplicacao(Integer p_id_aplicacao) {
			this.p_id_aplicacao = p_id_aplicacao;
		}

	}
}
/*-------------------------*/