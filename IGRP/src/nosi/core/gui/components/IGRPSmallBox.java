package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 18, 2017
 *
 * Description: class to generate xml of smallbox
 */
/*<smallbox_1 type="smallbox" xml-type="form" gen-type="container" gen-group="">
        <fields>
            <smallbox_1_tit name="p_smallbox_1_tit" type="text" maxlength="4000" persist="true">
                <label>Small Box Title</label>
                <value>Small Box Title</value>
            </smallbox_1_tit>
            ...
        </fields>
    </smallbox_1>
 */
public class IGRPSmallBox extends IGRPForm {

	public IGRPSmallBox(String tag_name) {
		super(tag_name);
		this.properties.put("type", "smallbox");
	}

}
