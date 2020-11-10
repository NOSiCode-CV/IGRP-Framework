package cv.nosi.core.webapp.ie.import_export_v2.exports.connection;

import java.util.ArrayList;
import java.util.List;

import cv.nosi.core.config.Config;
import cv.nosi.core.webapp.ie.import_export_v2.common.OptionsImportExport;
import cv.nosi.core.webapp.ie.import_export_v2.common.serializable.connection.ConnectionFIleNameSerializable;
import cv.nosi.core.webapp.ie.import_export_v2.common.serializable.connection.ConnectionSerializable;
import cv.nosi.core.webapp.ie.import_export_v2.exports.Export;
import cv.nosi.core.webapp.ie.import_export_v2.exports.IExport;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.util.helpers.file.FileHelper;
import cv.nosi.webapps.igrp.dao.Config_env;

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
				if(Core.isNotNull(id))
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
