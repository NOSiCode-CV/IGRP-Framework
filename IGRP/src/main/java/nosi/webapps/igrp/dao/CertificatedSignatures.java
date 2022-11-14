package nosi.webapps.igrp.dao;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;

import nosi.base.ActiveRecord.BaseActiveRecord;

@Entity
@Table(name = "tbl_cert_signs", schema= "public")
public class CertificatedSignatures extends IGRPBaseActiveRecord<CertificatedSignatures> implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	

	public CertificatedSignatures() {
		super();
		//this.generateUid();
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue(generator = "UUID")
	@GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator")
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "uuid", nullable = false, updatable = false)
 	private UUID uuid;
	
	
	@Column(name = "certificate")
	private String certificate;
	
	@Column(name = "data_hash")
	private String dataHash;
	
	@Column(name = "data")
	private String data;

	@Column(name = "status")
	private String status;
	
	@Column(name = "file_id")
	private String fileId;
	
	@CreationTimestamp
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@UpdateTimestamp
	@Column(name = "updated_at")
	private LocalDateTime updatedAt;

	public UUID getUuid() {
		return uuid;
	}

	public void setUuid(UUID uuid) {
		this.uuid = uuid;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public String getDataHash() {
		return dataHash;
	}

	public void setDataHash(String dataHash) {
		this.dataHash = dataHash;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public void generateUid() {
		this.uuid = java.util.UUID.randomUUID();
	}
}
