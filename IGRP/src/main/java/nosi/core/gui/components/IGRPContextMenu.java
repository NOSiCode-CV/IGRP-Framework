package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of context-menu 
 */
/*
 * <context-menu>
        <item type="specific" code="" rel="button_1" class="default">
            <title>Button</title>
            <app/>
            <page/>
            <link/>
            <target>_blank</target>
            <img>fa-dot-circle-o</img>
        </item>
    </context-menu>
 */
public class IGRPContextMenu extends IGRPToolsBar {

	public IGRPContextMenu() {
		super("context-menu");
	}

}
