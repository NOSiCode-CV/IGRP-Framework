package nosi.core.webapp.helpers.dao_helper;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Set;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;

/**
 * Isaias.Nunes Aug 27, 2019
 */
public class SaveMapeamentoDAO {

	private SaveMapeamentoDAO() {}

	public static String getHibernateConfig(final String path) {
		try {
			return new String(Files.readAllBytes(Paths.get(path)));
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		}
	}

	public static void saveMappings(final String hibernateConfigFileName, final Set<String> newMappings) {

		try {
			
			if (newMappings.isEmpty())
				return;

			final String hibernateConfigDirectoryPath = new Config().getPathConexao();
			final String hibernateConfigFilePath = hibernateConfigDirectoryPath + File.separator + hibernateConfigFileName;
			final String xml = getHibernateConfig(hibernateConfigFilePath);
			
			if (xml.isEmpty())
				return;
			
			final Document document = new SAXReader().read(new StringReader(xml));
			
			final Element root = document.getRootElement();

			final Element sessionFactory = root.element("session-factory");

			// Remove mappings that already exist
			sessionFactory.elements("mapping").forEach(obj -> newMappings.remove(obj.attributeValue("class")));

			if (newMappings.isEmpty())
				return;

			// Add new mappings
			newMappings.forEach(value -> sessionFactory.addElement("mapping").addAttribute("class", value));

			final StringWriter sw = new StringWriter();
			final XMLWriter xmlWriter = new XMLWriter(sw, getXmlOutputFormatter());
			xmlWriter.write(document);

			final String newXml = sw.toString();

			if (Core.isNotNull(newXml))
				FileHelper.save(hibernateConfigDirectoryPath, hibernateConfigFileName, newXml);

		} catch (Exception e) {
			e.printStackTrace();
			Core.setMessageError("Ocorreu um erro ao salvar o mapeamento das classes. Tente manualmente.");
		}
	}
	
	private static OutputFormat getXmlOutputFormatter() {
		final OutputFormat outputFormat = OutputFormat.createPrettyPrint();
		outputFormat.setIndentSize(4);
		outputFormat.setSuppressDeclaration(false);
		outputFormat.setEncoding(StandardCharsets.UTF_8.name());
		outputFormat.setNewlines(true);
		return outputFormat;
	}

}
