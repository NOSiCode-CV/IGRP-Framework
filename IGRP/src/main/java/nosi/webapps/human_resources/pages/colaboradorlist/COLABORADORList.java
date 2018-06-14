package nosi.webapps.human_resources.pages.colaboradorlist;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;



import java.util.ArrayList;
import java.util.List;

public class COLABORADORList extends Model{		
	
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
		private int id;
		private String codigo;
		private String nome;
		private String dt_nasc;
		private String dt_ini_act;
		private String id_depart;
		private String id_equipe;
		private String id_atrib;
		public void setId(int id){
			this.id = id;
		}
		public int getId(){
			return this.id;
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

		public void setDt_nasc(String dt_nasc){
			this.dt_nasc = dt_nasc;
		}
		public String getDt_nasc(){
			return this.dt_nasc;
		}

		public void setDt_ini_act(String dt_ini_act){
			this.dt_ini_act = dt_ini_act;
		}
		public String getDt_ini_act(){
			return this.dt_ini_act;
		}

		public void setId_depart(String id_depart){
			this.id_depart = id_depart;
		}
		public String getId_depart(){
			return this.id_depart;
		}

		public void setId_equipe(String id_equipe){
			this.id_equipe = id_equipe;
		}
		public String getId_equipe(){
			return this.id_equipe;
		}

		public void setId_atrib(String id_atrib){
			this.id_atrib = id_atrib;
		}
		public String getId_atrib(){
			return this.id_atrib;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
