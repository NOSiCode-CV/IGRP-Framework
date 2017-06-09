/*---------------------- Create Model ----------------------*/
package nosi.webapps.marcao_consulta.pages.imactest;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class ImacTest extends Model{		
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_id")
	private float id;
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setId(float id){
		this.id = id;
	}
	public float getId(){
		return this.id;
	}


}
/*-------------------------*/