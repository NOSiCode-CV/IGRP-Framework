package nosi.core.gui.components;

import static nosi.core.i18n.Translator.gt;

import nosi.core.config.ConfigApp;
import nosi.core.gui.fields.FieldProperties;
import nosi.core.xml.XMLWritter;

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
	
	protected IGRPComponent(String tagName,String title) {
		this.tag_name = tagName;
		this.xml = new XMLWritter();
		this.properties = new FieldProperties();
		this.properties.put("title", gt(title));
		this.connectionName = ConfigApp.getInstance().getBaseConnection();
	}
	protected IGRPComponent(String tagName) {
		this(tagName,"");
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
