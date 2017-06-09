package nosi.webapps.marcao_consulta.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import nosi.core.dao.RowDataGateway;
import nosi.core.webapp.Igrp;
import nosi.webapps.marcao_consulta.pages.dashboard.DashBoard;

public class Consulta  implements RowDataGateway{

	private int id;
	private Date data_consulta;
	private int estado;
	private Utente utente;
	private Medico medico;
	private Connection con;
	
	public Consulta(){
		super();
		this.con = Igrp.getInstance().getDao().unwrap("db1");
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getData_consulta() {
		return data_consulta;
	}
	public void setData_consulta(Date data_consulta) {
		this.data_consulta = data_consulta;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public Utente getUtente() {
		return utente;
	}
	public void setUtente(Utente utente) {
		this.utente = utente;
	}
	public Medico getMedico() {
		return medico;
	}
	public void setMedico(Medico medico) {
		this.medico = medico;
	}
	@Override
	public boolean insert() {
		try {
			PreparedStatement ps = this.con.prepareStatement("INSERT INTO tbl_marcao_consulta(id_medico,id_utente,estado,data_consulta) VALUES(?,?,?,?)");
			ps.setInt(1, this.getMedico().getId());
			ps.setInt(2, this.getUtente().getId());
			ps.setInt(3, this.getEstado());
			ps.setDate(4,(Date) this.getData_consulta());
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
		ArrayList<Consulta> consultas = new ArrayList<>();
		try {
			String condicions = "";
			condicions +=(this.getData_consulta()!=null)?" AND data_consulta=? ":"";
			condicions +=(this.getUtente()!=null && this.getUtente().getNome()!=null && !this.getUtente().getNome().equals(""))?" AND u.nome LIKE ? ":"";
			
			PreparedStatement ps = this.con.prepareStatement("SELECT a.*,u.nome as nome_cliente,m.nome as nome_medico  FROM tbl_marcao_consulta a,tbl_medico m, tbl_utente u WHERE u.id=a.id_utente AND m.id=a.id_medico AND estado=? "+condicions);
			ps.setInt(1, this.estado);
			if(this.getData_consulta()!=null &&  (this.getUtente().getNome()==null || this.getUtente().getNome().equals(""))){
				ps.setDate(2,(Date) this.getData_consulta());
			}else if(this.getData_consulta()==null && this.getUtente()!=null && this.getUtente().getNome()!=null && !this.getUtente().getNome().equals("")){
				ps.setString(2, this.getUtente().getNome()+"%");
			}else if(this.getData_consulta()!=null && this.getUtente()!=null && this.getUtente().getNome()!=null && !this.getUtente().getNome().equals("")){
				ps.setDate(2,(Date) this.getData_consulta());
				ps.setString(3, this.getUtente().getNome()+"%");
			}
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Consulta c = new Consulta();
				c.setId(rs.getInt("id"));
				c.setEstado(rs.getInt("estado"));
				c.setData_consulta((Date) rs.getDate("data_consulta"));
				Medico m = new Medico();
				m.setId(rs.getInt("id_medico"));
				m.setNome(rs.getString("nome_medico"));
				Utente u = new Utente();
				u.setId(rs.getInt("id_utente"));
				u.setNome(rs.getString("nome_cliente"));
				c.setMedico(m);
				c.setUtente(u);
				consultas.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return consultas.toArray();
	}
	
	public Object[] getChart1(){
		
		String sql = "select sum(total_m) total_m, sum(total_f) total_f, Ano from view_consulta_dash group by Ano ORDER BY Ano DESC";
		ArrayList<DashBoard.Chart_1> consultas = new ArrayList<>();
		try {
			PreparedStatement ps = this.con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				DashBoard.Chart_1 c = new DashBoard().new Chart_1();
				c.setAno(rs.getInt("Ano"));
				c.setHomem(rs.getInt("total_m"));
				c.setMulher(rs.getInt("total_f"));
				consultas.add(c);
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return consultas.toArray();
	}
	public boolean disponibilidade(){
		PreparedStatement ps;
		try {
			ps = this.con.prepareStatement("SELECT count(*) as total FROM tbl_marcao_consulta WHERE data_consulta=? AND id_medico=? AND estado=0");
			ps.setDate(1,(Date) this.getData_consulta());
			ps.setInt(2, this.getMedico().getId());
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				Medico m = new Medico();
				m.setId(this.getMedico().getId());
				if(m.getOne()!=null && ((Medico)m.getOne()).getNum_consulta() > rs.getInt("total")){
					return true;
				}
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return false;
	}
	
	public boolean updateStatus(int status) {
		try {
			PreparedStatement ps = this.con.prepareStatement("UPDATE tbl_marcao_consulta SET estado=? WHERE id=?");
			ps.setInt(1, status);
			ps.setInt(2, this.getId());
			int r = ps.executeUpdate();
			ps.close();
			return r > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
