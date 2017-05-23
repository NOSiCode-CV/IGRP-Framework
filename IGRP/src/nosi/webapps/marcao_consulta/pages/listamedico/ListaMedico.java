/*---------------------- Create Model ----------------------*/
package nosi.webapps.marcao_consulta.pages.listamedico;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class ListaMedico extends Model{		
	@RParam(rParamName = "p_nome")
	private String nome;

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}


	public class Table_1{
		private String nome;
		private int n_consulta_por_dia;
		private int p_id;
		public void setNome(String nome){
			this.nome = nome;
		}
		public String getNome(){
			return this.nome;
		}

		public void setN_consulta_por_dia(int n_consulta_por_dia){
			this.n_consulta_por_dia = n_consulta_por_dia;
		}
		public int getN_consulta_por_dia(){
			return this.n_consulta_por_dia;
		}

		public void setP_id(int p_id){
			this.p_id = p_id;
		}
		public int getP_id(){
			return this.p_id;
		}

	}
}
/*-------------------------*/