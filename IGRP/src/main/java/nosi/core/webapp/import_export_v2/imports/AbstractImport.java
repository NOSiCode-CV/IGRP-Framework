package nosi.core.webapp.import_export_v2.imports;

import java.util.List;
import nosi.core.webapp.Core;
import nosi.core.webapp.compiler.helpers.ErrorCompile;

/**
 * Emanuel
 * 28 Dec 2018
 */
public abstract class AbstractImport implements IImport{

	protected String error = "";
	protected String warning = "";

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
	public void addError(List<ErrorCompile> errors) {
		if(errors!=null) {
			errors.stream().forEach(e->{
				 this.addError(e.getError());
			 });
		}
	}

	@Override
	public void addWarning(List<ErrorCompile> warnings) {
		if(warnings!=null) {
			 warnings.stream().forEach(e->{
				 this.addWarning(e.getWarning());
			 });
		}
	}

}
