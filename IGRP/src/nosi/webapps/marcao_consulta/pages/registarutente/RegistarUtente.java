/*---------------------- Create Model ----------------------*/
package nosi.webapps.marcao_consulta.pages.registarutente;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class RegistarUtente extends Model{		
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_morada")
	private String morada;
	@RParam(rParamName = "p_data_nascimento")
	private String data_nascimento;
	@RParam(rParamName = "p_sexo")
	private int sexo;
	
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
	
	public void setData_nascimento(String data_nascimento){
		this.data_nascimento = data_nascimento;
	}
	public String getData_nascimento(){
		return this.data_nascimento;
	}
	
	public void setSexo(int sexo){
		this.sexo = sexo;
	}
	public int getSexo(){
		return this.sexo;
	}


}
/*-------------------------*/