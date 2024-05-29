package nosi.core.webapp.import_export_v2.imports;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.Part;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.imports.application.ApplicationImport;
import nosi.core.webapp.import_export_v2.imports.bpmn.BPMNTipoDocEtapaImport;
import nosi.core.webapp.import_export_v2.imports.bpmn.BpmnImport;
import nosi.core.webapp.import_export_v2.imports.connection.ConnectionImport;
import nosi.core.webapp.import_export_v2.imports.dao.DaoImport;
import nosi.core.webapp.import_export_v2.imports.dcument_type.ImportDocumentType;
import nosi.core.webapp.import_export_v2.imports.domain.DomainImport;
import nosi.core.webapp.import_export_v2.imports.menu.MenuImport;
import nosi.core.webapp.import_export_v2.imports.modulo.ModuloImport;
import nosi.core.webapp.import_export_v2.imports.others_class.OthersClassImport;
import nosi.core.webapp.import_export_v2.imports.page.PageImport;
import nosi.core.webapp.import_export_v2.imports.report.ReportImport;
import nosi.core.webapp.import_export_v2.imports.services.ServicesImport;
import nosi.core.webapp.import_export_v2.imports.transation.ImportTransation;
import nosi.webapps.igrp.dao.Application;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class ImportHelper {

	private Map<String,String> contentReads;
	private final Import imp;
	
	public ImportHelper() {
		this.imp = new Import();
	}
	
	public void importFile(Part file) {
		this.importFile(null, file);		
	}
	
	private void importFile(Integer applicationId,Part file) {
		this.contentReads = JarUnJarFile.readJarFile(file);
		if(contentReads!=null) {
			Application application = applicationId!=null?new Application().findOne(applicationId):null;
			this.contentReads = this.contentReads.entrySet().stream().collect(Collectors.toMap(k->k.getKey().toLowerCase(), Map.Entry::getValue));
			ApplicationImport app = new ApplicationImport(application);				
			app.deserialization(this.getJsonContent(OptionsImportExport.APP.getFileName()));
			app.execute();
			if(!app.allowPermissionImport()) {
				imp.addError(Core.gt("Não tem permissão para importar a aplicação"));
				return;
			}
			if(application==null) {
				application = app.getApplication();
			}
			ModuloImport modulo = new ModuloImport(application);
			modulo.deserialization(this.getJsonContent(OptionsImportExport.MODULO.getFileName()));
			imp.add(modulo);
			
			DaoImport dao = new DaoImport(application);
			dao.deserialization(this.getJsonContent(OptionsImportExport.DAO.getFileName()));
			imp.add(dao);
			
			OthersClassImport othersClass = new OthersClassImport(app.getApplication());
			othersClass.deserialization(this.getJsonContent(OptionsImportExport.OTHERS_CLASS.getFileName()));
			imp.add(othersClass);
			
			PageImport page = new PageImport(application);
			page.deserialization(this.getJsonContent(OptionsImportExport.PAGE.getFileName()));
			imp.add(page);

			MenuImport menu = new MenuImport(application);
			menu.deserialization(this.getJsonContent(OptionsImportExport.MENU.getFileName()));
			imp.add(menu);

			ImportTransation transation = new ImportTransation(application);
			transation.deserialization(this.getJsonContent(OptionsImportExport.TRANSATION.getFileName()));
			imp.add(transation);
			
			ConnectionImport conn = new ConnectionImport(application);
			conn.deserialization(this.getJsonContent(OptionsImportExport.CONNECTION.getFileName()));
			imp.add(conn);
			
			ReportImport report = new ReportImport(application);
			report.deserialization(this.getJsonContent(OptionsImportExport.REPORT.getFileName()));
			imp.add(report);
			
			BpmnImport bpmn = new BpmnImport(application);
			bpmn.deserialization(this.getJsonContent(OptionsImportExport.BPMN.getFileName()));
			imp.add(bpmn);
			
			DomainImport domain = new DomainImport(application);
			domain.deserialization(this.getJsonContent(OptionsImportExport.DOMAIN.getFileName()));
			imp.add(domain);
			
			ImportDocumentType doctype = new ImportDocumentType(application);
			doctype.deserialization(this.getJsonContent(OptionsImportExport.DOCUMENT_TYPE.getFileName()));
			imp.add(doctype);
			
			ServicesImport service = new ServicesImport(application);
			service.deserialization(this.getJsonContent(OptionsImportExport.SERVICE.getFileName()));
			imp.add(service);
			
			BPMNTipoDocEtapaImport bpmnTipoDocEtapaImport = new BPMNTipoDocEtapaImport(application);
			bpmnTipoDocEtapaImport.deserialization(this.getJsonContent(OptionsImportExport.BPMN_DOCUMENT_TYPE.getFileName()));
			imp.add(bpmnTipoDocEtapaImport);
			
			imp.execute();
			imp.compile();
		}else {
			imp.addError(Core.gt("Ocorreu um erro ao ler o ficheiro"));
		}
		if (file != null) {
			try {
				file.delete();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private String getJsonContent(String key) {
		return this.contentReads.get(key.toLowerCase());
	}

	public boolean hasError() {
		return this.imp.getErrors()!=null && !this.imp.getErrors().isEmpty();
	}
	
	public boolean hasWarning() {
		return this.imp.getWarnings()!=null && !this.imp.getWarnings().isEmpty();
	}
	
	public List<String> getErrors(){
		return this.imp.getErrors();
	}

	public List<String> getWarnings() {
		return this.imp.getWarnings();
	}
	
}
