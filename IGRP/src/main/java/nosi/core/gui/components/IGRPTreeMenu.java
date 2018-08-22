package nosi.core.gui.components;


/**
 * @author: Emanuel Pereira
 * 18 Sep 2017
 */
public class IGRPTreeMenu extends IGRPTable {

	public IGRPTreeMenu(String tag_name, String title) {
		super(tag_name, title);
		this.properties.put("type", "treemenu");
	}

	public IGRPTreeMenu(String tag_name) {
		this(tag_name,"");
	}
}
