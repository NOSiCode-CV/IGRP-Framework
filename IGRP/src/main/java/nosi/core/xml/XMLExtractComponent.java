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

   private static String extract(String xml) {
      if (Core.isNotNull(xml)) {
         final int start = xml.indexOf(">", xml.indexOf("<content")) + ">".length();
         final int end = xml.lastIndexOf("</content>");
         if (end != -1)
            return xml.substring(start, end);
      }
      return "";
   }
}
