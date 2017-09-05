/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.lst_entidade;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class LST_ENTIDADE extends Model{		
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


	public static class Table_1{
		private String entidade;
		private String estado;
		private String p_id;
		public void setEntidade(String entidade){
			this.entidade = entidade;
		}
		public String getEntidade(){
			return this.entidade;
		}

		public void setEstado(String estado){
			this.estado = estado;
		}
		public String getEstado(){
			return this.estado;
		}

		public void setP_id(String p_id){
			this.p_id = p_id;
		}
		public String getP_id(){
			return this.p_id;
		}

	}
}
/*-------------------------*/