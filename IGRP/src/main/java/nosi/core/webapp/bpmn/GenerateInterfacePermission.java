package nosi.core.webapp.bpmn;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.StringHelper;

/**
 * Emanuel
 * 28 Mar 2019
 */
public class GenerateInterfacePermission {

	public static String getGenerateClassName(String proccessKey) {
		if(Core.isNotNull(proccessKey)) {
			proccessKey = proccessKey.replaceAll("_", " ");
			proccessKey = StringHelper.camelCase(proccessKey);
			return proccessKey+"Permission";
		}
		return null;
	}
	
	
	public static String getGenerateClassContent(String dad,String proccessKey) {
		
		return "package nosi.webapps."+dad+".process."+proccessKey.toLowerCase()+";\r\n" + 
				"\r\n" + 
				"import nosi.core.webapp.bpmn.TaskPermissionInterface;\r\n" + 
				"import nosi.webapps.igrp.dao.ActivityExecute;\r\n" + 
				"\r\n" + 
				"/**\r\n" + 
				" * "+Core.getCurrentUser().getEmail()+"\r\n" + 
				" * "+Core.getCurrentDate()+"\r\n" + 
				" */\r\n" + 
				"public class "+getGenerateClassName(proccessKey)+" implements TaskPermissionInterface {\r\n" + 
				"\r\n" + 
				"	\t@Override\r\n" + 
				"	\tpublic boolean allowTask(ActivityExecute task) {\r\n" + 
				"		\t\t/**\r\n" + 
				"		 \t\t* Custom implement permission\r\n" + 
				"		 \t\t*/\r\n" + 
				"		\t\treturn true;\r\n" + 
				"	\t}\r\n" + 
				"\r\n" + 
				"}";
	}


	public static String getProccessClassName(String dad, String proccessKey) {
		if(Core.isNotNullMultiple(dad,proccessKey)) {
			String packageName = "nosi.webapps."+dad.toLowerCase()+".process."+proccessKey.toLowerCase()+"."+getGenerateClassName(proccessKey);
			return packageName;
		}
		return null;
	}
}
