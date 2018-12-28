package nosi.core.webapp.import_export_v2.imports.others_class;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.compiler.helpers.Compiler;
import nosi.core.webapp.import_export_v2.common.Path;
import nosi.core.webapp.import_export_v2.common.serializable.dao.DAOSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Application;
import nosi.core.webapp.import_export_v2.imports.AbstractImport;

/**
 * Emanuel
 * 22 Nov 2018
 */
public class OthersClassImport extends AbstractImport implements IImport{

	private List<DAOSerializable> others_class;
	private Compiler compiler;	
	
	public OthersClassImport(Application application) {
		this.others_class = new ArrayList<>();
		this.compiler = new Compiler();
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
			this.addError(this.compiler.getErrors());
			this.addWarning(this.compiler.getWarnings());
		}
	}


	private void saveFile(DAOSerializable fileClass) {
		String basePath = Path.getRootPath();
		if(Core.isNotNull(fileClass.getPath())) {
			basePath += fileClass.getPath().replace("\\", File.separator).replace("//", File.separator);
			try {
				FileHelper.save(basePath, fileClass.getFileName(), fileClass.getContent());
				this.compiler.addFileName(basePath + File.separator+fileClass.getFileName());
			} catch (IOException e) {
				this.addError(e.getMessage());
			}
		}
	}
}
