package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * May 10, 2017
 *
 * Description: class to generate xml of carousel
 */
/*
 * <carousel_1 type="carousel" xml-type="carousel" gen-type="menu" gen-group="">
        <item type="specific" code="" rel="img_1">
            <title>Img</title>
            <app/>
            <page/>
            <link/>
            <target/>
            <img/>
            <parameter/>
        </item>
    </carousel_1>
 */

import nosi.core.gui.fields.GenXMLField;

public class IGRPCarousel  extends IGRPComponent{
	
	public IGRPCarousel(String tag_name,String title){
		super(tag_name,title);
		this.properties.put("type", "carousel");
		this.properties.put("xml-type", "carousel");
		this.properties.put("gen-type", "menu");
		this.properties.put("gen-group", "");
	}
	
	public IGRPCarousel(String tag_name){
		this(tag_name,"");
	}
	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(xml, properties);
		this.xml.endElement();
		return this.xml.toString();
	}
}
