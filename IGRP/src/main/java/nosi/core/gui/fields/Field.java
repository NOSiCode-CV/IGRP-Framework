package nosi.core.gui.fields;

import java.util.Map;

import nosi.core.webapp.databse.helpers.BaseQueryInterface;

/**
 * {@code @author:} Emanuel Pereira
 * <p>
 * Apr 17, 2017
 * <p>
 * Description: interface that contains methods to implemented in class Fields
 */

public interface Field {
   String getParamTag();

   String getTagName();

   String getName();

   void setName(String name);

   void setTagName(String tagName);

   Object getValue();

   void setValue(Object value);

   void setValue(int value);

   void setValue(float value);

   void setValue(double value);

   void setValue(Map<?, ?> value);

   void setDefaultValue(Object defaultValue);

   void setLabel(String label);

   String getLabel();

   FieldProperties propertie();

   void setLookup(String app, String page, String action);

   String getLookup();

   void setVisible(boolean isVisible);

   boolean isVisible();

   void setParam(boolean isParam);

   boolean isParam();

   void setQuery(BaseQueryInterface query, String prompt);

   void setQuery(BaseQueryInterface query);

   void setSqlQuery(String sql);

   void setSqlQuery(String connectionName, String sql);

   String getSqlQuery();

   void setSqlQuery(String connectionName, String tableName, String key, String value);

   void setSqlQuery(String connectionName, String schemaName, String tableName, String key, String value);

   void addParam(String string, String string2);

   void setListOptions(Map<?, ?> map);

   Map<?, ?> getListOptions();

   default void loadDomain(String domain, String string) {
   }

   default void loadDomain(String domain) {
   }

   default void loadDomain(String domain, String codeApp, String string) {
   }

   default void loadDomainByApp(String domain, String codeApp) {
   }

   default void addLookupParam(String key, String value) {
   }

   default int vertionLookup() {
      return 1;
   }
}
