package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 18, 2017
 *
 * Description: class to generate xml of Quick Button Box
 */
/*
 *<quickbuttonbox_1 type="quickbuttonbox" xml-type="form" gen-type="container" gen-group="">
        <fields>
            <quickbuttonbox_1_tit name="p_quickbuttonbox_1_tit" type="text" maxlength="4000" persist="true">
                <label>Title</label>
                <value>Box Title</value>
            </quickbuttonbox_1_tit>
            ...
        </fields>
    </quickbuttonbox_1>
 */
public class IGRPQuickButtonBox extends IGRPForm {

	public IGRPQuickButtonBox(String tag_name) {
		super(tag_name);
		this.properties.put("type", "quickbuttonbox");
	}
}
