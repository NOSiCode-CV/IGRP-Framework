/*---------------------- Create Model ----------------------*/
package nosi.webapps.kofax.pages.listaobjeto;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class ListaObjeto extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_objecto_pesquisar")
	private String objecto_pesquisar;

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
	
	public void setObjecto_pesquisar(String objecto_pesquisar){
		this.objecto_pesquisar = objecto_pesquisar;
	}
	public String getObjecto_pesquisar(){
		return this.objecto_pesquisar;
	}


	public static class Table_1{
		private String objeto;
		private String pagina;
		private String organica;
		private String estado;
		private String p_id;
		public void setObjeto(String objeto){
			this.objeto = objeto;
		}
		public String getObjeto(){
			return this.objeto;
		}

		public void setPagina(String pagina){
			this.pagina = pagina;
		}
		public String getPagina(){
			return this.pagina;
		}

		public void setOrganica(String organica){
			this.organica = organica;
		}
		public String getOrganica(){
			return this.organica;
		}

		public void setEstado(String estado){
			this.estado = estado;
		}
		public String getEstado(){
			return this.estado;
		}

		public void setP_id(String p_id){
			this.p_id = p_id;
		}
		public String getP_id(){
			return this.p_id;
		}

	}
}
/*-------------------------*/