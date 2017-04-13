package nosi.core.gui.fields;

public class TextField extends AbstractField {

	public TextField(String name){
		this.setType("text");
		this.setTagName(name);
		this.setName("p_"+name);
	}

}
