package nosi.webapps.tutorial.pages.inserir_documento;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

import nosi.core.validator.constraints.*;

public class Inserir_documento extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@RParam(rParamName = "p_titulo")
	private String titulo;

	@NotNull()
	@RParam(rParamName = "p_type")
	private String type;

	@RParam(rParamName = "p_ordem")
	private Integer ordem;

	@RParam(rParamName = "p_descricao")
	private String descricao;

	@RParam(rParamName = "p_relacionados")
	private String[] relacionados;

	@RParam(rParamName = "p_id_doc")
	private String id_doc;

	@RParam(rParamName = "p_link_upload_img")
	private String link_upload_img;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setTitulo(String titulo){
		this.titulo = titulo;
	}
	public String getTitulo(){
		return this.titulo;
	}
	
	public void setType(String type){
		this.type = type;
	}
	public String getType(){
		return this.type;
	}
	
	public void setOrdem(Integer ordem){
		this.ordem = ordem;
	}
	public Integer getOrdem(){
		return this.ordem;
	}
	
	public void setDescricao(String descricao){
		this.descricao = descricao;
	}
	public String getDescricao(){
		return this.descricao;
	}
	
	public void setRelacionados(String[] relacionados){
		this.relacionados = relacionados;
	}
	public String[] getRelacionados(){
		return this.relacionados;
	}
	
	public void setId_doc(String id_doc){
		this.id_doc = id_doc;
	}
	public String getId_doc(){
		return this.id_doc;
	}
	
	public void setLink_upload_img(String link_upload_img){
		this.link_upload_img = link_upload_img;
	}
	public String getLink_upload_img(){
		return this.link_upload_img;
	}



}
