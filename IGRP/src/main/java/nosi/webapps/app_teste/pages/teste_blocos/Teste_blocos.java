package nosi.webapps.app_teste.pages.teste_blocos;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Teste_blocos extends Model{		
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_morada")
	private String morada;
	@RParam(rParamName = "p_estado_civil")
	private String estado_civil;
	@RParam(rParamName = "p_data_de_registro")
	private String data_de_registro;
	@RParam(rParamName = "p_anexos")
	private String anexos;
	
	private List<Table_2> table_2 = new ArrayList<>();	
	public void setTable_2(List<Table_2> table_2){
		this.table_2 = table_2;
	}
	public List<Table_2> getTable_2(){
		return this.table_2;
	}

	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}

	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setMorada(String morada){
		this.morada = morada;
	}
	public String getMorada(){
		return this.morada;
	}
	
	public void setEstado_civil(String estado_civil){
		this.estado_civil = estado_civil;
	}
	public String getEstado_civil(){
		return this.estado_civil;
	}
	
	public void setData_de_registro(String data_de_registro){
		this.data_de_registro = data_de_registro;
	}
	public String getData_de_registro(){
		return this.data_de_registro;
	}
	
	public void setAnexos(String anexos){
		this.anexos = anexos;
	}
	public String getAnexos(){
		return this.anexos;
	}


	public static class Table_2 extends IGRPTable.Table{
		private String nomeee;
		private String moraadaa;
		private String estadoooo;
		public void setNomeee(String nomeee){
			this.nomeee = nomeee;
		}
		public String getNomeee(){
			return this.nomeee;
		}

		public void setMoraadaa(String moraadaa){
			this.moraadaa = moraadaa;
		}
		public String getMoraadaa(){
			return this.moraadaa;
		}

		public void setEstadoooo(String estadoooo){
			this.estadoooo = estadoooo;
		}
		public String getEstadoooo(){
			return this.estadoooo;
		}

	}
	public static class Table_1 extends IGRPTable.Table{
		private String nomes;
		private String moradas;
		private String estados;
		private String datas;
		private IGRPLink anexoss;
		private String anexoss_desc;
		public void setNomes(String nomes){
			this.nomes = nomes;
		}
		public String getNomes(){
			return this.nomes;
		}

		public void setMoradas(String moradas){
			this.moradas = moradas;
		}
		public String getMoradas(){
			return this.moradas;
		}

		public void setEstados(String estados){
			this.estados = estados;
		}
		public String getEstados(){
			return this.estados;
		}

		public void setDatas(String datas){
			this.datas = datas;
		}
		public String getDatas(){
			return this.datas;
		}

		public IGRPLink setAnexoss(String app,String page,String action){
			this.anexoss = new IGRPLink(app,page,action);
			return this.anexoss;
		}
		public IGRPLink getAnexoss(){
			return this.anexoss;
		}
		public void setAnexoss_desc(String anexoss_desc){
			this.anexoss_desc = anexoss_desc;
		}
		public String getAnexoss_desc(){
			return this.anexoss_desc;
		}
	public IGRPLink setAnexoss(String link){
		this.anexoss = new IGRPLink(link);
		return this.anexoss;
	}
	public IGRPLink setAnexoss(Report link){
		this.anexoss = new IGRPLink(link);
		return this.anexoss;
	}

	}

	public void loadTable_2(BaseQueryInterface query) {
		this.setTable_2(this.loadTable(query,Table_2.class));
	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
