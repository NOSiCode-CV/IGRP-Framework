package nosi.core.gui.fields;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.Tuple;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import nosi.core.webapp.databse.helpers.QueryHelper;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;
import static nosi.core.i18n.Translator.gt;

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
	public void setQuery(QueryHelper query,String prompt) {
		List<Column> cols = DatabaseMetadaHelper.getCollumns(query.getConnectionName(), query.getSql());
		Map<Object,Object> map = new LinkedHashMap<>();
		if(prompt!=null)
			map.put(null, prompt);
		for(Tuple t:query.getResultList()){
			try {
				map.put(t.get(cols.get(0).getName()), t.get(cols.get(1).getName()));
			}catch(IllegalArgumentException e) {
				
			}
		}
		this.setValue(map);
	}
	@Override
	public void setQuery(QueryHelper query) {
		this.setQuery(query, null);
	}

	@Override
	public void setDefaultValue(Object defaultValue) {
		this.propertie.put("value", defaultValue);
	}
}
