package cv.nosi.webapps.igrp.pages.gestaodeacesso;

import java.util.ArrayList;
import java.util.List;

import cv.nosi.core.gui.components.IGRPLink;
import cv.nosi.core.gui.components.IGRPTable;
import cv.nosi.core.webapp.annotation.RParam;
import cv.nosi.core.webapp.mvc.Model;
import cv.nosi.core.webapp.util.helpers.database.BaseQueryInterface;
import cv.nosi.core.webapp.util.report.Report;

public class Gestaodeacesso extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@RParam(rParamName = "p_documento_link")
	private IGRPLink documento_link;
	@RParam(rParamName = "p_documento_link_desc")
	private String documento_link_desc;

	@RParam(rParamName = "p_forum")
	private IGRPLink forum;
	@RParam(rParamName = "p_forum_desc")
	private String forum_desc;

	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;

	@RParam(rParamName = "p_adicionar_organica")
	private IGRPLink adicionar_organica;
	@RParam(rParamName = "p_adicionar_organica_desc")
	private String adicionar_organica_desc;

	@RParam(rParamName = "p_gestao_de_utilizadores")
	private IGRPLink gestao_de_utilizadores;
	@RParam(rParamName = "p_gestao_de_utilizadores_desc")
	private String gestao_de_utilizadores_desc;

	@RParam(rParamName = "p_gestao_de_menu")
	private IGRPLink gestao_de_menu;
	@RParam(rParamName = "p_gestao_de_menu_desc")
	private String gestao_de_menu_desc;

	@RParam(rParamName = "p_id_app")
	private int id_app;
	
	private List<Org_table> org_table = new ArrayList<>();	
	public void setOrg_table(List<Org_table> org_table){
		this.org_table = org_table;
	}
	public List<Org_table> getOrg_table(){
		return this.org_table;
	}

	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public IGRPLink setDocumento_link(String app,String page,String action){
		this.documento_link = new IGRPLink(app,page,action);
		return this.documento_link;
	}
	public IGRPLink getDocumento_link(){
		return this.documento_link;
	}
	public void setDocumento_link_desc(String documento_link_desc){
		this.documento_link_desc = documento_link_desc;
	}
	public String getDocumento_link_desc(){
		return this.documento_link_desc;
	}
	public IGRPLink setDocumento_link(String link){
		this.documento_link = new IGRPLink(link);
		return this.documento_link;
	}
	public IGRPLink setDocumento_link(Report link){
		this.documento_link = new IGRPLink(link);
		return this.documento_link;
	}
	
	public IGRPLink setForum(String app,String page,String action){
		this.forum = new IGRPLink(app,page,action);
		return this.forum;
	}
	public IGRPLink getForum(){
		return this.forum;
	}
	public void setForum_desc(String forum_desc){
		this.forum_desc = forum_desc;
	}
	public String getForum_desc(){
		return this.forum_desc;
	}
	public IGRPLink setForum(String link){
		this.forum = new IGRPLink(link);
		return this.forum;
	}
	public IGRPLink setForum(Report link){
		this.forum = new IGRPLink(link);
		return this.forum;
	}
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public IGRPLink setAdicionar_organica(String app,String page,String action){
		this.adicionar_organica = new IGRPLink(app,page,action);
		return this.adicionar_organica;
	}
	public IGRPLink getAdicionar_organica(){
		return this.adicionar_organica;
	}
	public void setAdicionar_organica_desc(String adicionar_organica_desc){
		this.adicionar_organica_desc = adicionar_organica_desc;
	}
	public String getAdicionar_organica_desc(){
		return this.adicionar_organica_desc;
	}
	public IGRPLink setAdicionar_organica(String link){
		this.adicionar_organica = new IGRPLink(link);
		return this.adicionar_organica;
	}
	public IGRPLink setAdicionar_organica(Report link){
		this.adicionar_organica = new IGRPLink(link);
		return this.adicionar_organica;
	}
	
	public IGRPLink setGestao_de_utilizadores(String app,String page,String action){
		this.gestao_de_utilizadores = new IGRPLink(app,page,action);
		return this.gestao_de_utilizadores;
	}
	public IGRPLink getGestao_de_utilizadores(){
		return this.gestao_de_utilizadores;
	}
	public void setGestao_de_utilizadores_desc(String gestao_de_utilizadores_desc){
		this.gestao_de_utilizadores_desc = gestao_de_utilizadores_desc;
	}
	public String getGestao_de_utilizadores_desc(){
		return this.gestao_de_utilizadores_desc;
	}
	public IGRPLink setGestao_de_utilizadores(String link){
		this.gestao_de_utilizadores = new IGRPLink(link);
		return this.gestao_de_utilizadores;
	}
	public IGRPLink setGestao_de_utilizadores(Report link){
		this.gestao_de_utilizadores = new IGRPLink(link);
		return this.gestao_de_utilizadores;
	}
	
	public IGRPLink setGestao_de_menu(String app,String page,String action){
		this.gestao_de_menu = new IGRPLink(app,page,action);
		return this.gestao_de_menu;
	}
	public IGRPLink getGestao_de_menu(){
		return this.gestao_de_menu;
	}
	public void setGestao_de_menu_desc(String gestao_de_menu_desc){
		this.gestao_de_menu_desc = gestao_de_menu_desc;
	}
	public String getGestao_de_menu_desc(){
		return this.gestao_de_menu_desc;
	}
	public IGRPLink setGestao_de_menu(String link){
		this.gestao_de_menu = new IGRPLink(link);
		return this.gestao_de_menu;
	}
	public IGRPLink setGestao_de_menu(Report link){
		this.gestao_de_menu = new IGRPLink(link);
		return this.gestao_de_menu;
	}
	
	public void setId_app(int id_app){
		this.id_app = id_app;
	}
	public int getId_app(){
		return this.id_app;
	}


	public static class Org_table extends IGRPTable.Table{
		private int estado;
		private int estado_check;
		private String org_nome;
		private IGRPLink mostrar_perfis;
		private String mostrar_perfis_desc= "Mostrar perfis";
		private String id;
		public void setEstado(int estado){
			this.estado = estado;
		}
		public int getEstado(){
			return this.estado;
		}
		public void setEstado_check(int estado_check){
			this.estado_check = estado_check;
		}
		public int getEstado_check(){
			return this.estado_check;
		}

		public void setOrg_nome(String org_nome){
			this.org_nome = org_nome;
		}
		public String getOrg_nome(){
			return this.org_nome;
		}

		public IGRPLink setMostrar_perfis(String app,String page,String action){
			this.mostrar_perfis = new IGRPLink(app,page,action);
			return this.mostrar_perfis;
		}
		public IGRPLink getMostrar_perfis(){
			return this.mostrar_perfis;
		}
		public void setMostrar_perfis_desc(String mostrar_perfis_desc){
			this.mostrar_perfis_desc = mostrar_perfis_desc;
		}
		public String getMostrar_perfis_desc(){
			return this.mostrar_perfis_desc;
		}
	public IGRPLink setMostrar_perfis(String link){
		this.mostrar_perfis = new IGRPLink(link);
		return this.mostrar_perfis;
	}
	public IGRPLink setMostrar_perfis(Report link){
		this.mostrar_perfis = new IGRPLink(link);
		return this.mostrar_perfis;
	}

		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

	}

	public void loadOrg_table(BaseQueryInterface query) {
		this.setOrg_table(this.loadTable(query,Org_table.class));
	}

}
