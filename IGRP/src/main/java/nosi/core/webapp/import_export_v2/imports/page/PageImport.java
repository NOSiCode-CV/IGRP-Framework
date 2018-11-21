package nosi.core.webapp.import_export_v2.imports.page;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.google.gson.reflect.TypeToken;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export_v2.common.CompilerFile;
import nosi.core.webapp.import_export_v2.common.Path;
import nosi.core.webapp.import_export_v2.common.serializable.page.PageSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class PageImport implements IImport{
	private String error = "";
	protected Application application;
	private List<PageSerializable> pages;
	protected CompilerFile compiler;	
	
	
	
	public PageImport(Application application) {
		super();
		this.application = application;
		this.compiler = new CompilerFile();
	}

	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		if(Core.isNotNull(jsonContent)) {
			this.pages = (List<PageSerializable>) Core.fromJsonWithJsonBuilder(jsonContent, new TypeToken<List<PageSerializable>>() {}.getType());
		}
	}

	@Override
	public void execute() {
		if(this.pages!=null){
			this.pages.stream().forEach(page->{
				this.insertPgae(page);
			});
			this.compiler.compile();
			this.addError(this.compiler.getError());
		}
	}

	protected void saveFile(PageSerializable page, Action ac) {
		if(page.getClassFiles()!=null) {
			String path = Path.getPath(ac.getApplication())+"pages"+File.separator+ac.getPage().toLowerCase()+File.separator;
			try {
				FileHelper.save(path,ac.getPage()+".java", page.getClassFiles().getXmlOrModel());
				FileHelper.save(path,ac.getPage()+"View.java", page.getClassFiles().getJsonOrView());
				FileHelper.save(path,ac.getPage()+"Controller.java", page.getClassFiles().getXslOrController());
				this.compiler.addFileName(path+ac.getPage()+".java");
				this.compiler.addFileName(path+ac.getPage()+"View.java");
				this.compiler.addFileName(path+ac.getPage()+"Controller.java");
			} catch (IOException e) {
				this.addError(e.getMessage());
			}
		}
		if(page.getPageFiles()!=null) {
			String path = Path.getPathImages(ac);
			try {
				FileHelper.save(path ,ac.getPage()+".xml", page.getPageFiles().getXmlOrModel());
				FileHelper.save(path,ac.getPage()+".json", page.getPageFiles().getJsonOrView());
				FileHelper.save(path,ac.getPage()+".xsl", page.getPageFiles().getXslOrController());
			} catch (IOException e) {
				this.addError(e.getMessage());
			}
		}
	}

	protected void insertPgae(PageSerializable page) {
		Action ac = new Action().find().andWhere("page", "=",page.getPage()).andWhere("application.dad", "=",page.getDad()).one();
		if(ac==null) {
			if(this.application == null) {
				this.application = new Application().findByDad(page.getDad());
			}
			ac = new Action(page.getPage(), page.getAction(), page.getPackage_name(), page.getXsl_src(), page.getPage_descr(), page.getAction_descr(), page.getVersion(), page.getStatus(), this.application);
			ac.setNomeModulo(page.getNomeModulo());
			ac.setIsComponent(page.getIsComponent());
			ac.setProcessKey(page.getProcessKey());
			ac.setTipo(page.getTipo());
			ac = ac.insert();
			this.addError(ac.hasError()?ac.getError().get(0):null);
		}
		if(!ac.hasError()) {
			this.saveFile(page,ac);
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
