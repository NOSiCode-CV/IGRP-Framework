package nosi.core.webapp.import_export_v2.imports.connection;

import java.io.IOException;
import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export_v2.common.Path;
import nosi.core.webapp.import_export_v2.common.serializable.connection.ConnectionSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Config_env;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class ConnectionImport  implements IImport{
	private Application application;
	private String error;
	private List<ConnectionSerializable> conns;


	public ConnectionImport(Application application) {
		this.application = application;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		if(Core.isNotNull(jsonContent)) {
			this.conns = (List<ConnectionSerializable>) Core.fromJsonWithJsonBuilder(jsonContent, new TypeToken<List<ConnectionSerializable>>() {}.getType());
		}
	}

	@Override
	public void execute() {
		if(this.conns!=null) {
			this.conns.stream().forEach(c->{
				if(this.application==null) {
					this.application = new Application().findByDad(c.getDad());
				}
				Config_env config = new Config_env().find().andWhere("connection_identify", "=",c.getConnection_identify()).one();
				if(config==null){
					config = new Config_env(c.getPort(), c.getType_db(), c.getHost(), c.getName_db(), c.getUsername(), " ", c.getCharset(), c.getName(), this.application!=null?this.application:new Application().findByDad(c.getDad()));
					config.setDriver_connection(c.getDriver_connection());
					config.setUrl_connection(c.getUrl_connection());
					config.setConnection_identify(c.getConnection_identify());
					config.setIsDefault(c.getIsdefault());
					config.setApplication(this.application);
					config = config.insert();
					if(!config.hasError()) {
						c.setDad(this.application.getDad());
						this.saveConnectionFile(c);
					}
					this.error = config.hasError()?config.getError().get(0):null;
				}
			});
		}
	}

	private void saveConnectionFile(ConnectionSerializable c) {
		if(c.getFileName()!=null){
			String path = Path.getPathHibernateConfig();
			try {
				FileHelper.save(path, c.getFileName().getFileName(), c.getFileName().getFileContent());
			} catch (IOException e) {
				this.addError(e.getMessage());
			}
		}
	}

	@Override
	public void addError(String error) {
		if(Core.isNotNull(error))
			this.error += error+"\n";
	}

	@Override
	public String getError() {
		return this.error;
	}

}
