package nosi.core.webapp.helpers;

import nosi.core.webapp.import_export.FileImportAppOrPage;

import javax.servlet.http.Part;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.Adler32;
import java.util.zip.CheckedInputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * @author: Emanuel Pereira
 * 31 Oct 2017
 */
public class ZipUnzipFile {


   //Extract files jar format
   public static List<FileImportAppOrPage> getZipFiles(Part file) {
      List<FileImportAppOrPage> contents = new ArrayList<>();
      try (
              CheckedInputStream cis = new CheckedInputStream(file.getInputStream(), new Adler32());
              ZipInputStream zis = new ZipInputStream(new BufferedInputStream(cis));
      ) {
         ZipEntry entry;
         while ((entry = zis.getNextEntry()) != null) {
            int order = 3;
            String encode = FileHelper.ENCODE_UTF8;
            if (entry.getName().endsWith(".xml") || entry.getName().endsWith(".json") || entry.getName().endsWith(".xsl")) {
               order = 4;
            }
            if (entry.getName().startsWith("SQL/CONFIG") && entry.getName().endsWith("_ENV.xml")) {
               order = 1;
               encode = FileHelper.ENCODE_ISO;
            }
            if (entry.getName().startsWith("SQL/CONFIG") && entry.getName().endsWith("_ACTION.xml")) {
               order = 2;
               encode = FileHelper.ENCODE_ISO;
            }
            String ls = System.lineSeparator();
            String line;
            StringBuilder content = new StringBuilder();
            try (
                    DataInputStream in = new DataInputStream(zis);
                    BufferedReader d = new BufferedReader(new InputStreamReader(in, encode))
            ) {
               while ((line = d.readLine()) != null) {
                  content.append(line);
                  content.append(ls);
               }
            }

            FileImportAppOrPage f = new FileImportAppOrPage(entry.getName(), content.toString(), order);
            contents.add(f);
            zis.closeEntry();
         }
      } catch (IOException e) {
         e.printStackTrace();
      }
      Collections.sort(contents);
      return contents;
   }

   //NOT IN USE
   public static Map<String, String> readZipFile(Part file) {
      Map<String, String> files = new HashMap<>();
      try (
              CheckedInputStream cis = new CheckedInputStream(file.getInputStream(), new Adler32());
              ZipInputStream zis = new ZipInputStream(new BufferedInputStream(cis))
      ) {
         ZipEntry entry;
         while ((entry = zis.getNextEntry()) != null) {
            String ls = System.lineSeparator();
            String line;
            StringBuilder content = new StringBuilder();
            try (
                    DataInputStream in = new DataInputStream(zis);
                    BufferedReader d = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8));
            ) {
               while ((line = d.readLine()) != null) {
                  content.append(line);
                  content.append(ls);
               }
            }

            files.put(entry.getName(), content.toString());
            zis.closeEntry();
         }
      } catch (IOException e) {
         e.printStackTrace();
      }
      return files;
   }
}
