package nosi.core.webapp.import_export_v2.exports.dao;

import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.serializable.dao.DAOSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;
import nosi.core.webapp.helpers.FileHelper;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class DAOExport implements IExport{

	private List<DAOSerializable> daos;
	
	public DAOExport() {
		this.daos = new ArrayList<>();
	}
	
	@Override
	public String getFileName() {
		return OptionsImportExport.DAO.getFileName();
	}

	@Override
	public String serialization() {
		return Core.toJson(this.daos);
	}

	@Override
	public void export(Export export, String[] ids) {
		if(ids!=null) {
			for(String id:ids) {
				this.add(id);
			}
			export.add(this);
		}
	}

	@Override
	public void add(String id) {
		DAOSerializable dao = new DAOSerializable();
		dao.setFileName(id);
		dao.setContent(FileHelper.readFile(id, ""));
		this.daos.add(dao);
	}

}
