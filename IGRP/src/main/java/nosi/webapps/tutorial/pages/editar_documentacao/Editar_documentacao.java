package nosi.webapps.tutorial.pages.editar_documentacao;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Editar_documentacao extends Model{		
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}



	public static class Table_1 extends IGRPTable.Table{
		private String titulo;
		private String tipo;
		private String relacionados;
		private String data;
		private String id_doc;
		public void setTitulo(String titulo){
			this.titulo = titulo;
		}
		public String getTitulo(){
			return this.titulo;
		}

		public void setTipo(String tipo){
			this.tipo = tipo;
		}
		public String getTipo(){
			return this.tipo;
		}

		public void setRelacionados(String relacionados){
			this.relacionados = relacionados;
		}
		public String getRelacionados(){
			return this.relacionados;
		}

		public void setData(String data){
			this.data = data;
		}
		public String getData(){
			return this.data;
		}

		public void setId_doc(String id_doc){
			this.id_doc = id_doc;
		}
		public String getId_doc(){
			return this.id_doc;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
