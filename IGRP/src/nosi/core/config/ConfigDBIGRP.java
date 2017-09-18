package nosi.core.config;

import java.io.IOException;
import nosi.core.webapp.helpers.FileHelper;

/**
 * @author: Emanuel Pereira
 * 15 Sep 2017
 */
public class ConfigDBIGRP {

	private int port;
	private String type_db;
	private String host;
	private String name_db;
	private String username;
	private String password;
	private String name;
	private String fileName;
	private String path;
	
	//Default configuratio for h2
	public ConfigDBIGRP() {
		this.port = 0;
		this.type_db = "h2";
		this.host = "~";
		this.name_db = "db_igrp_core";
		this.username = "root";
		this.password = "root";
		this.name = "hibernate-igrp-core";
		this.fileName = "db_igrp.config";
		this.path = Config.getRootPaht()+"igrp/config/db";
	}
	
	public boolean save(){
		try {
			return FileHelper.save(path, this.fileName, generateConfig());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public void load(){
		String data = FileHelper.readFile(path, this.fileName);
		if(data!=null && !data.equals("")){
			String[] data_part = data.split(";");
			this.port = Integer.parseInt(data_part[0]);
			this.type_db = data_part[1];
			this.host = data_part[2];
			this.name_db = data_part[3];
			this.username = data_part[4];
			this.password = data_part[5];
			this.name = data_part[6];
		}
	}
	
	private String generateConfig(){
		return this.port+";"+this.type_db+";"+this.host+";"+this.name_db+";"+this.username+";"+this.password+";"+this.name+";";
	}

	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public String getType_db() {
		return type_db;
	}
	public void setType_db(String type_db) {
		this.type_db = type_db;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getName_db() {
		return name_db;
	}
	public void setName_db(String name_db) {
		this.name_db = name_db;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "ConfigDBIGRP [port=" + port + ", type_db=" + type_db + ", host=" + host + ", name_db="
				+ name_db + ", username=" + username + ", password=" + password + ", name=" + name + ", fileName="
				+ fileName + ", path=" + path + "]";
	}
	
	
}
