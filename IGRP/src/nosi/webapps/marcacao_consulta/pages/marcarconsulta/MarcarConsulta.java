/*---------------------- Create Model ----------------------*/
package nosi.webapps.marcacao_consulta.pages.marcarconsulta;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class MarcarConsulta extends Model{		
	@RParam(rParamName = "p_utente")
	private String utente;
	@RParam(rParamName = "p_medico")
	private String medico;
	@RParam(rParamName = "p_especialidade")
	private String especialidade;
	@RParam(rParamName = "p_data_consulta")
	private String data_consulta;
	
	public void setUtente(String utente){
		this.utente = utente;
	}
	public String getUtente(){
		return this.utente;
	}
	
	public void setMedico(String medico){
		this.medico = medico;
	}
	public String getMedico(){
		return this.medico;
	}
	
	public void setEspecialidade(String especialidade){
		this.especialidade = especialidade;
	}
	public String getEspecialidade(){
		return this.especialidade;
	}
	
	public void setData_consulta(String data_consulta){
		this.data_consulta = data_consulta;
	}
	public String getData_consulta(){
		return this.data_consulta;
	}


}
/*-------------------------*/