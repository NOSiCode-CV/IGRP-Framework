/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.lst_serv;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class LST_SERV extends Model{		
	@RParam(rParamName = "p_entidade")
	private String entidade;

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}
	
	public void setEntidade(String entidade){
		this.entidade = entidade;
	}
	public String getEntidade(){
		return this.entidade;
	}


	public class Table_1{
		private String servico;
		private int checkbox_1;
		private int checkbox_1_check;
		private int p_id;
		private String table_1_filter;
		public void setServico(String servico){
			this.servico = servico;
		}
		public String getServico(){
			return this.servico;
		}

		public void setCheckbox_1(int checkbox_1){
			this.checkbox_1 = checkbox_1;
		}
		public int getCheckbox_1(){
			return this.checkbox_1;
		}
		public void setCheckbox_1_check(int checkbox_1_check){
			this.checkbox_1_check = checkbox_1_check;
		}
		public int getCheckbox_1_check(){
			return this.checkbox_1_check;
		}

		public void setP_id(Integer p_id){
			this.p_id = p_id;
		}
		public Integer getP_id(){
			return this.p_id;
		}

		public void setTable_1_filter(String table_1_filter){
			this.table_1_filter = table_1_filter;
		}
		public String getTable_1_filter(){
			return this.table_1_filter;
		}

	}
}
/*-------------------------*/