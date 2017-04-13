package nosi.core.gui.fields;

public class CheckBoxListField extends ListField {

	public CheckBoxListField(String name) {
		super(name);
		this.propertie.put("type","checkboxlist");
		this.propertie.remove("multiple");
	}
}
