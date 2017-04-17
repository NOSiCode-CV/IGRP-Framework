package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure file field
 */
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
