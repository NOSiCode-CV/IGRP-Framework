package cv.nosi.core.webapp.ie.import_export_v2.exports.transation;

import java.util.ArrayList;
import java.util.List;

import cv.nosi.core.webapp.ie.import_export_v2.common.OptionsImportExport;
import cv.nosi.core.webapp.ie.import_export_v2.common.serializable.transation.TransationSerializable;
import cv.nosi.core.webapp.ie.import_export_v2.exports.Export;
import cv.nosi.core.webapp.ie.import_export_v2.exports.IExport;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.webapps.igrp.dao.Transaction;

/**
 * Emanuel
 * 6 Dec 2018
 */
public class ExportTransation implements IExport{

	private List<TransationSerializable> transations;
	
	public ExportTransation() {
		this.transations = new ArrayList<>();
	}
	
	@Override
	public String getFileName() {
		return OptionsImportExport.TRANSATION.getFileName();
	}

	@Override
	public String serialization() {
		return Core.toJsonWithJsonBuilder(this.transations);
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
		Transaction t = new Transaction().findOne(id);
		if(t!=null) {
			TransationSerializable tran = new TransationSerializable();
			Core.mapper(t, tran);
			tran.setDad(t.getApplication().getDad());
			this.transations.add(tran);
		}
	}

}
