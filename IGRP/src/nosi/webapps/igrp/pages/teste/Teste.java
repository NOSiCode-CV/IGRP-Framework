/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.teste;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Teste extends Model{ 
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_email_1")
	private String email_1;
	@RParam(rParamName = "p_file_1")
	private String file_1;
	@RParam(rParamName = "p_file_2")
	private String file_2;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setEmail_1(String email_1){
		this.email_1 = email_1;
	}
	public String getEmail_1(){
		return this.email_1;
	}
	
	public void setFile_1(String file_1){
		this.file_1 = file_1;
	}
	public String getFile_1(){
		return this.file_1;
	}
	
	public void setFile_2(String file_2){
		this.file_2 = file_2;
	}
	public String getFile_2(){
		return this.file_2;
	}
}
