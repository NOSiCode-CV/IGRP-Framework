package nosi.core.gui.fields;

import java.util.ArrayList;
import java.util.Map.Entry;

import nosi.core.xml.XMLWritter;

public class FieldXML {

	/*Generate xml field
	 * <fields>
            <text_1 name="p_text_1" type="text" maxlength="30" required="false" change="false" readonly="false" disabled="false" placeholder="" right="false">
                <label>Text</label>
                <value>Text 1</value>
            </text_1>
        </fields>
	 */
	public static void toString(XMLWritter xml, ArrayList<Field> fields){
		if(fields.size() > 0){
			xml.startElement("fields");
				for(Field field:fields){
					xml.startElement(field.getTagName());
					//Properties.getXML(xml, field);
					writteAttributes(xml,field.propertie());
					if(!field.propertie().get("type").equals("hidden")){
						xml.setElement("label", field.getLabel());
					}
					getXmlValue(xml,field);
					xml.endElement();
				}
			xml.endElement();
		}
	}

	public static void writteAttributes(XMLWritter xml,java.util.Properties properties) {
		for(Entry<Object, Object> p : properties.entrySet()) {
            xml.writeAttribute(p.getKey().toString(), p.getValue().toString());
        }
	}

	private static void getXmlValue(XMLWritter xml, Field field) {
		if(field.propertie().get("type").toString().compareTo("select") == 0 || field.propertie().get("type").toString().compareTo("radiolist") == 0 || field.propertie().get("type").toString().compareTo("checkboxlist") == 0 ){
			xml.startElement("list");
			for(Entry<Object, Object> obj : field.getOptions().entrySet()){
				xml.startElement("option");
				xml.setElement("text", obj.getKey().toString());
				xml.setElement("value", obj.getValue().toString());
				xml.endElement();
			}
			xml.endElement();
		}else{
			xml.setElement("value", field.getValue().toString());
		}
	}

}
