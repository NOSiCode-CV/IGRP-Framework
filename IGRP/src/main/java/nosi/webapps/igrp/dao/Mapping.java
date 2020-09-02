package nosi.webapps.igrp.dao;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_mapping")
public class Mapping extends IGRPBaseActiveRecord<Mapping> implements Serializable{

	private static final long serialVersionUID = -8421542320870086918L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "dad_origem")
	private String dadOrigem;
	
	@Column(name = "dad_destino")
	private String dadDestino;
	
	@Column(name = "valor_origem") 
	private String valorOrigem; 
	
	@Column(name = "valor_destino") 
	private String valorDestino; 
	
	private int tipo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDadOrigem() {
		return dadOrigem;
	}

	public void setDadOrigem(String dadOrigem) {
		this.dadOrigem = dadOrigem;
	}

	public String getDadDestino() {
		return dadDestino;
	}

	public void setDadDestino(String dadDestino) {
		this.dadDestino = dadDestino;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public String getValorOrigem() {
		return valorOrigem;
	}

	public void setValorOrigem(String valorOrigem) {
		this.valorOrigem = valorOrigem;
	}

	public String getValorDestino() {
		return valorDestino;
	}

	public void setValorDestino(String valorDestino) {
		this.valorDestino = valorDestino;
	}
	
}
