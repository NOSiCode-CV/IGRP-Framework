package nosi.core.webapp.webservices.biztalk.dao;


import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import com.google.gson.annotations.Expose;
import nosi.core.webapp.helpers.Helper;
import nosi.core.xml.XMLWritter;
/**
 * @author: Emanuel Pereira
 * 15 Nov 2017
 */
public class Request{

	public String prepare(ServiceSerach service,String type) {
		if(type.equalsIgnoreCase("xml")){
			return this.prepareXmlRequest(service);
		}else if(type.equalsIgnoreCase("json")){
			return this.prepareJsonRequest(service);			
		}
		return null;
	}


	private String prepareJsonRequest(ServiceSerach service) {
		// TODO Auto-generated method stub
		return null;
	}

	private String prepareXmlRequest(ServiceSerach service) {
		XMLWritter xml = new XMLWritter();
		xml.startElement("rows");
			xml.startElement("row");
				xml.setElement("mimetype", "xml");
				for(Field field:service.getClass().getDeclaredFields()){
					for(Annotation anotation:field.getDeclaredAnnotationsByType(Expose.class)){
						Expose a = (Expose) anotation;
						if(a.serialize()){
							String value = Helper.getValue(service, field.getName());
							if(value!=null && !value.equals("") && !value.equals("0")){
								xml.setElement(field.getName(),value);
							}
						}
					}
				}
			xml.endElement();
		xml.endElement();
		return xml.toString();
	}
}
