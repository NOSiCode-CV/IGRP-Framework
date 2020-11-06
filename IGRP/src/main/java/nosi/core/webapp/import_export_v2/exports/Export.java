package nosi.core.webapp.import_export_v2.exports;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import nosi.core.webapp.helpers.JarUnJarFile;

/**
 * Emanuel
 * 30 Oct 2018
 */
public class Export {

	private List<IExport> exports;
	
	public Export() {
		this.exports = new ArrayList<>();
	}
	
	public void add(IExport export) {
		this.exports.add(export);
	}
	
	public byte[] execute() {
		Map<String, String> fileMap = new HashMap<>();
		exports.stream().forEach(e->{
			fileMap.put(e.getFileName(), e.serialization());
		});
		return JarUnJarFile.convertFilesToJarBytes(fileMap , 9);
	}
}
