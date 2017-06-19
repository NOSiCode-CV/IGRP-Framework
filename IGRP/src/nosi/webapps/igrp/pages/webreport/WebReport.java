/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.webreport;
import nosi.core.webapp.Model;

public class WebReport extends Model{		

	private String page_title_text;
	private int env_fk;
	private int datasorce_app;
	private String report_editor;
	private String link_add_source;
	private String dialog_titulo_report;
	private String dialog_keys_report;
	private String codigo_report;
	private String title_report;
	private String link_source;
	private String edit_name_report;
	private String title;
	private String link;
	private String descricao;
	private int id;
	private String link_desc;
	private String reports;
	private String data_source;
	private String link_config;
	private String p_env_frm_url;
	private String p_env_dml;
	private String p_prm_target;
	private String p_fwl_tab_page;
	private String p_fwl_workflow;
	private String p_fwl_dialogbox;
	private String p_fwl_relbox;
	private String p_fwl_tab_menu;
	
	public String getP_env_frm_url() {
		return p_env_frm_url;
	}
	public void setP_env_frm_url(String p_env_frm_url) {
		this.p_env_frm_url = p_env_frm_url;
	}
	public String getP_env_dml() {
		return p_env_dml;
	}
	public void setP_env_dml(String p_env_dml) {
		this.p_env_dml = p_env_dml;
	}
	public String getP_prm_target() {
		return p_prm_target;
	}
	public void setP_prm_target(String p_prm_target) {
		this.p_prm_target = p_prm_target;
	}
	public String getP_fwl_tab_page() {
		return p_fwl_tab_page;
	}
	public void setP_fwl_tab_page(String p_fwl_tab_page) {
		this.p_fwl_tab_page = p_fwl_tab_page;
	}
	public String getP_fwl_workflow() {
		return p_fwl_workflow;
	}
	public void setP_fwl_workflow(String p_fwl_workflow) {
		this.p_fwl_workflow = p_fwl_workflow;
	}
	public String getP_fwl_dialogbox() {
		return p_fwl_dialogbox;
	}
	public void setP_fwl_dialogbox(String p_fwl_dialogbox) {
		this.p_fwl_dialogbox = p_fwl_dialogbox;
	}
	public String getP_fwl_relbox() {
		return p_fwl_relbox;
	}
	public void setP_fwl_relbox(String p_fwl_relbox) {
		this.p_fwl_relbox = p_fwl_relbox;
	}
	public String getP_fwl_tab_menu() {
		return p_fwl_tab_menu;
	}
	public void setP_fwl_tab_menu(String p_fwl_tab_menu) {
		this.p_fwl_tab_menu = p_fwl_tab_menu;
	}
	public String getLink_config() {
		return link_config;
	}
	public void setLink_config(String link_config) {
		this.link_config = link_config;
	}
	public String getReports() {
		return reports;
	}
	public void setReports(String reports) {
		this.reports = reports;
	}
	public String getData_source() {
		return data_source;
	}
	public void setData_source(String data_source) {
		this.data_source = data_source;
	}
	public String getPage_title_text() {
		return page_title_text;
	}
	public void setPage_title_text(String page_title_text) {
		this.page_title_text = page_title_text;
	}
	public int getEnv_fk() {
		return env_fk;
	}
	public void setEnv_fk(int env_fk) {
		this.env_fk = env_fk;
	}
	public int getDatasorce_app() {
		return datasorce_app;
	}
	public void setDatasorce_app(int datasorce_app) {
		this.datasorce_app = datasorce_app;
	}
	public String getReport_editor() {
		return report_editor;
	}
	public void setReport_editor(String report_editor) {
		this.report_editor = report_editor;
	}
	public String getLink_add_source() {
		return link_add_source;
	}
	public void setLink_add_source(String link_add_source) {
		this.link_add_source = link_add_source;
	}
	public String getDialog_titulo_report() {
		return dialog_titulo_report;
	}
	public void setDialog_titulo_report(String dialog_titulo_report) {
		this.dialog_titulo_report = dialog_titulo_report;
	}
	public String getDialog_keys_report() {
		return dialog_keys_report;
	}
	public void setDialog_keys_report(String dialog_keys_report) {
		this.dialog_keys_report = dialog_keys_report;
	}
	public String getCodigo_report() {
		return codigo_report;
	}
	public void setCodigo_report(String codigo_report) {
		this.codigo_report = codigo_report;
	}
	public String getTitle_report() {
		return title_report;
	}
	public void setTitle_report(String title_report) {
		this.title_report = title_report;
	}
	public String getLink_source() {
		return link_source;
	}
	public void setLink_source(String link_source) {
		this.link_source = link_source;
	}
	public String getEdit_name_report() {
		return edit_name_report;
	}
	public void setEdit_name_report(String edit_name_report) {
		this.edit_name_report = edit_name_report;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLink_desc() {
		return link_desc;
	}
	public void setLink_desc(String link_desc) {
		this.link_desc = link_desc;
	}
	
	public class Table_1{
		private String title;
		private String link;
		private String link_desc;
		private String descricao;
		private int id;
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		public String getLink_desc() {
			return link_desc;
		}
		public void setLink_desc(String link_desc) {
			this.link_desc = link_desc;
		}
		public String getDescricao() {
			return descricao;
		}
		public void setDescricao(String descricao) {
			this.descricao = descricao;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}	
	}
}
/*-------------------------*/