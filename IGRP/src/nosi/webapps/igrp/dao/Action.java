
package nosi.webapps.igrp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import nosi.core.dao.IgrpDb;
/**
 * @author Isaias.Nunes
 *
 */
import nosi.core.dao.RowDataGateway;
public class Action implements RowDataGateway{
	
	private int id;
	private int env_fk;
	private String page;
	private String action;
	private String proc_name;
	private String xsl_src;
	private String img_src;
	private String page_type;
	private String page_descr;
	private String action_descr;
	private String db_connection;
	private int flg_menu;
	private int flg_transaction;
	private int self_id;
	private int self_fw_id;
	private int version;
	private String table_name; 
	private int flg_offline;
	private int flg_internet;
	private int status;
	private Connection con;
	
	
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public int getEnv_fk() {
		return env_fk;
	}



	public void setEnv_fk(int env_fk) {
		this.env_fk = env_fk;
	}



	public String getPage() {
		return page;
	}



	public void setPage(String page) {
		this.page = page;
	}



	public String getAction() {
		return action;
	}



	public void setAction(String action) {
		this.action = action;
	}



	public String getProc_name() {
		return proc_name;
	}



	public void setProc_name(String proc_name) {
		this.proc_name = proc_name;
	}



	public String getXsl_src() {
		return xsl_src;
	}



	public void setXsl_src(String xsl_src) {
		this.xsl_src = xsl_src;
	}



	public String getImg_src() {
		return img_src;
	}



	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}



	public String getPage_type() {
		return page_type;
	}



	public void setPage_type(String page_type) {
		this.page_type = page_type;
	}



	public String getPage_descr() {
		return page_descr;
	}



	public void setPage_descr(String page_descr) {
		this.page_descr = page_descr;
	}



	public String getAction_descr() {
		return action_descr;
	}



	public void setAction_descr(String action_descr) {
		this.action_descr = action_descr;
	}



	public String getDb_connection() {
		return db_connection;
	}



	public void setDb_connection(String db_connection) {
		this.db_connection = db_connection;
	}



	public int getFlg_menu() {
		return flg_menu;
	}



	public void setFlg_menu(int flg_menu) {
		this.flg_menu = flg_menu;
	}



	public int getFlg_transaction() {
		return flg_transaction;
	}



	public void setFlg_transaction(int flg_transaction) {
		this.flg_transaction = flg_transaction;
	}



	public int getSelf_id() {
		return self_id;
	}



	public void setSelf_id(int self_id) {
		this.self_id = self_id;
	}



	public int getSelf_fw_id() {
		return self_fw_id;
	}



	public void setSelf_fw_id(int self_fw_id) {
		this.self_fw_id = self_fw_id;
	}



	public int getVersion() {
		return version;
	}



	public void setVersion(int version) {
		this.version = version;
	}



	public String getTable_name() {
		return table_name;
	}



	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}



	public int getFlg_offline() {
		return flg_offline;
	}



	public void setFlg_offline(int flg_offline) {
		this.flg_offline = flg_offline;
	}



	public int getFlg_internet() {
		return flg_internet;
	}



	public void setFlg_internet(int flg_internet) {
		this.flg_internet = flg_internet;
	}



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	public Action() {
		super();
		new IgrpDb("db_igrp", "postgres", "nunes").createUnwrap("conexao", "postgresql");
		this.con = new IgrpDb().unwrap("conexao");
	}

	

	@Override
	public boolean insert() {
		try {
			/*page = "page teste 1";
			action = "accao teste 1";
			env_fk = 1;*/
			PreparedStatement st = con.prepareStatement("INSERT INTO public.glb_t_action("
					+ "env_fk, page, action, table_name, xsl_src, img_src, "
					+ "page_type, page_descr, action_descr, flg_menu, "
					+ "flg_transaction, self_id, self_fw_id, version, "
					+ "db_connection, flg_offline, "
					+ "flg_internet, status, proc_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			st.setInt(1, this.env_fk);
			st.setString(2, this.page);
			st.setString(3, this.action);
			st.setString(4, this.table_name);
			st.setString(5, this.xsl_src);
			st.setString(6, this.img_src);
			st.setString(7, this.page_type);
			st.setString(8, this.page_descr);
			st.setString(9, this.action_descr);
			st.setInt(10, this.flg_menu);
			st.setInt(11, this.flg_transaction);
			st.setInt(12, this.self_id);
			st.setInt(13, this.self_fw_id);
			st.setInt(14, this.version);
			st.setString(15, this.db_connection);
			st.setInt(16, this.flg_offline);
			st.setInt(17, this.flg_internet);
			st.setInt(18, this.status);
			st.setString(19, this.proc_name);
			
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object getOne() {
		Action obj = new Action();
		id = 133;
		try {
			PreparedStatement st = con.prepareStatement("SELECT * FROM public.glb_t_action "
					+ "WHERE ID = ? ");
		
			st.setInt(1, this.id);
			
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				obj.setEnv_fk(rs.getInt("env_fk"));
				obj.setPage(rs.getString("page"));
				obj.setAction(rs.getString("action"));
				obj.setTable_name(rs.getString("table_name"));
				obj.setXsl_src(rs.getString("xsl_src"));
				obj.setImg_src(rs.getString("img_src"));
				obj.setPage_type(rs.getString("page_type"));
				obj.setPage_descr(rs.getString("page_descr"));
				obj.setAction_descr(rs.getString("action_descr"));
				obj.setFlg_menu(rs.getInt("flg_menu"));
				obj.setFlg_transaction(rs.getInt("flg_transaction"));
				obj.setSelf_id(rs.getInt("self_id"));
				obj.setSelf_fw_id(rs.getInt("self_fw_id"));
				obj.setVersion(rs.getInt("version"));
				obj.setDb_connection(rs.getString("db_connection"));
				obj.setFlg_offline(rs.getInt("flg_offline"));
				obj.setFlg_internet(rs.getInt("flg_internet"));
				obj.setStatus(rs.getInt("status"));
				obj.setProc_name(rs.getString("proc_name"));
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return obj;
	}

	@Override
	public boolean update() {
		/*id = 133;
		page = "page teste 1";
		action = "accao teste 1 Update";
		env_fk = 1;	*/	
		try {
			PreparedStatement st = con.prepareStatement("UPDATE public.glb_t_action	SET "
					+ "env_fk=?, "
					+ "page=?, "
					+ "action=?, "
					+ "table_name=?, "
					+ "xsl_src=?, "
					+ "img_src=?, "
					+ "page_type=?, "
					+ "page_descr=?, "
					+ "action_descr=?, "
					+ "flg_menu=?, "
					+ "flg_transaction=?, "
					+ "self_id=?, "
					+ "self_fw_id=?, "
					+ "version=?, "
					+ "db_connection=?, "
					+ "flg_offline=?, "
					+ "flg_internet=?, "
					+ "status=?, "
					+ "proc_name=? WHERE id = " + this.id);
			
			st.setInt(1, this.env_fk);
			st.setString(2, this.page);
			st.setString(3, this.action);
			st.setString(4, this.table_name);
			st.setString(5, this.xsl_src);
			st.setString(6, this.img_src);
			st.setString(7, this.page_type);
			st.setString(8, this.page_descr);
			st.setString(9, this.action_descr);
			st.setInt(10, this.flg_menu);
			st.setInt(11, this.flg_transaction);
			st.setInt(12, this.self_id);
			st.setInt(13, this.self_fw_id);
			st.setInt(14, this.version);
			st.setString(15, this.db_connection);
			st.setInt(16, this.flg_offline);
			st.setInt(17, this.flg_internet);
			st.setInt(18, this.status);
			st.setString(19, this.proc_name);
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return false;
	}

	@Override
	public boolean delete() {
		//id = 132;
		try {
			PreparedStatement st = con.prepareStatement("DELETE FROM public.glb_t_action WHERE id= " + this.id);
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object[] getAll() {
		ArrayList<Action> lista = new ArrayList<>();
		try{
			PreparedStatement st = con.prepareStatement("SELECT * FROM public.glb_t_action");
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				Action obj = new Action();
				obj.setEnv_fk(rs.getInt("env_fk"));
				obj.setPage(rs.getString("page"));
				obj.setAction(rs.getString("action"));
				obj.setTable_name(rs.getString("table_name"));
				obj.setXsl_src(rs.getString("xsl_src"));
				obj.setImg_src(rs.getString("img_src"));
				obj.setPage_type(rs.getString("page_type"));
				obj.setPage_descr(rs.getString("page_descr"));
				obj.setAction_descr(rs.getString("action_descr"));
				obj.setFlg_menu(rs.getInt("flg_menu"));
				obj.setFlg_transaction(rs.getInt("flg_transaction"));
				obj.setSelf_id(rs.getInt("self_id"));
				obj.setSelf_fw_id(rs.getInt("self_fw_id"));
				obj.setVersion(rs.getInt("version"));
				obj.setDb_connection(rs.getString("db_connection"));
				obj.setFlg_offline(rs.getInt("flg_offline"));
				obj.setFlg_internet(rs.getInt("flg_internet"));
				obj.setStatus(rs.getInt("status"));
				obj.setProc_name(rs.getString("proc_name"));
				lista.add(obj);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return lista.toArray();
	}
	
	
	public static void main(String[] args) {
		//new Action().insert();
		//System.out.println(new Action().getOne());
		/*for(Object i: new Action().getAll()){
			Action obj = (Action) i;
			System.out.println(obj.getStatus());
		}*/
		
		//new Action().update();
		//new Action().delete();
	}



	@Override
	public String toString() {
		return "Action [id=" + id + ", env_fk=" + env_fk + ", page=" + page + ", action=" + action + ", proc_name="
				+ proc_name + ", xsl_src=" + xsl_src + ", img_src=" + img_src + ", page_type=" + page_type
				+ ", page_descr=" + page_descr + ", action_descr=" + action_descr + ", db_connection=" + db_connection
				+ ", flg_menu=" + flg_menu + ", flg_transaction=" + flg_transaction + ", self_id=" + self_id
				+ ", self_fw_id=" + self_fw_id + ", version=" + version + ", table_name=" + table_name
				+ ", flg_offline=" + flg_offline + ", flg_internet=" + flg_internet + ", status=" + status +  "]";
	}
	
	
}
