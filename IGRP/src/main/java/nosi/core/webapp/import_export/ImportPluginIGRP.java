package nosi.core.webapp.import_export;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.http.Part;
import nosi.core.config.Config;

/**
 * @author: Emanuel Pereira
 * 14 Nov 2017
 */
public class ImportPluginIGRP {

	private Config config;
	public ImportPluginIGRP() {
		this.config = new Config();
	}
	
	public boolean importPlugin(Part part){
		boolean result = false;
		try {
			System.out.println("Import jar...");
			File uploads = new File(this.config.getPathLib());
			File file = File.createTempFile(part.getSubmittedFileName().replaceAll(".jar", ""), ".jar", uploads);

			try (InputStream input = part.getInputStream()) {
				System.out.println("Copying..."+file.toPath());
			    Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
			}
			part.delete();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
