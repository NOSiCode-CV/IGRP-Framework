/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.addservicos;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class AddServicos extends Model{		
	@RParam(rParamName = "p_page_title_text")
	private String page_title_text;
	@RParam(rParamName = "p_entidade")
	private String entidade;
	@RParam(rParamName = "p_balcao")
	private String balcao;

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}
	
	public void setPage_title_text(String page_title_text){
		this.page_title_text = page_title_text;
	}
	public String getPage_title_text(){
		return this.page_title_text;
	}
	
	public void setEntidade(String entidade){
		this.entidade = entidade;
	}
	public String getEntidade(){
		return this.entidade;
	}
	
	public void setBalcao(String balcao){
		this.balcao = balcao;
	}
	public String getBalcao(){
		return this.balcao;
	}


	public class Table_1{
		private String servicos;
		private int checkbox_1;
		private int checkbox_1_check;
		public void setServicos(String servicos){
			this.servicos = servicos;
		}
		public String getServicos(){
			return this.servicos;
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

	}
}
/*-------------------------*/