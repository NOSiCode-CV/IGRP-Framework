package nosi.webapps.igrp.pages.dominio;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class Dominio extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_lst_dominio")
	private String lst_dominio;
	@RParam(rParamName = "p_novo_dominio")
	private String novo_dominio;
	
	@SeparatorList(name = Formlist_1.class)
	private List<Formlist_1> formlist_1 = new ArrayList<>();	
	public void setFormlist_1(List<Formlist_1> formlist_1){
		this.formlist_1 = formlist_1;
	}
	public List<Formlist_1> getFormlist_1(){
		return this.formlist_1;
	}
	@RParam(rParamName = "p_formlist_1_id")
	private String[] p_formlist_1_id;
	@RParam(rParamName = "p_formlist_1_del")
	private String[] p_formlist_1_del;
	
	public void setP_formlist_1_id(String[] p_formlist_1_id){
		this.p_formlist_1_id = p_formlist_1_id;
	}
	public String[] getP_formlist_1_id(){
		return this.p_formlist_1_id;
	}
	
	public void setP_formlist_1_del(String[] p_formlist_1_del){
		this.p_formlist_1_del = p_formlist_1_del;
	}
	public String[] getP_formlist_1_del(){
		return this.p_formlist_1_del;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setLst_dominio(String lst_dominio){
		this.lst_dominio = lst_dominio;
	}
	public String getLst_dominio(){
		return this.lst_dominio;
	}
	
	public void setNovo_dominio(String novo_dominio){
		this.novo_dominio = novo_dominio;
	}
	public String getNovo_dominio(){
		return this.novo_dominio;
	}


	public static class Formlist_1{
		private Pair formlist_1_id;
		private Pair description;
		private Pair key;
		private Pair estado;
		private Pair ordem;
		public void setFormlist_1_id(Pair formlist_1_id){
			this.formlist_1_id = formlist_1_id;
		}
		public Pair getFormlist_1_id(){
			return this.formlist_1_id;
		}
		public void setDescription(Pair description){
			this.description = description;
		}
		public Pair getDescription(){
			return this.description;
		}

		public void setKey(Pair key){
			this.key = key;
		}
		public Pair getKey(){
			return this.key;
		}

		public void setEstado(Pair estado){
			this.estado = estado;
		}
		public Pair getEstado(){
			return this.estado;
		}

		public void setOrdem(Pair ordem){
			this.ordem = ordem;
		}
		public Pair getOrdem(){
			return this.ordem;
		}

	}

	public void loadFormlist_1(BaseQueryInterface query) {
		this.setFormlist_1(this.loadFormList(query,Formlist_1.class));
	}

}
