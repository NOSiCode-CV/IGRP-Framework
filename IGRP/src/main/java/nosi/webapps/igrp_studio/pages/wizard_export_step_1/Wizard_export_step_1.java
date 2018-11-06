package nosi.webapps.igrp_studio.pages.wizard_export_step_1;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Wizard_export_step_1 extends Model{		
	@RParam(rParamName = "p_exportacao_aplicacao___passo_1")
	private String exportacao_aplicacao___passo_1;
	@RParam(rParamName = "p_selecionar_opcao")
	private int[] selecionar_opcao;
	@RParam(rParamName = "p_application_id")
	private int application_id;
	
	public void setExportacao_aplicacao___passo_1(String exportacao_aplicacao___passo_1){
		this.exportacao_aplicacao___passo_1 = exportacao_aplicacao___passo_1;
	}
	public String getExportacao_aplicacao___passo_1(){
		return this.exportacao_aplicacao___passo_1;
	}
	
	public void setSelecionar_opcao(int[] selecionar_opcao){
		this.selecionar_opcao = selecionar_opcao;
	}
	public int[] getSelecionar_opcao(){
		return this.selecionar_opcao;
	}
	
	public void setApplication_id(int application_id){
		this.application_id = application_id;
	}
	public int getApplication_id(){
		return this.application_id;
	}



}
