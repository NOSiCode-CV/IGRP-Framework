package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: abstract class to configure any field
 */

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;
import nosi.core.webapp.databse.helpers.Query;

public abstract class AbstractField implements Field{

	private String name;
	private String tag_name;
	private Object value="";
	private String label = "";
	private String lookup = "";
	private boolean isVisible=true;
	private boolean isParam = false;
	private String sql;
	private String connectionName = Config.getBaseConnection();
	
	public FieldProperties propertie;
	
	public FieldProperties propertie(){
		return this.propertie;
	}
	public AbstractField(){
		this.propertie = new FieldProperties();
	}
	public String getLabel() {
		label = label != ""?label:this.propertie.get("name").toString().toUpperCase();
		return gt(label);
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getTagName() {
		tag_name = this.propertie.get("tag")!=null?this.propertie.get("tag").toString().toLowerCase():tag_name;
		return tag_name;
	}
	public void setTagName(String tag_name) {
		this.tag_name = tag_name;
	}	
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
	public void setValue(int value) {
		this.value = value;
	}	
	public void setValue(float value) {
		this.value = value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public String getLookup() {
		return lookup;
	}
	public void setLookup(String lookup) {
		this.lookup = lookup;
	}	
	public boolean isVisible() {
		return isVisible;
	}
	public void setVisible(boolean isVisible) {
		this.isVisible = isVisible;
	}
	public boolean isParam() {
		return isParam;
	}
	public void setParam(boolean isParam) {
		this.isParam = isParam;
	}
	public void setName(String name){
		this.name = name;
	}
	public String getName(){
		return this.name;
	}
	public void setSqlQuery(String sql){
		this.sql = sql;
		this.configValueWithSql();
	}

	public void setSqlQuery(String connectionName,String sql){
		if(connectionName!=null && !connectionName.equals("")){
			this.connectionName = connectionName;
		}
		this.setSqlQuery(sql);
	}

	public void setSqlQuery(String connectionName, String tableName, String key, String value) {
		String sql ="";
		if(connectionName!=null && !connectionName.equals("") && tableName!=null && key!=null && value!=null){
			this.connectionName = connectionName;
			sql = "SELECT "+key+", "+value+" FROM "+tableName;
		}
		this.setSqlQuery(sql);
	}

	public void setSqlQuery(String connectionName,String schemaName, String tableName, String key, String value) {
		if(schemaName!=null && !schemaName.equals("")) {
			tableName = schemaName+"."+tableName;
		}
		this.setSqlQuery(connectionName, tableName, key, value);
	}
	
	public void reselveFieldName(){
		if(this.name!=null && (this.name.startsWith("p_") || this.name.startsWith("P_"))) {
			this.name = this.name.substring(this.name.toLowerCase().indexOf("p_")+"p_".length(), this.name.length());
		}
	}
	
	private void configValueWithSql() {
		if(this.getSqlQuery()!=null && !this.getSqlQuery().equals("")){
			List<Column> cols = DatabaseMetadaHelper.getCollumns(this.getConnectionName(), this.getSqlQuery());
			if(cols.size()!=2){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR,"O seu SQL deve conter apenas 2 campos");
			}else{
				this.value = Query.queryToComboBox(this.getConnectionName(), this.getSqlQuery());
			}
		}
	}
	
	
	public String getSqlQuery(){
		return this.sql;
	}
	
	protected String getConnectionName(){
		return this.connectionName;
	}
	
	protected void configValue(Object model){
		if(model!=null){		
			this.value = "";
			Method[] allMethods = model.getClass().getDeclaredMethods();
		    for (Method m : allMethods) {
		    	String methodName = this.getName().substring(0, 1).toUpperCase()+this.getName().substring(1);
		    	if(m.getName().startsWith("get") && m.getName().equals("get"+methodName)){
			    	try {
			    		if(m.invoke(model)!=null)
			    			this.value = ""+ m.invoke(model);
					} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
						e.printStackTrace();
					}                                                                     
		    	}
		    }
		}
	}
}
