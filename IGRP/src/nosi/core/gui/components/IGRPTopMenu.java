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

	public void addItem(String title,String app,String page,String link,String target,String img){
		this.buttons.add(new IGRPButton(title, app, page, link, target, img, null, null));
	}

	@Override
	public String toString() {
		xml.startElement("top_menu");
		if(this.buttons.size() > 0){
			for(IGRPButton b:this.buttons){
				xml.startElement("button");
				xml.writeAttribute("type", "specific");
					xml.setElement("title", b.getTitle());
					xml.setElement("link", b.getLink());
					xml.setElement("page", b.getPage());
					xml.setElement("app",b.getApp());
					xml.setElement("target", b.getTarget());
					xml.setElement("img", b.getImg());
				xml.endElement();
			}
		}
		this.buttons = null;
		xml.endElement();
		return xml.toString();
	}
}
