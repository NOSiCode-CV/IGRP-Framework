/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.editartransacao;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class EditarTransacao extends Model{		
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_descricao")
	private String descricao;
	@RParam(rParamName = "p_aplicacao")
	private int aplicacao;
	@RParam(rParamName = "p_status")
	private int status;
	@RParam(rParamName = "p_id")
	private int id;
	
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
	
	public void setAplicacao(int aplicacao){
		this.aplicacao = aplicacao;
	}
	
	public int getAplicacao(){
		return this.aplicacao;
	}
	
	public void setStatus(int status){
		this.status = status;
	}
	public int getStatus(){
		return this.status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
/*-------------------------*/