package nosi.core.webapp.import_export_v2.imports.transation;

import java.util.List;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.transation.TransationSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Transaction;
import nosi.core.webapp.import_export_v2.imports.AbstractImport;

/**
 * Emanuel
 * 6 Dec 2018
 */
public class ImportTransation extends AbstractImport implements IImport{

	private List<TransationSerializable> transations;
	private Application application;
	
	public ImportTransation(Application application) {
		this.application = application;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		if(Core.isNotNull(jsonContent)) {
			this.transations = (List<TransationSerializable>) Core.fromJsonWithJsonBuilder(jsonContent, new TypeToken<List<TransationSerializable>>() {}.getType());
		}
	}

	@Override
	public void execute() {
		if(this.transations!=null) {
			this.transations.stream().forEach(t->{
				if(this.application==null) {
					this.application = new Application().findByDad(t.getDad());
				}
				Transaction tran = new Transaction().find().andWhere("code", "=",t.getCode()).andWhere("application.dad", "=",t.getDad()).one();
				if(tran==null) {
					tran = new Transaction(t.getCode(), t.getDescr(), 1, this.application).insert();
					if(tran!=null && tran.hasError()) {
						this.addError(tran.getError().get(0));
					}
				}
			});
		}
	}
}
