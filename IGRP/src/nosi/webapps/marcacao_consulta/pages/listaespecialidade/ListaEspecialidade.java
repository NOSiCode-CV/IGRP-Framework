/*---------------------- Create Model ----------------------*/
package nosi.webapps.marcacao_consulta.pages.listaespecialidade;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class ListaEspecialidade extends Model{		
	@RParam(rParamName = "p_descricao")
	private String descricao;

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}
	
	public void setDescricao(String descricao){
		this.descricao = descricao;
	}
	public String getDescricao(){
		return this.descricao;
	}


	public static class Table_1{
		private String codigo;
		private String descricao;
		private String p_id;
		public void setCodigo(String codigo){
			this.codigo = codigo;
		}
		public String getCodigo(){
			return this.codigo;
		}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
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