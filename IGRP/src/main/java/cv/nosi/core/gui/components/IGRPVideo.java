package cv.nosi.core.gui.components;
import cv.nosi.core.gui.fields.Field;

public class IGRPVideo extends IGRPForm {


	public IGRPVideo(String tag_name,String title) {
		super(tag_name,title);
		this.properties.put("type", "video");
		this.properties.put("xml-type", "video");
	}
	
	public IGRPVideo(String tag_name) {
		this(tag_name,"");
	}
	
	@Override
	public void addField(Field field){
		field.setValue(field.getValue());
		this.fields.add(field);
	}
}
