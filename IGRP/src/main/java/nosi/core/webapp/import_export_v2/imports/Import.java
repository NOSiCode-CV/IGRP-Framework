package nosi.core.webapp.import_export_v2.imports;

import java.util.ArrayList;
import java.util.List;

import nosi.core.config.Config;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.webapp.Core;
import nosi.core.webapp.compiler.helpers.Compiler;
import nosi.core.webapp.compiler.helpers.ErrorCompile;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class Import{

	private final List<IImport> imports;
	private final List<String> errors;
	private final List<String> warnings;
	
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
		this.imports.forEach(i->{
			i.execute();
			if(Core.isNotNull(i.getError()))
				this.addError(i.getFileName()+" "+i.getError());
			if(Core.isNotNull(i.getWarning()))
				this.addWarning(i.getFileName()+" "+i.getWarning());
		});
	}

	public void compile() {
		Compiler compiler = new Compiler();
		this.imports.forEach(i->i.getFileName().forEach(compiler::addFileName));
		compiler.compile();
		this.addError(compiler.getErrors());
		this.addWarning(compiler.getWarnings());
		this.removeJavaClass();
	}
	
	private void removeJavaClass() {
		String env = new Config().getEnvironment();
		if(env.equalsIgnoreCase(ConfigCommonMainConstants.IGRP_ENV_PROD.value()) || env.equalsIgnoreCase("prd") ) {
			this.imports.forEach(i->i.getFileName().forEach(Core::forceDelete));
		}
	}

	public void addError(List<ErrorCompile> errors) {
		if(errors!=null) {
			errors.forEach(e->{
				if(Core.isNotNull(e.getError()))
					this.addError(e.getFileName()+" "+e.getError());
			 });
		}
	}

	public void addWarning(List<ErrorCompile> warnings) {
		if(warnings!=null) {
			 warnings.forEach(e->{
				 if(Core.isNotNull(e.getWarning()))
					 this.addWarning(e.getFileName()+" "+e.getWarning());
			 });
		}
	}
	
	public List<String> getErrors() {
		return this.errors;
	}

	public List<String> getWarnings() {
		return warnings;
	}
	
}
