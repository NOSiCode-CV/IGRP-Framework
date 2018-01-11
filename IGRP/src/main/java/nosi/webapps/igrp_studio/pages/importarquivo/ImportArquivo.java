package nosi.webapps.igrp_studio.pages.importarquivo;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class ImportArquivo extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_importar_aplicacao")
	private String importar_aplicacao;
	@RParam(rParamName = "p_importar_pagina")
	private String importar_pagina;
	@RParam(rParamName = "p_importar_jar_file")
	private String importar_jar_file;
	@RParam(rParamName = "p_sectionheader_2_text")
	private String sectionheader_2_text;
	@RParam(rParamName = "p_sectionheader_3_text")
	private String sectionheader_3_text;
	@RParam(rParamName = "p_sectionheader_4_text")
	private String sectionheader_4_text;
	@RParam(rParamName = "p_arquivo_aplicacao")
	private String arquivo_aplicacao;
	@RParam(rParamName = "p_list_aplicacao")
	private String list_aplicacao;
	@RParam(rParamName = "p_arquivo_pagina")
	private String arquivo_pagina;
	@RParam(rParamName = "p_jar_file")
	private String jar_file;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setImportar_aplicacao(String importar_aplicacao){
		this.importar_aplicacao = importar_aplicacao;
	}
	public String getImportar_aplicacao(){
		return this.importar_aplicacao;
	}
	
	public void setImportar_pagina(String importar_pagina){
		this.importar_pagina = importar_pagina;
	}
	public String getImportar_pagina(){
		return this.importar_pagina;
	}
	
	public void setImportar_jar_file(String importar_jar_file){
		this.importar_jar_file = importar_jar_file;
	}
	public String getImportar_jar_file(){
		return this.importar_jar_file;
	}
	
	public void setSectionheader_2_text(String sectionheader_2_text){
		this.sectionheader_2_text = sectionheader_2_text;
	}
	public String getSectionheader_2_text(){
		return this.sectionheader_2_text;
	}
	
	public void setSectionheader_3_text(String sectionheader_3_text){
		this.sectionheader_3_text = sectionheader_3_text;
	}
	public String getSectionheader_3_text(){
		return this.sectionheader_3_text;
	}
	
	public void setSectionheader_4_text(String sectionheader_4_text){
		this.sectionheader_4_text = sectionheader_4_text;
	}
	public String getSectionheader_4_text(){
		return this.sectionheader_4_text;
	}
	
	public void setArquivo_aplicacao(String arquivo_aplicacao){
		this.arquivo_aplicacao = arquivo_aplicacao;
	}
	public String getArquivo_aplicacao(){
		return this.arquivo_aplicacao;
	}
	
	public void setList_aplicacao(String list_aplicacao){
		this.list_aplicacao = list_aplicacao;
	}
	public String getList_aplicacao(){
		return this.list_aplicacao;
	}
	
	public void setArquivo_pagina(String arquivo_pagina){
		this.arquivo_pagina = arquivo_pagina;
	}
	public String getArquivo_pagina(){
		return this.arquivo_pagina;
	}
	
	public void setJar_file(String jar_file){
		this.jar_file = jar_file;
	}
	public String getJar_file(){
		return this.jar_file;
	}


}
