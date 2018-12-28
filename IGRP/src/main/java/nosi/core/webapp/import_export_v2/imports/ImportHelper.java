package nosi.core.webapp.import_export_v2.imports;

import java.util.List;
import java.util.Map;
import javax.servlet.http.Part;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.imports.application.ApplicationImport;
import nosi.core.webapp.import_export_v2.imports.bpmn.BpmnImport;
import nosi.core.webapp.import_export_v2.imports.connection.ConnectionImport;
import nosi.core.webapp.import_export_v2.imports.dao.DaoImport;
import nosi.core.webapp.import_export_v2.imports.domain.DomainImport;
import nosi.core.webapp.import_export_v2.imports.menu.MenuImport;
import nosi.core.webapp.import_export_v2.imports.modulo.ModuloImport;
import nosi.core.webapp.import_export_v2.imports.others_class.OthersClassImport;
import nosi.core.webapp.import_export_v2.imports.page.PageImport;
import nosi.core.webapp.import_export_v2.imports.report.ReportImport;
import nosi.core.webapp.import_export_v2.imports.transation.ImportTransation;
import nosi.webapps.igrp.dao.Application;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class ImportHelper {


	private Map<String,String> contentReads;
	private Import imp;
	
	public ImportHelper() {
		this.imp = new Import();
	}
	
	public void importFile(Part file) {
		this.importFile(null, file);		
	}
	
	public void importFile(Integer application_id,Part file) {
		this.contentReads = JarUnJarFile.readJarFile(file);
		Application application = new Application().findOne(application_id);
		if(contentReads!=null) {
			ApplicationImport app = new ApplicationImport(application);
			app.deserialization(this.getJsonContent(OptionsImportExport.APP.getFileName()));
			imp.add(app);
			
			ModuloImport modulo = new ModuloImport(application);
			modulo.deserialization(this.getJsonContent(OptionsImportExport.MODULO.getFileName()));
			imp.add(modulo);		
			
			DaoImport dao = new DaoImport(app.getApplication());
			dao.deserialization(this.getJsonContent(OptionsImportExport.DAO.getFileName()));
			imp.add(dao);
			
			OthersClassImport others_class = new OthersClassImport(app.getApplication());
			others_class.deserialization(this.getJsonContent(OptionsImportExport.OTHERS_CLASS.getFileName()));
			imp.add(others_class);
			
			PageImport page = new PageImport(application);
			page.deserialization(this.getJsonContent(OptionsImportExport.PAGE.getFileName()));
			imp.add(page);			

			MenuImport menu = new MenuImport(application);
			menu.deserialization(this.getJsonContent(OptionsImportExport.MENU.getFileName()));
			imp.add(menu);			

			ImportTransation transation = new ImportTransation(application);
			transation.deserialization(this.getJsonContent(OptionsImportExport.TRANSATION.getFileName()));
			imp.add(transation);
			
			ReportImport report = new ReportImport(application);
			report.deserialization(this.getJsonContent(OptionsImportExport.REPORT.getFileName()));
			imp.add(report);
			
			BpmnImport bpmn = new BpmnImport(application);
			bpmn.deserialization(this.getJsonContent(OptionsImportExport.BPMN.getFileName()));
			imp.add(bpmn);
			
			ConnectionImport conn = new ConnectionImport(application);
			conn.deserialization(this.getJsonContent(OptionsImportExport.CONNECTION.getFileName()));
			imp.add(conn);
		
			
			DomainImport domain = new DomainImport();
			domain.deserialization(this.getJsonContent(OptionsImportExport.DOMAIN.getFileName()));
			imp.add(domain);
						
			imp.execute();
		}else {
			imp.addError(Core.gt("Ocorreu um erro ao ler o ficheiro"));
		}
	}
	
	private String getJsonContent(String key) {
		if(this.contentReads.containsKey(key))
			return this.contentReads.get(key);
		return null;
	}

	public boolean hasError() {
		return this.imp.getErrors()!=null && this.imp.getErrors().size() > 0;
	}
	
	public boolean hasWarning() {
		return this.imp.getWarnings()!=null && this.imp.getWarnings().size() > 0;
	}
	
	public List<String> getErrors(){
		return this.imp.getErrors();
	}

	public List<String> getWarnings() {
		return this.imp.getWarnings();
	}
	
}
