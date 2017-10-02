package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure lookup field
 */
import java.util.Map;
import java.util.HashMap;

public class LookupField extends TextField {

	private Map<String,Object> params;
	
	public LookupField(Object model,String name) {
		super(model,name);
		this.propertie.put("type", "lookup");
		this.params = new HashMap<>();
	}

	public void addParam(String key,String value){
		this.params.put(key, value);
	}
	
	public Map<String,Object> getParams(){
		return this.params;
	}
}
