package nosi.core.webapp.import_export_v2.imports;

import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class Import{

	private List<IImport> imports;
	private List<String> errors;
	private List<String> warnings;
	
	public Import() {
		this.imports = new ArrayList<>();
		this.errors = new ArrayList<>();
		this.warnings = new ArrayList<>();
	}

	public void add(IImport i) {
		this.imports.add(i);
	}
	
	public void addError(String error) {
		if(Core.isNotNull(error))
			this.errors.add(error);
	}
	
	public void addWarning(String warning) {
		if(Core.isNotNull(warning))
			this.warnings.add(warning);
	}
	
	public void execute() {
		this.imports.stream().forEach(i->{
			i.execute();
			this.addError(i.getError());
			this.addWarning(i.getWarning());
		});
	}

	public List<String> getErrors() {
		return this.errors;
	}

	public List<String> getWarnings() {
		return warnings;
	}
	
}
