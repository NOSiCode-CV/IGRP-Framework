package nosi.core.gui.components;

import nosi.core.config.Config;
import nosi.core.gui.fields.FieldProperties;
import nosi.core.xml.XMLWritter;
import static nosi.core.i18n.Translator.gt;

/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 */

public abstract class IGRPComponent {

	protected XMLWritter xml;
	protected String tag_name;
	protected FieldProperties properties;
	protected String connectionName;
	private boolean isVisible = true;
	
	public IGRPComponent(String tag_name,String title) {
		this.tag_name = tag_name;
		this.xml = new XMLWritter();
		this.properties = new FieldProperties();
		this.properties.put("title", gt(title));
		this.connectionName = new Config().getBaseConnection();
	}
	public IGRPComponent(String tag_name) {
		this(tag_name,"");
	}
	
	public abstract String toString();
	
	public String getConnectionName() {
		return connectionName;
	}
	public void setConnectionName(String connectionName) {
		this.connectionName = connectionName;
	}

	public void setTitle(String title){
		this.properties.put("title", gt(title));
	}
	
	public boolean isVisible() {
		return isVisible;
	}
	
	public void setVisible(boolean isVisible) {
		this.isVisible = isVisible;
	}
	
	public FieldProperties getProperties() {
		return properties;
	}
	
	public void setProperties(FieldProperties properties) {
		this.properties = properties;
	}
	
	
}
