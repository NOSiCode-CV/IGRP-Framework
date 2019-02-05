package nosi.core.webapp.import_export_v2.exports.services;

import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.services.ServicesSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;
import nosi.core.webapp.helpers.FileHelper;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class ServicesExport implements IExport{

	private List<ServicesSerializable> services;
	
	public ServicesExport() {
		this.services = new ArrayList<>();
	}
	
	@Override
	public String getFileName() {
		return "";//ExportTypes.SERVICE.getFileName();
	}

	@Override
	public String serialization() {
		return Core.toJsonWithJsonBuilder(this.services);
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
		ServicesSerializable s = new ServicesSerializable();
		s.setFileName(id);
		s.setContent(FileHelper.readFile(id, ""));
		this.services.add(s);
	}

}
