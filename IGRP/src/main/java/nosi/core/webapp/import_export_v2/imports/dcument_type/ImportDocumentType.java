package nosi.core.webapp.import_export_v2.imports.dcument_type;

import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.document_type.DocumentTypeExportSerializable;
import nosi.core.webapp.import_export_v2.imports.AbstractImport;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.TipoDocumento;

/**
 * Emanuel
 * 22 Apr 2019
 */
public class ImportDocumentType  extends AbstractImport implements IImport{

	private List<DocumentTypeExportSerializable> doctypes;
	private Application application;
	
	public ImportDocumentType(Application application) {
		this.application = application;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		if(Core.isNotNull(jsonContent)) {
			this.doctypes = (List<DocumentTypeExportSerializable>) Core.fromJsonWithJsonBuilder(jsonContent, new TypeToken<List<DocumentTypeExportSerializable>>() {}.getType());
		}
	}

	@Override
	public void execute() {
		if(this.doctypes!=null) {
			this.doctypes.stream().forEach(t->{
				if(this.application==null) {
					this.application = new Application().findByDad(t.getDad());
				}
				TipoDocumento tdoc = new TipoDocumento().find().where("nome","=",t.getNome())
						.andWhere("descricao","=",t.getDescricao())
						.andWhere("codigo", "=",t.getCodigo())
						.andWhere("application.dad", "=",t.getDad()).one();
				if(tdoc==null) {
					tdoc = new TipoDocumento(t.getNome(), 1, t.getDescricao(), t.getCodigo(), this.application).insert();
					if(tdoc!=null && tdoc.hasError()) {
						this.addError(tdoc.getError().get(0));
					}
				}
			});
		}
	}
}
