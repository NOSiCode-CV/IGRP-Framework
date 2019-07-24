package nosi.webapps.app_teste.pages.userlist;

import java.math.BigInteger;
import java.math.BigDecimal;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class UserList extends Model{		
	
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
		private String nome;
		private String morada;
		private int contacto;
		private int id_user;
		private String file_num;
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

		public void setContacto(int contacto){
			this.contacto = contacto;
		}
		public int getContacto(){
			return this.contacto;
		}

		public void setId_user(int id_user){
			this.id_user = id_user;
		}
		public int getId_user(){
			return this.id_user;
		}

		public void setFile_num(String file_num){
			this.file_num = file_num;
		}
		public String getFile_num(){
			return this.file_num;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
