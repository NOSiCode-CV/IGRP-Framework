/**
 * 
 */
package nosi.webapps.igrp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 * @author Isaias.Nunes
 *
 */

import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;

public class Config implements RowDataGateway {

	private String name;
	private String value;
	private Connection con;
	
	public Config() {
		super();
		this.con = Igrp.getInstance().getDao().unwrap("db1");
	}

	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public boolean insert() {
		name = "Nome teste";
		value = "valor teste";
		try{
			PreparedStatement st = con.prepareStatement("INSERT INTO public.glb_t_config (name, value) VALUES (?, ?)");
			
			st.setString(1, this.name);
			st.setString(2, this.value);
			
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object getOne() {
		
		Config obj = new Config();
		try{
			//name = "Nome teste";
			PreparedStatement st = con.prepareStatement("SELECT name, value FROM public.glb_t_config WHERE name = '" + this.name + "'");
			ResultSet rs = st.executeQuery();
			
			while(rs.next()){
				obj.setName(rs.getString("name"));
				obj.setValue(rs.getString("value"));
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
			/*this.name = "Nome teste";
			this.value = "valor update";*/
			PreparedStatement st = con.prepareStatement("UPDATE public.glb_t_config SET name=?, value = ? "
					+ "WHERE name = '" + this.name + "'");
			st.setString(1, this.name);
			st.setString(2, this.value);
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete() {
		try{
			name = "Nome teste";
			PreparedStatement st = con.prepareStatement("DELETE FROM public.glb_t_config WHERE name = '" + this.name + "'");
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object[] getAll() {
		ArrayList<Config> lista = new ArrayList<>();
		try{
			PreparedStatement st = con.prepareStatement("SELECT name, value FROM public.glb_t_config");
			ResultSet rs = st.executeQuery();
			
			while(rs.next()){
				Config obj = new Config();
				obj.setName(rs.getString("name"));
				obj.setValue(rs.getString("value"));
				lista.add(obj);
			}
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return lista.toArray();
	}
	
	
	public static void main(String[] args) {
		new Config().insert();
		//System.out.println(new Config().getOne());
		//new Config().update();
		//new Config().delete();
		for(Object i: new Config().getAll()){
			Config obj = (Config) i;
			System.out.println(obj.getName());
			System.out.println();
			System.out.println(obj.getValue());
		}
	}




	@Override
	public String toString() {
		return "Config [name=" + name + ", value=" + value + "]";
	}
	
	
	

}
