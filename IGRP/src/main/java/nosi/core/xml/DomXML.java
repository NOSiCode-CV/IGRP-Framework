package nosi.core.xml;

import java.io.IOException;
import java.io.StringReader;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 * Emanuel
 * 4 Jun 2019
 */
public class DomXML {

	private Document document;
	
	public DomXML(String xml) {
		this.document = this.extractXml(xml);
	}
	
	public Document extractXml(String xml) {
		try {
			DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			InputSource src = new InputSource();
			src.setCharacterStream(new StringReader(xml));
			return builder.parse(src);
		} catch (ParserConfigurationException | SAXException | IOException e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	public String getElement(String tagName) {
		if(this.document!=null) {
			NodeList element = this.document.getElementsByTagName(tagName);
			if(element.getLength() > 0)
				return element.item(0).getTextContent();
		}
		return null;
	}
	
	public Document getDocument() {
		return this.document;
	}
}
