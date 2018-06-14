package nosi.webapps.human_resources.pages.indicadorlist;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;



import java.util.ArrayList;
import java.util.List;

public class INDICADORList extends Model{		
	
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


	public static class Table_1 extends IGRPTable.Table{
		private String id_tp_indicador;
		private String id_atrib;
		private String codigo;
		private String nome;
		private String descricao;
		private String id_area;
		private String id;
		public void setId_tp_indicador(String id_tp_indicador){
			this.id_tp_indicador = id_tp_indicador;
		}
		public String getId_tp_indicador(){
			return this.id_tp_indicador;
		}

		public void setId_atrib(String id_atrib){
			this.id_atrib = id_atrib;
		}
		public String getId_atrib(){
			return this.id_atrib;
		}

		public void setCodigo(String codigo){
			this.codigo = codigo;
		}
		public String getCodigo(){
			return this.codigo;
		}

		public void setNome(String nome){
			this.nome = nome;
		}
		public String getNome(){
			return this.nome;
		}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

		public void setId_area(String id_area){
			this.id_area = id_area;
		}
		public String getId_area(){
			return this.id_area;
		}

		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
