package nosi.webapps.igrp.pages.lookuplistpage;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

import java.util.ArrayList;
import java.util.List;

public class LookupListPage extends Model{		
	@RParam(rParamName = "p_associar_pagina")
	private String associar_pagina;
	@RParam(rParamName = "p_associar_documentos")
	private String associar_documentos;
	@RParam(rParamName = "p_env_fk")
	private String env_fk;
	@RParam(rParamName = "p_page")
	private String page;
	@RParam(rParamName = "p_page_descr")
	private String page_descr;
	@RParam(rParamName = "p_taskId")
	private String taskid;
	@RParam(rParamName = "p_processId")
	private String processid;
	
	@SeparatorList(name = Formlist_1.class)
	private List<Formlist_1> formlist_1 = new ArrayList<>();	
	public void setFormlist_1(List<Formlist_1> formlist_1){
		this.formlist_1 = formlist_1;
	}
	public List<Formlist_1> getFormlist_1(){
		return this.formlist_1;
	}
	@RParam(rParamName = "p_formlist_1_id")
	private String[] p_formlist_1_id;
	@RParam(rParamName = "p_formlist_1_del")
	private String[] p_formlist_1_del;
	
	public void setP_formlist_1_id(String[] p_formlist_1_id){
		this.p_formlist_1_id = p_formlist_1_id;
	}
	public String[] getP_formlist_1_id(){
		return this.p_formlist_1_id;
	}
	
	public void setP_formlist_1_del(String[] p_formlist_1_del){
		this.p_formlist_1_del = p_formlist_1_del;
	}
	public String[] getP_formlist_1_del(){
		return this.p_formlist_1_del;
	}
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}
	@RParam(rParamName = "p_table_1_id")
	private String[] p_table_1_id;
	@RParam(rParamName = "p_table_1_del")
	private String[] p_table_1_del;
	
	public void setP_table_1_id(String[] p_table_1_id){
		this.p_table_1_id = p_table_1_id;
	}
	public String[] getP_table_1_id(){
		return this.p_table_1_id;
	}
	
	public void setP_table_1_del(String[] p_table_1_del){
		this.p_table_1_del = p_table_1_del;
	}
	public String[] getP_table_1_del(){
		return this.p_table_1_del;
	}
	
	public void setAssociar_pagina(String associar_pagina){
		this.associar_pagina = associar_pagina;
	}
	public String getAssociar_pagina(){
		return this.associar_pagina;
	}
	
	public void setAssociar_documentos(String associar_documentos){
		this.associar_documentos = associar_documentos;
	}
	public String getAssociar_documentos(){
		return this.associar_documentos;
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
	
	public void setTaskid(String taskid){
		this.taskid = taskid;
	}
	public String getTaskid(){
		return this.taskid;
	}
	
	public void setProcessid(String processid){
		this.processid = processid;
	}
	public String getProcessid(){
		return this.processid;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String nome_pagina;
		private String descricao;
		private String id;
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

		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

	}
	public static class Formlist_1{
		private Pair formlist_1_id;
		private Pair checkbox;
		private Pair checkbox_check;
		private Pair obrigatorio;
		private Pair obrigatorio_check;
		private Pair tipo;
		private Pair nome;
		private Pair descricao_documento;
		private Pair type_doc;
		public void setFormlist_1_id(Pair formlist_1_id){
			this.formlist_1_id = formlist_1_id;
		}
		public Pair getFormlist_1_id(){
			return this.formlist_1_id;
		}
		public void setCheckbox(Pair checkbox){
			this.checkbox = checkbox;
		}
		public Pair getCheckbox(){
			return this.checkbox;
		}
		
		public void setCheckbox_check(Pair checkbox_check){
			this.checkbox_check = checkbox_check;
		}
		public Pair getCheckbox_check(){
			return this.checkbox_check;
		}

		public void setObrigatorio(Pair obrigatorio){
			this.obrigatorio = obrigatorio;
		}
		public Pair getObrigatorio(){
			return this.obrigatorio;
		}
		
		public void setObrigatorio_check(Pair obrigatorio_check){
			this.obrigatorio_check = obrigatorio_check;
		}
		public Pair getObrigatorio_check(){
			return this.obrigatorio_check;
		}

		public void setTipo(Pair tipo){
			this.tipo = tipo;
		}
		public Pair getTipo(){
			return this.tipo;
		}

		public void setNome(Pair nome){
			this.nome = nome;
		}
		public Pair getNome(){
			return this.nome;
		}

		public void setDescricao_documento(Pair descricao_documento){
			this.descricao_documento = descricao_documento;
		}
		public Pair getDescricao_documento(){
			return this.descricao_documento;
		}

		public void setType_doc(Pair type_doc){
			this.type_doc = type_doc;
		}
		public Pair getType_doc(){
			return this.type_doc;
		}

	}

	public void loadFormlist_1(BaseQueryInterface query) {
		this.setFormlist_1(this.loadFormList(query,Formlist_1.class));
	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
