package nosi.webapps.igrp.pages.dash_board_processo;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Dash_board_processo extends Model{		
	@RParam(rParamName = "p_detalhes_processo")
	private String detalhes_processo;
	@RParam(rParamName = "p_instanciasocorencias")
	private String instanciasocorencias;
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
	
	private List<Table_2> table_2 = new ArrayList<>();	
	public void setTable_2(List<Table_2> table_2){
		this.table_2 = table_2;
	}
	public List<Table_2> getTable_2(){
		return this.table_2;
	}
	@RParam(rParamName = "p_table_2_id")
	private String[] p_table_2_id;
	@RParam(rParamName = "p_table_2_del")
	private String[] p_table_2_del;
	
	public void setP_table_2_id(String[] p_table_2_id){
		this.p_table_2_id = p_table_2_id;
	}
	public String[] getP_table_2_id(){
		return this.p_table_2_id;
	}
	
	public void setP_table_2_del(String[] p_table_2_del){
		this.p_table_2_del = p_table_2_del;
	}
	public String[] getP_table_2_del(){
		return this.p_table_2_del;
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
	
	public void setDetalhes_processo(String detalhes_processo){
		this.detalhes_processo = detalhes_processo;
	}
	public String getDetalhes_processo(){
		return this.detalhes_processo;
	}
	
	public void setInstanciasocorencias(String instanciasocorencias){
		this.instanciasocorencias = instanciasocorencias;
	}
	public String getInstanciasocorencias(){
		return this.instanciasocorencias;
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


	public static class Table_2 extends IGRPTable.Table{
		private IGRPLink nome_processo;
		private String nome_processo_desc;
		private String process_id;
		public IGRPLink setNome_processo(String app,String page,String action){
			this.nome_processo = new IGRPLink(app,page,action);
			return this.nome_processo;
		}
		public IGRPLink getNome_processo(){
			return this.nome_processo;
		}
		public void setNome_processo_desc(String nome_processo_desc){
			this.nome_processo_desc = nome_processo_desc;
		}
		public String getNome_processo_desc(){
			return this.nome_processo_desc;
		}
	public IGRPLink setNome_processo(String link){
		this.nome_processo = new IGRPLink(link);
		return this.nome_processo;
	}
	public IGRPLink setNome_processo(Report link){
		this.nome_processo = new IGRPLink(link);
		return this.nome_processo;
	}

		public void setProcess_id(String process_id){
			this.process_id = process_id;
		}
		public String getProcess_id(){
			return this.process_id;
		}

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

	public void loadTable_2(BaseQueryInterface query) {
		this.setTable_2(this.loadTable(query,Table_2.class));
	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
