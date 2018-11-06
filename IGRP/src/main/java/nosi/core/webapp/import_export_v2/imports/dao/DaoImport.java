package nosi.core.webapp.import_export_v2.imports.dao;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export_v2.common.CompilerFile;
import nosi.core.webapp.import_export_v2.common.Path;
import nosi.core.webapp.import_export_v2.common.serializable.dao.DAOSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Application;
import java.io.File;
import java.io.IOException;
import java.util.List;
import com.google.gson.reflect.TypeToken;
/**
 * Emanuel
 * 2 Nov 2018
 */
public class DaoImport  implements IImport{

	private String error = "";
	private Application application;
	private List<DAOSerializable> daos;
	private CompilerFile compiler;	
	
	public DaoImport(Application application) {
		super();
		this.application = application;
		this.compiler = new CompilerFile();
	}

	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		if(Core.isNotNull(jsonContent)) {
			this.daos = (List<DAOSerializable>) Core.fromJsonWithJsonBuilder(jsonContent, new TypeToken<List<DAOSerializable>>() {}.getType());
		}
	}

	@Override
	public void execute() {
		if(this.daos!=null) {
			this.daos.stream().forEach(dao->{
				this.saveFile(dao);
			});
			this.compiler.compile();
			this.addError(this.compiler.getError());
		}
	}

	private void saveFile(DAOSerializable dao) {
		String basePath = Path.getPath(this.application);
		basePath += "dao" + File.separator;
		String fileName = this.resolveFileName(dao.getFileName());
		try {
			FileHelper.save(basePath, fileName, dao.getContent());
			this.compiler.addFileName(basePath+fileName);
		} catch (IOException e) {
			this.addError(e.getMessage());
		}
	}

	private String resolveFileName(String fileName) {
		fileName = fileName.substring(fileName.lastIndexOf(File.separator));
		return fileName;
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
