/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.importarquivo;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class ImportArquivo extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_importar_aplicacao")
	private String importar_aplicacao;
	@RParam(rParamName = "p_importar_pagina")
	private String importar_pagina;
	@RParam(rParamName = "p_arquivo_aplicacao")
	private String arquivo_aplicacao;
	@RParam(rParamName = "p_list_aplicacao")
	private String list_aplicacao;
	@RParam(rParamName = "p_arquivo_pagina")
	private String arquivo_pagina;
	
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


}
/*-------------------------*/