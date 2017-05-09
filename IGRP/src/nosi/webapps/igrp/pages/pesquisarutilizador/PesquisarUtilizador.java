package nosi.webapps.igrp.pages.pesquisarutilizador;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class PesquisarUtilizador extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_organica")
	private String organica;
	@RParam(rParamName = "p_perfil")
	private String perfil;
	@RParam(rParamName = "p_username")
	private String username;
	@RParam(rParamName = "p_email")
	private String email;

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
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


	public class Table_1{
		private String nome;
		private String nominho;
		private String email;
		private String perfil;
		private int p_id;
		public void setNome(String nome){
			this.nome = nome;
		}
		public String getNome(){
			return this.nome;
		}

		public void setNominho(String nominho){
			this.nominho = nominho;
		}
		public String getNominho(){
			return this.nominho;
		}

		public void setEmail(String email){
			this.email = email;
		}
		public String getEmail(){
			return this.email;
		}

		public void setPerfil(String perfil){
			this.perfil = perfil;
		}
		public String getPerfil(){
			return this.perfil;
		}

		public void setP_id(int p_id){
			this.p_id = p_id;
		}
		public int getP_id(){
			return this.p_id;
		}

	}
}