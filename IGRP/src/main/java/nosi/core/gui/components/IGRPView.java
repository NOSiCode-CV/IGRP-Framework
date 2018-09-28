package nosi.core.gui.components;
import nosi.core.config.Config;
import nosi.core.gui.fields.Field;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 14, 2017
 *
 * Description: class to generate xml of View
 */

import nosi.core.gui.fields.ImageField;

/*Generate XML View
 * View can contain one or more fields
 * <view_1 type="view" xml-type="form" gen-type="container" gen-group="">
        <fields>
        	<number_1 name="p_number_1" type="number" maxlength="30" required="false" change="false" readonly="false" disabled="false" placeholder="" right="false">
                <label>Number</label>
                <value>606</value>
            </number_1>
            ...
            <view_img>images/IGRP/IGRP2.3/assets/img/jon_doe.jpg</view_img>
        </fields>
   </view_1>
 */
public class IGRPView extends IGRPForm {

	public IGRPView(String tag_name,String title) {
		super(tag_name,title);
		this.properties.put("type", "view");
//		this.addImageView();
	}
	
	private void addImageView() {
		String tag = tag_name.toLowerCase().replaceAll("p_", "")+"_img";
		Field img = new ImageField(null, tag);
		img.setValue(new Config().getRootPaht()+"images/IGRP/IGRP2.3/assets/img/jon_doe.jpg");		
		img.setLabel("");
		this.addField(img);
	}

	public IGRPView(String tag_name){
		this(tag_name,"");
	}
	
	public IGRPView(String tag_name,String title,float version){
		this(tag_name,title);
		this.version = version;
	}
}
