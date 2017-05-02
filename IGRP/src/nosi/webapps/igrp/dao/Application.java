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

import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;


public class Application implements RowDataGateway {
	
	private String dad;
	private String name;
	private int id;
	private String img_src;
	private String description;
	private int action_fk;
	private int status;
	private int flg_old;
	private String link_menu; 
	private String link_center;
	private String apache_dad;
	private String templates;
	private String host;
	private int flg_external;
	
	private Connection con;	
	
	public Application() {
		super();
		this.con = Igrp.getInstance().getDao().unwrap("db1");
	}

	public String getDad() {
		return dad;
	}

	public void setDad(String dad) {
		this.dad = dad;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImg_src() {
		return img_src;
	}

	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAction_fk() {
		return action_fk;
	}

	public void setAction_fk(int action_fk) {
		this.action_fk = action_fk;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getFlg_old() {
		return flg_old;
	}

	public void setFlg_old(int flg_old) {
		this.flg_old = flg_old;
	}

	public String getLink_menu() {
		return link_menu;
	}

	public void setLink_menu(String link_menu) {
		this.link_menu = link_menu;
	}

	public String getLink_center() {
		return link_center;
	}

	public void setLink_center(String link_center) {
		this.link_center = link_center;
	}

	public String getApache_dad() {
		return apache_dad;
	}

	public void setApache_dad(String apache_dad) {
		this.apache_dad = apache_dad;
	}

	public String getTemplates() {
		return templates;
	}

	public void setTemplates(String templates) {
		this.templates = templates;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public int getFlg_external() {
		return flg_external;
	}

	public void setFlg_external(int flg_external) {
		this.flg_external = flg_external;
	}

	@Override
	public boolean insert() {
		try{
			PreparedStatement st = con.prepareStatement("INSERT INTO glb_t_env"+
			             "(name, dad, img_src, description, action_fk, link_menu, link_center, apache_dad, templates, host, flg_old, status, flg_external)" +
					     "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			st.setString(1, this.name);
			st.setString(2, this.dad);
			st.setString(3, this.img_src);
			st.setString(4, this.description);
			st.setInt(5, this.action_fk);
			st.setString(6, this.link_menu);
			st.setString(7, this.link_center);
			st.setString(8, this.apache_dad);
			st.setString(9, this.templates);
			st.setString(10,this.host);
			st.setInt(11, this.flg_old);
			st.setInt(12,this.status);
			st.setInt(13,this.flg_external);
			st.executeUpdate();
			st.close();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object getOne() {
		Application obj = new Application();
		try{
		Statement st = con.createStatement();
		ResultSet result = st.executeQuery("SELECT * FROM public.glb_t_env where (id = "+ this.id+") or (dad='"+this.dad+"')");

		while(result.next()){
			
			obj.setName(result.getString("name"));
			obj.setDad(result.getString("dad"));
			obj.setImg_src(result.getString("img_src"));
			obj.setDescription(result.getString("description"));
			obj.setAction_fk(result.getInt("action_fk"));
			obj.setLink_menu(result.getString("link_menu"));
			obj.setLink_center(result.getString("link_center"));
			obj.setApache_dad(result.getString("apache_dad"));
			obj.setTemplates(result.getString("templates"));
			obj.setHost(result.getString("host"));
			obj.setFlg_old(result.getInt("flg_old"));
			obj.setStatus(result.getInt("status"));
			obj.setFlg_external(result.getInt("flg_external"));
		}
		st.close();
		
		}catch(SQLException e){
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	public boolean update() {
		
		try{
			Statement st = con.createStatement();
	        st.executeUpdate("UPDATE public.glb_t_env SET "
	        		+ "name= '" + this.name
	        		+ "',dad= '" + this.dad
	        		+ "',img_src= '" + this.img_src
	        		+ "',description= '" + this.description
	        		+ "',action_fk= " + this.action_fk
	        		+ ",flg_old= " + this.flg_old
	        		+ ",link_menu= '" + this.link_menu
	        		+ "',link_center= '" + this.link_center
	        		+ "',apache_dad= " + this.apache_dad
	        		+ ",templates= '" + this.templates
	        		+ "',host= '" + this.host
	        		+ "',flg_external= " + this.flg_external
	        		+ ",status = " + this.status
	        		+ "WHERE id = "+ this.id);
	        st.close();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete() {
		try{
			Statement st = con.createStatement();
	        st.executeUpdate("DELETE FROM public.glb_t_env where id = " + this.id);
	        st.close();
			con.close();
			return true;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object[] getAll() {
		
		ArrayList<Application> lista = new ArrayList<>();
		
		try{
			String conditions = "WHERE 1=1 ";
			Method[] methods = this.getClass().getDeclaredMethods();
			for(Method method:methods){
				if((method.getReturnType().getSimpleName().equals("String") || method.getReturnType().isPrimitive()) && method.getName().startsWith("get") && method.invoke(this)!=null && !method.invoke(this).equals("") && !method.invoke(this).toString().equals("0")){
					conditions+=" AND "+method.getName().substring(3).toLowerCase()+"=? ";
				}
			}
			PreparedStatement st = con.prepareStatement("SELECT * FROM public.glb_t_env "+ conditions+ " order by id");
			int i=1;
			for(Method method:methods){
				if((method.getReturnType().getSimpleName().equals("String") || method.getReturnType().isPrimitive()) && method.getName().startsWith("get") && method.invoke(this)!=null && !method.invoke(this).equals("") && !method.invoke(this).toString().equals("0")){
					switch(method.getReturnType().getSimpleName()){
						case "int":
							st.setInt(i,Integer.parseInt(method.invoke(this).toString()));
							break;
						case "String":
							st.setString(i,method.invoke(this).toString());
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
			
			ResultSet result = st.executeQuery();
			
			while(result.next()){
				Application obj = new Application();
				
				obj.setName(result.getString("name"));
			    obj.setDad(result.getString("dad")); 
				obj.setImg_src(result.getString("img_src") );
				obj.setDescription(result.getString("description"));
				obj.setAction_fk(result.getInt("action_fk")); 
				obj.setFlg_old(result.getInt("flg_old"));
				obj.setLink_menu(result.getString("link_menu")); 
				obj.setLink_center(result.getString("link_center"));
				obj.setApache_dad(result.getString("apache_dad")); 
				obj.setTemplates(result.getString("templates"));
				obj.setHost(result.getString("host"));
				obj.setFlg_external(result.getInt("flg_external"));
				obj.setStatus(result.getInt("status"));
				obj.setId(result.getInt("id"));		
				
				lista.add(obj);
		}
		st.close();
		
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

	public HashMap<Integer,String> getListApps(){
		HashMap<Integer,String> lista = new HashMap<>();
		lista.put(null, "--- Selecionar Aplicação ---");
		for(Object obj:new Application().getAll()){
			Application app = (Application) obj;
			lista.put(app.getId(), app.getName());
		}
		return lista;
	}
	// Pega o objeto que o metodo retorna e transforma em string 
	@Override
	public String toString() {
		return "Application [dad=" + dad + ", name=" + name + ", id=" + id + ", img_src=" + img_src + ", description="
				+ description + ", action_fk=" + action_fk + ", status=" + status + ", flg_old=" + flg_old
				+ ", link_menu=" + link_menu + ", link_center=" + link_center + ", apache_dad=" + apache_dad
				+ ", templates=" + templates + ", host=" + host + ", flg_external=" + flg_external + "]";
	}
	
	
}
