package cv.nosi.core.webapp.ie.import_export_v2.imports.transation;

import java.util.List;
import com.google.gson.reflect.TypeToken;

import cv.nosi.core.webapp.ie.import_export_v2.common.serializable.transation.TransationSerializable;
import cv.nosi.core.webapp.ie.import_export_v2.imports.AbstractImport;
import cv.nosi.core.webapp.ie.import_export_v2.imports.IImport;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.webapps.igrp.dao.Application;
import cv.nosi.webapps.igrp.dao.Transaction;

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
					this.application = Core.findApplicationByDad(t.getDad());
				}
				Transaction tran = new Transaction().find().andWhere("code", "=",t.getCode()).andWhere("application.dad", "=",t.getDad()).one();
				if(tran==null) {
					tran = new Transaction(t.getCode(), t.getDescr(), 1, this.application).insert();
					if(tran!=null && tran.hasError()) {
						this.addError(t.getCode()+" - "+tran.getError().get(0));
					}
				}
			});
		}
	}
}
