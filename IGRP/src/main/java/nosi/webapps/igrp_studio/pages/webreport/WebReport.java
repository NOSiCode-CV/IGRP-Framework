package nosi.webapps.igrp_studio.pages.webreport;


import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
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
	private String[] datasorce_app;
	@RParam(rParamName = "p_report_editor")
	private String report_editor;
	@RParam(rParamName = "p_link_add_source")
	private IGRPLink link_add_source;
	@RParam(rParamName = "p_link_add_source_desc")
	private String link_add_source_desc;
	@RParam(rParamName = "p_dialog_titulo_report")
	private String dialog_titulo_report;
	@RParam(rParamName = "p_dialog_keys_report")
	private String dialog_keys_report;
	@RParam(rParamName = "p_codigo_report")
	private String codigo_report;
	@RParam(rParamName = "p_title_report")
	private String title_report;
	@RParam(rParamName = "p_link_source")
	private String link_source;
	@RParam(rParamName = "p_edit_name_report")
	private String edit_name_report;
	@RParam(rParamName = "p_link_config")
	private String link_config;
	@RParam(rParamName = "p_link_upload_img")
	private String link_upload_img;
	
	private List<Gen_table> gen_table = new ArrayList<>();	
	public void setGen_table(List<Gen_table> gen_table){
		this.gen_table = gen_table;
	}
	public List<Gen_table> getGen_table(){
		return this.gen_table;
	}
	@RParam(rParamName = "p_gen_table_id")
	private String[] p_gen_table_id;
	@RParam(rParamName = "p_gen_table_del")
	private String[] p_gen_table_del;
	
	public void setP_gen_table_id(String[] p_gen_table_id){
		this.p_gen_table_id = p_gen_table_id;
	}
	public String[] getP_gen_table_id(){
		return this.p_gen_table_id;
	}
	
	public void setP_gen_table_del(String[] p_gen_table_del){
		this.p_gen_table_del = p_gen_table_del;
	}
	public String[] getP_gen_table_del(){
		return this.p_gen_table_del;
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
	
	public void setDatasorce_app(String[] datasorce_app){
		this.datasorce_app = datasorce_app;
	}
	public String[] getDatasorce_app(){
		return this.datasorce_app;
	}
	
	public void setReport_editor(String report_editor){
		this.report_editor = report_editor;
	}
	public String getReport_editor(){
		return this.report_editor;
	}
	
	public IGRPLink setLink_add_source(String app,String page,String action){
		this.link_add_source = new IGRPLink(app,page,action);
		return this.link_add_source;
	}
	public IGRPLink getLink_add_source(){
		return this.link_add_source;
	}
	public void setLink_add_source_desc(String link_add_source_desc){
		this.link_add_source_desc = link_add_source_desc;
	}
	public String getLink_add_source_desc(){
		return this.link_add_source_desc;
	}
	public IGRPLink setLink_add_source(String link){
		this.link_add_source = new IGRPLink(link);
		return this.link_add_source;
	}
	public IGRPLink setLink_add_source(Report link){
		this.link_add_source = new IGRPLink(link);
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
	
	public void setLink_source(String link_source){
		this.link_source = link_source;
	}
	public String getLink_source(){
		return this.link_source;
	}
	
	public void setEdit_name_report(String edit_name_report){
		this.edit_name_report = edit_name_report;
	}
	public String getEdit_name_report(){
		return this.edit_name_report;
	}
	
	public void setLink_config(String link_config){
		this.link_config = link_config;
	}
	public String getLink_config(){
		return this.link_config;
	}
	
	public void setLink_upload_img(String link_upload_img){
		this.link_upload_img = link_upload_img;
	}
	public String getLink_upload_img(){
		return this.link_upload_img;
	}


	public static class Gen_table extends IGRPTable.Table{
		private String title;
		private IGRPLink link;
		private String link_desc;
		private String descricao;
		private int id;
		public void setTitle(String title){
			this.title = title;
		}
		public String getTitle(){
			return this.title;
		}

		public IGRPLink setLink(String app,String page,String action){
			this.link = new IGRPLink(app,page,action);
			return this.link;
		}
		public IGRPLink getLink(){
			return this.link;
		}
		public void setLink_desc(String link_desc){
			this.link_desc = link_desc;
		}
		public String getLink_desc(){
			return this.link_desc;
		}
	public IGRPLink setLink(String link){
		this.link = new IGRPLink(link);
		return this.link;
	}
	public IGRPLink setLink(Report link){
		this.link = new IGRPLink(link);
		return this.link;
	}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

		public void setId(int id){
			this.id = id;
		}
		public int getId(){
			return this.id;
		}

	}

	public void loadGen_table(BaseQueryInterface query) {
		this.setGen_table(this.loadTable(query,Gen_table.class));
	}

}
