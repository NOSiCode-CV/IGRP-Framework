package nosi.core.webapp.helpers;

import java.io.ByteArrayOutputStream;
import java.nio.file.Paths;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

/**
 * @author: Emanuel Pereira
 * 31 Oct 2017
 */
public class XMLTransform {

	public static String tranform(String xmlFileName,String xslFileName) throws TransformerConfigurationException{
		StreamSource xlsStreamSource = new StreamSource(Paths.get(xslFileName).toAbsolutePath().toFile());
	    StreamSource xmlStreamSource = new StreamSource(Paths.get(xmlFileName).toAbsolutePath().toFile());
	    TransformerFactory transformerFactory = TransformerFactory.newInstance();//("org.apache.xalan.processor.TransformerFactoryImpl", null);

	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    StreamResult result = new StreamResult(baos);

	    Transformer transformer;
		try {
			transformer = transformerFactory.newTransformer(xlsStreamSource);
		    transformer.transform(xmlStreamSource, result);
		    return result.getOutputStream().toString();
		} catch (TransformerException e) {
			e.printStackTrace();
		}
		return null;
	}
}
