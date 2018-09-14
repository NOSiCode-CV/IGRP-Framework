package nosi.webapps.igrp.pages.pesquisarutilizador;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class PesquisarUtilizador extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
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
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}
	@RParam(rParamName = "p_table_1_id")
	private String[] p_table_1_id;
	@RParam(rParamName = "p_table_1_del")
	private String[] p_table_1_del;
	
	public void setP_table_1_id(String[] p_table_1_id){
		this.p_table_1_id = p_table_1_id;
	}
	public String[] getP_table_1_id(){
		return this.p_table_1_id;
	}
	
	public void setP_table_1_del(String[] p_table_1_del){
		this.p_table_1_del = p_table_1_del;
	}
	public String[] getP_table_1_del(){
		return this.p_table_1_del;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
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


	public static class Table_1 extends IGRPTable.Table{
		private String nominho;
		private int number_1;
		private int range_1;
		private String nome;
		private String tb_email;
		private String perfile;
		private String id;
		public void setNominho(String nominho){
			this.nominho = nominho;
		}
		public String getNominho(){
			return this.nominho;
		}

		public void setNumber_1(int number_1){
			this.number_1 = number_1;
		}
		public int getNumber_1(){
			return this.number_1;
		}

		public void setRange_1(int range_1){
			this.range_1 = range_1;
		}
		public int getRange_1(){
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

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
