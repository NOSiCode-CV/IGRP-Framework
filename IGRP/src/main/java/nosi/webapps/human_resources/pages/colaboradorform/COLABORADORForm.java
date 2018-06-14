package nosi.webapps.human_resources.pages.colaboradorform;


import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;





public class COLABORADORForm extends Model{		
	@RParam(rParamName = "p_id")
	private String id;
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_dt_nasc")
	private String dt_nasc;
	@RParam(rParamName = "p_dt_ini_act")
	private String dt_ini_act;
	@RParam(rParamName = "p_id_depart")
	private String id_depart;
	@RParam(rParamName = "p_id_equipe")
	private String id_equipe;
	@RParam(rParamName = "p_id_atrib")
	private String id_atrib;
	
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
	
	public void setDt_nasc(String dt_nasc){
		this.dt_nasc = dt_nasc;
	}
	public String getDt_nasc(){
		return this.dt_nasc;
	}
	
	public void setDt_ini_act(String dt_ini_act){
		this.dt_ini_act = dt_ini_act;
	}
	public String getDt_ini_act(){
		return this.dt_ini_act;
	}
	
	public void setId_depart(String id_depart){
		this.id_depart = id_depart;
	}
	public String getId_depart(){
		return this.id_depart;
	}
	
	public void setId_equipe(String id_equipe){
		this.id_equipe = id_equipe;
	}
	public String getId_equipe(){
		return this.id_equipe;
	}
	
	public void setId_atrib(String id_atrib){
		this.id_atrib = id_atrib;
	}
	public String getId_atrib(){
		return this.id_atrib;
	}



}
