package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 18, 2017
 *
 * Description: class to generate xml for iframe
 *
 /*
<iframe_1 type="iframe" xml-type="iframe" gen-type="container" gen-group="">  
    <fields>
        <iframe_1_src name="p_iframe_1_src" type="text" maxlength="4000">
            <label>Iframe Source</label>
            <value>http://igrp.teste.gov.cv/images/IGRP/app/RED/xml/RED_BIBLIO_BIB-DET_dash.xml</value>
        </iframe_1_src>
    </fields>
</iframe_1>
*/

import nosi.core.gui.fields.Field;

public class IGRPIframe extends IGRPForm {

	public IGRPIframe(String tag_name) {
		super(tag_name);
		this.properties.put("type", "iframe");
		this.properties.put("xml-type", "iframe");
	}
	
	@Override
	public void addField(Field field){
		field.setValue("<![CDATA["+field.getValue()+"]]>");
		this.fields.add(field);
	}
}
