package nosi.core.webapp.datasource.helpers;

import java.sql.Connection;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Parameter;
import javax.persistence.Query;
import javax.persistence.Tuple;

import org.hibernate.SessionFactory;

import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.SqlJavaType;
import nosi.core.webapp.databse.helpers.ResultSet.Record;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateSource;

/**
 * Emanuel
 * 24 Aug 2018
 */
public class DataSourceHelpers {

	private XMLWritter xmlRows;

	public HashMap<Integer,String> getListSources(Integer id){
		HashMap<Integer,String> lista = new HashMap<>();
		//lista.put(null, "--- Selecionar Aplicação ---");
		for(RepSource rep:new RepSource().find().andWhere("application", "=",id).all()){
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
	public Set<Properties> getColumns(Config_env config,int template_id,String query) {
		Set<Properties> columns = new LinkedHashSet<>();
		Connection con = new nosi.core.config.Connection().getConnection(config);
		try {
			Statement s = con.createStatement();
			Set<String> keys = getParamsQuery(config,template_id,query);
			query =query.replaceAll(":\\w+", "null");
			ResultSetMetaData rsd =s.executeQuery(query).getMetaData();
			for(int i=1;i<=rsd.getColumnCount();i++){
				Properties p = new Properties();
				//Set propertie true if column is a parameter
				p.put("key", keys.contains(rsd.getColumnName(i).toLowerCase())?"true":"false");
				p.put("name","p_"+rsd.getColumnName(i).toLowerCase());
				p.put("tag",rsd.getColumnName(i).toLowerCase());
				p.put("type",SqlJavaType.sqlToJava(rsd.getColumnType(i)).toString().replaceAll("class ", ""));
				columns.add(p);
			}
			s.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(con!=null){con.close();}
			} catch (SQLException e) {
			}
		}
		return columns;
	}
	
	
	/*Extract parameters in query select
	 * Example: SELECT * FROM tbl_user WHERE id=:p_id
	 * 
	 * The "p_id" is parameter
	 */
	public Set<String> getParamsQuery(Config_env config,Integer template_id,String query){
		Set<String> params = new HashSet<String>();
		EntityManager em = HibernateUtils.getSessionFactory(config).createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		try{
			Query q = em.createNativeQuery(query);
			for(Parameter<?> param:q.getParameters()){
				params.add(param.getName().contains("p_")?param.getName().substring("p_".length()):param.getName());
			}
			t.commit();
		}catch(Exception e){
		}finally{
			em.close();
		}
		if(template_id!=0){
			Map<String,String> p = this.getParams(template_id,null);
			if(p!=null)
				params.addAll(p.keySet());
		}
		return params;
	}
	
	private Map<String,String> getParams(Integer template_id,Integer idreportSoruce) {
		Map<String,String> params = new HashMap<>();
		RepTemplateSource rtp = new RepTemplateSource();
		List<RepTemplateSource> list = new ArrayList<>();
		if(idreportSoruce!=null) {
			list = rtp.find().andWhere("repTemplate", "=",template_id).andWhere("repSource", "=",idreportSoruce).all();
		}else {
			list = rtp.find().andWhere("repTemplate", "=",template_id).all();
		}
		for(RepTemplateSource r:list ){
			if(r.getParameters()!=null) {
				r.getParameters().stream().forEach(p->{
					params.put(p.getParameter().toLowerCase(),p.getParameter_type());
				});
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
	public String getSqlQueryToXml(String query,String[]name_array,String[]value_array,RepTemplate rt,RepSource rs){
		this.xmlRows = new XMLWritter();
		List<Tuple> list = null;
		String xml = null;
		//Get all parameters of datasource
		Map<String,String> parameters = this.getParams(rt.getId(), rs.getId());
		//Reomve filtro caso nao existir
		if(value_array==null || value_array.length<=0){
			query =rs.getType().equalsIgnoreCase("query")?this.replaceParameters(query):query;
		}
		//Aplica filtro caso existir
		Map<String, String> paramsUrl = (value_array!=null && value_array.length > 0)?(Map<String, String>) IntStream.range(0, name_array.length).boxed().collect(Collectors.toMap(i ->name_array[i], i -> value_array[i])):null;
		query = this.getResolveQuery(query,parameters,paramsUrl);		
		
		SessionFactory session =  HibernateUtils.getSessionFactory(rs.getConfig_env());
		if(session!=null) {
			EntityManager em = session.createEntityManager();
			EntityTransaction t =  em.getTransaction();
			t.begin();
			try{
				Query q = em.createNativeQuery(query,Tuple.class);
				if(value_array!=null && value_array.length>0){
					for(Parameter<? extends Object> param:q.getParameters()){
						this.setMapParameterQuery(q,param,parameters,paramsUrl);
					}
				}
				list = q.getResultList();
				t.commit();
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				em.close();	
			}
			Set<Properties> columns = this.getColumns(rs.getConfig_env(),rt.getId(), query);
			xml = this.getSqlQueryToXml(columns, list);
			return xml;
		}
		return null;
	}
	
	
	private String getResolveQuery(String query,Map<String,String> parameters,Map<String, String> paramsUrl) {
		if(paramsUrl!=null &&paramsUrl.size() > 0){
			query += !query.toLowerCase().contains("where")?" WHERE 1=1 ":"";	
			for(Map.Entry<String, String> parm:paramsUrl.entrySet()){
				if(parm.getKey()!=null && parm.getValue()!=null  && !parm.getKey().equals("") && !parm.getValue().equals("")){
					String column_name = parm.getKey().contains("p_")?parm.getKey().substring(2, parm.getKey().length()):parm.getKey();
					boolean column_find = (parameters.containsKey("p_"+column_name.toLowerCase()) || parameters.containsKey(column_name.toLowerCase()));
					if(column_find) {
						 if(!query.contains(":"+column_name.toLowerCase()) && !query.contains(":p_"+column_name.toLowerCase()))
							 query += " AND "+column_name+"=:"+parm.getKey();
					}
				}
			}
		}
		return query;
	}


	private void setMapParameterQuery(Query query,Parameter<? extends Object> param,Map<String,String> parameters,Map<String, String> paramsUrl) {
		Object value = paramsUrl.get(param.getName().toLowerCase());
		value = value==null?paramsUrl.get("p_"+param.getName().toLowerCase()):value;
		String type = parameters.get(param.getName());
		String column_name = param.getName().contains("p_")?param.getName().substring(2, param.getName().length()):param.getName();
		type = Core.isNull(type)?parameters.get(column_name):type;
		
		if(type.equals("java.lang.Integer.class")) {
			query.setParameter(param.getName(),value!=null?Core.toInt(value.toString()):0);
		}else if(type.equals("java.lang.Double.class")){
			query.setParameter(param.getName(),value!=null? Core.toDouble(value.toString()):0);
		}else if(type.equals("java.lang.Float.class")){
			query.setParameter(param.getName(),value!=null?Core.toFloat(value.toString()):0);
		}else if(type.equals("java.lang.Character.class")){
			query.setParameter(param.getName(), value!=null?(Character)value:"");
		}else if(type.equals("java.lang.Long.class")){
			query.setParameter(param.getName(), value!=null?Core.toLong(value.toString()):0);
		}else if(type.equals("java.lang.Short.class")){
			query.setParameter(param.getName(), value!=null?Core.toShort(value.toString()):0);
		}else if(type.equals("java.sql.Date.class")){
			if((value instanceof String) && Core.isNotNull(value))
				query.setParameter(param.getName(),Core.ToDate(value.toString(),"yyyy-mm-dd"));
			else
				query.setParameter(param.getName(),"");
		}else {
			query.setParameter(param.getName(),Core.isNotNull(value)?value.toString():"");
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
			if(data!=null) { 
				r.RowList = new ArrayList<>();
				data.stream().forEach(l->{
					Record rec = new Record();
					rec.Row = l;
					r.RowList.add(rec);
				});
			}
			r.RowList.forEach(t->{
				this.xmlRows.startElement("row");
				Iterator<Properties> listColumns = columns.iterator();
				while(listColumns.hasNext()){
					Properties p = listColumns.next();
					this.xmlRows.startElement(p.getProperty("tag"));
					this.xmlRows.writeAttribute("name",p.getProperty("name"));
						String name = p.getProperty("name");
						String value = t.getString(name);
						if(Core.isNull(value)) {
							name = name.startsWith("p_")?name.substring(2, name.length()):name;
							value = t.getString(name);
						}
						value = value!=null?value:"";
						mapping.put(p,value);
						this.xmlRows.text(value);
					this.xmlRows.endElement();
				}
				this.xmlRows.endElement();
			});
			return mapping;
		}
		return null;
	}

}
