package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: interface contain method to implemented in class Fields
 */

public interface Field {
	public String getTagName();
	public void setTagName(String tag_name);
	public Object getValue();
	public void setValue(Object value);
	public void setValue(int value);
	public void setValue(float value);
	public void setValue(double value);
	public void setLabel(String label);
	public String getLabel();
	public FieldProperties propertie();
	public void setLookup(String lookup);
	public String getLookup();
	public void setVisible(boolean isVisible);
	public boolean isVisible();
	public void setParam(boolean isParam);
	public boolean isParam();
}
