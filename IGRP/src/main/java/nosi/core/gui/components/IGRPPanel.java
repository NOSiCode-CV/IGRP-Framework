package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 18 Sep 2017
 * 
 * Description: Generate XML for Panel
 *  <panels_1 type="panels" xml-type="form" gen-type="container" gen-group="">
	    <fields>
	        <button_1 name="p_button_1" type="button" target_fields="" iconColor="#333" iconClass="" img="fa-angle-right" maxlength="50">
	            <label>Panel Item 1</label>
	            <value/>
	        </button_1>
	    </fields>
	</panels_1>
 */
public class IGRPPanel extends IGRPForm {

	public IGRPPanel(String tag_name, String title) {
		super(tag_name, title);
		this.properties.put("type", "panels");
		this.properties.put("xml-type", "form");
		this.properties.put("gen-type", "container");
		this.properties.put("xml-group", "");
	}

	public IGRPPanel(String tag_name) {
		this(tag_name,"");
	}

}
