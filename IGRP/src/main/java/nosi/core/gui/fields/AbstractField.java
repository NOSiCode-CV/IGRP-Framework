package nosi.core.gui.fields;

import java.util.Map;
import nosi.core.config.ConfigApp;
import nosi.core.webapp.Model;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.helpers.Route;

import static nosi.core.i18n.Translator.gt;

/**
 * @author: Emanuel Pereira
 * <p>
 * Apr 13, 2017
 *
 * Description: abstract class to configure any field
 */

public abstract class AbstractField implements Field {

	private String name;
	private String tagName;
	private String paramTag;
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

	protected AbstractField() {
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
		tagName = this.propertie.get("tag") != null ? this.propertie.get("tag").toString().toLowerCase() : tagName;
		return tagName;
	}

	@Override
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	@Override
	public String getParamTag() {
		paramTag = this.propertie.get("name") != null ? this.propertie.get("name").toString().toLowerCase() : paramTag;
		return paramTag;
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
		this.value = value;
	}

	@Override
	public void setValue(float value) {
		this.value = value;
	}

	@Override
	public void setValue(double value) {
		this.value = value;
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
		if (connectionName != null && !connectionName.isEmpty()) {
			this.connectionName = connectionName;
		}
		this.setSqlQuery(sql);
	}

	@Override
	public void setSqlQuery(String connectionName, String tableName, String key, String value) {
		String sqlQ = "";
		if (connectionName != null && !connectionName.isEmpty() && tableName != null && key != null && value != null) {
			this.connectionName = connectionName;
			sqlQ = "SELECT " + key + ", " + value + " FROM " + tableName;
		}
		this.setSqlQuery(sqlQ);
	}

	@Override
	public void setSqlQuery(String connectionName, String schemaName, String tableName_, String key, String value) {
		String tableName = tableName_;
		if (schemaName != null && !schemaName.isEmpty()) {
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
