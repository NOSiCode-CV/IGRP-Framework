package nosi.core.gui.components;

import nosi.core.config.Config;
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
	
	public IGRPComponent(String tag_name,String title) {
		this.tag_name = tag_name;
		this.xml = new XMLWritter();
		this.properties = new FieldProperties();
		this.properties.put("title", title);
		this.connectionName = Config.getBaseConnection();
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

	
}
