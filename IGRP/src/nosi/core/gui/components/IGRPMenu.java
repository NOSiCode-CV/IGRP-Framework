package nosi.core.gui.components;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Set;

import nosi.core.gui.fields.GenXMLField;

/**
 * @author: Emanuel Pereira
 * 
 * 14 Jun 2017
 *
 * Description: class to generate xml for Menu
 *
 /*
<menu		type="tabmenu">
	<group		title="Reports">
		<item		type="">
			<title>report</title>
			<app>//ADBABB</app>
			<page>//</page>
			<link>//</link>
			<target>specific</target>
		</item>
	</group>
	<group		title="Data Source">
		<item		type="">
			<title>data sorce</title>
			<app>//ADBABB</app>
			<page>//</page>
			<link>//</link>
			<target>specific</target>
		</item>
	</group>
</menu>
*/
public class IGRPMenu extends IGRPComponent{
	private HashMap<String,ArrayList<IGRPButton>> groups;
	public IGRPMenu(String tag_name) {
		super(tag_name);
		this.groups = new HashMap<>();
	}

	public void addGroup(String title,IGRPButton item){
		if(this.groups.size()>0 && this.groups.get(title)!=null){
			ArrayList<IGRPButton> value = new ArrayList<>();
			value.add(item);
			value.addAll(this.groups.get(title));
			this.groups.put(title, value);
		}else{
			ArrayList<IGRPButton> value = new ArrayList<>();
			value.add(item);
			this.groups.put(title, value);
		}
	}
	
	private void genItem(String tag,IGRPButton item){
		xml.startElement(tag);
		GenXMLField.writteAttributes(xml, item.getProperties());
		xml.setElement("title", item.getTitle());
		xml.setElement("app", item.getApp());
		xml.setElement("page", item.getPage());
		xml.setElement("link", item.getLink());
		xml.setElement("target", item.getTarget());
		xml.setElement("img", item.getImg());
		if(item.getParams().compareTo("") != 0){
			xml.setElement("params", item.getParams());
		}
		if(item.getParams().compareTo("") != 0){
			xml.setElement("parameter", item.getParameter());
		}
		xml.endElement();
	}
	
	@Override
	public String toString() {
		if(this.groups.size() > 0){
			xml.startElement(this.tag_name);
			xml.writeAttribute("type","tabmenu");
				Set<Entry<String, ArrayList<IGRPButton>>> list = this.groups.entrySet();
				for(Entry<String, ArrayList<IGRPButton>> g:list){
					xml.startElement("group");
					xml.writeAttribute("title", g.getKey());
						for(IGRPButton itens:g.getValue())
							this.genItem("item", itens);
					xml.endElement();
				}
			xml.endElement();
		}
		this.groups = null;
		return xml.toString();
	}

}
