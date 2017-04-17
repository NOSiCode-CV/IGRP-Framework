package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 14, 2017
 *
 * Description: class to generate xml of View
 */
import nosi.core.gui.fields.GenXMLField;

/*Generate XML View
 * View can contain one or more fields
 * <view_1 type="view" xml-type="form" gen-type="container" gen-group="">
        <fields>
        	<number_1 name="p_number_1" type="number" maxlength="30" required="false" change="false" readonly="false" disabled="false" placeholder="" right="false">
                <label>Number</label>
                <value>606</value>
            </number_1>
            ...
            <view_img>http://igrp.teste.gov.cv/images/legislativas/data/img/candidatos/jon_doe.jpg</view_img>
        </fields>
   </view_1>
 */
public class IGRPView extends IGRPForm {

	public IGRPView(String tag_name) {
		super(tag_name);
		this.properties.put("type", "view");
		//<view_img>http://igrp.teste.gov.cv/images/legislativas/data/img/candidatos/jon_doe.jpg</view_img>
		GenXMLField.view_img = "http://igrp.teste.gov.cv/images/legislativas/data/img/candidatos/jon_doe.jpg";
	}
}
