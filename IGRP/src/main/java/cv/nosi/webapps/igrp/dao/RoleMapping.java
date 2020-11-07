package cv.nosi.webapps.igrp.dao;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * Iekiny Marcel
 * Jun 14, 2020
 */
@Entity
@Table(name="tbl_role_mapping")
public class RoleMapping extends IGRPBaseActiveRecord<RoleMapping> implements Serializable{ 
		
		private static final long serialVersionUID = 1L;

		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private Integer id;
		private String env;
		@Column(name = "env_owner")
		private String envOwner;
		private String type;
		private int status;
		@Column(name = "value_env_owner")
		private String valueEnvOwner;
		@Column(name = "value_env")
		private String valueEnv; 
		
		public enum TYPE{
			 ORG, PROF 
		}

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getEnv() {
			return env;
		}

		public void setEnv(String env) {
			this.env = env;
		}

		public String getEnvOwner() {
			return envOwner;
		}

		public void setEnvOwner(String envOwner) {
			this.envOwner = envOwner;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public int getStatus() {
			return status;
		}

		public void setStatus(int status) {
			this.status = status;
		}

		public String getValueEnvOwner() {
			return valueEnvOwner;
		}

		public void setValueEnvOwner(String valueEnvOwner) {
			this.valueEnvOwner = valueEnvOwner;
		}

		public String getValueEnv() {
			return valueEnv;
		}

		public void setValueEnv(String valueEnv) {
			this.valueEnv = valueEnv;
		}
}
