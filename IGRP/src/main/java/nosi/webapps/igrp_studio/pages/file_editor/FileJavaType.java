package nosi.webapps.igrp_studio.pages.file_editor;

import nosi.core.webapp.Core;

/**
 * Emanuel
 * 22 Nov 2018
 */
public class FileJavaType {

	private static String createJavaFile(String packageName,String className,String type) {
		return "package "+packageName.toLowerCase()+";\n"
				 + "/**\n"
				 + "* "+Core.getCurrentUser().getEmail()+"\n"
				 + "* "+Core.getCurrentDate()+"\n"
				 + "*/\n"
				 +"public "+type+" "+className+" {\n"
				 +"\n"
				 +"}";
	}

	public static String createFile(String packageName,String className,String type) {
       return switch (type) {
          case "class" -> createJavaFile(packageName, className, "class");
          case "interface" -> createJavaFile(packageName, className, "interface");
          case "enum" -> createJavaFile(packageName, className, "enum");
          case "annotation" -> createJavaFile(packageName, className, "@interface");
          case "xml" -> "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
          default -> "";
       };
    }
}
