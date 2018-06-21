package nosi.webapps.igrp.pages.gestaodeacesso;
import nosi.core.gui.components.IGRPLink;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;



import java.util.ArrayList;
import java.util.List;

public class Gestaodeacesso extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
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
	
	private List<Org_table> org_table = new ArrayList<>();	
	public void setOrg_table(List<Org_table> org_table){
		this.org_table = org_table;
	}
	public List<Org_table> getOrg_table(){
		return this.org_table;
	}
	@RParam(rParamName = "p_org_table_id")
	private String[] p_org_table_id;
	@RParam(rParamName = "p_org_table_del")
	private String[] p_org_table_del;
	
	public void setP_org_table_id(String[] p_org_table_id){
		this.p_org_table_id = p_org_table_id;
	}
	public String[] getP_org_table_id(){
		return this.p_org_table_id;
	}
	
	public void setP_org_table_del(String[] p_org_table_del){
		this.p_org_table_del = p_org_table_del;
	}
	public String[] getP_org_table_del(){
		return this.p_org_table_del;
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


	public static class Org_table extends IGRPTable.Table{
		private int estado;
		private int estado_check;
		private String org_nome;
		private IGRPLink mostrar_perfis;
		private String mostrar_perfis_desc;
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
