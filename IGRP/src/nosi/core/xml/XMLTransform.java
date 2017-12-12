package nosi.core.xml;

import java.io.ByteArrayOutputStream;
import java.nio.file.Paths;
import java.util.List;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.NumberField;
import nosi.core.gui.fields.TextField;
import nosi.core.gui.page.Page;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Config_env;

/**
 * Emanuel
 * 11 Dec 2017
 */
public class XMLTransform {

	public static String genXML(String path_xsl,String xmlContent,Action page) {
		XMLWritter xml = new XMLWritter("rows", path_xsl, "utf-8");
		xml.addXml(Config.getHeader(page));
		xml.startElement("content");
		xml.writeAttribute("type", "");
		xml.setElement("title", "");
			xml.addXml(xmlContent);
		xml.endElement();//close tag content
		xml.endElement();//close tag rows
		return xml.toString();
	}

	public static String generateXMLForm(Config_env config,String tableName, List<DatabaseMetadaHelper.Column> columns) {
		tableName = Page.getPageName(tableName);
		XMLWritter xml = new XMLWritter();		
		IGRPForm form = new IGRPForm("form_1",tableName);
		IGRPToolsBar tools = new IGRPToolsBar("tools_bar");
		IGRPButton btn_gravar = new IGRPButton("Gravar", config.getApplication().getDad().toLowerCase(), tableName, "gravar", "submit", "info|fa-save","","",true);
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		tools.addButton(btn_gravar);
		columns.stream().forEach(column->{
			Field f = XMLTransform.getGenFiled(column);
			form.addField(f);
		});
		xml.addXml(tools.toString());
		xml.addXml(form.toString());
		return xml.toString();
	}

	public static String generateXMLTable(Config_env config,String tableName, List<DatabaseMetadaHelper.Column> columns) {
		tableName = Page.getPageName(tableName);
		XMLWritter xml = new XMLWritter();		
		IGRPTable table = new IGRPTable("table_1",tableName);
		IGRPButton btn_editar = new IGRPButton("Editar", config.getApplication().getDad().toLowerCase(), tableName, "editar", "submit", "warning|fa-edit","","",true);
		btn_editar.propertie.add("type","specific").add("code","").add("rel","editar");
		IGRPButton btn_eliminar = new IGRPButton("Eliminar", config.getApplication().getDad().toLowerCase(), tableName, "eliminar", "submit", "danger|fa-trash-o","","",true);
		btn_eliminar.propertie.add("type","specific").add("code","").add("rel","eliminar");
		columns.stream().forEach(column->{
			Field f = XMLTransform.getGenFiled(column);
			table.addField(f);
		});
		table.addButton(btn_editar);
		table.addButton(btn_eliminar);
		xml.addXml(table.toString());
		return xml.toString();
	}
	
	public static Field getGenFiled(DatabaseMetadaHelper.Column column) {
		Field f = null;
		System.out.println(column.getName()+":"+column.getType().toString());
		switch (column.getType().toString()) {
			case "java.long.String":
				f = new NumberField(null, column.getName());
				break;	
			default:
				f = new TextField(null, column.getName());
				break;
		}
		configureProperties(f,column);
		return f;
	}
	
	private static void configureProperties(Field f,DatabaseMetadaHelper.Column column) {
		if(f!=null){
			
		}
	}

	public static String xmlTransformWithXSL(String xmlFileName,String xslFileName) throws TransformerConfigurationException{
		StreamSource xlsStreamSource = new StreamSource(Paths.get(xslFileName).toAbsolutePath().toFile());
	    StreamSource xmlStreamSource = new StreamSource(Paths.get(xmlFileName).toAbsolutePath().toFile());
	    TransformerFactory transformerFactory = TransformerFactory.newInstance();
	    StreamResult result = new StreamResult(new ByteArrayOutputStream());
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
