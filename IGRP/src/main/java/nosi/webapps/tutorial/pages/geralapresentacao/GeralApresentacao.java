package nosi.webapps.tutorial.pages.geralapresentacao;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;
import java.util.List;

public class GeralApresentacao extends Model{		
	@RParam(rParamName = "p_sectionheader_2_text")
	private String sectionheader_2_text;
	@RParam(rParamName = "p_welcome")
	private String welcome;
	@RParam(rParamName = "p_gestao")
	private String gestao;
	@RParam(rParamName = "p_desenvolvimento")
	private String desenvolvimento;
	@RParam(rParamName = "p_contribuicao")
	private String contribuicao;
	@RParam(rParamName = "p_documentos_gerais")
	private String documentos_gerais;
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_paragraph_3_text")
	private String paragraph_3_text;
	@RParam(rParamName = "p_como_instalar_igrp_java_framework")
	private String como_instalar_igrp_java_framework;
	@RParam(rParamName = "p_my_first_app")
	private String my_first_app;
	@RParam(rParamName = "p_paragraph_7_text")
	private String paragraph_7_text;
	@RParam(rParamName = "p_paragraph_6_text")
	private String paragraph_6_text;
	@RParam(rParamName = "p_paragraph_1_text")
	private String paragraph_1_text;
	@RParam(rParamName = "p_video_3_text")
	private String video_3_text;
	@RParam(rParamName = "p_paragraph_8_text")
	private String paragraph_8_text;
	@RParam(rParamName = "p_paragraph_5_text")
	private String paragraph_5_text;
	@RParam(rParamName = "p_video_7_text")
	private String video_7_text;
	@RParam(rParamName = "p_video_2_text")
	private String video_2_text;
	@RParam(rParamName = "p_video_6_text")
	private String video_6_text;
	@RParam(rParamName = "p_video_1_text")
	private String video_1_text;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}
	
	public void setSectionheader_2_text(String sectionheader_2_text){
		this.sectionheader_2_text = sectionheader_2_text;
	}
	public String getSectionheader_2_text(){
		return this.sectionheader_2_text;
	}
	
	public void setWelcome(String welcome){
		this.welcome = welcome;
	}
	public String getWelcome(){
		return this.welcome;
	}
	
	public void setGestao(String gestao){
		this.gestao = gestao;
	}
	public String getGestao(){
		return this.gestao;
	}
	
	public void setDesenvolvimento(String desenvolvimento){
		this.desenvolvimento = desenvolvimento;
	}
	public String getDesenvolvimento(){
		return this.desenvolvimento;
	}
	
	public void setContribuicao(String contribuicao){
		this.contribuicao = contribuicao;
	}
	public String getContribuicao(){
		return this.contribuicao;
	}
	
	public void setDocumentos_gerais(String documentos_gerais){
		this.documentos_gerais = documentos_gerais;
	}
	public String getDocumentos_gerais(){
		return this.documentos_gerais;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setParagraph_3_text(String paragraph_3_text){
		this.paragraph_3_text = paragraph_3_text;
	}
	public String getParagraph_3_text(){
		return this.paragraph_3_text;
	}
	
	public void setComo_instalar_igrp_java_framework(String como_instalar_igrp_java_framework){
		this.como_instalar_igrp_java_framework = como_instalar_igrp_java_framework;
	}
	public String getComo_instalar_igrp_java_framework(){
		return this.como_instalar_igrp_java_framework;
	}
	
	public void setMy_first_app(String my_first_app){
		this.my_first_app = my_first_app;
	}
	public String getMy_first_app(){
		return this.my_first_app;
	}
	
	public void setParagraph_7_text(String paragraph_7_text){
		this.paragraph_7_text = paragraph_7_text;
	}
	public String getParagraph_7_text(){
		return this.paragraph_7_text;
	}
	
	public void setParagraph_6_text(String paragraph_6_text){
		this.paragraph_6_text = paragraph_6_text;
	}
	public String getParagraph_6_text(){
		return this.paragraph_6_text;
	}
	
	public void setParagraph_1_text(String paragraph_1_text){
		this.paragraph_1_text = paragraph_1_text;
	}
	public String getParagraph_1_text(){
		return this.paragraph_1_text;
	}
	
	public void setVideo_3_text(String video_3_text){
		this.video_3_text = video_3_text;
	}
	public String getVideo_3_text(){
		return this.video_3_text;
	}
	
	public void setParagraph_8_text(String paragraph_8_text){
		this.paragraph_8_text = paragraph_8_text;
	}
	public String getParagraph_8_text(){
		return this.paragraph_8_text;
	}
	
	public void setParagraph_5_text(String paragraph_5_text){
		this.paragraph_5_text = paragraph_5_text;
	}
	public String getParagraph_5_text(){
		return this.paragraph_5_text;
	}
	
	public void setVideo_7_text(String video_7_text){
		this.video_7_text = video_7_text;
	}
	public String getVideo_7_text(){
		return this.video_7_text;
	}
	
	public void setVideo_2_text(String video_2_text){
		this.video_2_text = video_2_text;
	}
	public String getVideo_2_text(){
		return this.video_2_text;
	}
	
	public void setVideo_6_text(String video_6_text){
		this.video_6_text = video_6_text;
	}
	public String getVideo_6_text(){
		return this.video_6_text;
	}
	
	public void setVideo_1_text(String video_1_text){
		this.video_1_text = video_1_text;
	}
	public String getVideo_1_text(){
		return this.video_1_text;
	}


	public static class Table_1{
		private String documento;
		private String ver;
		private String ver_desc;
		public void setDocumento(String documento){
			this.documento = documento;
		}
		public String getDocumento(){
			return this.documento;
		}

		public void setVer(String app,String page,String action){
			this.ver = new Config().getResolveUrl(app, page, action);
		}
		public String getVer(){
			return this.ver;
		}
		public void setVer_desc(String ver_desc){
			this.ver_desc = ver_desc;
		}
		public String getVer_desc(){
			return this.ver_desc;
		}

	}
}
