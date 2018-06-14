package nosi.webapps.human_resources.pages.indicadorform;


import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;





public class INDICADORForm extends Model{		
	@RParam(rParamName = "p_id")
	private String id;
	@RParam(rParamName = "p_id_tp_indicador")
	private String id_tp_indicador;
	@RParam(rParamName = "p_id_atrib")
	private String id_atrib;
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_descricao")
	private String descricao;
	@RParam(rParamName = "p_id_area")
	private String id_area;
	
	public void setId(String id){
		this.id = id;
	}
	public String getId(){
		return this.id;
	}
	
	public void setId_tp_indicador(String id_tp_indicador){
		this.id_tp_indicador = id_tp_indicador;
	}
	public String getId_tp_indicador(){
		return this.id_tp_indicador;
	}
	
	public void setId_atrib(String id_atrib){
		this.id_atrib = id_atrib;
	}
	public String getId_atrib(){
		return this.id_atrib;
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
	
	public void setDescricao(String descricao){
		this.descricao = descricao;
	}
	public String getDescricao(){
		return this.descricao;
	}
	
	public void setId_area(String id_area){
		this.id_area = id_area;
	}
	public String getId_area(){
		return this.id_area;
	}



}
