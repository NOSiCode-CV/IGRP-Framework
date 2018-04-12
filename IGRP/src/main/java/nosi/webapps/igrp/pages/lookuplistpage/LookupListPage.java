package nosi.webapps.igrp.pages.lookuplistpage;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import java.sql.Date;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.QueryHelper;
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
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
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


	public static class Table_1{
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
		private Pair checkbox;
		private Pair checkbox_check;
		private Pair obrigatorio;
		private Pair obrigatorio_check;
		private Pair tipo_documento;
		private Pair nome;
		private Pair descricao_documento;
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

		public void setTipo_documento(Pair tipo_documento){
			this.tipo_documento = tipo_documento;
		}
		public Pair getTipo_documento(){
			return this.tipo_documento;
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

	}

	public void loadFormlist_1(QueryHelper query) {
		this.setFormlist_1(this.loadFormList(query,Formlist_1.class));
	}

	public void loadTable_1(QueryHelper query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
