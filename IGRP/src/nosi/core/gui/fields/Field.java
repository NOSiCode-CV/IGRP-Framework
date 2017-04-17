package nosi.core.gui.fields;

import java.util.HashMap;
import java.util.Properties;

public interface Field {
	public String getTagName();
	public void setTagName(String tag_name);
	public Object getValue();
	public void setValue(Object value);
	public void setValue(int value);
	public void setValue(float value);
	public void setValue(double value);
	public void addOption(Object name,Object value);
	public HashMap<Object,Object> getOptions();
	public void setLabel(String label);
	public String getLabel();
	public Properties propertie();
	public void setLookup(String lookup);
	public String getLookup();
}
