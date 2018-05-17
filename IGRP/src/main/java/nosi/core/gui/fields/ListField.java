package nosi.core.gui.fields;

import java.util.LinkedHashMap;
import java.util.Map;
import javax.persistence.Tuple;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.webapp.helpers.IgrpHelper;

/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure list field
 */


public class ListField extends AbstractField {
	public Object value = null;
	
	public ListField(Object model, String name){
		super();
		this.setName(name);
		this.propertie.put("type","select");
		this.propertie.put("name","p_"+name);
		this.propertie.put("multiple", false);
		this.propertie.put("right", false);
		this.propertie.put("disabled", false);
		this.propertie.put("maxlength", 30);
		this.propertie.put("change", false);
		this.propertie.put("required", false);
		this.setTagName(name);
		this.configValue(model);
		this.propertie.put("value", this.getValue());
		this.value = null;
	}
	
	@Override
	protected void configValue(Object model){
		if(!this.propertie.get("multiple").equals("true")) {
			this.setValue("" + IgrpHelper.getValue(model, this.getName()));
		}
		else
			this.setValue(IgrpHelper.getValueArray(model, this.getName()));
	}
	
	@Override
	public void setQuery(BaseQueryInterface query,String prompt) {
		Map<Object,Object> map = new LinkedHashMap<>();
		if(prompt!=null)
			map.put(null, prompt);
		for(Tuple t:query.getResultList()){
			try {
				map.put(t.get(0), t.get(1));
			}catch(IllegalArgumentException e) {
				
			}
		}
		this.setValue(map);
	}
	@Override
	public void setQuery(BaseQueryInterface query) {
		this.setQuery(query, null);
	}

	@Override
	public void setDefaultValue(Object defaultValue) {
		this.propertie.put("value", defaultValue);
	}
}
