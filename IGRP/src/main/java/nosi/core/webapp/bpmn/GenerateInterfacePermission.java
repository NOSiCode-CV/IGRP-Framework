package nosi.core.webapp.bpmn;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.StringHelper;
/**
 * Emanuel
 * 28 Mar 2019
 */
public class GenerateInterfacePermission {

	public static String getGenerateClassName(String proccessKey_) {
		String proccessKey = proccessKey_;
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
				"\r\n\n"
				+ "/*"
				+ "* Exemple Implementation\n"
				+ "*\n"
				+ "\t\t @Override\r\n" + 
				"		public boolean allowTask(ActivityExecute task) {\r\n" + 
				"				\r\n" + 
				"				if(Core.isNotNull(task.getCustomPermission())) {\r\n" + 
				"					String cc = centro_custo.get(Core.getCurrentUser().getEmail());\r\n" + 
				"					return cc!=null && cc.compareTo(task.getCustomPermission())==0;			\r\n" + 
				"				}\r\n" + 
				"				return true;\r\n" + 
				"		}\r\n" + 
				"\r\n" + 
				"		private static final Map<String,String> centro_custo = new HashMap<>();\r\n" + 
				"		\r\n" + 
				"		static {\r\n" + 
				"			centro_custo.put(\"c1@gmail.com\", \"c1\");\r\n" + 
				"			centro_custo.put(\"c2@gmail.com\", \"c2\");\r\n" + 
				"			centro_custo.put(\"c11@gmail.com\", \"c2\");\r\n" + 
				"		}"
				+ "*/"
				+ "\n\n"+
				"}";
	}


	public static String getProccessPackageName(String dad,String proccessKey) {
		if(Core.isNotNullMultiple(dad,proccessKey)) {
			String packageName = "nosi.webapps."+dad.toLowerCase()+".process."+proccessKey.toLowerCase()+"."+getGenerateClassName(proccessKey);
			return packageName;
		}
		return null;
	}
}
