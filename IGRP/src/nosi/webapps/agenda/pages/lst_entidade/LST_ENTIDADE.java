/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.lst_entidade;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class LST_ENTIDADE extends Model{		
	@RParam(rParamName = "p_entidade")
	private String entidade;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;

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
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}


	public static class Table_1{
		private String entidade;
		private String aplicacao;
		private String p_id;
		private String table_1_filter;
		public void setEntidade(String entidade){
			this.entidade = entidade;
		}
		public String getEntidade(){
			return this.entidade;
		}

		public void setAplicacao(String aplicacao){
			this.aplicacao = aplicacao;
		}
		public String getAplicacao(){
			return this.aplicacao;
		}

		public void setP_id(String p_id){
			this.p_id = p_id;
		}
		public String getP_id(){
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