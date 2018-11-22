package nosi.core.webapp.import_export_v2.exports.others_class;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.serializable.dao.DAOSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;

/**
 * Emanuel
 * 22 Nov 2018
 */
public class OthersClassExport  implements IExport {

	private List<DAOSerializable> others_class;
	
	public OthersClassExport() {
		this.others_class = new ArrayList<>();
	}
	
	@Override
	public String getFileName() {
		return OptionsImportExport.OTHERS_CLASS.getFileName();
	}

	@Override
	public String serialization() {
		return Core.toJsonWithJsonBuilder(this.others_class);
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
		if(FileHelper.fileExists(id)) {
			File file = new File(id);
			DAOSerializable fileClass = new DAOSerializable();
			fileClass.setContent(FileHelper.readFile(file.getParentFile().getAbsolutePath(), file.getName()));
			fileClass.setFileName(file.getName());
			fileClass.setPath(this.resolvePath(file.getParentFile().getAbsolutePath()));
			this.others_class.add(fileClass);
		}
	}

	protected String resolvePath(String dir) {
		String dirIGRP = "nosi"+File.separator+"webapps";
		int start = dir.indexOf(dirIGRP);
		if(Core.isNotNull(dir) && start!=-1) {
			dir = dir.substring(start+dirIGRP.length(), dir.length());
		}
		return dir;
	}

}
