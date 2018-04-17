package nosi.webapps.igrp.pages.tbl_tipo_documentoform;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import java.sql.Date;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.QueryHelper;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class Tbl_tipo_documentoForm extends Model{		
	@RParam(rParamName = "p_env_fk")
	private int env_fk;
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_descricao")
	private String descricao;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_status")
	private int status;
	@RParam(rParamName = "p_id")
	private int id;
	
	public void setEnv_fk(int env_fk){
		this.env_fk = env_fk;
	}
	public int getEnv_fk(){
		return this.env_fk;
	}
	
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
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setStatus(int status){
		this.status = status;
	}
	public int getStatus(){
		return this.status;
	}
	
	public void setId(int id){
		this.id = id;
	}
	public int getId(){
		return this.id;
	}



}
