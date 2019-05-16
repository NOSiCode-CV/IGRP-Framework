package nosi.webapps.igrp.pages.detalhes_dashboard_processo;


import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Detalhes_dashboard_processo extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_total_proc_finished_title")
	private String total_proc_finished_title;
	@RParam(rParamName = "p_total_proc_finished_val")
	private String total_proc_finished_val;
	@RParam(rParamName = "p_total_proc_finished_url")
	private String total_proc_finished_url;
	@RParam(rParamName = "p_total_proc_finished_bg")
	private String total_proc_finished_bg;
	@RParam(rParamName = "p_total_proc_finished_icn")
	private String total_proc_finished_icn;
	@RParam(rParamName = "p_total_proc_em_execucao_title")
	private String total_proc_em_execucao_title;
	@RParam(rParamName = "p_total_proc_em_execucao_val")
	private String total_proc_em_execucao_val;
	@RParam(rParamName = "p_total_proc_em_execucao_url")
	private String total_proc_em_execucao_url;
	@RParam(rParamName = "p_total_proc_em_execucao_bg")
	private String total_proc_em_execucao_bg;
	@RParam(rParamName = "p_total_proc_em_execucao_icn")
	private String total_proc_em_execucao_icn;
	
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
	
	public void setTotal_proc_finished_title(String total_proc_finished_title){
		this.total_proc_finished_title = total_proc_finished_title;
	}
	public String getTotal_proc_finished_title(){
		return this.total_proc_finished_title;
	}
	
	public void setTotal_proc_finished_val(String total_proc_finished_val){
		this.total_proc_finished_val = total_proc_finished_val;
	}
	public String getTotal_proc_finished_val(){
		return this.total_proc_finished_val;
	}
	
	public void setTotal_proc_finished_url(String total_proc_finished_url){
		this.total_proc_finished_url = total_proc_finished_url;
	}
	public String getTotal_proc_finished_url(){
		return this.total_proc_finished_url;
	}
	
	public void setTotal_proc_finished_bg(String total_proc_finished_bg){
		this.total_proc_finished_bg = total_proc_finished_bg;
	}
	public String getTotal_proc_finished_bg(){
		return this.total_proc_finished_bg;
	}
	
	public void setTotal_proc_finished_icn(String total_proc_finished_icn){
		this.total_proc_finished_icn = total_proc_finished_icn;
	}
	public String getTotal_proc_finished_icn(){
		return this.total_proc_finished_icn;
	}
	
	public void setTotal_proc_em_execucao_title(String total_proc_em_execucao_title){
		this.total_proc_em_execucao_title = total_proc_em_execucao_title;
	}
	public String getTotal_proc_em_execucao_title(){
		return this.total_proc_em_execucao_title;
	}
	
	public void setTotal_proc_em_execucao_val(String total_proc_em_execucao_val){
		this.total_proc_em_execucao_val = total_proc_em_execucao_val;
	}
	public String getTotal_proc_em_execucao_val(){
		return this.total_proc_em_execucao_val;
	}
	
	public void setTotal_proc_em_execucao_url(String total_proc_em_execucao_url){
		this.total_proc_em_execucao_url = total_proc_em_execucao_url;
	}
	public String getTotal_proc_em_execucao_url(){
		return this.total_proc_em_execucao_url;
	}
	
	public void setTotal_proc_em_execucao_bg(String total_proc_em_execucao_bg){
		this.total_proc_em_execucao_bg = total_proc_em_execucao_bg;
	}
	public String getTotal_proc_em_execucao_bg(){
		return this.total_proc_em_execucao_bg;
	}
	
	public void setTotal_proc_em_execucao_icn(String total_proc_em_execucao_icn){
		this.total_proc_em_execucao_icn = total_proc_em_execucao_icn;
	}
	public String getTotal_proc_em_execucao_icn(){
		return this.total_proc_em_execucao_icn;
	}


	public static class Table_1 extends IGRPTable.Table{
		private IGRPLink n_processo;
		private String n_processo_desc;
		private String descricao;
		private String iniciado_em;
		private String estado;
		private String id;
		private String process_definition;
		private String process_key;
		public IGRPLink setN_processo(String app,String page,String action){
			this.n_processo = new IGRPLink(app,page,action);
			return this.n_processo;
		}
		public IGRPLink getN_processo(){
			return this.n_processo;
		}
		public void setN_processo_desc(String n_processo_desc){
			this.n_processo_desc = n_processo_desc;
		}
		public String getN_processo_desc(){
			return this.n_processo_desc;
		}
	public IGRPLink setN_processo(String link){
		this.n_processo = new IGRPLink(link);
		return this.n_processo;
	}
	public IGRPLink setN_processo(Report link){
		this.n_processo = new IGRPLink(link);
		return this.n_processo;
	}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

		public void setIniciado_em(String iniciado_em){
			this.iniciado_em = iniciado_em;
		}
		public String getIniciado_em(){
			return this.iniciado_em;
		}

		public void setEstado(String estado){
			this.estado = estado;
		}
		public String getEstado(){
			return this.estado;
		}

		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

		public void setProcess_definition(String process_definition){
			this.process_definition = process_definition;
		}
		public String getProcess_definition(){
			return this.process_definition;
		}

		public void setProcess_key(String process_key){
			this.process_key = process_key;
		}
		public String getProcess_key(){
			return this.process_key;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
