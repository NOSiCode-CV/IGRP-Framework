package nosi.core.xml;

import nosi.core.webapp.Core;

/**
 * Emanuel
 * 5 Apr 2018
 */
public class XMLExtractComponent {

	
	public static String extract(String xml) {
		if(Core.isNotNull(xml)) {
			int start = xml.indexOf(">",xml.indexOf("<content"))+">".length();
			int end = xml.lastIndexOf("</content>");
			if(start != -1 && end != -1) {
				return xml.substring(start, end);
			}
		}
		return "";
	}
	
}
