/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp_studio.pages.webreport;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class WebReport extends Model{		
	@RParam(rParamName = "p_page_title_text")
	private String page_title_text;
	@RParam(rParamName = "p_reports")
	private String reports;
	@RParam(rParamName = "p_data_source")
	private String data_source;
	@RParam(rParamName = "p_env_fk")
	private String env_fk;
	@RParam(rParamName = "p_datasorce_app")
	private String datasorce_app;
	@RParam(rParamName = "p_report_editor")
	private String report_editor;
	@RParam(rParamName = "p_link_add_source")
	private String link_add_source;
	@RParam(rParamName = "p_dialog_titulo_report")
	private String dialog_titulo_report;
	@RParam(rParamName = "p_dialog_keys_report")
	private String dialog_keys_report;
	@RParam(rParamName = "p_codigo_report")
	private String codigo_report;
	@RParam(rParamName = "p_title_report")
	private String title_report;
	@RParam(rParamName = "p_link_source")
	private String p_link_source;
	@RParam(rParamName = "p_edit_name_report")
	private String p_edit_name_report;
	@RParam(rParamName = "p_link_config")
	private String p_link_config;

	@SeparatorList(name = Gen_table.class)
	private List<Gen_table> gen_table = new ArrayList<>();
	public void setGen_table(List<Gen_table> gen_table){
		this.gen_table = gen_table;
	}
	public List<Gen_table> getgen_table(){
		return this.gen_table;
	}

	@SeparatorList(name = Chart_1.class)
	private List<Chart_1> chart_1 = new ArrayList<>();
	public void setChart_1(List<Chart_1> chart_1){
		this.chart_1 = chart_1;
	}
	public List<Chart_1> getchart_1(){
		return this.chart_1;
	}
	
	public void setPage_title_text(String page_title_text){
		this.page_title_text = page_title_text;
	}
	public String getPage_title_text(){
		return this.page_title_text;
	}
	
	public void setReports(String reports){
		this.reports = reports;
	}
	public String getReports(){
		return this.reports;
	}
	
	public void setData_source(String data_source){
		this.data_source = data_source;
	}
	public String getData_source(){
		return this.data_source;
	}
	
	public void setEnv_fk(String env_fk){
		this.env_fk = env_fk;
	}
	public String getEnv_fk(){
		return this.env_fk;
	}
	
	public void setDatasorce_app(String datasorce_app){
		this.datasorce_app = datasorce_app;
	}
	public String getDatasorce_app(){
		return this.datasorce_app;
	}
	
	public void setReport_editor(String report_editor){
		this.report_editor = report_editor;
	}
	public String getReport_editor(){
		return this.report_editor;
	}
	
	public void setLink_add_source(String app,String page,String action){
		this.link_add_source = Config.getResolveUrl(app, page, action);
	}
	public String getLink_add_source(){
		return this.link_add_source;
	}
	
	public void setDialog_titulo_report(String dialog_titulo_report){
		this.dialog_titulo_report = dialog_titulo_report;
	}
	public String getDialog_titulo_report(){
		return this.dialog_titulo_report;
	}
	
	public void setDialog_keys_report(String dialog_keys_report){
		this.dialog_keys_report = dialog_keys_report;
	}
	public String getDialog_keys_report(){
		return this.dialog_keys_report;
	}
	
	public void setCodigo_report(String codigo_report){
		this.codigo_report = codigo_report;
	}
	public String getCodigo_report(){
		return this.codigo_report;
	}
	
	public void setTitle_report(String title_report){
		this.title_report = title_report;
	}
	public String getTitle_report(){
		return this.title_report;
	}
	
	public void setP_link_source(String p_link_source){
		this.p_link_source = p_link_source;
	}
	public String getP_link_source(){
		return this.p_link_source;
	}
	
	public void setP_edit_name_report(String p_edit_name_report){
		this.p_edit_name_report = p_edit_name_report;
	}
	public String getP_edit_name_report(){
		return this.p_edit_name_report;
	}
	
	public void setP_link_config(String p_link_config){
		this.p_link_config = p_link_config;
	}
	public String getP_link_config(){
		return this.p_link_config;
	}


	public static class Gen_table{
		private String title;
		private String link;
		private String link_desc;
		private String descricao;
		private float id;
		public void setTitle(String title){
			this.title = title;
		}
		public String getTitle(){
			return this.title;
		}

		public void setLink(String app,String page,String action){
			this.link = Config.getResolveUrl(app, page, action);
		}
		public String getLink(){
			return this.link;
		}
		public void setLink_desc(String link_desc){
			this.link_desc = link_desc;
		}
		public String getLink_desc(){
			return this.link_desc;
		}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

		public void setId(float id){
			this.id = id;
		}
		public float getId(){
			return this.id;
		}

	}
	public static class Chart_1{
		private String Ano;
		private String X1;
		private String X2;
		private String X3;
		private String X4;
		public void setAno(String Ano){
			this.Ano = Ano;
		}
		public String getAno(){
			return this.Ano;
		}

		public void setX1(String X1){
			this.X1 = X1;
		}
		public String getX1(){
			return this.X1;
		}

		public void setX2(String X2){
			this.X2 = X2;
		}
		public String getX2(){
			return this.X2;
		}

		public void setX3(String X3){
			this.X3 = X3;
		}
		public String getX3(){
			return this.X3;
		}

		public void setX4(String X4){
			this.X4 = X4;
		}
		public String getX4(){
			return this.X4;
		}

	}
}
/*-------------------------*/