package nosi.core.webapp.helpers;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.io.IOUtils;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import com.openhtmltopdf.objects.zxing.ZXingObjectDrawer;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import com.openhtmltopdf.render.DefaultObjectDrawerFactory;
import com.openhtmltopdf.util.XRLog;

import nosi.core.config.Config;
import nosi.core.webapp.helpers.report.AutoFont;
import nosi.core.webapp.helpers.report.AutoFont.CSSFont;


/**
 * MarcosM
 * 03/06/2021
 */
public class TransformHelper {

	
	/**
	 * @param xml
	 * @param xsl
	 * @return
	 * @throws ParserConfigurationException
	 * @throws SAXException
	 * @throws IOException
	 * @throws TransformerFactoryConfigurationError
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 */
	public StreamResult transformXMLXSL2HTML(String xml, String xsl) throws ParserConfigurationException, SAXException,
			IOException, TransformerFactoryConfigurationError, TransformerConfigurationException, TransformerException {
		Document document;
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		 DocumentBuilder builderD = factory.newDocumentBuilder();
        //  document = builder.parse(datafile);
		 document = builderD.parse(IOUtils.toInputStream(xml,"UTF-8"));
		 // Use a Transformer for output
		 TransformerFactory tFactory = TransformerFactory.newInstance();
		// StreamSource stylesource = new StreamSource(stylesheet);
		 StreamSource stylesource = new StreamSource(IOUtils.toInputStream(xsl,"UTF-8"));
		 Transformer transformer = tFactory.newTransformer(stylesource);

		 DOMSource source = new DOMSource(document);
     //     StreamResult result = new StreamResult(System.out); // para mostrar na consola
		 StreamResult result = new StreamResult(new StringWriter());  //para colocar num string
		 transformer.transform(source, result);
		return result;
	}
	
	/**
	 * @param doc
	 * @param baseUri
	 * @throws IOException
	 */
	public ByteArrayOutputStream transformHTML2PDF(Document doc, String baseUri) throws IOException {
		XRLog.setLoggingEnabled(false);
		
		PdfRendererBuilder builderP = new PdfRendererBuilder();
		 ByteArrayOutputStream actual = new ByteArrayOutputStream();
		Path fontDirectory = Paths.get(new Config().basePathServer()+"images/IGRP/IGRP2.3/assets/fonts/");
		// PERF: Should only be called once, as each font must be parsed for font family name.
		List<CSSFont> fonts = AutoFont.findFontsInDirectory(fontDirectory);

         // Add fonts to builder.		     
		AutoFont.toBuilder(builderP, fonts);
			//builderP.useCacheStore(CacheStore.PDF_FONT_METRICS, cache);
			//try (OutputStream os = new FileOutputStream(outputPdf)) {

				//builder.withUri(outputPdf);
				builderP.useFastMode();	 
				builderP.withW3cDocument(doc, baseUri);
				//builderP.withHtmlContent(result.getWriter().toString(), baseUri4);
				builderP.toStream(actual);			
				//QR code 
		        DefaultObjectDrawerFactory factoryZ = new DefaultObjectDrawerFactory();
		        factoryZ.registerDrawer("image/barcode", new ZXingObjectDrawer());
		        builderP.useObjectDrawerFactory(factoryZ);

				builderP.run();
				
				return actual;
	}

	
}
