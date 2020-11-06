package nosi.webapps.igrp.pages.dominio;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
public class Dominio extends Model{		

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;

	@RParam(rParamName = "p_documento")
	private IGRPLink documento;
	@RParam(rParamName = "p_documento_desc")
	private String documento_desc;

	@RParam(rParamName = "p_forum")
	private IGRPLink forum;
	@RParam(rParamName = "p_forum_desc")
	private String forum_desc;

	@RParam(rParamName = "p_aplicacao")
	private Integer aplicacao;

	@RParam(rParamName = "p_lst_dominio")
	private String lst_dominio;

	@RParam(rParamName = "p_novo_dominio")
	private String novo_dominio;

	@RParam(rParamName = "p_app")
	private Integer app;
	
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
	
	public void setAplicacao(Integer aplicacao){
		this.aplicacao = aplicacao;
	}
	public Integer getAplicacao(){
		return this.aplicacao;
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
	
	public void setApp(Integer app){
		this.app = app;
	}
	public Integer getApp(){
		return this.app;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String dominio;
		private String id_dom;
		public void setDominio(String dominio){
			this.dominio = dominio;
		}
		public String getDominio(){
			return this.dominio;
		}

		public void setId_dom(String id_dom){
			this.id_dom = id_dom;
		}
		public String getId_dom(){
			return this.id_dom;
		}

	}
	public static class Formlist_1{
		private Pair formlist_1_id;
private Pair description;
private Pair key;
private Pair estado;
		private Pair estado_check;
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
		
		public void setEstado_check(Pair estado_check){
			this.estado_check = estado_check;
		}
		public Pair getEstado_check(){
			return this.estado_check;
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

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
