


package nosi.core.webapp.datasource.helpers;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import javax.persistence.Parameter;
import javax.persistence.Query;
import javax.persistence.Tuple;

import org.hibernate.Session;

import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.SqlJavaType;
import nosi.core.webapp.databse.helpers.ResultSet.Record;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateSource;

/**
 * Emanuel
 * 24 Aug 2018
 */
public class DataSourceHelpers {

	private XMLWritter xmlRows; 
	
	public static final int QUERY_TIMEOUT = 10; // 5s 

	public Map<Integer,String> getListSources(Integer id){
		HashMap<Integer,String> lista = new HashMap<>();
		for(RepSource rep:new RepSource().find()
				.andWhere("application", "=",id)
				.andWhere("status", "=", 1).all()){
			lista.put(rep.getId(), rep.getName());
		}
		return lista;
	}
	
	/*Extract columns in Query Select and Check if the column is a parameter
	 * 
	 * Example: SELECT ID, NAME, EMAIL from tbl_user
	 * 
	 * The columns extracted is: id, name, email
	 * 
	 */
	public Set<Properties> getColumns(RepSource rs,Integer template_id,String query_) {
		Set<Properties> columns = new LinkedHashSet<>();
		Connection con = nosi.core.webapp.databse.helpers.Connection.getConnection(rs.getConfig_env());
		if(con!=null) {
			try {
				
				try(Statement s = con.createStatement()){
				Set<String> keys = getParamsName(rs,template_id);
				String query =query_.replaceAll(":\\w+", "null");
				ResultSetMetaData rsd =s.executeQuery(query).getMetaData();
				for(int i=1;i<=rsd.getColumnCount();i++){
					Properties p = new Properties();
					//Set propertie true if column is a parameter
					p.put("key", keys.contains(rsd.getColumnName(i).toLowerCase())?"true":"false");
					p.put("name","p_"+rsd.getColumnName(i).toLowerCase());
					p.put("tag",rsd.getColumnName(i).toLowerCase());
					p.put("type",SqlJavaType.sqlToJava(rsd.getColumnType(i)).toString().replace("class ", ""));
					columns.add(p);
				}
				
				}
				} catch (SQLException e) {
				e.printStackTrace();
				}finally{				
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}			
		}
		return columns;
	}
	
	

	public Set<String> getParamsName(RepSource rs,Integer template_id){
		Set<String> params = new HashSet<>();
		
		if(template_id!=0){
			Map<String,String> p = this.getParams(template_id,rs.getId());
			params.addAll(p.keySet());
		}
		return params;
	}
	
	private Map<String,String> getParams(Integer template_id,Integer idreportSoruce) {
		Map<String,String> params = new HashMap<>();
		RepTemplateSource rtp = new RepTemplateSource();
		List<RepTemplateSource> list;
		if(idreportSoruce!=null) {
			list = rtp.find().andWhere("repTemplate", "=",template_id).andWhere("repSource", "=",idreportSoruce).all();
		}else {
			list = rtp.find().andWhere("repTemplate", "=",template_id).all();
		}
		for(RepTemplateSource r:list ){
			if(r.getParameters()!=null) {
				r.getParameters().forEach(p-> params.put(p.getParameter().toLowerCase(),p.getParameter_type()));
			}
		}
		return params;
	}



	/*Transform sql query to xml
	 * 
	 * Example: SELECT ID, NAME, EMAIL from tbl_user
	 * The return value is:
	 * 	<form>
	 * 		<fields>
        		<number_1 name="p_number_1" type="number" maxlength="30" required="false" change="false" readonly="false" disabled="false" placeholder="" right="false">
	                <label>Number</label>
	                <value>606</value>
	            </number_1>
	            ...
	        </fields>
	 *  </form>
	 *  <table>
	        <value>
	            <row>
	                <number_1>527</number_1>
	                <number_1_desc>527</number_1_desc>
	                <text_1>Magna dolor labore ipsum totam</text_1>
	                <text_1_desc>Magna dolor labore ipsum totam</text_1_desc>
	            </row>
	            ...
	        </value>
	 *  <table>
	 */
	@SuppressWarnings("unchecked")
	public String getSqlQueryToXml(String query_,String[]name_array,String[]value_array,RepTemplate rt,RepSource rs){
		this.xmlRows = new XMLWritter();
		List<Tuple> list = null;
		String xml = null;
		String query = query_;
		//Get all parameters of datasource
		Map<String,String> parameters = this.getParams(rt.getId(), rs.getId());
		//Reomve filtro caso nao existir
		if(value_array==null || value_array.length == 0){
			query =rs.getType().equalsIgnoreCase("query")?this.replaceParameters(query):query;
		}
		//Aplica filtro caso existir
		Map<String, String> paramsUrl = (value_array!=null && value_array.length > 0)?IntStream.range(0, name_array.length).boxed().collect(Collectors.toMap(i ->name_array[i], i -> value_array[i])):null;
		query = this.getResolveQuery(query,parameters,paramsUrl);		
		
		Session session =  HibernateUtils.getSessionFactory(rs.getConfig_env().getName(), rs.getConfig_env().getApplication() != null ? rs.getConfig_env().getApplication().getDad() : "").getCurrentSession();
		if(session!=null) {			
			try{
				if(!session.getTransaction().isActive())
					session.getTransaction().begin();
				Query q = session.createNativeQuery(query,Tuple.class).setTimeout(QUERY_TIMEOUT);
				if(value_array!=null && value_array.length>0){
					for(Parameter<?> param:q.getParameters()){
						this.setMapParameterQuery(q,param,parameters,paramsUrl);
					}
				}
				list = q.getResultList();				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				if (session != null && session.isOpen()) {
					session.close();
				}	
			}
			
			Set<Properties> columns = this.getColumns(rs,rt.getId(), query);
			xml = this.getSqlQueryToXml(columns, list);
			return xml;
		}
		return null;
	}
	
	
	private String getResolveQuery(String query_,Map<String,String> parameters,Map<String, String> paramsUrl) {
		StringBuilder query = new StringBuilder(query_);
		if(paramsUrl!=null && !paramsUrl.isEmpty()){
			query.append(!query.toString().toLowerCase().contains("where") ? " WHERE 1=1 " : "");
			for(Map.Entry<String, String> parm:paramsUrl.entrySet()){
				if(parm.getKey()!=null && parm.getValue()!=null && !parm.getKey().isEmpty() && !parm.getValue().isEmpty()){
					String column_name = parm.getKey().contains("p_")?parm.getKey().substring(2):parm.getKey();
					boolean column_find = (parameters.containsKey("p_"+column_name.toLowerCase()) || parameters.containsKey(column_name.toLowerCase()));
					if(column_find) {
						 if(!query.toString().contains(":" + column_name.toLowerCase()) && !query.toString().contains(":p_" + column_name.toLowerCase()))
							 query.append(" AND ").append(column_name).append("=:").append(parm.getKey());
					}
				}
			}
		}
		return query.toString();
	}


	private void setMapParameterQuery(Query query, Parameter<?> param, Map<String, String> parameters, Map<String, String> paramsUrl) {
		Object value = paramsUrl.get(param.getName().toLowerCase());
		value = value == null ? paramsUrl.get("p_" + param.getName().toLowerCase()) : value;
		String type = parameters.get(param.getName());
		String column_name = param.getName().contains("p_") ? param.getName().substring(2) : param.getName();
		type = Core.isNull(type) ? parameters.get(column_name) : type;
		switch (type) {
			case "java.math.BigDecimal" ->
					query.setParameter(param.getName(), value != null ? new BigDecimal(value.toString()) : null);
			case "java.lang.Integer" ->
					query.setParameter(param.getName(), value != null ? Core.toInt(value.toString()) : null);
			case "java.lang.Double" ->
					query.setParameter(param.getName(), value != null ? Core.toDouble(value.toString()) : null);
			case "java.lang.Float" ->
					query.setParameter(param.getName(), value != null ? Core.toFloat(value.toString()) : null);
			case "java.lang.Character" -> query.setParameter(param.getName(), value != null ? (Character) value : "");
			case "java.lang.Long" ->
					query.setParameter(param.getName(), value != null ? Core.toLong(value.toString()) : null);
			case "java.lang.Short" ->
					query.setParameter(param.getName(), value != null ? Core.toShort(value.toString()) : null);
			case "java.sql.Date" -> {
				if ((value instanceof String) && Core.isNotNull(value))
					query.setParameter(param.getName(), Core.ToDate(value.toString(), "yyyy-MM-dd"));
				else
					query.setParameter(param.getName(), "");
			}
			case "java.sql.Timestamp" -> {
				if ((value instanceof String) && Core.isNotNull(value))
					query.setParameter(param.getName(), Core.ToTimestamp(value.toString(), "yyyy-MM-dd HH:mm:ss"));
				else
					query.setParameter(param.getName(), "");
			}
			default -> query.setParameter(param.getName(), Core.isNotNull(value) ? value.toString() : "");
		}
	}

	private String replaceParameters(String query) {
		return query.replaceAll("\\w*[.]\\w+=:\\w+", "1=1");
	}

	private String getSqlQueryToXml(Set<Properties> columns,List<Tuple> data){
		XMLWritter xml = new XMLWritter();
		IGRPForm form = new IGRPForm("form");
		IGRPTable table = new IGRPTable("table");
		Map<Properties,String> mappData = this.mappingColumnValue(columns, data);		
		Set<Entry<Properties, String>> setData = mappData.entrySet();
		for(Entry<Properties,String> entry:setData){
				Field f = new TextField(null,entry.getKey().getProperty("tag"));
				f.propertie().add("name",entry.getKey().getProperty("name"));
				f.setLabel(entry.getKey().getProperty("name"));
				f.setValue(entry.getValue());
				form.addField(f);
				table.addField(f);
		}
		table.addRowsXMl(this.xmlRows.toString());
		xml.addXml(form.toString());
		xml.addXml(table.toString());
		return xml.toString();
	}
	
	/*Mapping columns with value properties
	 * 
	 */
	private Map<Properties,String> mappingColumnValue(Set<Properties> columns,List<Tuple> data){
		if(data!=null) {			
			Map<Properties,String> mapping = new HashMap<>();
			Record r = new Record();
			r.rowList = new ArrayList<>();
			data.forEach(l->{
				Record rec = new Record();
				rec.row = l;
				r.rowList.add(rec);
			});
			r.rowList.forEach(t->{
				this.xmlRows.startElement("row");
               for (Properties p : columns) {
                  String name = p.getProperty("name");
                  String value = t.getString(name);
                  String tag = p.getProperty("tag");
                  if (Core.isNull(value)) {
                     name = name.startsWith("p_") ? name.substring(2) : name;
                     value = t.getString(name);
                  }
                  mapping.put(p, value != null ? value : "");
                  this.appendTag(tag, name, value != null ? value : "");
               }
				this.xmlRows.endElement();
			});
			return mapping;
		}
		return null;
	}
	
	private void appendTag(String tag, String name, String value) {
		this.xmlRows.startElement(tag);
			this.xmlRows.writeAttribute("name", name);
			this.xmlRows.text(value);
		this.xmlRows.endElement();
		this.xmlRows.startElement(tag + "_desc");
			this.xmlRows.writeAttribute("name", name + "_desc");
			this.xmlRows.text(value);
		this.xmlRows.endElement();
	}

}
