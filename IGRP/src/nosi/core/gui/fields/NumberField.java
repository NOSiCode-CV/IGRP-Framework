package nosi.core.gui.fields;

public class NumberField extends TextField {

	public NumberField(String name){
		super(name);
		this.propertie.put("type","number");
	}
}
