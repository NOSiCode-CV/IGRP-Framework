package nosi.core.gui.components;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: Emanuel Pereira
 * 28 Sep 2017
 */
public class IGRPTopMenu extends IGRPComponent{

	private List<IGRPButton> buttons;
	
	public IGRPTopMenu(String tag_name) {
		super(tag_name);
		this.buttons = new ArrayList<>();
	}

	public void addItem(String title,String app,String page,String link,String target,String img,String prefix){
		IGRPButton button = new IGRPButton(title, app, page, link, target, img, null, null);
		button.setPrefix(prefix);
		this.buttons.add(button );
	}

	@Override
	public String toString() {
		xml.startElement("top_menu");
		if(this.buttons.size() > 0){
			for(IGRPButton b:this.buttons){
				b.setTag("button");
				xml.addXml(b.toString());
			}
		}
		this.buttons = null;
		xml.endElement();
		return xml.toString();
	}
}
