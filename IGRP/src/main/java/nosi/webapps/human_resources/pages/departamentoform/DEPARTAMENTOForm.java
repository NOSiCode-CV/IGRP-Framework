package nosi.webapps.human_resources.pages.departamentoform;


import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;





public class DEPARTAMENTOForm extends Model{		
	@RParam(rParamName = "p_id")
	private String id;
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_nome")
	private String nome;
	
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
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}



}
