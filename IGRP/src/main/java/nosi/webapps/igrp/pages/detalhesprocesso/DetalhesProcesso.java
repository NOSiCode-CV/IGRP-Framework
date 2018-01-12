package nosi.webapps.igrp.pages.detalhesprocesso;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class DetalhesProcesso extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_numero_de_processo")
	private String numero_de_processo;
	@RParam(rParamName = "p_descricao")
	private String descricao;
	@RParam(rParamName = "p_data_criacao_de_processo")
	private String data_criacao_de_processo;
	@RParam(rParamName = "p_data_inicio_de_processo")
	private String data_inicio_de_processo;
	@RParam(rParamName = "p_data_fim_processo")
	private String data_fim_processo;
	@RParam(rParamName = "p_view_1_img")
	private String view_1_img;
	@RParam(rParamName = "p_img_1")
	private String img_1;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setNumero_de_processo(String numero_de_processo){
		this.numero_de_processo = numero_de_processo;
	}
	public String getNumero_de_processo(){
		return this.numero_de_processo;
	}
	
	public void setDescricao(String descricao){
		this.descricao = descricao;
	}
	public String getDescricao(){
		return this.descricao;
	}
	
	public void setData_criacao_de_processo(String data_criacao_de_processo){
		this.data_criacao_de_processo = data_criacao_de_processo;
	}
	public String getData_criacao_de_processo(){
		return this.data_criacao_de_processo;
	}
	
	public void setData_inicio_de_processo(String data_inicio_de_processo){
		this.data_inicio_de_processo = data_inicio_de_processo;
	}
	public String getData_inicio_de_processo(){
		return this.data_inicio_de_processo;
	}
	
	public void setData_fim_processo(String data_fim_processo){
		this.data_fim_processo = data_fim_processo;
	}
	public String getData_fim_processo(){
		return this.data_fim_processo;
	}
	
	public void setView_1_img(String view_1_img){
		this.view_1_img = view_1_img;
	}
	public String getView_1_img(){
		return this.view_1_img;
	}
	
	public void setImg_1(String img_1){
		this.img_1 = img_1;
	}
	public String getImg_1(){
		return this.img_1;
	}


}
