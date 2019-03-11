package nosi.core.gui.fields;

import java.util.Arrays;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 14, 2017
 *
 * Description: class to generate xml of fields
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import nosi.core.webapp.Core;
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
	public static void toXml(XMLWritter xml, List<Field> fields){
		if(fields.size() > 0){
			xml.startElement("fields");
				for(Field field:fields){
					if(field.isVisible()){
						if(field instanceof HiddenField){
							xml.startElement(field.propertie().getProperty("hidden_formlist")!=null?field.propertie().getProperty("tag"):"hidden");
							field.propertie().remove("maxlength");
						}else{
							xml.startElement(field.getTagName());
						}
						writteAttributes(xml,field.propertie());
						if(!(field instanceof HiddenField)){//Hidden field not contain tag label
							xml.setElement("label", field.getLabel());
						}
						if(!(field instanceof SeparatorField)){//Seprator field not contain tag value
							getXmlValue(xml,field);
						}
						if(field instanceof LookupField){
							String link = field.getLookup()+"&forLookup=true";
							
							for(Entry<String, Object> param:((LookupField) field).getParams().entrySet()){
								link+= "&"+param.getKey()+"="+param.getValue();
							}
							xml.setElement("lookup", link);
						}
						xml.endElement();
					}
				}
			if(view_img.toString().compareTo("") > 0){//add tag view_img in case the View
				xml.setElement("view_img", view_img);//<view_img>http://igrp.teste.gov.cv/images/legislativas/data/img/candidatos/jon_doe.jpg</view_img>
				view_img = "";
			}
			xml.endElement();
		}
	}

	/*
	 * Generate field xml for Generator
	 *  <label>
            <env_fk     name="p_env_fk" type="select"   maxlength="30">Aplicacao</env_fk>
            ...
        </label>
        <value>
        	...
        </value>
         <list>
            <env_fk     name="p_env_fk">
                <option>
                    <text>-- Aplicação --</text>
                    <value />
                </option>
                <option     selected="true">
                    <text>API - Gerador</text>
                    <value>807</value>
                </option>
                ...
            </env_fk>
        </list>
        ...
	 */
	public static void toXmlV21(XMLWritter xml, List<Field> fields){
		if(fields.size() > 0){
			xml.startElement("label");
				for(Field field:fields){
					if(field.isVisible()){
						if(field instanceof HiddenField){
							field.setTagName(field.propertie().getProperty("tag"));
						}
						xml.startElement(field.getTagName());
						writteAttributes(xml,field.propertie());
						xml.text(field.getLabel());
						xml.endElement();
					}
				}
			xml.endElement();
			xml.startElement("value");
				for(Field field:fields){
					if(field.isVisible()){						
						if(!(field instanceof ListField) && !(field instanceof RadioListField) && !(field instanceof CheckBoxListField)){
							if(field instanceof HiddenField){
								xml.startElement("hidden");
							}else{
								xml.startElement(field.getTagName());
							}
							writteAttributes(xml,field.propertie());							
							xml.text(""+field.getValue());
							if(field instanceof LookupField){
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
					}
				}
			xml.endElement();
			xml.startElement("list");
			for(Field field:fields){
				if(field.isVisible()){
					if(field instanceof ListField || field instanceof RadioListField || field instanceof CheckBoxListField){
						xml.startElement(field.getTagName());
						writteAttributes(xml,field.propertie());
						if(field.getValue()!=null && field.getValue() instanceof HashMap){
							HashMap<?,?> values = (HashMap<?, ?>)field.getValue();
							for(Entry<?, ?> obj : values.entrySet()){
								
								xml.startElement("option");
								if(field instanceof ListField && obj.getKey() != null && field.propertie().get("value")!=null && field.propertie().get("value").toString().equals(obj.getKey().toString())){
									xml.writeAttribute("selected", "true");
								}else if((field instanceof CheckBoxListField || field instanceof RadioListField) && obj.getKey() != null && field.propertie().get("value")!=null && field.propertie().get("value").toString().equals(obj.getKey().toString())){
									xml.writeAttribute("checked", "true");
								}
								xml.setElement("text", obj.getValue().toString());
								if(obj.getKey() == null || obj.getKey().toString().equals(""))
									xml.emptyTag("value");
								else
									xml.setElement("value", obj.getKey().toString());
								xml.endElement();
							}
						}
						xml.endElement();
					}
				}
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
		if(field instanceof ListField || field instanceof RadioListField || field instanceof CheckBoxListField){
			xml.startElement("list");
			if(field.getListOptions()!=null && field.getListOptions() instanceof Map<?,?>){
				HashMap<?,?> values = (HashMap<?, ?>)field.getListOptions();
				for(Entry<?, ?> obj : values.entrySet()){
					xml.startElement("option");
					if(field instanceof ListField && field.propertie().get("multiple") != null && field.propertie().get("multiple").equals("true") && field.propertie().get("value") != null && obj.getKey() != null) {
						try {
							Object[] o = (Object[]) field.propertie().get("value");
							
							List<?> aux = Arrays.asList(o);
							
							if(aux.contains(obj.getKey())) 
								xml.writeAttribute("selected", "true");
							
						}catch(Exception e) {
							//e.printStackTrace();
						}
					}else if(field instanceof ListField && obj.getKey() != null && field.propertie().get("value")!=null && field.propertie().get("value").toString().equals(obj.getKey().toString())){
						xml.writeAttribute("selected", "true");
					}else if(field instanceof CheckBoxListField && obj.getKey() != null && field.propertie().get("value")!=null) {
						try {
							String[] x = convertToArrayString(field.propertie().get("value")); 
							if(x!=null) {
								List<String> aux = Arrays.asList(x);
								if(aux.contains(obj.getKey().toString())) { 
									xml.writeAttribute("selected", "true");
								}
							}
						}catch(Exception e) {
							Core.setMessageError(e.getMessage());
						}
					}else if(field instanceof RadioListField && obj.getKey() != null && field.propertie().get("value")!=null && field.propertie().get("value").toString().equals(obj.getKey().toString())){
						xml.writeAttribute("checked", "true");
					}
					xml.setElement("text", obj.getValue().toString());
					if(obj.getKey() == null || obj.getKey().toString().equals(""))
						xml.emptyTag("value");
					else
						xml.setElement("value", obj.getKey().toString());
					xml.endElement();
				}
			}
			xml.endElement();
		}else if(field instanceof HiddenField){
			xml.text((String)field.getValue());
		}else{
			/*if(field instanceof CheckBoxField)
				System.out.println(field.getValue());*/
			xml.setElement("value",field.getValue()!=null?field.getValue().toString():"");
		}
	}

	private static String[] convertToArrayString(Object value) {
		if(value instanceof int[]) {
			return Core.convertArrayIntToArrayString((int[])value);
		}else if(value instanceof float[]) {
			return Core.convertArrayFloatToArrayString((float[])value);
		}else if(value instanceof double[]) {
			return Core.convertArrayDoubleToArrayString((double[])value);
		}else if(value instanceof short[]) {
			return Core.convertArrayShortToArrayString((short[])value);
		}else if(value instanceof Integer[]) {
			return Core.convertArrayObjectToArrayString((Integer[])value);
		}else if(value instanceof Float[]) {
			return Core.convertArrayObjectToArrayString((Float[])value);
		}else if(value instanceof Double[]) {
			return Core.convertArrayObjectToArrayString((Double[])value);
		}else if(value instanceof Short[]) {
			return Core.convertArrayObjectToArrayString((Short[])value);
		}else if(value instanceof String[]) {
			return (String[])value;
		}
		return null;
	}


}
