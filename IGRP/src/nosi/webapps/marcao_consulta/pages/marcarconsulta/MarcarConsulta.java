/*---------------------- Create Model ----------------------*/
package nosi.webapps.marcao_consulta.pages.marcarconsulta;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class MarcarConsulta extends Model{		
	@RParam(rParamName = "p_utente")
	private int utente;
	@RParam(rParamName = "p_medico")
	private int medico;
	@RParam(rParamName = "p_data_consulta")
	private String data_consulta;
	
	public void setUtente(int utente){
		this.utente = utente;
	}
	public int getUtente(){
		return this.utente;
	}
	
	public void setMedico(int medico){
		this.medico = medico;
	}
	public int getMedico(){
		return this.medico;
	}
	
	public void setData_consulta(String data_consulta){
		this.data_consulta = data_consulta;
	}
	public String getData_consulta(){
		return this.data_consulta;
	}


}
/*-------------------------*/