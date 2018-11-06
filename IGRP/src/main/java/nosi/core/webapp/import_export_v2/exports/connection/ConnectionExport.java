package nosi.core.webapp.import_export_v2.exports.connection;

import java.util.ArrayList;
import java.util.List;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.serializable.connection.ConnectionFIleNameSerializable;
import nosi.core.webapp.import_export_v2.common.serializable.connection.ConnectionSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;
import nosi.webapps.igrp.dao.Config_env;

/**
 * Emanuel
 * 29 Oct 2018
 */
public class ConnectionExport implements IExport{

	private List<ConnectionSerializable> connections;
	
	public ConnectionExport() {
		this.connections = new ArrayList<>();
	}
	
	@Override
	public String getFileName() {
		return OptionsImportExport.CONNECTION.getFileName();
	}
	
	@Override
	public String serialization() {
		return Core.toJsonWithJsonBuilder(this.connections);
	}

	@Override
	public void export(Export export, String[] ids) {
		if(ids!=null) {
			for(String id:ids) {
				this.add(id);
			}
			export.add(this);
		}
	}
	
	@Override
	public void add(String id) {
		Config_env config = new Config_env().findOne(Core.toInt(id));
		ConnectionSerializable conn = new ConnectionSerializable();
		Core.mapper(config, conn);
		conn.setDad(config.getApplication().getDad());
		ConnectionFIleNameSerializable fileName = new ConnectionFIleNameSerializable();
		fileName.setFileName(config.getName()+"."+config.getApplication().getDad().toLowerCase()+".cfg.xml");
		fileName.setFileContent(this.getFileContent(config));
		conn.setFileName(fileName );
		this.connections.add(conn);
	}
	
	public String getFileContent(Config_env connection) {
		Config config = new Config();
		String path = config.getPathWorkspaceResources();
		if(Core.isNull(path)) {
			path = config.getBasePathClass();
		}
		return FileHelper.readFile(path,connection.getName()+"."+connection.getApplication().getDad().toLowerCase() + ".cfg.xml");
	}
	

}
