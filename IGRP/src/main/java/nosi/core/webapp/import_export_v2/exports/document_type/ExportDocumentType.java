package nosi.core.webapp.import_export_v2.exports.document_type;

import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.serializable.document_type.DocumentTypeExportSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;
import nosi.webapps.igrp.dao.TipoDocumento;

/**
 * Emanuel
 * 22 Apr 2019
 */
public class ExportDocumentType implements IExport{

	private List<DocumentTypeExportSerializable> doctypes;
	
	public ExportDocumentType() {
		this.doctypes = new ArrayList<>();
	}
	
	@Override
	public String getFileName() {
		return OptionsImportExport.DOCUMENT_TYPE.getFileName();
	}

	@Override
	public String serialization() {
		return Core.toJsonWithJsonBuilder(this.doctypes);
	}

	@Override
	public void export(Export export, String[] ids) {
		if(ids!=null) {
			for(String id:ids) {
				if(Core.isNotNull(id))
					this.add(id);
			}
			export.add(this);
		}
	}

	@Override
	public void add(String id) {
		TipoDocumento t = new TipoDocumento().findOne(id);
		if(t!=null) {
			DocumentTypeExportSerializable tdoc = new DocumentTypeExportSerializable();
			Core.mapper(t, tdoc);
			tdoc.setDad(t.getApplication().getDad());
			this.doctypes.add(tdoc);
		}
	}

}
