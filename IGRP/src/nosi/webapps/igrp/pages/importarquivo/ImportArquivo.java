/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.importarquivo;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class ImportArquivo extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_arquivo")
	private String arquivo;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setArquivo(String arquivo){
		this.arquivo = arquivo;
	}
	public String getArquivo(){
		return this.arquivo;
	}


}
/*-------------------------*/