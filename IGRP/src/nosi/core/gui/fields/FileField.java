package nosi.core.gui.fields;

public class FileField extends TextField {

	public FileField(String name) {
		super(name);
		this.propertie.put("type","file");
		this.propertie.put("accept","file_extension");
		this.propertie.put("class","default");
		this.propertie.put("multiple", false);
		this.propertie.remove("placeholder");
		this.propertie.remove("change");
		this.propertie.remove("readonly");
	}

}
