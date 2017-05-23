/*---------------------- Create Model ----------------------*/
package nosi.webapps.marcao_consulta.pages.consultapendente;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class ConsultaPendente extends Model{		
	@RParam(rParamName = "p_nome_utente")
	private String nome_utente;
	@RParam(rParamName = "p_data_consulta")
	private String data_consulta;

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}
	
	public void setNome_utente(String nome_utente){
		this.nome_utente = nome_utente;
	}
	public String getNome_utente(){
		return this.nome_utente;
	}
	
	public void setData_consulta(String data_consulta){
		this.data_consulta = data_consulta;
	}
	public String getData_consulta(){
		return this.data_consulta;
	}


	public class Table_1{
		private String nome_utente;
		private String medico_a_consultar;
		private String data_da_consulta;
		private int p_id;
		public void setNome_utente(String nome_utente){
			this.nome_utente = nome_utente;
		}
		public String getNome_utente(){
			return this.nome_utente;
		}

		public void setMedico_a_consultar(String medico_a_consultar){
			this.medico_a_consultar = medico_a_consultar;
		}
		public String getMedico_a_consultar(){
			return this.medico_a_consultar;
		}

		public void setData_da_consulta(String data_da_consulta){
			this.data_da_consulta = data_da_consulta;
		}
		public String getData_da_consulta(){
			return this.data_da_consulta;
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