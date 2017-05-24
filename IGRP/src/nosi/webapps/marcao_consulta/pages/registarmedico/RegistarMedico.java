/*---------------------- Create Model ----------------------*/
package nosi.webapps.marcao_consulta.pages.registarmedico;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class RegistarMedico extends Model{		
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_morada")
	private String morada;
	@RParam(rParamName = "p_n_consulta_por_dia")
	private int n_consulta_por_dia = 1;
	
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
	
	public void setN_consulta_por_dia(int n_consulta_por_dia){
		this.n_consulta_por_dia = n_consulta_por_dia;
	}
	public int getN_consulta_por_dia(){
		return this.n_consulta_por_dia;
	}


}
/*-------------------------*/