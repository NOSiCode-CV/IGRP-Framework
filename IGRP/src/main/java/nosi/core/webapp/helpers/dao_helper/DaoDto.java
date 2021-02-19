package nosi.core.webapp.helpers.dao_helper;

import nosi.webapps.igrp.dao.Config_env;


/**
 * william.fonseca 10/02/2021
 */
public class DaoDto {

	private Config_env configEnv;
	private String schema;
	private String tableName;
	private String daoClassName;
	private String dadName;
	private String contentList;
	private String contentListSetGet;
	private String tableType;
	private String packageName;
	private boolean hasList;
	private boolean isJavaUtilDate;

	public Config_env getConfigEnv() {
		return configEnv;
	}

	public void setConfigEnv(Config_env configEnv) {
		this.configEnv = configEnv;
	}

	public String getSchema() {
		return schema;
	}

	public void setSchema(String schema) {
		this.schema = schema;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getDaoClassName() {
		return daoClassName;
	}

	public void setDaoClassName(String daoClassName) {
		this.daoClassName = daoClassName;
	}

	public String getDadName() {
		return dadName;
	}

	public void setDadName(String dadName) {
		this.dadName = dadName;
		this.packageName = "package nosi.webapps.".concat(this.dadName).concat(".dao;").concat("\n").concat("\n");
	}

	public String getContentList() {
		return contentList;
	}

	public void setContentList(String contentList) {
		this.contentList = contentList;
	}

	public String getContentListSetGet() {
		return contentListSetGet;
	}

	public void setContentListSetGet(String contentListSetGet) {
		this.contentListSetGet = contentListSetGet;
	}

	public String getTableType() {
		return tableType;
	}

	public void setTableType(String tableType) {
		this.tableType = tableType;
	}

	public void setJavaUtilDate(boolean isJavaUtilDate) {
		this.isJavaUtilDate = isJavaUtilDate;
	}
	
	public boolean isJavaUtilDate() {
		return this.isJavaUtilDate;
	}

	public String getPackageName() {
		return packageName;
	}

	public boolean hasList() {
		return hasList;
	}

	public void setHasList(boolean hasList) {
		this.hasList = hasList;
	}

}
