package nosi.core.webapp.helpers;


import java.io.IOException;
import java.util.Map;

import nosi.core.config.Config;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/**
 * Isaias.Nunes
 * Oct 11, 2017
 */
public class ImportExportApp {
	
	public static String generateXMLPage(Action pagina) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("page");
		xml.setElement("id", pagina.getId()+"");
		xml.setElement("action", pagina.getAction());
		xml.setElement("action_desc", pagina.getAction_descr());
		xml.setElement("package_name", pagina.getPackage_name());
		xml.setElement("page", pagina.getPage());
		xml.setElement("page_desc", pagina.getPage_descr());
		xml.setElement("status", pagina.getStatus()+"");
		xml.setElement("version", pagina.getVersion());
		xml.setElement("xsl_src", pagina.getXsl_src());
		xml.setElement("dad", pagina.getApplication().getDad()+"");
		xml.endElement();
		return xml.toString();
	}
	
	public static String genereteXMLApplication(Application app) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("Application");
		xml.setElement("dad", app.getDad());
		xml.setElement("description", app.getDescription());
		xml.setElement("external", app.getExternal()+"");
		xml.setElement("img_src", app.getImg_src());
		xml.setElement("name", app.getName());
		xml.setElement("status", app.getStatus()+"");
		xml.setElement("url", app.getUrl());
		xml.setElement("action_fk", (app != null) && (app.getAction() != null) ? app.getAction().getId() + "" : "");
		xml.endElement();
		return xml.toString();
	}
	
	public class FileOrderCompile implements Comparable<FileOrderCompile>{
		
		public FileOrderCompile(String nome, String conteudo, int order) {
			super();
			this.conteudo = conteudo;
			this.nome = nome;
			this.order = order;
		}

		private String conteudo;
		private String nome;
		private int order;
		
		public String getConteudo() {
			return conteudo;
		}
		public void setConteudo(String conteudo) {
			this.conteudo = conteudo;
		}
		public String getNome() {
			return nome;
		}
		public void setNome(String nome) {
			this.nome = nome;
		}
		public int getOrder() {
			return order;
		}
		public void setOrder(int order) {
			this.order = order;
		}
		
		@Override
		public int compareTo(FileOrderCompile file) {
			if(this.order < file.order) {
				return -1;
			}
			if(this.order > file.order) {
				return 1;
			}
			return 0;
		}
		
		
	}
	public static boolean ExportPage(String id) throws IOException {
		boolean status = false;
		if(id != null && !id.equals("")) {
			Action page = new Action().findOne(id);
			String xml_file = ImportExportApp.generateXMLPage(page);			
			String path_class_files = Config.getWorkspace() +"\\src\\"+ page.getPackage_name().replace(".", "\\");
			String path_xsl_xml = Config.getWorkspace() + "\\WebContent\\" + Config.getResolvePathXsl(page.getApplication().getDad(), page.getPage(), page.getVersion());
			
			FileHelper.save(path_xsl_xml, page.getPage()+"Config.xml", xml_file);
			
			Map<String, String> xsl_xml_files = FileHelper.listFilesDirectory(path_xsl_xml);
			Map<String, String> Java_files = FileHelper.listFilesDirectory(path_class_files);
			
			xsl_xml_files.putAll(Java_files);
			FileHelper.createDiretory("C:\\Users\\isaias.nunes\\Downloads\\"+page.getApplication().getDad());
			status = JarUnJarFile.saveJarFiles("C:\\Users\\isaias.nunes\\Downloads\\"+page.getApplication().getDad()+"\\"+page.getPage()+".jar", xsl_xml_files, 9);
			
		}
		return status;
	}
	
	
}