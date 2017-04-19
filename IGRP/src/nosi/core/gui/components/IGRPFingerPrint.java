package nosi.core.gui.components;

public class IGRPFingerPrint extends IGRPForm {

	public IGRPFingerPrint(String tag_name,String title) {
		super(tag_name);
		this.properties.put("type", "fingerprint");
		this.properties.put("title", title);
	}
}
