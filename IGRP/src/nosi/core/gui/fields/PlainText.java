package nosi.core.gui.fields;

public class PlainText extends AbstractField {

	public PlainText(String name) {
		super();
		this.propertie.put("type","plaintext");
		this.setTagName(name);
		this.propertie.put("name","p_"+name);
		this.propertie.put("clear", false);
		this.propertie.put("maxlength", 30);
		this.propertie.put("right", false);
	}

}
