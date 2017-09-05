/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.lista_req;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class Lista_req extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_nome_requisitos")
	private String nome_requisitos;

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
	
	public void setNome_requisitos(String nome_requisitos){
		this.nome_requisitos = nome_requisitos;
	}
	public String getNome_requisitos(){
		return this.nome_requisitos;
	}


	public static class Table_1{
		private String servicos;
		private String tipo_de_requisito;
		private String descricao_do_requisito;
		private String estado;
		private Integer p_p_id;
		public void setServicos(String servicos){
			this.servicos = servicos;
		}
		public String getServicos(){
			return this.servicos;
		}

		public void setTipo_de_requisito(String tipo_de_requisito){
			this.tipo_de_requisito = tipo_de_requisito;
		}
		public String getTipo_de_requisito(){
			return this.tipo_de_requisito;
		}

		public void setDescricao_do_requisito(String descricao_do_requisito){
			this.descricao_do_requisito = descricao_do_requisito;
		}
		public String getDescricao_do_requisito(){
			return this.descricao_do_requisito;
		}

		public void setEstado(String estado){
			this.estado = estado;
		}
		public String getEstado(){
			return this.estado;
		}

		public void setP_p_id(Integer p_p_id){
			this.p_p_id = p_p_id;
		}
		public Integer getP_p_id(){
			return this.p_p_id;
		}

	}
}
/*-------------------------*/