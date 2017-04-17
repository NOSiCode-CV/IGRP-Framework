package nosi.core.gui.fields;

public class LookupField extends TextField {

	public LookupField(String name) {
		super(name);
		this.propertie.put("type", "lookup");
	}

}
