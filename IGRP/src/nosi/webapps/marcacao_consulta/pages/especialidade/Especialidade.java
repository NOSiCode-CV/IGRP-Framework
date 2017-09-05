/*---------------------- Create Model ----------------------*/
package nosi.webapps.marcacao_consulta.pages.especialidade;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Especialidade extends Model{		
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_descricao")
	private String descricao;
	@RParam(rParamName = "p_id")
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
/*-------------------------*/