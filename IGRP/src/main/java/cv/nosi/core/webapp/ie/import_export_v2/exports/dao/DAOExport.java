package cv.nosi.core.webapp.ie.import_export_v2.exports.dao;

import cv.nosi.core.webapp.ie.import_export_v2.common.OptionsImportExport;
import cv.nosi.core.webapp.ie.import_export_v2.exports.IExport;
import cv.nosi.core.webapp.ie.import_export_v2.exports.others_class.OthersClassExport;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class DAOExport extends OthersClassExport implements IExport{


	public DAOExport() {
		super();
	}
	
	@Override
	public String getFileName() {
		return OptionsImportExport.DAO.getFileName();
	}

}
