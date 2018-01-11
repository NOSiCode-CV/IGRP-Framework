package nosi.webapps.igrp.pages._cons_proc;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class _CONS_PROC extends Model{		
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_organica")
	private String organica;
	@RParam(rParamName = "p_area_fk")
	private String area_fk;
	@RParam(rParamName = "p_proc_tp_fk")
	private String proc_tp_fk;
	@RParam(rParamName = "p_user_fk")
	private String user_fk;
	@RParam(rParamName = "p_status")
	private String status;
	@RParam(rParamName = "p_referencia_pedido")
	private String referencia_pedido;
	@RParam(rParamName = "p_requerente")
	private String requerente;
	@RParam(rParamName = "p_num")
	private String num;
	@RParam(rParamName = "p_intervalo_entrada")
	private String intervalo_entrada;
	@RParam(rParamName = "p_dt_ini")
	private String dt_ini;
	@RParam(rParamName = "p_dt_fim")
	private String dt_fim;
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setOrganica(String organica){
		this.organica = organica;
	}
	public String getOrganica(){
		return this.organica;
	}
	
	public void setArea_fk(String area_fk){
		this.area_fk = area_fk;
	}
	public String getArea_fk(){
		return this.area_fk;
	}
	
	public void setProc_tp_fk(String proc_tp_fk){
		this.proc_tp_fk = proc_tp_fk;
	}
	public String getProc_tp_fk(){
		return this.proc_tp_fk;
	}
	
	public void setUser_fk(String user_fk){
		this.user_fk = user_fk;
	}
	public String getUser_fk(){
		return this.user_fk;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	public String getStatus(){
		return this.status;
	}
	
	public void setReferencia_pedido(String referencia_pedido){
		this.referencia_pedido = referencia_pedido;
	}
	public String getReferencia_pedido(){
		return this.referencia_pedido;
	}
	
	public void setRequerente(String requerente){
		this.requerente = requerente;
	}
	public String getRequerente(){
		return this.requerente;
	}
	
	public void setNum(String num){
		this.num = num;
	}
	public String getNum(){
		return this.num;
	}
	
	public void setIntervalo_entrada(String intervalo_entrada){
		this.intervalo_entrada = intervalo_entrada;
	}
	public String getIntervalo_entrada(){
		return this.intervalo_entrada;
	}
	
	public void setDt_ini(String dt_ini){
		this.dt_ini = dt_ini;
	}
	public String getDt_ini(){
		return this.dt_ini;
	}
	
	public void setDt_fim(String dt_fim){
		this.dt_fim = dt_fim;
	}
	public String getDt_fim(){
		return this.dt_fim;
	}


}
