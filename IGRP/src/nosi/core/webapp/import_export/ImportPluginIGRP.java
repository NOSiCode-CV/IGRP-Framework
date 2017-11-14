package nosi.core.webapp.import_export;

import java.io.IOException;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.http.Part;
import nosi.core.config.Config;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.JarUnJarFile;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/**
 * @author: Emanuel Pereira
 * 14 Nov 2017
 */
public class ImportPluginIGRP {

	
	public boolean importPlugin(Part file){
		Map<String,String> files = JarUnJarFile.readJarFile(file);
		boolean result = false;
		for(Entry<String, String> entry:files.entrySet()){
			if(entry.getKey().contains("images/IGRP/") && (entry.getKey().endsWith(".xsl") || entry.getKey().endsWith(".xml") || entry.getKey().endsWith(".json"))){
				try {
					String [] path = entry.getKey().split("/");
					String fileName = path[path.length-1];
					String subPath = entry.getKey().substring(0,entry.getKey().indexOf("/"+fileName));
					if(entry.getKey().endsWith(".xml")){
						//Saving page if not exists
						result = this.savePage(fileName.replace(".xml", ""),entry.getValue());
					}
					result = FileHelper.save(Config.getBasePathXsl()+subPath.substring(subPath.indexOf("WebContent/")+"WebContent/".length()), fileName, entry.getValue());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		try {
			result = FileHelper.saveFile(Config.getPathLib(), file.getSubmittedFileName(), file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	private boolean savePage(String pageName, String content) {
		Action page = new Action();
		if(new Action().find().andWhere("page", "=", pageName).one()==null){
			//Get Title Page
			String title = content.substring(
					content.indexOf("<title>",content.indexOf("<content>"))+"<title>".length(), 
					content.indexOf("</title>",content.indexOf("<title>",content.indexOf("<content>"))+"<title>".length()));
			page.setAction("index");
			page.setAction_descr(title);
			page.setApplication(new Application().findOne(1));
			page.setPage(pageName);
			page.setPage_descr(title);
			page.setXsl_src("igrp/"+pageName.toLowerCase()+"/"+pageName+".xsl");
			page.setVersion("2.3");
			page.setStatus(1);
			return page.insert()!=null;
		}
		return true;
	}
}
