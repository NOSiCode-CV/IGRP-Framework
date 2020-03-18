package nosi.webapps.tutorial.pages.parametrizacao_tipo;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Parametrizacao_tipo extends Model{		

	@RParam(rParamName = "p_tipo")
	private String tipo;

	@RParam(rParamName = "p_descricao")
	private String descricao;

	@RParam(rParamName = "p_ordem")
	private Integer ordem;

	@RParam(rParamName = "p_id_tipo_form")
	private int id_tipo_form;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}

	
	public void setTipo(String tipo){
		this.tipo = tipo;
	}
	public String getTipo(){
		return this.tipo;
	}
	
	public void setDescricao(String descricao){
		this.descricao = descricao;
	}
	public String getDescricao(){
		return this.descricao;
	}
	
	public void setOrdem(Integer ordem){
		this.ordem = ordem;
	}
	public Integer getOrdem(){
		return this.ordem;
	}
	
	public void setId_tipo_form(int id_tipo_form){
		this.id_tipo_form = id_tipo_form;
	}
	public int getId_tipo_form(){
		return this.id_tipo_form;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String nome_tipo;
		private String descricao_do_tipo;
		private Integer ordem_tbl;
		private int id_tipo;
		public void setNome_tipo(String nome_tipo){
			this.nome_tipo = nome_tipo;
		}
		public String getNome_tipo(){
			return this.nome_tipo;
		}

		public void setDescricao_do_tipo(String descricao_do_tipo){
			this.descricao_do_tipo = descricao_do_tipo;
		}
		public String getDescricao_do_tipo(){
			return this.descricao_do_tipo;
		}

		public void setOrdem_tbl(Integer ordem_tbl){
			this.ordem_tbl = ordem_tbl;
		}
		public Integer getOrdem_tbl(){
			return this.ordem_tbl;
		}

		public void setId_tipo(int id_tipo){
			this.id_tipo = id_tipo;
		}
		public int getId_tipo(){
			return this.id_tipo;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
