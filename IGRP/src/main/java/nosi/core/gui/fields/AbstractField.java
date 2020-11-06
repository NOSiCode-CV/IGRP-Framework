package nosi.core.gui.fields;

/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: abstract class to configure any field
 */

import java.util.Map;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.ConfigApp;
import nosi.core.webapp.mvc.Model;
import nosi.core.webapp.util.helpers.IgrpHelper;
import nosi.core.webapp.util.helpers.Route;
import nosi.core.webapp.util.helpers.database.BaseQueryInterface;

public abstract class AbstractField implements Field {

	private String name;
	private String tag_name;
	private String param_tag;
	private Object value = "";
	private String label = "";
	protected String lookup = "";
	private boolean isVisible = true;
	private boolean isParam = false;
	private String sql;
	private String connectionName = ConfigApp.getInstance().getBaseConnection();
	private Map<?, ?> comboBox;

	public FieldProperties propertie;

	@Override
	public FieldProperties propertie() {
		return this.propertie;
	}

	public AbstractField() {
		this.propertie = new FieldProperties();
	}

	@Override
	public String getLabel() {
		return gt(this.label);
	}

	@Override
	public void setLabel(String label) {
		this.label = label;
	}

	@Override
	public String getTagName() {
		tag_name = this.propertie.get("tag") != null ? this.propertie.get("tag").toString().toLowerCase() : tag_name;
		return tag_name;
	}

	@Override
	public void setTagName(String tag_name) {
		this.tag_name = tag_name;
	}

	@Override
	public String getParamTag() {
		param_tag = this.propertie.get("name") != null ? this.propertie.get("name").toString().toLowerCase() : param_tag;
		return param_tag;
	}

	@Override
	public Object getValue() {
		return value;
	}

	@Override
	public void setValue(Object value) {
		if (value instanceof Model) {
			this.configValue(value);
			if (this.propertie != null && this.getValue() != null)
				this.propertie.put("value", this.getValue());
		} else if (value instanceof Map) {
			this.setListOptions((Map<?, ?>) value);
		} else {
			this.value = value;
		}
	}

	@Override
	public void setValue(int value) {
		this.value = new Integer(value);
	}

	@Override
	public void setValue(float value) {
		this.value = new Float(value);
	}

	@Override
	public void setValue(double value) {
		this.value = new Double(value);
	}

	@Override
	public String getLookup() {
		return lookup;
	}

	@Override
	public void setLookup(String app, String page, String action) {
		this.lookup = Route.getResolveUrl(app, page, action).replace("?", "").replace("webapps", "");
	}

	@Override
	public boolean isVisible() {
		return isVisible;
	}

	@Override
	public void setVisible(boolean isVisible) {
		this.isVisible = isVisible;
	}

	@Override
	public boolean isParam() {
		return isParam;
	}

	@Override
	public void setParam(boolean isParam) {
		this.isParam = isParam;
	}

	@Override
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String getName() {
		return this.name;
	}

	@Override
	public void setSqlQuery(String sql) {
		this.sql = sql;
	}

	@Override
	public void setSqlQuery(String connectionName, String sql) {
		if (connectionName != null && !connectionName.equals("")) {
			this.connectionName = connectionName;
		}
		this.setSqlQuery(sql);
	}

	@Override
	public void setSqlQuery(String connectionName, String tableName, String key, String value) {
		String sql = "";
		if (connectionName != null && !connectionName.equals("") && tableName != null && key != null && value != null) {
			this.connectionName = connectionName;
			sql = "SELECT " + key + ", " + value + " FROM " + tableName;
		}
		this.setSqlQuery(sql);
	}

	@Override
	public void setSqlQuery(String connectionName, String schemaName, String tableName_, String key, String value) {
		String tableName = tableName_;
		if (schemaName != null && !schemaName.equals("")) {
			tableName = schemaName + "." + tableName;
		}
		this.setSqlQuery(connectionName, tableName, key, value);
	}

	@Override
	public String getSqlQuery() {
		return this.sql;
	}

	protected String getConnectionName() {
		return this.connectionName;
	}

	protected void configValue(Object model) {
		this.value = IgrpHelper.getValue(model, this.getName());
	}

	@Override
	public void addParam(String string, String string2) {

	}

	@Override
	public void setValue(Map<?, ?> map) {
		this.comboBox = map;
	}

	@Override
	public void setListOptions(Map<?, ?> map) {
		this.comboBox = map;
	}

	@Override
	public Map<?, ?> getListOptions() {
		return this.comboBox;
	}

	@Override
	public void setQuery(BaseQueryInterface query, String prompt) {
	}

	@Override
	public void setQuery(BaseQueryInterface query) {
	}

	@Override
	public void setDefaultValue(Object defaultValue) {
		// Not set yet
	}
}
