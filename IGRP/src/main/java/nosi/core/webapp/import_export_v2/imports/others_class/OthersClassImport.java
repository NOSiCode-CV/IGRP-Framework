package nosi.core.webapp.import_export_v2.imports.others_class;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export_v2.common.CompilerFile;
import nosi.core.webapp.import_export_v2.common.Path;
import nosi.core.webapp.import_export_v2.common.serializable.dao.DAOSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Application;

/**
 * Emanuel
 * 22 Nov 2018
 */
public class OthersClassImport implements IImport{

	private List<DAOSerializable> others_class;
	private String error = "";
	private CompilerFile compiler;	
	
	public OthersClassImport(Application application) {
		this.others_class = new ArrayList<>();
		this.compiler = new CompilerFile();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		if(Core.isNotNull(jsonContent)) {
			this.others_class = (List<DAOSerializable>) Core.fromJsonWithJsonBuilder(jsonContent, new TypeToken<List<DAOSerializable>>() {}.getType());
		}
	}

	@Override
	public void execute() {
		if(this.others_class!=null) {
			this.others_class.stream().forEach(fileClass->{
				this.saveFile(fileClass);
			});
			this.compiler.compile();
			this.addError(this.compiler.getError());
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

	private void saveFile(DAOSerializable fileClass) {
		String basePath = Path.getRootPath();
		basePath += fileClass.getPath().replace("\\", File.separator).replace("//", File.separator);
		try {
			FileHelper.save(basePath, fileClass.getFileName(), fileClass.getContent());
			this.compiler.addFileName(basePath + File.separator+fileClass.getFileName());
		} catch (IOException e) {
			this.addError(e.getMessage());
		}
	}
}
