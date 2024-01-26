/**
 * @author: Emanuel Pereira
 * <p>
 * June 06, 2017
 * <p>
 * Description: save files in jar format and read extract on far format
 */

package nosi.core.webapp.helpers;

import nosi.core.webapp.import_export.FileImportAppOrPage;

import javax.servlet.http.Part;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.Map.Entry;
import java.util.jar.JarEntry;
import java.util.jar.JarInputStream;
import java.util.jar.JarOutputStream;
import java.util.zip.Adler32;
import java.util.zip.CheckedInputStream;
import java.util.zip.CheckedOutputStream;


public class JarUnJarFile {

   public static byte[] convertFilesToJarBytes(Map<String, String> files, int level) {
      byte[] result = null;
      if (!files.isEmpty() && (level >= 0 && level <= 9))
         try (
                 ByteArrayOutputStream fos = new ByteArrayOutputStream();
                 CheckedOutputStream cos = new CheckedOutputStream(fos, new Adler32());
                 JarOutputStream jos = new JarOutputStream(new BufferedOutputStream(cos))
         ) {
            Set<Entry<String, String>> entry = files.entrySet();
            for (Entry<String, String> e : entry) {
               JarEntry je = new JarEntry(e.getKey());
               jos.putNextEntry(je);
               try (InputStream fis = FileHelper.convertStringToInputStream(e.getValue())) {
                  for (int r = fis.read(); r != -1; r = fis.read()) {
                     jos.write(r);
                  }
               }
            }
            result = fos.toByteArray();
         } catch (IOException e) {
            e.printStackTrace();
         }
      return result;
   }

   //save data to jar format
   public static boolean saveJarFiles(String jarName, Map<String, String> files, int level) {
      boolean result = false;
      jarName = jarName.endsWith(".jar") ? jarName : (jarName + ".jar");
      if (!files.isEmpty() && (level >= 0 && level <= 9))
         try (
                 FileOutputStream fos = new FileOutputStream(jarName);
                 CheckedOutputStream cos = new CheckedOutputStream(fos, new Adler32());
                 JarOutputStream jos = new JarOutputStream(new BufferedOutputStream(cos))
         ) {
            Set<Entry<String, String>> entry = files.entrySet();
            for (Entry<String, String> e : entry) {
               JarEntry je = new JarEntry(e.getKey());
               jos.putNextEntry(je);
               try (FileInputStream fis = new FileInputStream(e.getValue())) {
                  for (int r = fis.read(); r != -1; r = fis.read()) {
                     jos.write(r);
                  }
               }
            }
            result = true;
         } catch (IOException e) {
            result = false;
            e.printStackTrace();
         }
      return result;
   }

   public static Map<String, String> readJarFile(Part file) {

      Map<String, String> files = new LinkedHashMap<>();

      try (
              InputStream inputStream = file.getInputStream();
              CheckedInputStream cis = new CheckedInputStream(inputStream, new Adler32());
              JarInputStream jis = new JarInputStream(new BufferedInputStream(cis))
      ) {
         JarEntry entry;
         while ((entry = jis.getNextJarEntry()) != null) {
            String ls = System.lineSeparator();
            StringBuilder content = new StringBuilder();
            try (
                    DataInputStream in = new DataInputStream(jis);
                    BufferedReader d = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))
            ) {
               String line;
               while ((line = d.readLine()) != null) {
                  content.append(line);
                  content.append(ls);
               }
            }
            files.put(entry.getName(), content.toString());
            jis.closeEntry();
         }
      } catch (IOException e) {
         e.printStackTrace();
      }
      return files;
   }

   //Extract files jar format
   public static List<FileImportAppOrPage> getJarFiles(Part file) {
      List<FileImportAppOrPage> contents = new ArrayList<>();
      try (
              InputStream inputStream = file.getInputStream();
              CheckedInputStream cis = new CheckedInputStream(inputStream, new Adler32());
              JarInputStream jis = new JarInputStream(new BufferedInputStream(cis))
      ) {

         JarEntry entry;
         while ((entry = jis.getNextJarEntry()) != null) {
            String ls = System.lineSeparator();
            String line;
            StringBuilder content = new StringBuilder();
            try (
                    DataInputStream in = new DataInputStream(jis);
                    BufferedReader d = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
               while ((line = d.readLine()) != null) {
                  content.append(line);
                  content.append(ls);
               }
            }

            final int order = getOrder(entry.getName());

            FileImportAppOrPage f = new FileImportAppOrPage(entry.getName(), content.toString(), order);

            contents.add(f);
            jis.closeEntry();
         }
      } catch (IOException e) {
         e.printStackTrace();
      }
      Collections.sort(contents);
      return contents;
   }

   private static int getOrder(String name) {

      if (name.startsWith("configApp"))
         return 0;

      if (name.startsWith("configDBApp"))
         return 1;

      if (name.startsWith("configHibernate"))
         return 2;

      if (name.startsWith("configPage"))
         return 3;

      return 4;
   }

   public static void copyStream(OutputStream outputStream, InputStream inputStream) throws IOException {
      byte[] bytes = new byte[4096];
      int read = inputStream.read(bytes, 0, 4096);
      while (read > 0) {
         outputStream.write(bytes, 0, read);
         read = inputStream.read(bytes, 0, 4096);
      }
   }
}
