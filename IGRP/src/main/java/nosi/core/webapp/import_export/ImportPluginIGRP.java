package nosi.core.webapp.import_export;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.jar.Attributes;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.jar.Manifest;

import javax.servlet.http.Part;

import nosi.core.config.Config;
import nosi.core.webapp.Core;

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
			File uploads = new File(this.config.getPathLib());
			File file = File.createTempFile(part.getSubmittedFileName().replaceAll(".jar", ""), ".jar", uploads);
			
		/*	JarFile jar_import = new JarFile(file);
				
			System.out.println("Imprimindo: " + jar_import.getName());
			
			boolean validado =  validarJar(jar_import);
			
			if(validado)
				Core.setMessageSuccess("JAR Válido");
			else
				Core.setMessageError("Não é um JAR");
	*/
			try (InputStream input = part.getInputStream()) {
			    Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
			}
			part.delete();
			result = true;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	 /*
	  private static boolean validarJar(JarFile jar) throws IOException {
	        Enumeration<JarEntry> entries = jar.entries();
	        while (entries.hasMoreElements()) {
	            JarEntry entry = entries.nextElement();
	            try {
	                byte[] buffer = new byte[8192];
	                InputStream is = jar.getInputStream(entry);
	                while ((is.read(buffer, 0, buffer.length)) != -1) {
	                    // We just read. This will throw a SecurityException
	                    // if a signature/digest check fails.
	                }
	            } catch (SecurityException se) {
	                return false;
	            }
	        }
	        return true;
	    }
	  
	 
	
	private boolean validarJar(File jar_imported) throws IOException
	{
			boolean result = false;
			JarFile jar = new JarFile(jar_imported);

			// This call will throw a java.lang.SecurityException if someone has tampered
			// with the signature of _any_ element of the JAR file.
			// Alas, it will proceed without a problem if the JAR file is not signed at all
			InputStream is = jar.getInputStream(jar.getEntry("META-INF/MANIFEST.MF"));
			Manifest man = new Manifest(is);
			is.close();

			Set<String> signed = new HashSet<String>();
			for(Map.Entry<String, Attributes> entry: man.getEntries().entrySet()) {
			    for(Object attrkey: entry.getValue().keySet()) {
			        if (attrkey instanceof Attributes.Name && 
			           ((Attributes.Name)attrkey).toString().indexOf("-Digest") != -1)
			            signed.add(entry.getKey());
			    }
			}

			Set<String> entries = new HashSet<String>();
			for(Enumeration<JarEntry> entry = jar.entries(); entry.hasMoreElements(); ) {
			    JarEntry je = entry.nextElement();
			    if (!je.isDirectory())
			        entries.add(je.getName());
			}

			// contains all entries in the Manifest that are not signed.
			// Ususally, this contains:
			//  * MANIFEST.MF itself
			//  * *.SF files containing the signature of MANIFEST.MF
			//  * *.DSA files containing public keys of the signer

			Set<String> unsigned = new HashSet<String>(entries);
			unsigned.removeAll(signed);

			// contains all the entries with a signature that are not present in the JAR
			Set<String> missing = new HashSet<String>(signed);
			missing.removeAll(entries);
			
			result= missing.isEmpty();
			
			return result;

		}
		*/

}
