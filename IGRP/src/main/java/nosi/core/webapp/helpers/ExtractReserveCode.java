package nosi.core.webapp.helpers;
/**
 * Emanuel
 * 6 Mar 2018
 * 
 * Willy
 * 9 Mar 2018
 */

import com.google.gson.Gson;
import nosi.core.config.Config;
import nosi.core.webapp.Core;

import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ExtractReserveCode {
	
		public static String globalReserveHeadStart = "/*----#START-PRESERVED-AREA(";
		
		public static String globalReserveHeadEnd = ")----*/";
		
		public static String globalReserveEnd = "/*----#END-PRESERVED-AREA----*/";

	 	public static String extract(String app, String page){	
	 		
	 		Gson gson = new Gson();
	 		
	 		Config c = new Config();
	 		
	 		String className = c.getPackage(app, page,null);
	 		
	 		String code = ExtractReserveCode.getPageController(app, page);
	 		
	 		if(Core.isNotNull(code)) {
	 			
	 			ArrayList<ReserveCode> codes = new ArrayList<>();
		        
		        codes.add(ExtractReserveCode.extractImports(code));
		        
		        codes.add(ExtractReserveCode.extractCustomsMethods(code));
		        
		        ArrayList<ReserveCode> list = ExtractReserveCode.extractMethods(className,code);
		        
		        if(list!=null)
		        	
		            codes.addAll(list);
		        
		        return gson.toJson(codes);
	 			
	 		}
	 			
	 		return  "{}";
	 		
	    }
	    
	 	public static String getPageController(String app, String page) {
	 		Config c = new Config();
			String workspace = c.getBasePahtClassWorkspace(app,page);
			String controller = null;
			if (FileHelper.fileExists(workspace + File.separator + page + "Controller.java")) {
				controller = FileHelper.readFile(workspace, page + "Controller.java");
			} else {
				workspace = c.getBasePathClass() + "nosi/webapps/" + app.toLowerCase() + "/pages/"+ page.toLowerCase();
				if (FileHelper.fileExists(workspace + "/" + page + "Controller.java")) {
					controller = FileHelper.readFile(workspace, page + "Controller.java");
				}
			}

			return controller;
		}
	 	
	    public static ReserveCode extract(String code,String action,String split){
	    	
	    	if(Core.isNotNull(code) ) {
	    		
	    		boolean isGlobalReserve = code.indexOf( globalReserveHeadStart ) != -1;
		    	
		    	split = isGlobalReserve ? split.toUpperCase() : split;
		    	
		    	String content = ExtractReserveCode.getStartReseveCodeAction(split,isGlobalReserve);
		      
		    	int start = code.indexOf( content );
		       
		    	int end = start != -1 ? code.indexOf(ExtractReserveCode.getEndReserveCode(isGlobalReserve), start) : -1;  
		      
		        code = (start != -1 && end != -1)?code.substring(start + content.length(),end):"";

		        code = !code.equals("") && isGlobalReserve ? code : code;   

		        ReserveCode rc = new ReserveCode();
		       
		        rc.setContent(code);
		       
		        rc.setAction(action);
		        
		        rc.setEnd(ExtractReserveCode.getEndReserveCode(isGlobalReserve));
		        
		        rc.setStart(ExtractReserveCode.getStartReseveCodeAction(split,isGlobalReserve));
		        
		        rc.setIsGlobal(isGlobalReserve);
		       
		        return rc;
	    		
	    	}
	    	
	    	return null;
	    	
	    }
	    
	    public static ReserveCode extractImports(String code){
	    	return ExtractReserveCode.extract(code, "packages_import","packages_import");
	    }
	    
	    public static ReserveCode extractCustomsMethods(String code){
	       return ExtractReserveCode.extract(code,"custom_actions", "custom_actions");
	    }   
	    
	    public static ArrayList<ReserveCode> extractMethods(String className,String code) {  
	        ArrayList<ReserveCode> codes = new ArrayList<>();
	        ArrayList<String> extrats = extractAllMethods(className);
	        if(extrats != null)
		        extractAllMethods(className).stream().forEach(ac->{
		            
		        	codes.add(ExtractReserveCode.extract(code,ac, ac.toUpperCase()));
		        });
	        return codes;
	    }	
	    
	    public static ArrayList<String> extractAllMethods(String className){
	        try {
	            ArrayList<String> actions = new ArrayList<>();
	            Class<?> c = Class.forName(className);
	            for (Method method : c.getDeclaredMethods()) {
	           
	                actions.add(method.getName().replaceAll("action", ""));
	            }
	            return actions;
	        } catch (ClassNotFoundException ex) {
	            Logger.getLogger(ExtractReserveCode.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return null;
	    }
	    
	    public static String getStartReseveCodeAction(String actionName, boolean isGlobalReserve){
	    	
	    	String rtn = isGlobalReserve ? globalReserveHeadStart+actionName+globalReserveHeadEnd : "/*----#start-code("+actionName.toLowerCase()+")----*/";
	    	
	    	return rtn;
	    }
	    
	    public static String getEndReserveCode(boolean isGlobalReserve){
	    	
	    	String rtn = isGlobalReserve ? globalReserveEnd : "/*----#end-code----*/";
	    	
	        return rtn;
	    }
	    
	    
	    public static class ReserveCode{
	        private String action;
	        private String content;
	        private String start;
	        private String end;
	        private boolean isGlobal;

	        public String getAction() {
	            return action;
	        }

	        public void setAction(String action) {
	            this.action = action;
	        }

	        public String getContent() {
	            return content;
	        }

	        public void setContent(String content) {
	            this.content = content;
	        }

	        public String getStart() {
	            return start;
	        }

	        public void setStart(String start) {
	            this.start = start;
	        }

	        public String getEnd() {
	            return end;
	        }

	        public void setEnd(String end) {
	            this.end = end;
	        } 
	        
	        public boolean getIsGlobal() {
	            return isGlobal;
	        }

	        public void setIsGlobal(boolean g) {
	            this.isGlobal = g;
	        } 
	        
	    }
}
