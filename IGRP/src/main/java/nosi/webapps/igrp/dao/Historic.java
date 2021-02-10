package nosi.webapps.igrp.dao;
/**
 * @author: Rodney Fernandes
 * 10 Fev 2021
 */

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.CreationTimestamp;
import java.time.LocalDateTime;

@Entity
@Table(name = "tbl_historic")
public class Historic extends IGRPBaseActiveRecord<Historic> implements Serializable {

	private static final long serialVersionUID = -1366720109128763696L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable = false)
	private String nome;
    @CreationTimestamp
    private LocalDateTime data;
	@ManyToOne
	@JoinColumn(name = "page_fk", foreignKey = @ForeignKey(name = "PAGE_FK"), nullable = false)
	private Action page;
	@Column(nullable = false)
	private String descricao;
		
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Action getPage() {
		return page;
	}

	public void setPage(Action page) {
		this.page = page;
	}
	
	public LocalDateTime getData() {
		return this.data;
	}
	
}
