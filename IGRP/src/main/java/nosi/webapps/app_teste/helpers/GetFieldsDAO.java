package nosi.webapps.app_teste.helpers;

import java.io.File;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import nosi.core.config.Config;
import nosi.core.webapp.helpers.FileHelper;

/**
 * rodney.fernandes
 * 23/07/2019
 */
public class GetFieldsDAO {
	
	public Map<String,String> listFilesDirectory(String path) {
		Map<String,String> files = new HashMap<String,String>();
		if(FileHelper.fileExists(path)){
		File folder = new File(path);
		   for (final File fileEntry : folder.listFiles()) {
		       if (fileEntry.isDirectory()) {
		           return listFilesDirectory(fileEntry.toString());
		       } else {
		       	files.put(fileEntry.getName(), fileEntry.getAbsolutePath());
		       }
		   }
		   return files;
		}
		return null;
		}
	
	
	public String GerarXML(Config conf, String dad){
		
		String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>";
		
		xml += "<dao>";
		
		if(dad != "") {
			
			String x = conf.getBasePahtClassWorkspace(dad)+File.separator+"dao";
			
			Map<String,String> dao = listFilesDirectory(x);
			
			if( dao != null ) {
				
				for (Map.Entry<String, String> entry : dao.entrySet()) {
					//System.out.println(entry.getKey() + "/" + entry.getValue()); 
					 try {
						 String nome_classe = entry.getKey().replace(".java", "");
						 
						Class obj = Class.forName("nosi.webapps."+dad+".dao."+ nome_classe);
						
						 xml += "<" +nome_classe+  ">";
						
						 Field[] fields = obj.getDeclaredFields();
					        
				         
				         for (int i = 0; i < fields.length; i++) 
				         {
				        	 //System.out.println(fields[i].getName());
				        	 
				        	 if(!fields[i].getName().startsWith("pc") && !fields[i].getName().startsWith("class") && !fields[i].getName().startsWith("serialVersion"))
				        	 {
				        	 xml += "<field>"
				        	 		+ "<nome>" +
				        	 		fields[i].getName()
				        	 		+ "</nome>"
				        	 		
				        	 		+ "<tipo>";
				        	 
				        	 		try {
				        	 			String aux[] = fields[i].getType().getTypeName().split("\\."); 
		                              
		                              System.out.println(aux.length);
					        	 		
					        	 		xml += aux[aux.length - 1];
									} catch (Exception e) {
										xml += fields[i].getType().getTypeName();
									}
				        	 		 
				        	 		xml += "</tipo>"
				        	 		+ ""; 
				        	 
				        	 xml += "</field>";
				        	 
				        	 }
				         }
				         
				         xml += "</" +nome_classe+ ">";
				         
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}
				
			
		}
		
		xml += "</dao>";
		
		System.out.println(xml);
		
		return xml;
		
	}

}
