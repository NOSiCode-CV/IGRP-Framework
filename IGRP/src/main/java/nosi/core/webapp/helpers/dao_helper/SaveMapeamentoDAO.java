package nosi.core.webapp.helpers.dao_helper;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import nosi.core.config.Config;
import nosi.webapps.igrp_studio.pages.crudgenerator.CRUDGeneratorController;

/**
 * Isaias.Nunes
 * Aug 27, 2019
 */
public class SaveMapeamentoDAO {
	
	public static String getHibernateConfig(String path_file) {
			String data="";
			try {
				data = new String(Files.readAllBytes(Paths.get(path_file)));
			} catch (IOException e) {
				e.printStackTrace();
			}
			return data;
	}

	
	public static boolean SaveNewHibernateConfig(String path_file, String fileName, String packageName,String dao_name_class ) throws IOException {
		boolean flag = false;
		String nv_config = SaveMapeamentoDAO.getHibernateConfig(path_file+File.separator+fileName);
		nv_config = nv_config.replaceAll("<!-- Mapping your class here... ", "<mapping class=\""+packageName+"."+dao_name_class+"\"/>\n"
																			+ "\t\t<!-- Mapping your class here... ");
		flag = new CRUDGeneratorController().saveFiles(fileName, nv_config, path_file);
		return flag;
	}
	
	public static boolean loadCfg(String fileName, String packageName, String dao_name_class ) throws IOException {
		return SaveMapeamentoDAO.SaveNewHibernateConfig(new Config().getPathConexao(), fileName,packageName, dao_name_class);
	}
}
