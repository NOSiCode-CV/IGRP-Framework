package nosi.core.webapp.compiler.helpers;

import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.FileHelper;
import org.eclipse.jdt.core.compiler.batch.BatchCompiler;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author: Emanuel Pereira
 * 12 Nov 2017
 */
public class Compiler {
   private final List<String> dirs;
   private final Config config;
   private final StringBuilder jars;
   private static final String ERROR_SEPARATOR = "ERROR_SEPARATOR";
   private final List<ErrorCompile> errors;
   private final List<ErrorCompile> warnings;

   public Compiler() {
      this.config = new Config();
      this.jars = new StringBuilder();
      this.dirs = new ArrayList<>();
      this.errors = new ArrayList<>();
      this.warnings = new ArrayList<>();
   }

   public void addFileName(String file) {
      if (Core.isNotNull(file))
         this.dirs.add(file);
   }

   public void compile() {

      if (this.dirs.isEmpty())
         return;

      String pathTomcat = Igrp.getInstance().getServlet().getServletContext().getRealPath("/");
      int index = pathTomcat.indexOf("webapps");
      if (index != -1) {
         final var pathTomcatSubstring = pathTomcat.substring(0, index);
         listFilesDirectory(pathTomcatSubstring + "lib/");
         listFilesDirectory(pathTomcatSubstring + "igrplib/");
      }

      listFilesDirectory(this.config.getPathLib());

      final var files = String.join(" ", this.dirs);

      final String buildArgs = " -encoding UTF-8 "
                               + files + " -classpath " + jars + File.pathSeparator + this.config.getBasePathClass()
                               + " -d " + this.config.getBasePathClass() // lugar onde é colocado os arquivos compilados
                               + " -warn:none -16  -Xemacs";

      StringWriter swS = new StringWriter();
      StringWriter swE = new StringWriter();
      PrintWriter outSuccess = new PrintWriter(swS);
      PrintWriter outError = new PrintWriter(swE);
      BatchCompiler.compile(buildArgs, outSuccess, outError, null);
      this.extractError(outSuccess, outError, swS, swE);
   }

   private void extractError(PrintWriter outSuccess, PrintWriter outError, StringWriter swS, StringWriter swE) {
      try {
         outError.flush();
         outError.close();
         outSuccess.flush();
         outSuccess.close();
         if (Core.isNotNull(swE.toString())) {
            this.extractError(swE.toString());
         }
      } finally {
         try {
            swE.close();
            swS.close();
         } catch (IOException e) {
            ErrorCompile err = new ErrorCompile(e.getMessage(), "", 1, e.getLocalizedMessage());
            this.errors.add(err);
         }
      }

   }

   private void extractError(String error) {
      error = error.replace("^", ERROR_SEPARATOR);
      String[] err = error.split(ERROR_SEPARATOR);
      if (err != null) {
         for (String e : err) {
            if (Core.isNotNull(e)) {
               ErrorCompile errorC = this.errorCompiler(e);
               if (errorC != null)
                  this.errors.add(errorC);
               errorC = this.warningCompiler(e);
               if (errorC != null)
                  this.warnings.add(errorC);
            }
         }
      }
   }

   private ErrorCompile errorCompiler(String error) {
      ErrorCompile err = new ErrorCompile();
      err.setFileName(this.resolveFileName(error));
      err.setError(this.resolveError(error, "error:"));
      err.setLine(this.resolveLine(error, err.getFileName()));
      if (Core.isNotNull(err.getError()))
         return err;
      return null;
   }


   private ErrorCompile warningCompiler(String error) {
      ErrorCompile err = new ErrorCompile();
      err.setFileName(this.resolveFileName(error));
      err.setWarning(this.resolveError(error, "warning:"));
      err.setLine(this.resolveLine(error, err.getFileName()));
      if (Core.isNotNull(err.getWarning()))
         return err;
      return null;
   }

   private long resolveLine(String error, String fileName) {
      int start = error.indexOf(fileName + ":") + (fileName + ":").length();
      if (start != -1) {
         int end = error.indexOf(":", start);
         if (end != -1) {
            String line = error.substring(start, end);
            return Core.toLong(line);
         }
      }
      return 0;
   }

   private String resolveError(String msg, String type) {
      int start = msg.indexOf(type);
      return start != -1 ? msg.substring(start) : "";
   }

   private String resolveFileName(String error) {
      int start = error.lastIndexOf(File.separator);
      if (start != -1) {
         int end = error.indexOf(".", start);
         if (end != -1)
            return error.substring(start + 1, end) + ".java";
      }
      return "";
   }

   public String getErrorToJson() {
      if (this.hasError()) {
         Map<String, List<ErrorCompile>> er = this.getErrors().stream().collect(Collectors.groupingBy(ErrorCompile::getFileName));
         return Core.toJson(new MapErrorCompile(Core.gt("Falha na compilação") + " - " + er.keySet().stream().findFirst().get(), er));
      }
      return "";
   }

   public String getWarningToJson() {
      if (this.hasWarning()) {
         Map<String, List<ErrorCompile>> er = this.getWarnings().stream().collect(Collectors.groupingBy(ErrorCompile::getFileName));
         return Core.toJson(new MapErrorCompile(Core.gt("Warnings") + " - " + er.keySet().stream().findFirst().get(), er));
      }
      return "";
   }

   public List<ErrorCompile> getErrors() {
      return this.errors;
   }

   public boolean hasError() {
      return !this.errors.isEmpty();
   }

   public List<ErrorCompile> getWarnings() {
      return this.warnings;
   }

   public boolean hasWarning() {
      return !this.warnings.isEmpty();
   }

   // Get jar files
   public void listFilesDirectory(String path) {
      if (FileHelper.dirExists(path)) {
         Map<String, String> lFiles = new FileHelper().listFilesDirectory(path);
         final var pathSeparator = File.pathSeparator;
         for (Map.Entry<String, String> file : lFiles.entrySet()) {
            this.jars.append(file.getValue()).append(pathSeparator);
         }
      }
   }

   public String getError() {
      return this.convertListToString(this.getErrors());
   }

   public String getWarning() {
      return this.convertListToString(this.getWarnings());
   }

   private String convertListToString(List<ErrorCompile> list) {
      return Objects.isNull(list) ? "" : list.stream().map(ErrorCompile::toString).collect(Collectors.joining());
   }
}
