package nosi.core.gui.components;

/*Generate XML View
 * View can contain one or more fields
 * <view_1 type="view" xml-type="form" gen-type="container" gen-group="">
        <fields>
        	<number_1 name="p_number_1" type="number" maxlength="30" required="false" change="false" readonly="false" disabled="false" placeholder="" right="false">
                <label>Number</label>
                <value>606</value>
            </number_1>
            ...
        </fields>
   </view_1>
 */
public class ViewXML extends FormXML {

	public ViewXML(String tag_name) {
		super(tag_name);
		this.properties.put("type", "view");
	}

}
