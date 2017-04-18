package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of SeparatorList
 */
/*
 * /*Generate XML SeparatorList
 *<separatorlist_1 type="separatorlist" structure="fields">
    <fields>
        <number_1 name="p_number_1" type="number" align="left" lookup_parser="false">
            <label>Number</label>
        </number_1>
        ...
    </fields>
    <table>
        <value>
            <row>
                <number_1>527</number_1>
                <number_1_desc>527</number_1_desc>
                <text_1>Magna dolor labore ipsum totam</text_1>
                <text_1_desc>Magna dolor labore ipsum totam</text_1_desc>
            </row>
            ...
        </value>
    </table>
</separatorlist_1>
 */
public class IGRPSeparatorList extends IGRPFormList {

	public IGRPSeparatorList(String tag_name) {
		super(tag_name);
		this.properties.put("type", "separatorlist");
	}

}
