package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure number field
 */
public class NumberField extends TextField {

	public NumberField(Object model,String name){
		super(model,name);
		this.propertie.put("type","number");
	}
}
