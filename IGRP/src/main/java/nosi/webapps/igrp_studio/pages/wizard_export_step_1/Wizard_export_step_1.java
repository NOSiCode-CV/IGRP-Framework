package nosi.webapps.igrp_studio.pages.wizard_export_step_1;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Report;

public class Wizard_export_step_1 extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@RParam(rParamName = "p_file_name")
	private String file_name;

	@RParam(rParamName = "p_selecionar_opcao")
	private String[] selecionar_opcao;

	@RParam(rParamName = "p_application_id")
	private int application_id;

	@RParam(rParamName = "p_help")
	private IGRPLink help;
	@RParam(rParamName = "p_help_desc")
	private String help_desc;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setFile_name(String file_name){
		this.file_name = file_name;
	}
	public String getFile_name(){
		return this.file_name;
	}
	
	public void setSelecionar_opcao(String[] selecionar_opcao){
		this.selecionar_opcao = selecionar_opcao;
	}
	public String[] getSelecionar_opcao(){
		return this.selecionar_opcao;
	}
	
	public void setApplication_id(int application_id){
		this.application_id = application_id;
	}
	public int getApplication_id(){
		return this.application_id;
	}
	
	public IGRPLink setHelp(String app,String page,String action){
		this.help = new IGRPLink(app,page,action);
		return this.help;
	}
	public IGRPLink getHelp(){
		return this.help;
	}
	public void setHelp_desc(String help_desc){
		this.help_desc = help_desc;
	}
	public String getHelp_desc(){
		return this.help_desc;
	}
	public IGRPLink setHelp(String link){
		this.help = new IGRPLink(link);
		return this.help;
	}
	public IGRPLink setHelp(Report link){
		this.help = new IGRPLink(link);
		return this.help;
	}



}
