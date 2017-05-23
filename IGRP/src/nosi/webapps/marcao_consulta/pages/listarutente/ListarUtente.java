/*---------------------- Create Model ----------------------*/
package nosi.webapps.marcao_consulta.pages.listarutente;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class ListarUtente extends Model{		
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_sexo")
	private int sexo;

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
	
	public void setSexo(int sexo){
		this.sexo = sexo;
	}
	public int getSexo(){
		return this.sexo;
	}


	public class Table_1{
		private String nome;
		private String morada;
		private String sexo;
		private int idade;
		private int p_id;
		public void setNome(String nome){
			this.nome = nome;
		}
		public String getNome(){
			return this.nome;
		}

		public void setMorada(String morada){
			this.morada = morada;
		}
		public String getMorada(){
			return this.morada;
		}

		public void setSexo(String sexo){
			this.sexo = sexo;
		}
		public String getSexo(){
			return this.sexo;
		}

		public void setIdade(int idade){
			this.idade = idade;
		}
		public int getIdade(){
			return this.idade;
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