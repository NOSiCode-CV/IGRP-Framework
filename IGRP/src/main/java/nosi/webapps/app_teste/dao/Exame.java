package nosi.webapps.app_teste.dao;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import nosi.base.ActiveRecord.BaseActiveRecord;


@Entity
@Table(name = "exame") 
public class Exame extends BaseActiveRecord<Exame> implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_exame")
    private Integer idExame;
    
    @JoinColumn(name = "id_user")
    @ManyToOne ()
    private User idUser;
    
    @Column(name = "nome_exame")
    private String nome_exame;
    
    @Column(name = "data")
    private Date data;
    
    @Column(name = "raioX")
    private String raioX;

    public Exame() {
    }

	public Integer getIdExame() {
		return idExame;
	}

	public void setIdExame(Integer idExame) {
		this.idExame = idExame;
	}

	
	public String getNome_exame() {
		return nome_exame;
	}

	public void setNome_exame(String nome_exame) {
		this.nome_exame = nome_exame;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public User getIdUser() {
		return idUser;
	}

	public void setIdUser(User idUser) {
		this.idUser = idUser;
	}
    
    public String getRaioX() {
        return raioX;
    }

    public void setRaioX(String raioX) {
        this.raioX = raioX;
    }   
    
}

