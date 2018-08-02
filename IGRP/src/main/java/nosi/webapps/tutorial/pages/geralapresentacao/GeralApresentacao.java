package nosi.webapps.tutorial.pages.geralapresentacao;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;



import java.util.ArrayList;
import java.util.List;

public class GeralApresentacao extends Model{		
	@RParam(rParamName = "p_sectionheader_2_text")
	private String sectionheader_2_text;
	@RParam(rParamName = "p_welcome")
	private String welcome;
	@RParam(rParamName = "p_videos_tutoriais")
	private String videos_tutoriais;
	@RParam(rParamName = "p_documentos_gerais")
	private String documentos_gerais;
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_quickbuttonbox_gestao_title")
	private String quickbuttonbox_gestao_title;
	@RParam(rParamName = "p_quickbuttonbox_gestao_val")
	private String quickbuttonbox_gestao_val;
	@RParam(rParamName = "p_quickbuttonbox_gestao_url")
	private String quickbuttonbox_gestao_url;
	@RParam(rParamName = "p_quickbuttonbox_gestao_bg")
	private String quickbuttonbox_gestao_bg;
	@RParam(rParamName = "p_quickbuttonbox_gestao_icn")
	private String quickbuttonbox_gestao_icn;
	@RParam(rParamName = "p_statbox_1_title")
	private String statbox_1_title;
	@RParam(rParamName = "p_statbox_1_val")
	private String statbox_1_val;
	@RParam(rParamName = "p_statbox_1_txt")
	private String statbox_1_txt;
	@RParam(rParamName = "p_statbox_1_url")
	private String statbox_1_url;
	@RParam(rParamName = "p_statbox_1_bg")
	private String statbox_1_bg;
	@RParam(rParamName = "p_statbox_1_icn")
	private String statbox_1_icn;
	@RParam(rParamName = "p_paragraph_1_text")
	private String paragraph_1_text;
	@RParam(rParamName = "p_quickbuttonbox_instalar_title")
	private String quickbuttonbox_instalar_title;
	@RParam(rParamName = "p_quickbuttonbox_instalar_val")
	private String quickbuttonbox_instalar_val;
	@RParam(rParamName = "p_quickbuttonbox_instalar_url")
	private String quickbuttonbox_instalar_url;
	@RParam(rParamName = "p_quickbuttonbox_instalar_bg")
	private String quickbuttonbox_instalar_bg;
	@RParam(rParamName = "p_quickbuttonbox_instalar_icn")
	private String quickbuttonbox_instalar_icn;
	@RParam(rParamName = "p_paragraph_6_text")
	private String paragraph_6_text;
	@RParam(rParamName = "p_video_2_text")
	private String video_2_text;
	@RParam(rParamName = "p_quickbuttonbox__title")
	private String quickbuttonbox__title;
	@RParam(rParamName = "p_quickbuttonbox__val")
	private String quickbuttonbox__val;
	@RParam(rParamName = "p_quickbuttonbox__url")
	private String quickbuttonbox__url;
	@RParam(rParamName = "p_quickbuttonbox__bg")
	private String quickbuttonbox__bg;
	@RParam(rParamName = "p_quickbuttonbox__icn")
	private String quickbuttonbox__icn;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}
	@RParam(rParamName = "p_table_1_id")
	private String[] p_table_1_id;
	@RParam(rParamName = "p_table_1_del")
	private String[] p_table_1_del;
	
	public void setP_table_1_id(String[] p_table_1_id){
		this.p_table_1_id = p_table_1_id;
	}
	public String[] getP_table_1_id(){
		return this.p_table_1_id;
	}
	
	public void setP_table_1_del(String[] p_table_1_del){
		this.p_table_1_del = p_table_1_del;
	}
	public String[] getP_table_1_del(){
		return this.p_table_1_del;
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
	
	public void setVideos_tutoriais(String videos_tutoriais){
		this.videos_tutoriais = videos_tutoriais;
	}
	public String getVideos_tutoriais(){
		return this.videos_tutoriais;
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
	
	public void setQuickbuttonbox_gestao_title(String quickbuttonbox_gestao_title){
		this.quickbuttonbox_gestao_title = quickbuttonbox_gestao_title;
	}
	public String getQuickbuttonbox_gestao_title(){
		return this.quickbuttonbox_gestao_title;
	}
	
	public void setQuickbuttonbox_gestao_val(String quickbuttonbox_gestao_val){
		this.quickbuttonbox_gestao_val = quickbuttonbox_gestao_val;
	}
	public String getQuickbuttonbox_gestao_val(){
		return this.quickbuttonbox_gestao_val;
	}
	
	public void setQuickbuttonbox_gestao_url(String quickbuttonbox_gestao_url){
		this.quickbuttonbox_gestao_url = quickbuttonbox_gestao_url;
	}
	public String getQuickbuttonbox_gestao_url(){
		return this.quickbuttonbox_gestao_url;
	}
	
	public void setQuickbuttonbox_gestao_bg(String quickbuttonbox_gestao_bg){
		this.quickbuttonbox_gestao_bg = quickbuttonbox_gestao_bg;
	}
	public String getQuickbuttonbox_gestao_bg(){
		return this.quickbuttonbox_gestao_bg;
	}
	
	public void setQuickbuttonbox_gestao_icn(String quickbuttonbox_gestao_icn){
		this.quickbuttonbox_gestao_icn = quickbuttonbox_gestao_icn;
	}
	public String getQuickbuttonbox_gestao_icn(){
		return this.quickbuttonbox_gestao_icn;
	}
	
	public void setStatbox_1_title(String statbox_1_title){
		this.statbox_1_title = statbox_1_title;
	}
	public String getStatbox_1_title(){
		return this.statbox_1_title;
	}
	
	public void setStatbox_1_val(String statbox_1_val){
		this.statbox_1_val = statbox_1_val;
	}
	public String getStatbox_1_val(){
		return this.statbox_1_val;
	}
	
	public void setStatbox_1_txt(String statbox_1_txt){
		this.statbox_1_txt = statbox_1_txt;
	}
	public String getStatbox_1_txt(){
		return this.statbox_1_txt;
	}
	
	public void setStatbox_1_url(String statbox_1_url){
		this.statbox_1_url = statbox_1_url;
	}
	public String getStatbox_1_url(){
		return this.statbox_1_url;
	}
	
	public void setStatbox_1_bg(String statbox_1_bg){
		this.statbox_1_bg = statbox_1_bg;
	}
	public String getStatbox_1_bg(){
		return this.statbox_1_bg;
	}
	
	public void setStatbox_1_icn(String statbox_1_icn){
		this.statbox_1_icn = statbox_1_icn;
	}
	public String getStatbox_1_icn(){
		return this.statbox_1_icn;
	}
	
	public void setParagraph_1_text(String paragraph_1_text){
		this.paragraph_1_text = paragraph_1_text;
	}
	public String getParagraph_1_text(){
		return this.paragraph_1_text;
	}
	
	public void setQuickbuttonbox_instalar_title(String quickbuttonbox_instalar_title){
		this.quickbuttonbox_instalar_title = quickbuttonbox_instalar_title;
	}
	public String getQuickbuttonbox_instalar_title(){
		return this.quickbuttonbox_instalar_title;
	}
	
	public void setQuickbuttonbox_instalar_val(String quickbuttonbox_instalar_val){
		this.quickbuttonbox_instalar_val = quickbuttonbox_instalar_val;
	}
	public String getQuickbuttonbox_instalar_val(){
		return this.quickbuttonbox_instalar_val;
	}
	
	public void setQuickbuttonbox_instalar_url(String quickbuttonbox_instalar_url){
		this.quickbuttonbox_instalar_url = quickbuttonbox_instalar_url;
	}
	public String getQuickbuttonbox_instalar_url(){
		return this.quickbuttonbox_instalar_url;
	}
	
	public void setQuickbuttonbox_instalar_bg(String quickbuttonbox_instalar_bg){
		this.quickbuttonbox_instalar_bg = quickbuttonbox_instalar_bg;
	}
	public String getQuickbuttonbox_instalar_bg(){
		return this.quickbuttonbox_instalar_bg;
	}
	
	public void setQuickbuttonbox_instalar_icn(String quickbuttonbox_instalar_icn){
		this.quickbuttonbox_instalar_icn = quickbuttonbox_instalar_icn;
	}
	public String getQuickbuttonbox_instalar_icn(){
		return this.quickbuttonbox_instalar_icn;
	}
	
	public void setParagraph_6_text(String paragraph_6_text){
		this.paragraph_6_text = paragraph_6_text;
	}
	public String getParagraph_6_text(){
		return this.paragraph_6_text;
	}
	
	public void setVideo_2_text(String video_2_text){
		this.video_2_text = video_2_text;
	}
	public String getVideo_2_text(){
		return this.video_2_text;
	}
	
	public void setQuickbuttonbox__title(String quickbuttonbox__title){
		this.quickbuttonbox__title = quickbuttonbox__title;
	}
	public String getQuickbuttonbox__title(){
		return this.quickbuttonbox__title;
	}
	
	public void setQuickbuttonbox__val(String quickbuttonbox__val){
		this.quickbuttonbox__val = quickbuttonbox__val;
	}
	public String getQuickbuttonbox__val(){
		return this.quickbuttonbox__val;
	}
	
	public void setQuickbuttonbox__url(String quickbuttonbox__url){
		this.quickbuttonbox__url = quickbuttonbox__url;
	}
	public String getQuickbuttonbox__url(){
		return this.quickbuttonbox__url;
	}
	
	public void setQuickbuttonbox__bg(String quickbuttonbox__bg){
		this.quickbuttonbox__bg = quickbuttonbox__bg;
	}
	public String getQuickbuttonbox__bg(){
		return this.quickbuttonbox__bg;
	}
	
	public void setQuickbuttonbox__icn(String quickbuttonbox__icn){
		this.quickbuttonbox__icn = quickbuttonbox__icn;
	}
	public String getQuickbuttonbox__icn(){
		return this.quickbuttonbox__icn;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String documento;
		private String ver;
		public void setDocumento(String documento){
			this.documento = documento;
		}
		public String getDocumento(){
			return this.documento;
		}

		public void setVer(String ver){
			this.ver = ver;
		}
		public String getVer(){
			return this.ver;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
