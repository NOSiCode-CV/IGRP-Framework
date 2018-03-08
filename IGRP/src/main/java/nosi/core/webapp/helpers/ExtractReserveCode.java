package nosi.core.webapp.helpers;
/**
 * Emanuel
 * 6 Mar 2018
 */

import com.google.gson.Gson;
import nosi.core.config.Config;
import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ExtractReserveCode {

	 	public static String extract(String app, String page){	
	 		Config c = new Config();
	 		String className = c.getPackage(app, page,null);
	 		String code = ExtractReserveCode.getPageController(app, page);
	        ArrayList<ReserveCode> codes = new ArrayList<>();
	        codes.add(ExtractReserveCode.extractImports(code));
	        codes.add(ExtractReserveCode.extractCustomsMethods(code));
	        ArrayList<ReserveCode> list = ExtractReserveCode.extractMethods(className,code);
	        if(list!=null)
	            codes.addAll(list);
	        Gson gson = new Gson();
	        return gson.toJson(codes);
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
	        int start = code.indexOf(ExtractReserveCode.getStartReseveCodeAction(split));
	        int end = start != -1 ? code.indexOf(ExtractReserveCode.getEndReserveCode(), start) : -1;   
	        code = (start != -1 && end != -1)?code.substring(start + ExtractReserveCode.getStartReseveCodeAction(split).length(),end):"";
	        ReserveCode rc = new ReserveCode();
	        rc.setContent(code);
	        rc.setAction(action);
	        rc.setEnd(ExtractReserveCode.getEndReserveCode());
	        rc.setStart(ExtractReserveCode.getStartReseveCodeAction(split));
	        return rc;
	    }
	    
	    public static ReserveCode extractImports(String code){
	       return ExtractReserveCode.extract(code, "imports","PACKAGES_IMPORT");
	    }
	    
	    public static ReserveCode extractCustomsMethods(String code){
	       return ExtractReserveCode.extract(code,"CUSTOM_ACTIONS", "CUSTOM_ACTIONS");
	    }   
	    
	    public static ArrayList<ReserveCode> extractMethods(String className,String code) {  
	        ArrayList<ReserveCode> codes = new ArrayList<>();
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
	    
	    public static String getStartReseveCodeAction(String actionName){
	        return "/*----#START-PRESERVED-AREA("+actionName.toUpperCase()+")----*/";
	    }
	    
	    public static String getEndReserveCode(){
	        return "/*----#END-PRESERVED-AREA----*/";
	    }
	    
	    
	    public static class ReserveCode{
	        private String action;
	        private String content;
	        private String start;
	        private String end;

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
	        
	    }
}
