/*---------------------- Create Model ----------------------*/
package nosi.webapps.human_resources.pages.nivel_avaliacaoform;


import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;





public class NIVEL_AVALIACAOForm extends Model{		
	@RParam(rParamName = "p_id")
	private String id;
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_nivel")
	private String nivel;
	@RParam(rParamName = "p_descricao")
	private String descricao;
	@RParam(rParamName = "p_cor")
	private String cor;
	
	public void setId(String id){
		this.id = id;
	}
	public String getId(){
		return this.id;
	}
	
	public void setCodigo(String codigo){
		this.codigo = codigo;
	}
	public String getCodigo(){
		return this.codigo;
	}
	
	public void setNivel(String nivel){
		this.nivel = nivel;
	}
	public String getNivel(){
		return this.nivel;
	}
	
	public void setDescricao(String descricao){
		this.descricao = descricao;
	}
	public String getDescricao(){
		return this.descricao;
	}
	
	public void setCor(String cor){
		this.cor = cor;
	}
	public String getCor(){
		return this.cor;
	}



}
/*-------------------------*/
