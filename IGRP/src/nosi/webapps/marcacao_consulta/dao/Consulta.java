package nosi.webapps.marcacao_consulta.dao;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.config.Connection;
import nosi.core.webapp.helpers.DateHelper;
import nosi.webapps.marcacao_consulta.pages.dashboard.DashBoard;
import java.util.ArrayList;

@Entity
@Table(name="tbl_consulta")
public class Consulta extends BaseActiveRecord<Consulta> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false)
	@Temporal(TemporalType.DATE)
	private Date data_consulta;
	@Column(nullable=false)
	private int estado;
	@ManyToOne
	@JoinColumn(name="id_utente", foreignKey = @ForeignKey(name = "UTENTE_CONSULTA_FK"), nullable=false)
	private Utente utente;
	@ManyToOne
	@JoinColumn(name="id_medico", foreignKey = @ForeignKey(name = "MEDICO_CONSULTA_FK"), nullable=false)
	private Medico medico;

	@ManyToOne
	@JoinColumn(name="id_especialidade", foreignKey = @ForeignKey(name = "ESPECIALIDADE_CONSULTA_FK"), nullable=false)
	private Especialidade especialidade;
	
	public Consulta() {
	}
	
	public Consulta(String data_consulta, int estado, Utente utente, Medico medico,Especialidade esp) {
		super();
		this.data_consulta = DateHelper.formatDate(data_consulta, "dd-MM-yyyy", "yyyy-MM-dd");
		this.estado = estado;
		this.utente = utente;
		this.medico = medico;
		this.especialidade = esp;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getData_consulta() {
		return data_consulta;
	}
	public void setData_consulta(String data_consulta) {
		this.data_consulta = DateHelper.formatDate(data_consulta, "dd-MM-yyyy", "yyyy-MM-dd");
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
	
	public Especialidade getEspecialidade() {
		return especialidade;
	}

	public void setEspecialidade(Especialidade especialidade) {
		this.especialidade = especialidade;
	}

	public Object[] getChart1(){
		String sql = "select sum(Total_Masculino) total_m, sum(Total_Feminino) total_f, Ano from "
				+ "(Select count(*) as Total_Masculino, 0 as Total_Feminino, YEAR(m.data_consulta) as Ano "
				+ "from tbl_consulta m, tbl_utente u "
				+ "where m.estado =1 AND m.id_utente=u.id AND u.sexo=2 group by YEAR(m.data_consulta)"
				+ " union "
				+ "Select 0 as Total_Masculino, count(*) as Total_Feminino, YEAR(m.data_consulta) as Ano "
				+ "from tbl_consulta m, tbl_utente u"
				+ " where m.estado =1 AND m.id_utente=u.id AND u.sexo=1 group by YEAR(m.data_consulta)) group by Ano";
		ArrayList<DashBoard.Chart_1> consultas = new ArrayList<>();
		try {
			PreparedStatement ps = Connection.getConnection(this.getConnectionName()).prepareStatement(sql);
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
	public boolean disponibilidade(String data,int id_medico,int especialidade){
		PreparedStatement ps;
		try {
			ps = Connection.getConnection(this.getConnectionName()).prepareStatement("SELECT count(*) as total FROM tbl_consulta WHERE data_consulta=? AND id_medico=? AND estado=0 AND id_medico IN (SELECT id_medico from tbl_medico_especialidades WHERE id_especialidade=?)");
			ps.setString(1, data);;
			ps.setInt(2,id_medico);
			ps.setInt(3, especialidade);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				Medico m = new Medico().findOne(id_medico);
				if(m!=null && m.getNum_consulta() > rs.getInt("total")){
					return true;
				}
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return false;
	}
	
	@Override
	public String getConnectionName() {
		return "hibernate-marcacao-consulta";
	}
	
}
