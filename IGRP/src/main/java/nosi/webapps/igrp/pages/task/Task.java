package nosi.webapps.igrp.pages.task;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
public class Task extends Model{		

	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;

	@RParam(rParamName = "p_processo")
	private String processo;
	
	@SeparatorList(name = Table_1.class)
	@Valid
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
	@RParam(rParamName = "p_table_1_edit")
	private String[] p_table_1_edit;
	
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
	
	public void setP_table_1_edit(String[] p_table_1_edit){
		this.p_table_1_edit = p_table_1_edit;
	}
	public String[] getP_table_1_edit(){
		return this.p_table_1_edit;
	}
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setProcesso(String processo){
		this.processo = processo;
	}
	public String getProcesso(){
		return this.processo;
	}


	public static class Table_1{
		private Pair table_1_id;
private Pair descricao;
private Pair ordem;
		public void setTable_1_id(Pair table_1_id){
			this.table_1_id = table_1_id;
		}
		public void setTable_1_id(String key){
			this.setTable_1_id(key, key);
		}
		public void setTable_1_id(String key, String value){
			this.table_1_id= new Pair(key, value);
		}
		public Pair getTable_1_id(){
			return this.table_1_id;
		}
		public void setDescricao(Pair descricao){
			this.descricao = descricao;
		}
		public void setDescricao(String key){
			this.setDescricao(key, key);
		}
		public void setDescricao(String key, String value){
			this.descricao= new Pair(key, value);
		}
		public Pair getDescricao(){
			return this.descricao;
		}

		public void setOrdem(Pair ordem){
			this.ordem = ordem;
		}
		public void setOrdem(String key){
			this.setOrdem(key, key);
		}
		public void setOrdem(String key, String value){
			this.ordem= new Pair(key, value);
		}
		public Pair getOrdem(){
			return this.ordem;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadFormList(query,Table_1.class));
	}

}
