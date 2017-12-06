package nosi.webapps.tutorial.pages.geralapresentacao;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class GeralApresentacao extends Model{		
	@RParam(rParamName = "p_sectionheader_2_text")
	private String sectionheader_2_text;
	@RParam(rParamName = "p_videos")
	private String videos;
	@RParam(rParamName = "p_documentos")
	private String documentos;
	@RParam(rParamName = "p_bem_vindo")
	private String bem_vindo;
	@RParam(rParamName = "p_como_instalar_o_igrp")
	private String como_instalar_o_igrp;
	@RParam(rParamName = "p_demo_de_um_aplicacao")
	private String demo_de_um_aplicacao;
	@RParam(rParamName = "p_minha_primeira_aplicacao")
	private String minha_primeira_aplicacao;
	@RParam(rParamName = "p_como_contribuir")
	private String como_contribuir;
	@RParam(rParamName = "p_paragraph_6_text")
	private String paragraph_6_text;
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_paragraph_3_text")
	private String paragraph_3_text;
	@RParam(rParamName = "p_paragraph_5_text")
	private String paragraph_5_text;
	@RParam(rParamName = "p_paragraph_4_text")
	private String paragraph_4_text;
	@RParam(rParamName = "p_paragraph_2_text")
	private String paragraph_2_text;
	@RParam(rParamName = "p_paragraph_1_text")
	private String paragraph_1_text;
	@RParam(rParamName = "p_video_3_text")
	private String video_3_text;
	@RParam(rParamName = "p_video_5_text")
	private String video_5_text;
	@RParam(rParamName = "p_video_4_text")
	private String video_4_text;
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
	
	public void setVideos(String videos){
		this.videos = videos;
	}
	public String getVideos(){
		return this.videos;
	}
	
	public void setDocumentos(String documentos){
		this.documentos = documentos;
	}
	public String getDocumentos(){
		return this.documentos;
	}
	
	public void setBem_vindo(String bem_vindo){
		this.bem_vindo = bem_vindo;
	}
	public String getBem_vindo(){
		return this.bem_vindo;
	}
	
	public void setComo_instalar_o_igrp(String como_instalar_o_igrp){
		this.como_instalar_o_igrp = como_instalar_o_igrp;
	}
	public String getComo_instalar_o_igrp(){
		return this.como_instalar_o_igrp;
	}
	
	public void setDemo_de_um_aplicacao(String demo_de_um_aplicacao){
		this.demo_de_um_aplicacao = demo_de_um_aplicacao;
	}
	public String getDemo_de_um_aplicacao(){
		return this.demo_de_um_aplicacao;
	}
	
	public void setMinha_primeira_aplicacao(String minha_primeira_aplicacao){
		this.minha_primeira_aplicacao = minha_primeira_aplicacao;
	}
	public String getMinha_primeira_aplicacao(){
		return this.minha_primeira_aplicacao;
	}
	
	public void setComo_contribuir(String como_contribuir){
		this.como_contribuir = como_contribuir;
	}
	public String getComo_contribuir(){
		return this.como_contribuir;
	}
	
	public void setParagraph_6_text(String paragraph_6_text){
		this.paragraph_6_text = paragraph_6_text;
	}
	public String getParagraph_6_text(){
		return this.paragraph_6_text;
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
	
	public void setParagraph_5_text(String paragraph_5_text){
		this.paragraph_5_text = paragraph_5_text;
	}
	public String getParagraph_5_text(){
		return this.paragraph_5_text;
	}
	
	public void setParagraph_4_text(String paragraph_4_text){
		this.paragraph_4_text = paragraph_4_text;
	}
	public String getParagraph_4_text(){
		return this.paragraph_4_text;
	}
	
	public void setParagraph_2_text(String paragraph_2_text){
		this.paragraph_2_text = paragraph_2_text;
	}
	public String getParagraph_2_text(){
		return this.paragraph_2_text;
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
	
	public void setVideo_5_text(String video_5_text){
		this.video_5_text = video_5_text;
	}
	public String getVideo_5_text(){
		return this.video_5_text;
	}
	
	public void setVideo_4_text(String video_4_text){
		this.video_4_text = video_4_text;
	}
	public String getVideo_4_text(){
		return this.video_4_text;
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
			this.ver = Config.getResolveUrl(app, page, action);
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
