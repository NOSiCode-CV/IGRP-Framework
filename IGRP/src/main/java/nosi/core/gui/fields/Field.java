package nosi.core.gui.fields;

import java.util.Map;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;

/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: interface contain method to implemented in class Fields
 */

public interface Field {
	public String getTagName();
	public String getName();
	public void setName(String name);
	public void setTagName(String tag_name);
	public Object getValue();
	public void setValue(Object value);
	public void setValue(int value);
	public void setValue(float value);
	public void setValue(double value);
	public void setValue(Map<?,?> value);
	public void setDefaultValue(Object defaultValue);
	public void setLabel(String label);
	public String getLabel();
	public FieldProperties propertie();
	public void setLookup(String app,String page,String action);
	public String getLookup();
	public void setVisible(boolean isVisible);
	public boolean isVisible();
	public void setParam(boolean isParam);
	public boolean isParam();
	public void setQuery(BaseQueryInterface query,String prompt);
	public void setQuery(BaseQueryInterface query);
	public void setSqlQuery(String sql);
	public void setSqlQuery(String connectionName,String sql);
	public String getSqlQuery();
	public void setSqlQuery(String connectionName, String tableName, String key, String value);
	public void setSqlQuery(String connectionName,String schemaName, String tableName, String key, String value);
	public void addParam(String string, String string2);
	public void setListOptions( Map<?,?>  map);
	public Map<?,?> getListOptions();
	default void loadDomain(String domain, String string) {}
	default void loadDomain(String domain) {}
	default void addLookupParam(String key,String value) {}
}
