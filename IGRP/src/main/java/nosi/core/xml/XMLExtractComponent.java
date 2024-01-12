package nosi.core.xml;

import nosi.core.webapp.Core;

/**
 * Emanuel
 * 5 Apr 2018
 */
public class XMLExtractComponent {

   private XMLExtractComponent() {
   }


   public static String extractXML(String xml) {
      return extract(xml);
   }

   public static String extractXSL(String xsl) {
      return extract(xsl);
   }

   private static String extract(String xxl) {
      if (Core.isNotNull(xxl)) {
         final int start = xxl.indexOf(">", xxl.indexOf("<content")) + ">".length();
         final int end = xxl.lastIndexOf("</content>");
         if (end != -1)
            return xxl.substring(start, end);
      }
      return "";
   }
}
