package nosi.webapps.app_teste.pages.listar_exames;

import java.math.BigInteger;
import java.math.BigDecimal;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Listar_exames extends Model{		
	
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


	public static class Table_1 extends IGRPTable.Table{
		private String nome_utente;
		private String nome_exame;
		private String date;
		private IGRPLink ver_exame;
		private String ver_exame_desc;
		public void setNome_utente(String nome_utente){
			this.nome_utente = nome_utente;
		}
		public String getNome_utente(){
			return this.nome_utente;
		}

		public void setNome_exame(String nome_exame){
			this.nome_exame = nome_exame;
		}
		public String getNome_exame(){
			return this.nome_exame;
		}

		public void setDate(String date){
			this.date = date;
		}
		public String getDate(){
			return this.date;
		}

		public IGRPLink setVer_exame(String app,String page,String action){
			this.ver_exame = new IGRPLink(app,page,action);
			return this.ver_exame;
		}
		public IGRPLink getVer_exame(){
			return this.ver_exame;
		}
		public void setVer_exame_desc(String ver_exame_desc){
			this.ver_exame_desc = ver_exame_desc;
		}
		public String getVer_exame_desc(){
			return this.ver_exame_desc;
		}
	public IGRPLink setVer_exame(String link){
		this.ver_exame = new IGRPLink(link);
		return this.ver_exame;
	}
	public IGRPLink setVer_exame(Report link){
		this.ver_exame = new IGRPLink(link);
		return this.ver_exame;
	}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
