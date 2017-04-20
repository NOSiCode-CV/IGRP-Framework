package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of Paragraph
 */
/*
 * <paragraph_1 type="paragraph" structure="text">
        <fields>
            <text>
                <value>
                    <![CDATA[Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.]]>
                </value>
            </text>
        </fields>
    </paragraph_1>
 */
public class IGRPParagraph extends IGRPSectionHeader {

	public IGRPParagraph(String tag) {
		super(tag);
		this.properties.put("type", "paragraph");
	}

}
