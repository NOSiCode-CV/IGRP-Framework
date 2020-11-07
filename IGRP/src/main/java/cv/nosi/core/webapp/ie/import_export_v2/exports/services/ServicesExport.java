package cv.nosi.core.webapp.ie.import_export_v2.exports.services;

import cv.nosi.core.webapp.ie.import_export_v2.common.OptionsImportExport;
import cv.nosi.core.webapp.ie.import_export_v2.exports.IExport;
import cv.nosi.core.webapp.ie.import_export_v2.exports.others_class.OthersClassExport;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class ServicesExport extends OthersClassExport implements IExport{

	public ServicesExport() {
		super();
	}
	
	@Override
	public String getFileName() {
		return OptionsImportExport.SERVICE.getFileName();
	}

}
