package nosi.core.webapp.helpers;

import com.google.gson.Gson;
import nosi.core.config.Config;
import nosi.core.webapp.Core;

import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ExtractReserveCode {

   private static final String globalReserveHeadStart = "/*----#START-PRESERVED-AREA(";

   private static final String globalReserveHeadEnd = ")----*/";

   private static final String globalReserveEnd = "/*----#END-PRESERVED-AREA----*/";

   public static String extract(String app, String page) {

      final var code = getPageController(app, page);
      if (Core.isNull(code))
         return "{}";

      final var config = new Config();
      final var className = config.getPackage(app, page);
      final var list = extractMethods(className, code);

      final var codes = new ArrayList<ReserveCode>();
      codes.add(extractImports(code));
      codes.add(extractCustomsMethods(code));
      codes.addAll(list);

      return new Gson().toJson(codes);
   }

   public static String getPageController(String app, String page) {
      Config c = new Config();
      String workspace = c.getBasePahtClassWorkspace(app, page);

      if (FileHelper.fileExists(workspace + File.separator + page + "Controller.java"))
         return FileHelper.readFile(workspace, page + "Controller.java");

      workspace = c.getBasePathClass() + "nosi/webapps/" + app.toLowerCase() + "/pages/" + page.toLowerCase();
      if (FileHelper.fileExists(workspace + "/" + page + "Controller.java"))
         return FileHelper.readFile(workspace, page + "Controller.java");

      return null;
   }

   public static ReserveCode extract(String code, String action, String split) {

      if (Core.isNotNull(code)) {

         boolean isGlobalReserve = code.contains(globalReserveHeadStart);

         String split_ = isGlobalReserve ? split.toUpperCase() : split;

         String content = getStartReseveCodeAction(split_, isGlobalReserve);

         int start = code.indexOf(content);

         final var endReserveCode = getEndReserveCode(isGlobalReserve);

         int end = start != -1 ? code.indexOf(endReserveCode, start) : -1;

         String code_ = (start != -1 && end != -1) ? code.substring(start + content.length(), end) : "";

         final var rc = new ReserveCode();
         rc.setContent(code_);
         rc.setAction(action);
         rc.setStart(getStartReseveCodeAction(split, isGlobalReserve));
         rc.setEnd(endReserveCode);
         rc.setIsGlobal(isGlobalReserve);

         return rc;
      }

      return null;
   }

   public static ReserveCode extractImports(String code) {
      return extract(code, "packages_import", "packages_import");
   }

   public static ReserveCode extractCustomsMethods(String code) {
      return extract(code, "custom_actions", "custom_actions");
   }

   public static List<ReserveCode> extractMethods(String className, String code) {
      final var allMethods = extractAllMethods(className);
      if (allMethods != null) {
         final var codes = new ArrayList<ReserveCode>();
         allMethods.forEach(ac ->
                 codes.add(extract(code, ac, ac.toUpperCase()))
         );
         return codes;
      }
      return new ArrayList<>(0);
   }

   public static List<String> extractAllMethods(String className) {
      try {
         List<String> actions = new ArrayList<>();
         Class<?> c = Class.forName(className);
         for (Method method : c.getDeclaredMethods()) {
            actions.add(method.getName().replace("action", ""));
         }
         return actions;
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(ExtractReserveCode.class.getName()).log(Level.SEVERE, null, ex);
      }
      return null;
   }

   private static String getStartReseveCodeAction(String actionName, boolean isGlobalReserve) {
      return isGlobalReserve ? globalReserveHeadStart + actionName + globalReserveHeadEnd : "/*----#start-code(" + actionName.toLowerCase() + ")----*/";
   }

   private static String getEndReserveCode(boolean isGlobalReserve) {
      return isGlobalReserve ? globalReserveEnd : "/*----#end-code----*/";
   }

   public static class ReserveCode {
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
