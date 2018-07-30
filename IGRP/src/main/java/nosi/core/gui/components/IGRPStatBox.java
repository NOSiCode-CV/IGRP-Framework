package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 18, 2017
 *
 * Description: class to generate xml of statbox
 */
/*<statbox_1 type="statbox" xml-type="form" gen-type="container" gen-group="">
        <fields>
            <statbox_1_tit name="p_statbox_1_tit" type="text" maxlength="4000" persist="true">
                <label>Box Title</label>
                <value>Box Title</value>
            </statbox_1_tit>
            ...
        </fields>
    </statbox_1>
 */
public class IGRPStatBox extends IGRPForm {

	public IGRPStatBox(String tag_name,String title) {
		super(tag_name,title);
		this.properties.put("type", "statbox");
	}
	public IGRPStatBox(String tag_name) {
		this(tag_name,"");
	}

}
