package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 19, 2017
 *
 * Description: class to generate xml of Vertical Menu
 */
/*
 * /*Generate XML Table
 <verticalmenu_1 type="verticalmenu" xml-type="verticalmenu" gen-type="menu" gen-group="">
    <item type="specific" code="" rel="button_1">
        <title>Button</title>
        <app>RED</app>
        <page>BIBLIO</page>
        <link>BIB-DET</link>
        <target>_blank</target>
        <img>default|fa-angle-right</img>
        <parameter>http://igrp.teste.gov.cv/images/IGRP/app/RED/xml/RED_BIBLIO_BIB-DET_dash.xml</parameter>
    </item>
    ...
</verticalmenu_1>
 */
public class IGRPVerticalMenu extends IGRPToolsBar { 
	
	public IGRPVerticalMenu(String tag_name) {
		super(tag_name);
		this.type="verticalmenu";
	}

}
