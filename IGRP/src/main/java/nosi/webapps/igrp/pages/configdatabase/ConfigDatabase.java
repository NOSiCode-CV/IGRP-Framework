package nosi.webapps.igrp.pages.configdatabase;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

import nosi.core.validator.constraints.*;

public class ConfigDatabase extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;

	@RParam(rParamName = "p_tipo_base_dados")
	private String tipo_base_dados;

	@RParam(rParamName = "p_nome_de_conexao")
	private String nome_de_conexao;

	@RParam(rParamName = "p_config")
	private String config;

	@RParam(rParamName = "p_url_connection")
	private String url_connection;

	@RParam(rParamName = "p_driver_connection")
	private String driver_connection;

	@RParam(rParamName = "p_paragraph_1")
	private String paragraph_1;

	@NotNull()
	@RParam(rParamName = "p_sql_dialect")
	private String sql_dialect;

	@RParam(rParamName = "p_credenciais")
	private String credenciais;

	@RParam(rParamName = "p_username")
	private String username;

	@RParam(rParamName = "p_password")
	private String password;

	@RParam(rParamName = "p_save_properties")
	private int save_properties;
	@RParam(rParamName = "p_save_properties_check")
	private int save_properties_check;

	@RParam(rParamName = "p_abrir_cfgxml")
	private IGRPLink abrir_cfgxml;
	@RParam(rParamName = "p_abrir_cfgxml_desc")
	private String abrir_cfgxml_desc;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}

	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setTipo_base_dados(String tipo_base_dados){
		this.tipo_base_dados = tipo_base_dados;
	}
	public String getTipo_base_dados(){
		return this.tipo_base_dados;
	}
	
	public void setNome_de_conexao(String nome_de_conexao){
		this.nome_de_conexao = nome_de_conexao;
	}
	public String getNome_de_conexao(){
		return this.nome_de_conexao;
	}
	
	public void setConfig(String config){
		this.config = config;
	}
	public String getConfig(){
		return this.config;
	}
	
	public void setUrl_connection(String url_connection){
		this.url_connection = url_connection;
	}
	public String getUrl_connection(){
		return this.url_connection;
	}
	
	public void setDriver_connection(String driver_connection){
		this.driver_connection = driver_connection;
	}
	public String getDriver_connection(){
		return this.driver_connection;
	}
	
	public void setParagraph_1(String paragraph_1){
		this.paragraph_1 = paragraph_1;
	}
	public String getParagraph_1(){
		return this.paragraph_1;
	}
	
	public void setSql_dialect(String sql_dialect){
		this.sql_dialect = sql_dialect;
	}
	public String getSql_dialect(){
		return this.sql_dialect;
	}
	
	public void setCredenciais(String credenciais){
		this.credenciais = credenciais;
	}
	public String getCredenciais(){
		return this.credenciais;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	public String getUsername(){
		return this.username;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	public String getPassword(){
		return this.password;
	}
	
	public void setSave_properties(int save_properties){
		this.save_properties = save_properties;
	}
	public int getSave_properties(){
		return this.save_properties;
	}
	public void setSave_properties_check(int save_properties_check){
		this.save_properties_check = save_properties_check;
	}
	public int getSave_properties_check(){
		return this.save_properties_check;
	}
	
	public IGRPLink setAbrir_cfgxml(String app,String page,String action){
		this.abrir_cfgxml = new IGRPLink(app,page,action);
		return this.abrir_cfgxml;
	}
	public IGRPLink getAbrir_cfgxml(){
		return this.abrir_cfgxml;
	}
	public void setAbrir_cfgxml_desc(String abrir_cfgxml_desc){
		this.abrir_cfgxml_desc = abrir_cfgxml_desc;
	}
	public String getAbrir_cfgxml_desc(){
		return this.abrir_cfgxml_desc;
	}
	public IGRPLink setAbrir_cfgxml(String link){
		this.abrir_cfgxml = new IGRPLink(link);
		return this.abrir_cfgxml;
	}
	public IGRPLink setAbrir_cfgxml(Report link){
		this.abrir_cfgxml = new IGRPLink(link);
		return this.abrir_cfgxml;
	}


	public static class Table_1 extends IGRPTable.Table{
		private Integer default_;
		private Integer default__check;
		private String nome_de_conexao_tabela;
		private String user_name_tabela;
		private String tipo_de_base_de_dados_tabela;
		private String t_url_connection;
		private String t_driver_connection;
		private String id;
		public void setDefault_(Integer default_){
			this.default_ = default_;
		}
		public Integer getDefault_(){
			return this.default_;
		}
		public void setDefault__check(Integer default__check){
			this.default__check = default__check;
		}
		public Integer getDefault__check(){
			return this.default__check;
		}

		public void setNome_de_conexao_tabela(String nome_de_conexao_tabela){
			this.nome_de_conexao_tabela = nome_de_conexao_tabela;
		}
		public String getNome_de_conexao_tabela(){
			return this.nome_de_conexao_tabela;
		}

		public void setUser_name_tabela(String user_name_tabela){
			this.user_name_tabela = user_name_tabela;
		}
		public String getUser_name_tabela(){
			return this.user_name_tabela;
		}

		public void setTipo_de_base_de_dados_tabela(String tipo_de_base_de_dados_tabela){
			this.tipo_de_base_de_dados_tabela = tipo_de_base_de_dados_tabela;
		}
		public String getTipo_de_base_de_dados_tabela(){
			return this.tipo_de_base_de_dados_tabela;
		}

		public void setT_url_connection(String t_url_connection){
			this.t_url_connection = t_url_connection;
		}
		public String getT_url_connection(){
			return this.t_url_connection;
		}

		public void setT_driver_connection(String t_driver_connection){
			this.t_driver_connection = t_driver_connection;
		}
		public String getT_driver_connection(){
			return this.t_driver_connection;
		}

		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
