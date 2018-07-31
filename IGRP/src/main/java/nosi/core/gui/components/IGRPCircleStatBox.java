package nosi.core.gui.components;

import nosi.core.gui.fields.GenXMLField;

/**
 * @author: Emanuel Pereira
 * 
 * May 10, 2017
 *
 * Description: class to generate xml of circlestatbox
 */
/*
 * <circlestatbox_1 type="circlestatbox" xml-type="form" gen-type="container" gen-group="">
            <fields>
                <circlestatbox_1_tit name="p_circlestatbox_1_tit" type="text" maxlength="4000" persist="true">
                    <label>Circle Box Title</label>
                    <value>Circle Box Title</value>
                </circlestatbox_1_tit>
                ...
            </fields>
        </circlestatbox_1>
 */
public class IGRPCircleStatBox extends IGRPForm {

	public IGRPCircleStatBox(String tag_name,String title) {
		super(tag_name,title);
		this.properties.put("type", "circlestatbox");
	}
	
	public IGRPCircleStatBox(String tag_name) {
		this(tag_name,"");
		this.properties.put("type", "circlestatbox");
	}
	
}
