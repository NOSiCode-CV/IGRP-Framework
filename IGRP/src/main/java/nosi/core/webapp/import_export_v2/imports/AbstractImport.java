package nosi.core.webapp.import_export_v2.imports;

import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 28 Dec 2018
 */
public abstract class AbstractImport implements IImport{

	protected String error = "";
	protected String warning = "";
	protected List<String> fileName;
	
	public AbstractImport() {
		this.fileName = new ArrayList<>();
	}
	
	@Override
	public String getError() {
		return this.error;
	}

	@Override
	public String getWarning() {
		return this.warning;
	}

	@Override
	public void addError(String error) {
		if(Core.isNotNull(error))
			this.error += error+"\n";
	}

	@Override
	public void addWarning(String warning) {
		if(Core.isNotNull(warning))
			this.warning += warning+"\n";
	}

	@Override
	public List<String> getFileName(){
		return this.fileName;
	}


}
