package nosi.webapps.app_teste.dao;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import nosi.base.ActiveRecord.BaseActiveRecord;


@Entity
@Table(name = "utilizador") 
public class User extends BaseActiveRecord<User> implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_user")
    private Integer idUser;
    
    @Column(name = "nome")
    private String nome;
    
    @Column(name = "morada")
    private String morada;
    

    
    @Column(name = "data_nasc")
    private Date data_nasc;
    
    
    @Column(name = "estado_civil")
    private String estado_civil;
    
    @Column(name = "beneficiario")
    private String beneficiario;
    
    @Column(name = "genero")
    private String genero;
    
    @Column(name = "email")
    private String email;
    
    @Column(name = "contacto")
    private Integer contacto;
    
    @Column(name = "data_regis")
    private Date data_regis;

    public User() {
    }

    public User(Integer idUser) {
        this.idUser = idUser;
    }

    public Integer getIdUser() {
        return idUser;
    }

    public void setIdUser(Integer idUser) {
        this.idUser = idUser;
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


    
    

    public Date getData_nasc() {
		return data_nasc;
	}

	public void setData_nasc(Date data_nasc) {
		this.data_nasc = data_nasc;
	}

	public String getEstado_civil() {
		return estado_civil;
	}

	public void setEstado_civil(String estado_civil) {
		this.estado_civil = estado_civil;
	}

	public String getBeneficiario() {
		return beneficiario;
	}

	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getContacto() {
		return contacto;
	}

	public void setContacto(Integer contacto) {
		this.contacto = contacto;
	}

	public Date getData_regis() {
		return data_regis;
	}

	public void setData_regis(Date data_regis) {
		this.data_regis = data_regis;
	}

	@Override
    public int hashCode() {
        int hash = 0;
        hash += (idUser != null ? idUser.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
// TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.idUser == null && other.idUser != null) || (this.idUser != null && !this.idUser.equals(other.idUser))) {
            return false;
        }
        return true;
    }
    
}

