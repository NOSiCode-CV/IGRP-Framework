package nosi.webapps.igrp.pages.pesquisarutilizador;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class PesquisarUtilizador extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@RParam(rParamName = "p_documento")
	private IGRPLink documento;
	@RParam(rParamName = "p_documento_desc")
	private String documento_desc;

	@RParam(rParamName = "p_resumo_utilizadores")
	private String resumo_utilizadores;

	@RParam(rParamName = "p_resumo_inativos")
	private String resumo_inativos;

	@RParam(rParamName = "p_resumo_perfis_ativos")
	private String resumo_perfis_ativos;

	@RParam(rParamName = "p_resumo_problemas")
	private String resumo_problemas;

	@RParam(rParamName = "p_nome_filt")
	private String nome_filt;

	@RParam(rParamName = "p_username")
	private String username;

	@RParam(rParamName = "p_email")
	private String email;

	@RParam(rParamName = "p_nada")
	private String nada;

	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;

	@RParam(rParamName = "p_organica")
	private String organica;

	@RParam(rParamName = "p_perfil")
	private String perfil;

	@RParam(rParamName = "p_problemas_apenas")
	private int problemas_apenas;
	@RParam(rParamName = "p_problemas_apenas_check")
	private int problemas_apenas_check;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}

	
	private List<Utilizadores_resumo> utilizadores_resumo = new ArrayList<>();	
	public void setUtilizadores_resumo(List<Utilizadores_resumo> utilizadores_resumo){
		this.utilizadores_resumo = utilizadores_resumo;
	}
	public List<Utilizadores_resumo> getUtilizadores_resumo(){
		return this.utilizadores_resumo;
	}

	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public IGRPLink setDocumento(String app,String page,String action){
		this.documento = new IGRPLink(app,page,action);
		return this.documento;
	}
	public IGRPLink getDocumento(){
		return this.documento;
	}
	public void setDocumento_desc(String documento_desc){
		this.documento_desc = documento_desc;
	}
	public String getDocumento_desc(){
		return this.documento_desc;
	}
	public IGRPLink setDocumento(String link){
		this.documento = new IGRPLink(link);
		return this.documento;
	}
	public IGRPLink setDocumento(Report link){
		this.documento = new IGRPLink(link);
		return this.documento;
	}
	
	public void setResumo_utilizadores(String resumo_utilizadores){
		this.resumo_utilizadores = resumo_utilizadores;
	}
	public String getResumo_utilizadores(){
		return this.resumo_utilizadores;
	}
	
	public void setResumo_inativos(String resumo_inativos){
		this.resumo_inativos = resumo_inativos;
	}
	public String getResumo_inativos(){
		return this.resumo_inativos;
	}
	
	public void setResumo_perfis_ativos(String resumo_perfis_ativos){
		this.resumo_perfis_ativos = resumo_perfis_ativos;
	}
	public String getResumo_perfis_ativos(){
		return this.resumo_perfis_ativos;
	}
	
	public void setResumo_problemas(String resumo_problemas){
		this.resumo_problemas = resumo_problemas;
	}
	public String getResumo_problemas(){
		return this.resumo_problemas;
	}
	
	public void setNome_filt(String nome_filt){
		this.nome_filt = nome_filt;
	}
	public String getNome_filt(){
		return this.nome_filt;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	public String getUsername(){
		return this.username;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	
	public void setNada(String nada){
		this.nada = nada;
	}
	public String getNada(){
		return this.nada;
	}
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setOrganica(String organica){
		this.organica = organica;
	}
	public String getOrganica(){
		return this.organica;
	}
	
	public void setPerfil(String perfil){
		this.perfil = perfil;
	}
	public String getPerfil(){
		return this.perfil;
	}
	
	public void setProblemas_apenas(int problemas_apenas){
		this.problemas_apenas = problemas_apenas;
	}
	public int getProblemas_apenas(){
		return this.problemas_apenas;
	}
	public void setProblemas_apenas_check(int problemas_apenas_check){
		this.problemas_apenas_check = problemas_apenas_check;
	}
	public int getProblemas_apenas_check(){
		return this.problemas_apenas_check;
	}


	public static class Table_1 extends IGRPTable.Table{
		private int ativo;
		private int ativo_check;
		private String nominho;
		private Integer range_1;
		private String nome;
		private String tb_email;
		private String perfile;
		private String id;
		private String check_email_hidden;
		public void setAtivo(int ativo){
			this.ativo = ativo;
		}
		public int getAtivo(){
			return this.ativo;
		}
		public void setAtivo_check(int ativo_check){
			this.ativo_check = ativo_check;
		}
		public int getAtivo_check(){
			return this.ativo_check;
		}

		public void setNominho(String nominho){
			this.nominho = nominho;
		}
		public String getNominho(){
			return this.nominho;
		}

		public void setRange_1(Integer range_1){
			this.range_1 = range_1;
		}
		public Integer getRange_1(){
			return this.range_1;
		}

		public void setNome(String nome){
			this.nome = nome;
		}
		public String getNome(){
			return this.nome;
		}

		public void setTb_email(String tb_email){
			this.tb_email = tb_email;
		}
		public String getTb_email(){
			return this.tb_email;
		}

		public void setPerfile(String perfile){
			this.perfile = perfile;
		}
		public String getPerfile(){
			return this.perfile;
		}

		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

		public void setCheck_email_hidden(String check_email_hidden){
			this.check_email_hidden = check_email_hidden;
		}
		public String getCheck_email_hidden(){
			return this.check_email_hidden;
		}

	}
	public static class Utilizadores_resumo extends IGRPTable.Table{
		private String estado_utilizador;
		private String nome_utilizador;
		private String username_utilizador;
		private String email_utilizador;
		private String total_aplicacoes;
		private String total_organicas;
		private String perfis_ativos;
		private String perfis_inativos;
		private String alertas;
		private String acessos;
		public void setEstado_utilizador(String estado_utilizador){
			this.estado_utilizador = estado_utilizador;
		}
		public String getEstado_utilizador(){
			return this.estado_utilizador;
		}

		public void setNome_utilizador(String nome_utilizador){
			this.nome_utilizador = nome_utilizador;
		}
		public String getNome_utilizador(){
			return this.nome_utilizador;
		}

		public void setUsername_utilizador(String username_utilizador){
			this.username_utilizador = username_utilizador;
		}
		public String getUsername_utilizador(){
			return this.username_utilizador;
		}

		public void setEmail_utilizador(String email_utilizador){
			this.email_utilizador = email_utilizador;
		}
		public String getEmail_utilizador(){
			return this.email_utilizador;
		}

		public void setTotal_aplicacoes(String total_aplicacoes){
			this.total_aplicacoes = total_aplicacoes;
		}
		public String getTotal_aplicacoes(){
			return this.total_aplicacoes;
		}

		public void setTotal_organicas(String total_organicas){
			this.total_organicas = total_organicas;
		}
		public String getTotal_organicas(){
			return this.total_organicas;
		}

		public void setPerfis_ativos(String perfis_ativos){
			this.perfis_ativos = perfis_ativos;
		}
		public String getPerfis_ativos(){
			return this.perfis_ativos;
		}

		public void setPerfis_inativos(String perfis_inativos){
			this.perfis_inativos = perfis_inativos;
		}
		public String getPerfis_inativos(){
			return this.perfis_inativos;
		}

		public void setAlertas(String alertas){
			this.alertas = alertas;
		}
		public String getAlertas(){
			return this.alertas;
		}

		public void setAcessos(String acessos){
			this.acessos = acessos;
		}
		public String getAcessos(){
			return this.acessos;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

	public void loadUtilizadores_resumo(BaseQueryInterface query) {
		this.setUtilizadores_resumo(this.loadTable(query,Utilizadores_resumo.class));
	}

}