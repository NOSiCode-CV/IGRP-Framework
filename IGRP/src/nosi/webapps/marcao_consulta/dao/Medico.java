package nosi.webapps.marcao_consulta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;

public class Medico implements RowDataGateway{

	
	private int id;
	private String nome;
	private String morada;
	private int num_consulta;
	private Connection con;
	
	public Medico(){
		super();
		this.con = Igrp.getInstance().getDao().unwrap("db1");
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getMorada() {
		return morada;
	}
	public void setMorada(String morada) {
		this.morada = morada;
	}
	public int getNum_consulta() {
		return num_consulta;
	}
	public void setNum_consulta(int num_consulta) {
		this.num_consulta = num_consulta;
	}
	@Override
	public boolean insert() {
		try {
			PreparedStatement ps = this.con.prepareStatement("INSERT INTO tbl_medico(nome,morada,num_consulta_dia) VALUES(?,?,?)");
			ps.setString(1, this.getNome());
			ps.setString(2, this.getMorada());
			ps.setInt(3, this.getNum_consulta());
			int r = ps.executeUpdate();
			ps.close();
			return r > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public Object getOne() {
		PreparedStatement ps;
		try {
			ps = this.con.prepareStatement("SELECT * FROM tbl_medico WHERE id=?");
			ps.setInt(1, this.id);
			ResultSet rs = ps.executeQuery();
			Medico m = new Medico();
			if(rs.next()){
				m.setId(rs.getInt("id"));
				m.setMorada(rs.getString("morada"));
				m.setNome(rs.getString("nome"));
				m.setNum_consulta(rs.getInt("num_consulta_dia"));
				return m;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public boolean update() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean delete() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public Object[] getAll() {
		ArrayList<Medico> medicos = new ArrayList<>();
		try {
			String condicions = " WHERE 1=1 ";
			condicions += (this.getNome()!=null && !this.getNome().equals(""))?" AND nome LIKE ? ":"";
			PreparedStatement ps = this.con.prepareStatement("SELECT *  FROM tbl_medico "+condicions);
			if(this.getNome()!=null && !this.getNome().equals("")){
				ps.setString(1, this.getNome()+"%");
			}
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Medico m = new Medico();
				m.setId(rs.getInt("id"));
				m.setMorada(rs.getString("morada"));
				m.setNome(rs.getString("nome"));
				m.setNum_consulta(rs.getInt("num_consulta_dia"));
				medicos.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return medicos.toArray();
	}
	
	public HashMap<Integer,String> getListMedico(){
		HashMap<Integer,String> lista = new HashMap<>();
		lista.put(null, "--- Selecionar Utente ---");
		for(Object obj:new Medico().getAll()){
			Medico m = (Medico) obj;
			lista.put(m.getId(), m.getNome());
		}
		return lista;
	}
}
