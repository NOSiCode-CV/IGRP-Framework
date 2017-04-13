package nosi.core.gui.fields;

public class TextField extends AbstractField {

	public TextField(String name){
		super();
		this.propertie.setType("text");
		this.setTagName(name);
		this.propertie.setName("p_"+name);
	}

}
