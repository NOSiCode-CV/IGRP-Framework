package nosi.webapps.igrp.pages.gestaodeacesso;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class Gestaodeacesso extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	
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
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}


	public static class Org_table{
		private String estado;
		private String org_nome;
		private String mostrar_perfis;
		private String mostrar_perfis_desc;
		private String p_id;
		public void setEstado(String estado){
			this.estado = estado;
		}
		public String getEstado(){
			return this.estado;
		}

		public void setOrg_nome(String org_nome){
			this.org_nome = org_nome;
		}
		public String getOrg_nome(){
			return this.org_nome;
		}

		public void setMostrar_perfis(String app,String page,String action){
			this.mostrar_perfis = Config.getResolveUrl(app, page, action);
		}
		public String getMostrar_perfis(){
			return this.mostrar_perfis;
		}
		public void setMostrar_perfis_desc(String mostrar_perfis_desc){
			this.mostrar_perfis_desc = mostrar_perfis_desc;
		}
		public String getMostrar_perfis_desc(){
			return this.mostrar_perfis_desc;
		}

		public void setP_id(String p_id){
			this.p_id = p_id;
		}
		public String getP_id(){
			return this.p_id;
		}

	}
}
