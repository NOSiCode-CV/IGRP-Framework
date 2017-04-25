/**
 * 
 */
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

public class Menu implements RowDataGateway {
	
	private int id;
	private String area;
	private String link;
	private int self_id;
	private int env_fk;
	private String img_src;
	private String descr;
	private int action_fk;
	private int orderby;
	private int status;
	private String code;
	private int flg_base;
	private String target;
	private Connection con;
	
	
	
	
	
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getArea() {
		return area;
	}



	public void setArea(String area) {
		this.area = area;
	}



	public String getLink() {
		return link;
	}



	public void setLink(String link) {
		this.link = link;
	}



	public int getSelf_id() {
		return self_id;
	}



	public void setSelf_id(int self_id) {
		this.self_id = self_id;
	}



	public int getEnv_fk() {
		return env_fk;
	}



	public void setEnv_fk(int env_fk) {
		this.env_fk = env_fk;
	}



	public String getImg_src() {
		return img_src;
	}



	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}



	public String getDescr() {
		return descr;
	}



	public void setDescr(String descr) {
		this.descr = descr;
	}



	public int getAction_fk() {
		return action_fk;
	}



	public void setAction_fk(int action_fk) {
		this.action_fk = action_fk;
	}



	public int getOrderby() {
		return orderby;
	}



	public void setOrderby(int orderby) {
		this.orderby = orderby;
	}



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	public String getCode() {
		return code;
	}



	public void setCode(String code) {
		this.code = code;
	}



	public int getFlg_base() {
		return flg_base;
	}



	public void setFlg_base(int flg_base) {
		this.flg_base = flg_base;
	}



	public String getTarget() {
		return target;
	}



	public void setTarget(String target) {
		this.target = target;
	}




	public Menu() {
		super();
		new IgrpDb("db_igrp", "postgres", "nunes").createUnwrap("conexao", "postgresql");
		this.con = new IgrpDb().unwrap("conexao");
	}
	
	

	@Override
	public boolean insert() {
		try{
			/*descr = "descricao teste";
			action_fk = 5;
			env_fk = 1;
			self_id = 3;*/
			PreparedStatement st = con.prepareStatement("INSERT INTO public.glb_t_menu("
					+ "descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			st.setString(1, this.descr);
			st.setString(2, this.link);
			st.setInt(3, this.self_id);
			st.setInt(4, this.env_fk);
			st.setString(5, this.img_src);
			st.setString(6, this.area);
			st.setInt(7, this.action_fk);
			st.setInt(8, this.orderby);
			st.setInt(9, this.status);
			st.setString(10, this.code);
			st.setInt(11, this.flg_base);
			st.setString(12, this.target);
			
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object getOne() {
		Menu obj = new Menu();
		try{
			//id = 19;
			PreparedStatement st = con.prepareStatement("SELECT * FROM public.glb_t_menu where id = " + this.id);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()){
				obj.setSelf_id(rs.getInt("id"));
				obj.setDescr(rs.getString("descr"));
				obj.setLink(rs.getString("link"));
				obj.setSelf_id(rs.getInt("self_id"));
				obj.setEnv_fk(rs.getInt("env_fk"));
				obj.setImg_src(rs.getString("img_src"));
				obj.setArea(rs.getString("area"));
				obj.setAction_fk(rs.getInt("action_fk"));
				obj.setOrderby(rs.getInt("orderby"));
				obj.setStatus(rs.getInt("status"));
				obj.setCode(rs.getString("code"));
				obj.setFlg_base(rs.getInt("flg_base"));
				obj.setTarget(rs.getString("target"));
				
			}
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	public boolean update() {
		id = 138;
		descr = "descricao teste update";
		action_fk = 5;
		env_fk = 1;
		self_id = 3;
		try{
			PreparedStatement st = con.prepareStatement("UPDATE public.glb_t_menu SET "
					+ "descr=?, link=?, self_id=?, env_fk=?, img_src=?, area=?, "
					+ "action_fk=?, orderby=?, status=?, code=?, flg_base=?, target = ? WHERE id = " + this.id);
			
			st.setString(1, this.descr);
			st.setString(2, this.link);
			st.setInt(3, this.self_id);
			st.setInt(4, this.env_fk);
			st.setString(5, this.img_src);
			st.setString(6, this.area);
			st.setInt(7, this.action_fk);
			st.setInt(8, this.orderby);
			st.setInt(9, this.status);
			st.setString(10, this.code);
			st.setInt(11, this.flg_base);
			st.setString(12, this.target);
			
			st.executeUpdate();
			st.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete() {
		id = 138;
		try {
			PreparedStatement st = con.prepareStatement("DELETE FROM public.glb_t_menu WHERE id = " + this.id);
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Object[] getAll() {
		ArrayList<Menu> lista = new ArrayList<>();
		try {
			PreparedStatement st = con.prepareStatement("SELECT * FROM public.glb_t_menu");
			ResultSet rs = st.executeQuery();
			while(rs.next()){
				Menu obj = new Menu();
				obj.setSelf_id(rs.getInt("id"));
				obj.setDescr(rs.getString("descr"));
				obj.setLink(rs.getString("link"));
				obj.setSelf_id(rs.getInt("self_id"));
				obj.setEnv_fk(rs.getInt("env_fk"));
				obj.setImg_src(rs.getString("img_src"));
				obj.setArea(rs.getString("area"));
				obj.setAction_fk(rs.getInt("action_fk"));
				obj.setOrderby(rs.getInt("orderby"));
				obj.setStatus(rs.getInt("status"));
				obj.setCode(rs.getString("code"));
				obj.setFlg_base(rs.getInt("flg_base"));
				obj.setTarget(rs.getString("target"));
				lista.add(obj);
			}
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista.toArray();
	}
	
	
	
	public static void main(String[] args) {
		//new Menu().insert();
		//System.out.println(new Menu().getOne());
		//new Menu().update();
		//new Menu().delete();
		for(Object i: new Menu().getAll()){
			Menu obj = (Menu) i;
			System.out.println(obj.getStatus());
		}
	}



	@Override
	public String toString() {
		return "Menu [id=" + id + ", area=" + area + ", link=" + link + ", self_id=" + self_id + ", env_fk=" + env_fk
				+ ", img_src=" + img_src + ", descr=" + descr + ", action_fk=" + action_fk + ", orderby=" + orderby
				+ ", status=" + status + ", code=" + code + ", flg_base=" + flg_base + ", target=" + target + "]";
	}
	
	
}
