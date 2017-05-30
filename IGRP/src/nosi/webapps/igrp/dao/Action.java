package nosi.webapps.igrp.dao;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * @author Isaias.Nunes
 *
 */
import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;
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
	private String version;
	private String table_name; 
	private int flg_offline;
	private int flg_internet;
	private int status;
	private Application env = new Application();
	private Connection con;
	
	
	public Application getEnv() {
		return env;
	}



	public void setEnv(Application env) {
		this.env = env;
	}



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



	public String getVersion() {
		return version;
	}



	public void setVersion(String version) {
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
		this.con = Igrp.getInstance().getDao().unwrap("db1");
		
		/*IgrpDb db = new IgrpDb();
		db.newConnection("", "", "", "");
		this.con = db.unwrap("");
		*/
	}

	

	@Override
	public boolean insert() {
		boolean result = false;
		try {
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_action("
					+ "env_fk, page, action, table_name, xsl_src, img_src, "
					+ "page_type, page_descr, action_descr, flg_menu, "
					+ "flg_transaction, self_id, self_fw_id, version, "
					+ "db_connection, flg_offline, "
					+ "flg_internet, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
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
			st.setString(14, this.version);
			st.setString(15, this.db_connection);
			st.setInt(16, this.flg_offline);
			st.setInt(17, this.flg_internet);
			st.setInt(18, this.status);
			
			st.executeUpdate();
			st.close();
			result  = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	@Override
	public Object getOne() {
		Action obj = new Action();
		try {
			String condicions = "";
			condicions += this.id!=0?" AND a.id="+this.id:"";
			condicions += this.page!=null && !this.page.equals("")?" AND a.page='"+this.page+"'":"";
			condicions += this.action!=null && !this.action.equals("")?" AND a.action='"+this.action+"'":"";
			PreparedStatement st = con.prepareStatement("SELECT a.*,e.dad FROM glb_t_action a, glb_t_env e "
					+ " WHERE a.env_fk=e.id "+condicions);
			
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
				obj.setVersion(rs.getString("version"));
				obj.setDb_connection(rs.getString("db_connection"));
				obj.setFlg_offline(rs.getInt("flg_offline"));
				obj.setFlg_internet(rs.getInt("flg_internet"));
				obj.setStatus(rs.getInt("status"));
				obj.setId(rs.getInt("id"));
				Application e = new Application();
				e.setDad(rs.getString("dad"));
				e.setId(rs.getInt("env_fk"));
				obj.setEnv(e);
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return obj;
	}
	
	public Object getOne(int id) {
		Action obj = new Action();
		try {
			PreparedStatement st = con.prepareStatement("SELECT * FROM glb_t_action A, glb_t_env E "
					+ " WHERE A.env_fk=E.id AND A.id = ? ");
		
			st.setInt(1,id);
			
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
				obj.setVersion(rs.getString("version"));
				obj.setDb_connection(rs.getString("db_connection"));
				obj.setFlg_offline(rs.getInt("flg_offline"));
				obj.setFlg_internet(rs.getInt("flg_internet"));
				obj.setStatus(rs.getInt("status"));
				obj.env.setDad(rs.getString("dad"));
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return obj;
	}

	public String getXslPath() {
		String xsl_src = "";
		try {
			PreparedStatement st = con.prepareStatement("SELECT xsl_src FROM glb_t_action A, glb_t_env E"
					+ " WHERE A.env_fk=E.id AND A.page = ? AND E.dad=?");
		
			st.setString(1, this.page);
			//st.setString(2, this.action);
			st.setString(2, this.getEnv().getDad());
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				xsl_src = rs.getString("xsl_src");
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return xsl_src;
	}
	
	@Override
	public boolean update() {	
		int result = 0;
		try {
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("UPDATE glb_t_action	SET "
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
					+ "status=? "
					+ "WHERE id = " + this.id);
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
			st.setString(14, this.version);
			st.setString(15, this.db_connection);
			st.setInt(16, this.flg_offline);
			st.setInt(17, this.flg_internet);
			st.setInt(18, this.status);
			result = st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return result > 0;
	}

	@Override
	public boolean delete() {
		boolean result = false;
		try {
			con.setAutoCommit(true);
			PreparedStatement st = con.prepareStatement("DELETE FROM glb_t_action WHERE id= " + this.id);
			st.executeUpdate();
			st.close();
			result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result ;
	}

	@Override
	public Object[] getAll() {
		ArrayList<Action> lista = new ArrayList<Action>();
		try{
			String conditions = "WHERE 1=1 ";
			Method[] methods = this.getClass().getDeclaredMethods();
			for(Method method:methods){
				if((method.getReturnType().getSimpleName().equals("String") || method.getReturnType().isPrimitive()) && method.getName().startsWith("get") && method.invoke(this)!=null && !method.invoke(this).equals("") && !method.invoke(this).toString().equals("0")){
					conditions+=" AND "+method.getName().substring(3).toLowerCase()+" LIKE ? ";
				}
			}
			PreparedStatement st = con.prepareStatement("SELECT * FROM glb_t_action "+conditions);
			int i=1;
			for(Method method:methods){
				if((method.getReturnType().getSimpleName().equals("String") || method.getReturnType().isPrimitive()) && method.getName().startsWith("get") && method.invoke(this)!=null && !method.invoke(this).equals("") && !method.invoke(this).toString().equals("0")){
					switch(method.getReturnType().getSimpleName()){
						case "int":
							st.setInt(i,Integer.parseInt(method.invoke(this).toString()));
							break;
						case "String":
							st.setString(i,method.invoke(this).toString()+"%");
							break;
						case "double":
							st.setDouble(i,Double.parseDouble(method.invoke(this).toString()));
							break;
						case "float":
							st.setFloat(i,Float.parseFloat(method.invoke(this).toString()));
							break;
					}
					i++;
				}
			}
			ResultSet rs = st.executeQuery();			
			while(rs.next()){
				Action obj = new Action();
				obj.setId(rs.getInt("id"));
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
				obj.setVersion(rs.getString("version"));
				obj.setDb_connection(rs.getString("db_connection"));
				obj.setFlg_offline(rs.getInt("flg_offline"));
				obj.setFlg_internet(rs.getInt("flg_internet"));
				obj.setStatus(rs.getInt("status"));
				lista.add(obj);
			}
		}catch(SQLException e){
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista.toArray();
	}
	
	
	public Object[] getAll_(){
		ArrayList<Action> lista = new ArrayList<Action>();
		try{
			String sql = "SELECT * FROM glb_t_action where 1=1 ";
			Statement st = con.createStatement();
			
			sql += this.page != null && !this.page.equals("") ? " and page like '%" + this.page + "%'" : "";
			sql += this.page_descr != null && !this.page_descr.equals("") ? " and page_descr like '%" + this.page_descr + "%'" : "";
			sql += this.env_fk != 0 ? " and env_fk = " + this.env_fk : "";
			
			System.out.println(sql);
			
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				Action obj = new Action();
				obj.setId(rs.getInt("id"));
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
				obj.setVersion(rs.getString("version"));
				obj.setDb_connection(rs.getString("db_connection"));
				obj.setFlg_offline(rs.getInt("flg_offline"));
				obj.setFlg_internet(rs.getInt("flg_internet"));
				obj.setStatus(rs.getInt("status"));
				lista.add(obj);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return lista.toArray();
	}
	
	
	public Object[] getAll(String dad) {
		ArrayList<Action> lista = new ArrayList<>();
		try{
			PreparedStatement st = con.prepareStatement("SELECT * FROM glb_t_action A, glb_t_env E WHERE A.env_fk=E.id AND E.dad=?");
			st.setString(1, dad);
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				Action obj = new Action();
				obj.setId(rs.getInt("id"));
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
				obj.setVersion(rs.getString("version"));
				obj.setDb_connection(rs.getString("db_connection"));
				obj.setFlg_offline(rs.getInt("flg_offline"));
				obj.setFlg_internet(rs.getInt("flg_internet"));
				obj.setStatus(rs.getInt("status"));
				obj.env.setDad(rs.getString("dad"));
				lista.add(obj);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return lista.toArray();
	}

	public HashMap<Integer,String> getListActions(){
		HashMap<Integer,String> lista = new HashMap<>();
		lista.put(null, "--- Selecionar Página ---");
		for(Object obj:new Action().getAll()){
			Action ac = (Action) obj;
			if(ac.getPage_descr()!=null && !ac.getPage_descr().equals(""))
				lista.put(ac.getId(), ac.getPage_descr());
			else
				lista.put(ac.getId(), ac.getPage());
		}
		return lista;
	}
	
	@Override
	public String toString() {
		return "Action [id=" + id + ", env_fk=" + env_fk + ", page=" + page + ", action=" + action + ", "
				+", xsl_src=" + xsl_src + ", img_src=" + img_src + ", page_type=" + page_type
				+ ", page_descr=" + page_descr + ", action_descr=" + action_descr + ", db_connection=" + db_connection
				+ ", flg_menu=" + flg_menu + ", flg_transaction=" + flg_transaction + ", self_id=" + self_id
				+ ", self_fw_id=" + self_fw_id + ", version=" + version + ", table_name=" + table_name
				+ ", flg_offline=" + flg_offline + ", flg_internet=" + flg_internet + ", status=" + status +  "]";
	}
	
	
}
