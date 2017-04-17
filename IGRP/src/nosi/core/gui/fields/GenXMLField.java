package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 14, 2017
 *
 * Description: class to generate xml of fields
 */
import java.util.ArrayList;
import java.util.Map.Entry;

import nosi.core.xml.XMLWritter;

public class GenXMLField {

	public static String view_img = "";
	/*Generate xml field
	 * <fields>
            <text_1 name="p_text_1" type="text" maxlength="30" required="false" change="false" readonly="false" disabled="false" placeholder="" right="false">
                <label>Text</label>
                <value>Text 1</value>
            </text_1>
        </fields>
	 */
	public static void toXml(XMLWritter xml, ArrayList<Field> fields){
		if(fields.size() > 0){
			xml.startElement("fields");
				for(Field field:fields){
					xml.startElement(field.getTagName());
					writteAttributes(xml,field.propertie());
					if(field.propertie().get("type").toString().compareTo("hidden")!=0){//Hidden field not contain tag label
						xml.setElement("label", field.getLabel());
					}
					if(field.propertie().get("type").toString().compareTo("separator")!=0){//Seprator field not contain tag value
						getXmlValue(xml,field);
					}
					if(field.propertie().get("type").toString().compareTo("lookup")==0){
						xml.setElement("lookup", field.getLookup());
						/*
						 * <lookup_1 name="p_lookup_1" type="lookup" action="" page="" app="" class="default" required="false" change="false" readonly="false" disabled="false" maxlength="30" placeholder="" right="false">
			                    <label>Lookup</label>
			                    <value/>
			                    <lookup>http://xpto/file.xml</lookup>
			                </lookup_1>
						 */
					}
					xml.endElement();
				}
			if(view_img.toString().compareTo("") > 0){//add tag view_img in case the View
				xml.setElement("view_img", view_img);//<view_img>http://igrp.teste.gov.cv/images/legislativas/data/img/candidatos/jon_doe.jpg</view_img>
				view_img = "";
			}
			xml.endElement();
		}
	}

	/*Generate attributes
	 * name="p_text_1" type="text"
	 */
	public static void writteAttributes(XMLWritter xml,java.util.Properties properties) {
		for(Entry<Object, Object> p : properties.entrySet()) {
            xml.writeAttribute(p.getKey().toString(), p.getValue().toString());
        }
	}
	
	/*Generate xml value
	 * <value>Text 1</value>
	 */
	private static void getXmlValue(XMLWritter xml, Field field) {
		if(field.propertie().get("type").toString().compareTo("select") == 0 || field.propertie().get("type").toString().compareTo("radiolist") == 0 || field.propertie().get("type").toString().compareTo("checkboxlist") == 0 ){
			xml.startElement("list");
			for(Entry<Object, Object> obj : field.getOptions().entrySet()){
				xml.startElement("option");
				xml.setElement("text", obj.getValue().toString());
				xml.setElement("value", obj.getKey().toString());
				xml.endElement();
			}
			xml.endElement();
		}else{
			xml.setElement("value", field.getValue().toString());
		}
	}

}
