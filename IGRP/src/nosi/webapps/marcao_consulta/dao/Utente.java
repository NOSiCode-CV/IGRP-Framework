package nosi.webapps.marcao_consulta.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;

public class Utente   implements RowDataGateway{

	private int id;
	private String nome;
	private String morada;
	private int sexo;
	private Date data_nascimento;
	private Connection con;
	
	public Utente(){
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
	public int getSexo() {
		return sexo;
	}
	public void setSexo(int sexo) {
		this.sexo = sexo;
	}
	public Date getData_nascimento() {
		return data_nascimento;
	}
	public void setData_nascimento(Date data_nascimento) {
		this.data_nascimento = data_nascimento;
	}
	@Override
	public boolean insert() {
		try {
			PreparedStatement ps = this.con.prepareStatement("INSERT INTO tbl_utente(nome,morada,sexo,data_nascimento) VALUES(?,?,?,?)");
			ps.setString(1, this.getNome());
			ps.setString(2, this.getMorada());
			ps.setInt(3, this.getSexo());
			ps.setDate(4, (Date)this.getData_nascimento());
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
		// TODO Auto-generated method stub
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
		ArrayList<Utente> utentes = new ArrayList<>();
		try {
			String condicions = " WHERE 1=1 ";
			condicions += (this.getNome()!=null && !this.getNome().equals(""))?" AND nome LIKE ? ":"";
			condicions += this.getSexo()!=0?" AND sexo = "+this.getSexo():"";
			PreparedStatement ps = this.con.prepareStatement("SELECT *  FROM tbl_utente "+condicions);
			if(this.getNome()!=null && !this.getNome().equals("")){
				ps.setString(1, this.getNome()+"%");
			}
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Utente u = new Utente();
				u.setId(rs.getInt("id"));
				u.setMorada(rs.getString("morada"));
				u.setNome(rs.getString("nome"));
				u.setSexo(rs.getInt("sexo"));
				u.setData_nascimento( (Date) rs.getDate("data_nascimento"));
				utentes.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return utentes.toArray();
	}
	
	public HashMap<Integer,String> getListUtente(){
		HashMap<Integer,String> lista = new HashMap<>();
		lista.put(null, "--- Selecionar Utente ---");
		for(Object obj:new Utente().getAll()){
			Utente u = (Utente) obj;
			lista.put(u.getId(), u.getNome());
		}
		return lista;
	}
}
