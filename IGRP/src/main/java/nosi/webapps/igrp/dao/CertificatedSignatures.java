package nosi.webapps.igrp.dao;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "tbl_cert_signs", schema= "public")
public class CertificatedSignatures extends IGRPBaseActiveRecord<CertificatedSignatures> implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	

	public CertificatedSignatures() {
		super();
		//this.generateUid();
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
	
	private String name;
	
	private String mime_type;
	
	@Column(name = "env_id")
	private String envId;
	
	@Column(name = "user_id")
	private String userId;
	
	@Column(name = "user_ip")
	private String userIp;
		
	@Column(name = "user_context")
	private String userContext;
	
	@Column(name = "cert_sn")
	private String certSn;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMime_type() {
		return mime_type;
	}

	public void setMime_type(String mime_type) {
		this.mime_type = mime_type;
	}

	public String getEnvId() {
		return envId;
	}

	public void setEnvId(String envId) {
		this.envId = envId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserIp() {
		return userIp;
	}


	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	public String getUserContext() {
		return userContext;
	}

	public void setUserContext(String userContext) {
		this.userContext = userContext;
	}

	public String getCertSn() {
		return certSn;
	}

	public void setCertSn(String certSn) {
		this.certSn = certSn;
	}
	

	@Override
	public String toString() {
		return "CertificatedSignatures [uuid=" + uuid +  ", status=" + status + ", fileId=" + fileId + ", createdAt=" + createdAt
				+ ", updatedAt=" + updatedAt + ", name=" + name + ", mime_type=" + mime_type + ", envId=" + envId
				+ ", userId=" + userId + ", userIp=" + userIp + ", userContext=" + userContext + ", certSn=" + certSn
				+ "]";
	}
}
