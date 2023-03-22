package nosi.webapps.igrp.pages.proforgmapper;

import java.util.ArrayList;
import java.util.List;
import jakarta.validation.Valid;

import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.*;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.SeparatorList;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;

public class Proforgmapper extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@NotNull()
	@RParam(rParamName = "p_aplicacao_origem")
	private String aplicacao_origem;

	@NotNull()
	@RParam(rParamName = "p_aplicacao_destino")
	private String aplicacao_destino;

	@NotNull()
	@RParam(rParamName = "p_tipo")
	private String tipo;
	
	@SeparatorList(name = Formlist_1.class)
	@Valid
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
	@RParam(rParamName = "p_formlist_1_edit")
	private String[] p_formlist_1_edit;
	
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
	
	public void setP_formlist_1_edit(String[] p_formlist_1_edit){
		this.p_formlist_1_edit = p_formlist_1_edit;
	}
	public String[] getP_formlist_1_edit(){
		return this.p_formlist_1_edit;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setAplicacao_origem(String aplicacao_origem){
		this.aplicacao_origem = aplicacao_origem;
	}
	public String getAplicacao_origem(){
		return this.aplicacao_origem;
	}
	
	public void setAplicacao_destino(String aplicacao_destino){
		this.aplicacao_destino = aplicacao_destino;
	}
	public String getAplicacao_destino(){
		return this.aplicacao_destino;
	}
	
	public void setTipo(String tipo){
		this.tipo = tipo;
	}
	public String getTipo(){
		return this.tipo;
	}


	public static class Formlist_1{
		private Pair formlist_1_id;
private Pair perfilorganica_origem;
private Pair perfilorganica_destino;
		public void setFormlist_1_id(Pair formlist_1_id){
			this.formlist_1_id = formlist_1_id;
		}
		public Pair getFormlist_1_id(){
			return this.formlist_1_id;
		}
		public void setPerfilorganica_origem(Pair perfilorganica_origem){
			this.perfilorganica_origem = perfilorganica_origem;
		}
		public Pair getPerfilorganica_origem(){
			return this.perfilorganica_origem;
		}

		public void setPerfilorganica_destino(Pair perfilorganica_destino){
			this.perfilorganica_destino = perfilorganica_destino;
		}
		public Pair getPerfilorganica_destino(){
			return this.perfilorganica_destino;
		}

	}

	public void loadFormlist_1(BaseQueryInterface query) {
		this.setFormlist_1(this.loadFormList(query,Formlist_1.class));
	}

}
