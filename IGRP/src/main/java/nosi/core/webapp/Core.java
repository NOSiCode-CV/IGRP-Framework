package nosi.core.webapp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringReader;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.FileNameMap;
import java.net.URLConnection;
import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.Normalizer;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import javax.persistence.Tuple;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.xml.bind.JAXB;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.modelmapper.ModelMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.config.Config;
import nosi.core.config.ConfigApp;
import nosi.core.config.Connection;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.HiddenField;
import nosi.core.mail.EmailMessage;
import nosi.core.webapp.activit.rest.CustomVariableIGRP;
import nosi.core.webapp.activit.rest.HistoricProcessInstance;
import nosi.core.webapp.activit.rest.HistoricTaskService;
import nosi.core.webapp.activit.rest.ProcessInstancesService;
import nosi.core.webapp.activit.rest.Rows;
import nosi.core.webapp.activit.rest.TaskService;
import nosi.core.webapp.activit.rest.TaskVariables;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.webapp.databse.helpers.QueryDelete;
import nosi.core.webapp.databse.helpers.QueryInsert;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.webapp.databse.helpers.QuerySelect;
import nosi.core.webapp.databse.helpers.QueryUpdate;
import nosi.core.webapp.helpers.CheckBoxHelper;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.EncrypDecrypt;
import nosi.core.webapp.helpers.GUIDGenerator;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.helpers.Permission;
import nosi.core.webapp.webservices.biztalk.GenericService_DevProxy;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaBI;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaGeografia;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaHierarquicaCAE;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaNIF;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaNascimento;
import nosi.core.webapp.webservices.biztalk.dao.PesquisaSNIAC;
import nosi.core.webapp.webservices.biztalk.dao.Request;
import nosi.core.webapp.webservices.biztalk.dao.ServiceSerach;
import nosi.core.webapp.webservices.biztalk.message.GenericServiceRequest;
import nosi.core.webapp.webservices.biztalk.message.GenericServiceResponse;
import nosi.core.webapp.webservices.soap.SoapClient;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.Domain;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Transaction;

/**
 * The core of the IGRP, here you can find all the main functions and helper function useful like toInt, parceInt, isNotNull...
 * 
 * @author: Emanuel Pereira 13 Nov 2017
 */
public final class Core { // Not inherit

	//TODO: ver javadoc de nao incluir no javadoc
	public static class MimeType extends nosi.core.webapp.helpers.mime_type.MimeType{
		
	}
	public static final String NO_PERMITION_MSG = "No permision";
	public static final String DD_MM_YYYY = "dd-MM-yyyy";
	public static final String YYYY_MM_DD = "yyyy-MM-dd";

	/**
	 Add Hidden field to form
	 @param	name parameter name
	 @param value value of parameter
	 */
	public static void addHiddenField(String name, Object value) {
		Field f = new HiddenField(null,name);
		f.propertie().add("value", value).add("name","p_"+name).add("type","hidden").add("maxlength","250").add("java-type","").add("tag",name);
		f.setValue(value);
		IGRPForm.hiddenFields.add(f);
	}
	/**
	 Add variable of type long to the process task
	 @param	taskDefinitionKey identification of task
	 @param variableName name of parameter
	 @param value value of parameter
	 */
	public static void addTaskVariableLong(String taskDefinitionKey, String variableName, Object value) {
		String taskId = Igrp.getInstance().getRequest().getParameter("taskId");
		if (Core.isNotNull(taskId)) {
			TaskService task = new TaskService().getTask(taskId);
			task.setId(taskId);
			task.addVariable(task.getTaskDefinitionKey() + "_" + variableName, "local", "string", value.toString());
			task.submitVariables();
			ProcessInstancesService p = new ProcessInstancesService();
			p.setId(task.getProcessInstanceId());
			p.addVariable(task.getTaskDefinitionKey() + "_" + variableName, "local", "string", value.toString());
			p.submitVariables();
		}
	}

	/**
	 * set attibute in session
	 * {@code Igrp.getInstance().getRequest().getSession().setAttribute(key, value);}
	 * 
	 * @param key
	 * @param value
	 */
	public static void addToSession(String key, String value) {
		Igrp.getInstance().getRequest().getSession().setAttribute(key, value);
	}

	/**
	 * Check permition transaction for current user
	 * 
	 * @param transaction
	 * @return
	 */
	public static boolean checkUserTransaction(String transaction) {
		return new Transaction().getPermission(transaction);
	}

	/**
	 * Format date and return to Type String Example use
	 * {@code Core.convertDate("11-10-2017", "dd-MM-yyyy", "dd-MM-yyyy h:mm")}
	 * 
	 * @param date
	 * @param formatIn
	 * @param outputFormat
	 * @return {@code DateHelper.convertDate(date,formatIn,outputFormat);}
	 */
	public static String convertDate(String date, String formatIn, String outputFormat) {
		return DateHelper.convertDate(date, formatIn, outputFormat);
	}

	/**
	 * Convert string date into Timestamp
	 * @param date
	 * @param formatIn
	 * @return
	 */
	public static Timestamp stringToTimestamp(String date,String formatIn) {
		return DateHelper.convertStringToTimestamp(date, formatIn);
	}
	
	public static String decrypt(String content) {
		return new EncrypDecrypt().decrypt(content);
	}
	/**
	 Decrypt string based on secret key
	 @param	content content of string to decrypt
	 @param secretKey secret key used to decrypt
	 */
	public static String decrypt(String content, String secretKey) {
		return new EncrypDecrypt().decrypt(content, secretKey);
	}
	
	
	/**
	 * @return Return the default connection name of the current application 
	 */
	public static String defaultConnection() {
		return defaultConnection(Core.getCurrentDadParam());
	}
	/**
	 * Return default connection string related to dad
	 * @param dad application code
	 */
	public static String defaultConnection(String dad) {
		String result = "";
		Application app = new Application().find().andWhere("dad", "=", dad).one();
		if(app != null) {
			Config_env config_env = new Config_env().find().andWhere("isdefault", "=", (short)1).andWhere("application", "=", app.getId()).one();
			if(config_env != null)
				result = config_env.getName();
		}
		return result;
	}
	/**
	 * Return Query of type BaseQueryInterface
	 * @param  tableName
	 * @return  BaseQueryInterface nosi.core.webapp.databse.helpers.QueryDelete
	 * */
	public static BaseQueryInterface delete(String tableName) {
		return new QueryDelete(Core.defaultConnection()).delete(tableName);
	}
	/**
	 * Return Query of type BaseQueryInterface from a specific connection
	 * @param  connectionName connection name
	 * @param  tableName table name
	 * @return  BaseQueryInterface nosi.core.webapp.databse.helpers.QueryDelete
	 * */
	public static BaseQueryInterface delete(String connectionName, String tableName) {
		return new QueryDelete(connectionName).delete(tableName);
	}
	/**
	 * Return Query of type BaseQueryInterface from a specific connection and schema
	 * @param  connectionName connection name
	 * @param  schemaName schema name
	 * @param  tableName table name
	 * @return  BaseQueryInterface nosi.core.webapp.databse.helpers.QueryDelete
	 * */
	public static BaseQueryInterface delete(String connectionName, String schemaName, String tableName) {
		return new QueryDelete(connectionName).delete(schemaName, tableName);
	}
	
	/**
	 * Return Query of type BaseQueryInterface
	 * @param  tableName
	 * @param displayError display error if true
	 * @param tracingError tracing error if true
	 * @return  BaseQueryInterface nosi.core.webapp.databse.helpers.QueryDelete
	 * */
	public static BaseQueryInterface delete(String tableName,boolean displayError,boolean tracingError) {
		return new QueryDelete(Core.defaultConnection(),displayError,tracingError).delete(tableName);
	}
	/**
	 * Return Query of type BaseQueryInterface from a specific connection
	 * @param  connectionName connection name
	 * @param  tableName table name
	 * @param displayError display error if true
	 * @param tracingError tracing error if true
	 * @return  BaseQueryInterface nosi.core.webapp.databse.helpers.QueryDelete
	 * */
	public static BaseQueryInterface delete(String connectionName, String tableName,boolean displayError,boolean tracingError) {
		return new QueryDelete(connectionName,displayError,tracingError).delete(tableName);
	}
	/**
	 * Return Query of type BaseQueryInterface from a specific connection and schema
	 * @param  connectionName connection name
	 * @param  schemaName schema name
	 * @param  tableName table name
	 * @param displayError display error if true
	 * @param tracingError tracing error if true
	 * @return  BaseQueryInterface nosi.core.webapp.databse.helpers.QueryDelete
	 * */
	public static BaseQueryInterface delete(String connectionName, String schemaName, String tableName,boolean displayError,boolean tracingError) {
		return new QueryDelete(connectionName,displayError,tracingError).delete(schemaName, tableName);
	}
	/**
	 * Encrypt a string
	 * @param content
	 * */
	public static String encrypt(String content) {
		return new EncrypDecrypt().encrypt(content);
	}
	/**
	 * Encrypt a string with a secret key
	 * @param content string content
	 * @param secretKey string secret key
	 * */
	public static String encrypt(String content, String secretKey) {
		return new EncrypDecrypt().encrypt(content, secretKey);
	}

	public static nosi.core.webapp.databse.helpers.ResultSet executeQuery(Config_env env, String sql) {
		QuerySelect q = new QuerySelect();
		q.setSql(sql);
		return q.executeQuery(env);
	}

	public static nosi.core.webapp.databse.helpers.ResultSet executeQuery(String connectionName, String sql) {
		QuerySelect q = new QuerySelect();
		q.setSql(sql);
		return q.executeQuery(new Connection().getConnection(connectionName));
	}

	/**
	 * Find Application By Dad
	 * 
	 * @param dad
	 * @return {@code new Application().findByDad(dad);}
	 */
	public static Application findApplicationByDad(String dad) {
		Application app = new Application();
		app.setReadOnly(true);
		return app.findByDad(dad);
	}

	/**
	 * Find Application By ID
	 * 
	 * @param id
	 * @return {@code new Application().findOne(id);}
	 */
	public static Application findApplicationById(Integer id) {
		Application app = new Application();
		app.setReadOnly(true);
		return app.findOne(id);
	}

	/**
	 * Find Organization By Code
	 * 
	 * @param code
	 * @return
	 */
	public static Organization findOrganizationByCode(String code) {
		Organization org = new Organization();
		org.setReadOnly(true);
		return org.find().andWhere("code", "=", code).one();
	}

	/**
	 * Find Organization By ID
	 * 
	 * @param id
	 * @return {@code new Organization().findOne(id);}
	 */
	public static Organization findOrganizationById(Integer id) {
		Organization org = new Organization();
		org.setReadOnly(true);
		return org.findOne(id);
	}

	/**
	 * Find ProfileType() By Code
	 * 
	 * @param code
	 * @return
	 */
	public static ProfileType findProfileByCode(String code) {
		ProfileType prof = new ProfileType();
		prof.setReadOnly(true);
		return prof.find().andWhere("code", "=", code).one();
	}

	/**
	 * Find ProfileType() By ID
	 * 
	 * @param id
	 * @return
	 */
	public static ProfileType findProfileById(Integer id) {
		ProfileType prof = new ProfileType();
		prof.setReadOnly(true);
		return prof.findOne(id);
	}

	/**
	 * Find User by email
	 * 
	 * @param email
	 * @return {@code User().find().andWhere("username", "=", email).one();}
	 */
	public static nosi.webapps.igrp.dao.User findUserByEmail(String email) {
		nosi.webapps.igrp.dao.User user = new nosi.webapps.igrp.dao.User();
		user.setReadOnly(true);
		return user.findIdentityByEmail(email);
	}

	/**
	 * Find User by ID
	 * 
	 * @param id
	 * @return {@code new User().findOne(id)}
	 */
	public static nosi.webapps.igrp.dao.User findUserById(Integer id) {
		nosi.webapps.igrp.dao.User user = new nosi.webapps.igrp.dao.User();
		user.setReadOnly(true);
		return user.findOne(id);
	}
	
	/**
	 * Find User by ID
	 * 
	 * @param id
	 * @return {@code new User().findOne(id)}
	 */
	public static nosi.webapps.igrp.dao.User findUserById(BigInteger id) {
		nosi.webapps.igrp.dao.User user = new nosi.webapps.igrp.dao.User();
		user.setReadOnly(true);
		return user.findOne(id);
	}

	/**
	 * Find User by Username
	 * 
	 * @param userName
	 * @return {@code User().find().andWhere("username", "=", userName).one();}
	 */
	public static nosi.webapps.igrp.dao.User findUserByUsername(String userName) {
		nosi.webapps.igrp.dao.User user = new nosi.webapps.igrp.dao.User();
		user.setReadOnly(true);
		return user.findIdentityByUsername(userName);
	}

	/**
	 * Format date and return to Type Date
	 * 
	 * @param data
	 * @param inputFormat
	 * @param outputFormat
	 * @return {@code DateHelper.formatDate(data,inputFormat,outputFormat);}
	 */
	public static java.sql.Date formatDate(String data, String inputFormat, String outputFormat) {
		return DateHelper.formatDate(data, inputFormat, outputFormat);
	}
/**
 * 
 * @return {@code return new Gson().fromJson(json, type);}
 */
	public static Object fromJson(String json, Type type) {
		return new Gson().fromJson(json, type);
	}

	
	/**
	 * @return {@code return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(json, type);}
	 */
	public static Object  fromJsonWithJsonBuilder(String json, Type type) {
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(json, type);
	}

	public static String getAmberColor() {
		return "2";
	}

	public static String getAttribute(String name, boolean isRemoved) {
		if (Igrp.getInstance()!=null && Igrp.getInstance().getRequest().getAttribute(name) != null) {
			String v = null;
			if (Igrp.getInstance().getRequest().getAttribute(name) instanceof Object[])
				v = ((Object[]) Igrp.getInstance().getRequest().getAttribute(name))[0].toString();
			else
				v = (String) Igrp.getInstance().getRequest().getAttribute(name);
			if (isRemoved)
				Igrp.getInstance().getRequest().removeAttribute(name);
			return v;
		}
		return null;
	}

	public static String[] getAttributeArray(String name) {
		if (Igrp.getInstance().getRequest().getAttribute(name) != null
				&& (Igrp.getInstance().getRequest().getAttribute(name) instanceof Object[]
						|| Igrp.getInstance().getRequest().getAttribute(name) instanceof String[])) {
			Object[] valueO = (Object[]) Igrp.getInstance().getRequest().getAttribute(name);
			Igrp.getInstance().getRequest().removeAttribute(name);
			String[] valueS = Arrays.copyOf(valueO, valueO.length, String[].class);
			return valueS;
		}
		return null;
	}

	public static Object getAttributeObject(String name, boolean isRemoved) {
		Object v = Igrp.getInstance().getRequest().getAttribute(name);
		if (isRemoved)
			Igrp.getInstance().getRequest().removeAttribute(name);
		return v;
	}
	
	public static GenericServiceResponse getBizTalkClient(String clientId, String transaction, String service,
			String args) {
		GenericService_DevProxy proxy = new GenericService_DevProxy();
		GenericServiceRequest part = new GenericServiceRequest(clientId, transaction, service, args);
		try {
			return proxy.getGenericService_Dev().genericRequest(part);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static GenericServiceResponse getBizTalkClientService(ServiceSerach service) {
		String args = new Request().prepare(service, "xml");
		return getBizTalkClient(service.getClientID(), service.getTransactionID(), service.getServiceID(), args);
	}

	/**
	 * Pesquia BI via Biztalk
	 * 
	 * @param bi
	 * @param nome
	 * @return
	 */
	public static PesquisaBI getBizTalkPesquisaBI(Integer bi, String nome) {
		return getBizTalkPesquisaBI(new PesquisaBI(bi, nome));
	}

	/**
	 * Pesquia BI via Biztalk
	 * 
	 * @param pesquisa
	 * @return
	 */
	public static PesquisaBI getBizTalkPesquisaBI(PesquisaBI pesquisa) {
		return (PesquisaBI) processRequestBiztalkClientService(getBizTalkClientService(pesquisa), pesquisa);
	}

	/**
	 * Pesquia Geografia via Biztalk
	 * 
	 * @param pesquisa
	 * @return
	 */
	public static PesquisaGeografia getBizTalkPesquisaGeografia(PesquisaGeografia pesquisa) {
		return (PesquisaGeografia) processRequestBiztalkClientService(getBizTalkClientService(pesquisa), pesquisa);
	}

	public static PesquisaGeografia getBizTalkPesquisaGeografia(String id, String zona, String freguesia,
			String concelho, String ilha, String pais, String nivel_detalhe, String tp_geog_cd, String codigo_ine,
			String codigo, String self_id) {
		return getBizTalkPesquisaGeografia(new PesquisaGeografia(id, zona, freguesia, concelho, ilha, pais,
				nivel_detalhe, tp_geog_cd, codigo_ine, codigo, self_id));
	}

	/**
	 * Pesquia Hierarquia CAE via Biztalk
	 * 
	 * @param pesquisa
	 * @return
	 */
	public static PesquisaHierarquicaCAE getBizTalkPesquisaHierarquiaCAE(PesquisaHierarquicaCAE pesquisa) {
		return (PesquisaHierarquicaCAE) processRequestBiztalkClientService(getBizTalkClientService(pesquisa), pesquisa);
	}

	/**
	 * Pesquia Hierarquia CAE via Biztalk
	 * 
	 * @param id
	 * @param codigo
	 * @param crpcae_id
	 * @param self_id
	 * @return
	 */
	public static PesquisaHierarquicaCAE getBizTalkPesquisaHierarquiaCAE(String id, String codigo, String crpcae_id,
			String self_id) {
		return getBizTalkPesquisaHierarquiaCAE(new PesquisaHierarquicaCAE(id, codigo, crpcae_id, self_id));
	}

	/**
	 * Pesquia Nascimento via Biztalk
	 * 
	 * @param pesquisa
	 * @return
	 */
	public static PesquisaNascimento getBizTalkPesquisaNascimento(PesquisaNascimento pesquisa) {
		return (PesquisaNascimento) processRequestBiztalkClientService(getBizTalkClientService(pesquisa), pesquisa);
	}
	
	/**
	 * Pesquia Nascimento via Biztalk
	 * 
	 * @param nome
	 * @param numero_registo
	 * @param data_nascimento
	 * @return
	 */
	public static PesquisaNascimento getBizTalkPesquisaNascimento(String nome, Integer numero_registo,
			String data_nascimento) {
		return getBizTalkPesquisaNascimento(new PesquisaNascimento(nome, numero_registo, data_nascimento));
	}

	/**
	 * Pesquia NIF via Biztalk
	 * 
	 * @param numero
	 * @param nome
	 * @return
	 */
	public static PesquisaNIF getBizTalkPesquisaNIF(Integer numero, String nome) {
		return getBizTalkPesquisaNIF(new PesquisaNIF(numero, nome));
	}

	/**
	 * Pesquia NIF via Biztalk
	 * 
	 * @param pesquisa
	 * @return
	 */
	public static PesquisaNIF getBizTalkPesquisaNIF(PesquisaNIF pesquisa) {
		return (PesquisaNIF) processRequestBiztalkClientService(getBizTalkClientService(pesquisa), pesquisa);
	}

	/**
	 * Pesquia SNIAC via Biztalk
	 * 
	 * @param num_idnt_civil_pes
	 * @param num_registo_pes
	 * @param nome_pes
	 * @param data_nasc_pes
	 * @param id_tp_doc_pes
	 * @return
	 */
	public static PesquisaSNIAC getBizTalkPesquisaSNIAC(Integer num_idnt_civil_pes, String num_registo_pes,
			String nome_pes, String data_nasc_pes, Integer id_tp_doc_pes) {
		return getBizTalkPesquisaSNIAC(
				new PesquisaSNIAC(num_idnt_civil_pes, num_registo_pes, nome_pes, data_nasc_pes, id_tp_doc_pes));
	}

	/**
	 * Pesquia SNIAC via Biztalk
	 * 
	 * @param pesquisa
	 * @return
	 */
	public static PesquisaSNIAC getBizTalkPesquisaSNIAC(PesquisaSNIAC pesquisa) {
		return (PesquisaSNIAC) processRequestBiztalkClientService(getBizTalkClientService(pesquisa), pesquisa);
	}

	public static String getBlueColor() {
		return "7";
	}

	public static String getBlueGreyColor() {
		return "5";
	}

	public static String getBrownColor() {
		return "8";
	}

	/**
	 * Get Config Property
	 * 
	 * @param name of the config property
	 * @return
	 */
	public static String getConfig(String name) {
		nosi.webapps.igrp.dao.Config c = new nosi.webapps.igrp.dao.Config().find().andWhere("name", "=", name).one();
		return c != null ? c.getValue() : null;
	}

	/**
	 * Get Current Application
	 * 
	 * @return {@code Core.findApplicationByDad(Core.getCurrentDad())}
	 */
	public static Application getCurrentApp() {
		return Core.findApplicationByDad(Core.getCurrentDad());
	}

	/**
	 * Get Current Application Dad on Cookie
	 * 
	 * @return {@code new Permission().getCurrentEnv();}
	 */
	public static String getCurrentDad() {
		String dad = new Permission().getCurrentEnv();
		return dad;
	}

	/**
	 * Get Current Application Dad on the URL Example: dad/app/action
	 * 
	 * @return {@code new Permission().getCurrentEnv();}
	 */
	public static String getCurrentDadParam() {
		String current_app_conn = Core.getParam("current_app_conn",false);
		if(Core.isNotNull(current_app_conn)) {
			return current_app_conn;
		}
		String r = Core.getParam("r"); 
		r = r!=null?Core.decrypt(r):null;
		String[] r_split = Core.isNotNull(r)?r.split("/"):null;
		return r_split!=null?r_split[0]:"igrp";
	}

	/**
	 * Get Current Datetime (dd/MM/yyyy HH:mm:ss)
	 * 
	 * @return {@code DateHelper.getCurrentDataTime();}
	 */
	public static String getCurrentDataTime() {
		return DateHelper.getCurrentDataTime();
	}

	/**
	 * Get Current Datetime (dd-MM-yyyy)
	 * 
	 * @return {@code DateHelper.getCurrentDate("dd-MM-yyyy");}
	 */
	public static String getCurrentDate() {
		return DateHelper.getCurrentDate("dd-MM-yyyy");
	}

	/**
	 * Get Current Datetime (User defined output format)
	 * 
	 * @param outputFormat
	 * @return {@code DateHelper.getCurrentDate(outputFormat);}
	 */
	public static String getCurrentDate(String outputFormat) {
		return DateHelper.getCurrentDate(outputFormat);
	}

	public static Date getCurrentDate1() {
		return DateHelper.getCurrentDate();
	}

	/**
	 * Get current Organization ID
	 * 
	 * @return {@code Organization integer ID}
	 */
	public static Integer getCurrentOrganization() {
		return new Permission().getCurrentOrganization();
	}

	/**
	 * Get current Profile ID
	 * 
	 * @return Profile integer ID
	 */
	public static Integer getCurrentProfile() {
		return new Permission().getCurrentPerfilId();
	}

	/**
	 * Get current user and than use then .getName()  or getEmail or getUser_name;
	 *  
	 * @return {@code (User) Igrp.getInstance().getUser().getIdentity();}
	 */
	public static nosi.webapps.igrp.dao.User getCurrentUser() {
		nosi.webapps.igrp.dao.User user = (nosi.webapps.igrp.dao.User) Igrp.getInstance().getUser().getIdentity();
		if(user!=null)
			user.setReadOnly(true);
		return user;
	}

	/**
	* Find Active Domains by domain code name
	* @param domainsName domain code name
	* @return {@code List< of Domains> }
	*/
	public static List<nosi.webapps.igrp.dao.Domain> findDomainByCode(String domainsName) {
		nosi.webapps.igrp.dao.Domain domain = new nosi.webapps.igrp.dao.Domain();
		domain.setReadOnly(true);
		return domain.find().andWhere("dominio", "=", domainsName).andWhere("status","=","ATIVE").orderBy("ordem").all();
	}
	/**
	 * Find the Value/Decription ok a domay key
	 * @param domainsName domain code name
	 * @param key
	 * @return value/description
	 */
	public static String findDomainDescByKey(String domainsName, String key) {
	
		
//		if(Core.isNull(domainsName) && Core.isNull(key))
		if(!Core.isNotNullMultiple(domainsName,key))
			return "";
//		final Domain onedom = Core.query("SELECT obj FROM nosi.webapps.igrp.dao.Domain obj WHERE lower(obj.dominio) =:domainsname "
//				+ "AND lower(obj.valor) =:key")
//				.addString("domainsname",domainsName.toLowerCase())
//				.addString("key",key.toLowerCase())
//				.getSingleResult(Domain.class);				
//				
//		return onedom!=null?onedom.getDescription():"";
		nosi.webapps.igrp.dao.Domain domain = new nosi.webapps.igrp.dao.Domain();
		domain.setReadOnly(true);
		final Domain oneDomain = domain.find().andWhere("lower(dominio)","dominio", "=", domainsName.toLowerCase()).andWhere("lower(valor)","valor", "=", key.toLowerCase()).one();
		return oneDomain!=null?oneDomain.getDescription():"";

	}

	
	public static String getDeepPurpleColor() {
		return "9";
	}

	public static String getExecutionId() {
		String taskId = Core.getParamTaskId();
		String taskExecutionId = Core.getParam("taskExecutionId");
		if (Core.isNull(taskExecutionId)) {
			List<HistoricTaskService> task = new HistoricTaskService().getHistory(taskId);
			taskExecutionId = (task != null && task.size() > 0) ? task.get(task.size() - 1).getExecutionId()
					: taskExecutionId;
		}
		Core.setAttribute("taskExecutionId", taskExecutionId);
		return taskExecutionId;
	}

	public static CLob getFile(int fileId) {
		CLob cLob = null;
		java.sql.Connection conn = null;

		try {
			String igrpCoreConnection = new ConfigApp().getBaseConnection();
			conn = new Connection().getConnection(igrpCoreConnection);
			String sql = "select * from tbl_clob where id = ?";
			java.sql.PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, fileId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				cLob = new CLob();
				cLob.setC_lob_content(rs.getBytes("c_lob_content"));
				cLob.setDt_created(rs.getDate("dt_created"));
				cLob.setName(rs.getString("name"));
				cLob.setMime_type(rs.getString("mime_type"));
				cLob.setId(rs.getInt("id"));
			}
			rs.close();
		} catch (java.sql.SQLException e) {
			e.printStackTrace();
			cLob = null;
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return cLob;
	}

	
	public static Part getFile(String name) throws IOException, ServletException {
		Part part = Igrp.getInstance().getRequest().getPart(name);
		if (part != null) {
			return part;
		}
		return null;
	}

	/**
	 * @throws ServletException
	 * @throws IOException
	 **/
	public static List<Part> getFiles() throws IOException, ServletException {
		try {
			Collection<Part> parts = Igrp.getInstance().getRequest().getParts();
			if (parts != null) {
				return parts.stream().filter(file -> Core.isNotNull(file.getSubmittedFileName()))
						.filter(file -> Core.isNotNull(file.getName())).collect(Collectors.toList());
			}
		} catch (javax.servlet.ServletException e) {

		}
		return null;
	}

	public static Object getFromSession(String key) {
		return getFromSession(key, false);
	}

	public static Object getFromSession(String key, boolean flag) {
		Object result = Igrp.getInstance().getRequest().getSession().getAttribute(key);
		if (flag)
			Igrp.getInstance().getRequest().getSession().removeAttribute(key);
		return result;
	}

	public static String getGreenColor() {
		return "4";
	}

	public static String getJsonParams() {
		Map<String, String[]> params = Igrp.getInstance().getRequest().getParameterMap();
		CustomVariableIGRP customV = new CustomVariableIGRP();
		Gson gson = new Gson();
		params.entrySet().stream().filter(p -> !p.getKey().equalsIgnoreCase("r"))
				.filter(p -> !p.getKey().equalsIgnoreCase("prm_app"))
				.filter(p -> !p.getKey().equalsIgnoreCase("prm_page")).forEach(p -> {
					Rows row = new Rows();
					row.setName(p.getKey());
					row.setValue((Object[]) p.getValue());
					customV.add(row);
				});
		String json = gson.toJson(customV);
		return json;
	}

	/**
	 * Link for get file
	 * 
	 * 
	 * @param p_id Unique file id
	 * @return
	 */
	public static String getLinkFile(String p_id) {
		return new Config().getResolveUrl("igrp", "File", "get-file&p_id=" + p_id);
	}
	
	public static String getLinkFile(int p_id) {
		return new Config().getResolveUrl("igrp", "File", "get-file&p_id=" + p_id);
	}
	/**
	 * This method you can invoking using Link or Button.
	 * 
	 * Example with filter id=2:
	 * {@code model.setLink(Core.getLinkReport("rep_persons").addParam("p_id", 2))}
	 * 
	 * @param code_report The unique code that identifies Report
	 * @return
	 */
	public static Report getLinkReport(String code_report) {
		return new Report().getLinkReport(code_report);
	}

	/**
	 * Get Report for Response redirect {@code .addParam } for filtering
	 * 
	 * @param code_report The unique code that identifies Report
	 * @param report      use filter {@code new Report().addParam("id",1) } OR
	 *                    this.loadQueryString()
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Response getLinkReport(String code_report, Object report) {
		Report rep = new Report();
		if (report != null && report instanceof QueryString) {
			((QueryString<String, Object>) report).getQueryString().entrySet().stream().forEach(q -> {
				rep.addParam(q.getKey(), q.getValue());
			});
		} else if (report != null && report instanceof Report) {
			return new Report().invokeReport(code_report, (Report) report);
		}
		return new Report().invokeReport(code_report, rep);
	}

	/**
	 * {@code Object v = Igrp.getInstance().getRequest().getParameter(name);}
	 * 
	 * @param name of the string name remove the attribute after get it
	 * @return {@code v!=null?v.toString():"";}
	 */
	public static String getParam(String name) {
		Object v = Igrp.getInstance()!=null?Igrp.getInstance().getRequest().getParameter(name):null;
		if (Core.isNull(v))
			v = Core.getAttribute(name, true);
		return v != null ? v.toString() : "";
	}

	/**
	 * {@code Object v = Igrp.getInstance().getRequest().getParameter(name);}
	 * 
	 * @param name      of the string name
	 * @param isRemoved if you don't remove the attribute
	 * @return {@code v!=null?v.toString():"";}
	 */
	public static String getParam(String name, boolean isRemoved) {
		Object v = Igrp.getInstance()!=null?Igrp.getInstance().getRequest().getParameter(name):null;
		if (Core.isNull(v))
			v = Core.getAttribute(name, isRemoved);
		return v != null ? v.toString() : "";
	}

	/**
	 * {@code String[] value = Igrp.getInstance().getRequest().getParameterValues(name);}
	 * 
	 * @param name of the string label
	 * @return value
	 */
	public static String[] getParamArray(String name) {
		String[] value =  Igrp.getInstance()!=null?Igrp.getInstance().getRequest().getParameterValues(name):null;
		if (value == null) {
			value = Core.getAttributeArray(name);
		}
		return value;
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name of the string label
	 * @return {@code Core.isNotNull(x)?Core.toDouble(x):0;}
	 */
	public static Double getParamDouble(String name) {
		String x = Core.getParam(name);
		if (Core.isNull(x))
			x = Core.getAttribute(name, true);
		return Core.isNotNull(x) ? Core.toDouble(x) : 0;
	}

	public static Map<String, String[]> getParameters() {
		return Igrp.getInstance().getRequest().getParameterMap();
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name of the string label
	 * @return {@code Core.isNotNull(x)?Core.toFloat(x):0;}
	 */
	public static Float getParamFloat(String name) {
		String x = Core.getParam(name);
		if (Core.isNull(x))
			x = Core.getAttribute(name, true);
		return Core.isNotNull(x) ? Core.toFloat(x) : 0;
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name of the string label
	 * @return {@code Core.isNotNull(x)?Core.toInt(x):0;}
	 */
	public static Integer getParamInt(String name) {
		String x = Core.getParam(name);
		if (Core.isNull(x))
			x = Core.getAttribute(name, true);
		return Core.isNotNull(x) ? Core.toInt(x) : 0;
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name of the string label
	 * @return {@code  Core.isNotNull(x)?Core.toLong(x):0;}
	 */
	public static Long getParamLong(String name) {
		String x = Core.getParam(name);
		if (Core.isNull(x))
			x = Core.getAttribute(name, true);
		return Core.isNotNull(x) ? Core.toLong(x) : 0;
	}

	public static Object getParamObject(String name) {
		Object x = Core.getAttribute(name, true);
		return x;
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name of the string label
	 * @return {@code Core.isNotNull(x)?Core.toShort(x):0;}
	 */
	public static Short getParamShort(String name) {
		String x = Core.getParam(name);
		if (Core.isNull(x))
			x = Core.getAttribute(name, true);
		return Core.isNotNull(x) ? Core.toShort(x) : 0;
	}

	public static String getParamTaskId() {
		String taskId = Core.getParam("taskId");
		Core.setAttribute("taskId", taskId);
		return taskId;
	}

	public static String getPinkColor() {
		return "1";
	}

	public static String getProcessVariable(String processDefinitionKey, String variableName) {
		List<TaskVariables> vars = Core.getProcessVariables(processDefinitionKey);
		if (vars != null) {
			List<TaskVariables> var = vars.stream().filter(v -> v.getName().equalsIgnoreCase(variableName))
					.collect(Collectors.toList());
			return (var != null && var.size() > 0) ? (String) var.get(var.size() - 1).getValue() : "";
		}
		return "";
	}

	public static String getProcessVariableId(String processDefinitionKey) {
		List<TaskVariables> vars = Core.getProcessVariables(processDefinitionKey);
		if (vars != null) {
			List<TaskVariables> var = vars.stream().filter(v -> v.getName().equalsIgnoreCase("p_process_id"))
					.collect(Collectors.toList());
			return (var != null && var.size() > 0) ? (String) var.get(var.size() - 1).getValue() : "";
		}
		return "";
	}

	private static List<TaskVariables> getProcessVariables(String processDefinitionKey) {
		List<HistoricProcessInstance> task1 = new HistoricProcessInstance()
				.getHistoryOfProccessInstanceId(processDefinitionKey);
		if (task1 != null && task1.size() > 0) {
			return task1.get(task1.size() - 1).getVariables();
		}
		return null;
	}

	public static String getPurpleColor() {
		return "6";
	}

	public static SessionFactory getSessionFactory(String connectionName) {
		return HibernateUtils.getSessionFactory(connectionName,null);
	}

	/**
	 * Receive multiple params and get one of these params that's not null
	 * 
	 * @param strings
	 * @return
	 */
	public static String getSwitchNotNullValue(String... strings) {
		if (strings.length > 1) {
			if (Core.isNotNull(strings[0]))
				return strings[0];
			String[] newStrings = new String[strings.length - 1];
			System.arraycopy(strings, 1, newStrings, 0, newStrings.length);
			return getSwitchNotNullValue(newStrings);
		} else if (strings.length == 1) {
			if (Core.isNotNull(strings[0]))
				return strings[0];
		}
		return "";
	}

	public static HistoricTaskService getTaskHistory(String taskDefinitionKey) {
		String id = Core.getExecutionId();
		if (Core.isNotNull(id)) {
			List<HistoricTaskService> task1 = new HistoricTaskService().getHistory(taskDefinitionKey, id);
			if (task1 != null && task1.size() > 0) {
				return task1.get(task1.size() - 1);
			}
		}
		return null;
	}

	

	/**
	 * Get UUID
	 * @return
	 */
	public static String getUUID() {
		return GUIDGenerator.getGUIDLowerCase();
	}

	public static String getXMLParams() {
		Map<String, String[]> params = Igrp.getInstance().getRequest().getParameterMap();
		XMLWritter xml = new XMLWritter();
		xml.startElement("rows");
		params.entrySet().stream().filter(p -> !p.getKey().equalsIgnoreCase("r"))
				.filter(p -> !p.getKey().equalsIgnoreCase("prm_app"))
				.filter(p -> !p.getKey().equalsIgnoreCase("prm_page")).forEach(p -> {
					for (String v : p.getValue()) {
						xml.setElement(p.getKey(), v);
					}
				});
		xml.endElement();
		return xml.toString();
	}

	public static String getYellowColor() {
		return "3";
	}

	public static String gt(String value) {
		return nosi.core.i18n.Translator.gt(value);
	}

	/**
	 * Consume a REST API using get
	 * 
	 * @param url
	 * @param mediaType
	 * @param result
	 * @return {@code httpGet(url, mediaType, null, result);}
	 */
	public static <T> T httpGet(String url, String[] mediaType, Class<T> result) {
		return httpGet(url, mediaType, null, result);
	}

	/**
	 * Consume a REST API using Get
	 * 
	 * @param url
	 * @param mediaType
	 * @param httpHeaders
	 * @param result
	 * @return {@code 	T r = ib.get(result);}
	 */
	public static <T> T httpGet(String url, String[] mediaType, Map<String, Object> httpHeaders, Class<T> result) {
		Client curl = ClientBuilder.newClient();
		Invocation.Builder ib = curl.target(url).request(mediaType);
		if (httpHeaders != null && !httpHeaders.isEmpty()) {
			for (Map.Entry<String, Object> obj : httpHeaders.entrySet()) {
				ib.header(obj.getKey(), obj.getValue());
			}
		}
		T r = ib.get(result);
		curl.close();
		return r;
	}

	/**
	 * Consume a REST API using post
	 * 
	 * @param url
	 * @param content
	 * @param mediaType
	 * @param httpHeaders
	 * @param entityMediaType
	 * @param result
	 * @return
	 */
	public static <T> T httpPost(String url, Object content, String[] mediaType, Map<String, Object> httpHeaders,
			String entityMediaType, Class<T> result) {
		Client curl = ClientBuilder.newClient();
		Invocation.Builder ib = curl.target(url).request(mediaType);
		if (httpHeaders != null && !httpHeaders.isEmpty()) {
			for (Map.Entry<String, Object> obj : httpHeaders.entrySet()) {
				ib.header(obj.getKey(), obj.getValue());
			}
		}
		T r = ib.post(Entity.entity(content, entityMediaType), result);
		return r;
	}

	/**
	 * Consume a REST API using post
	 * 
	 * @param url
	 * @param content
	 * @param mediaType
	 * @param entityMediaType
	 * @param result
	 * @return
	 */
	public static <T> T httpPost(String url, Object content, String[] mediaType, String entityMediaType,
			Class<T> result) {
		return httpPost(url, content, mediaType, null, entityMediaType, result);
	}

	public static BaseQueryInterface insert(String tableName) {
		return new QueryInsert(Core.defaultConnection()).insert(tableName);
	}

	public static QueryInterface transaction(String connectionName) {
		return new nosi.core.webapp.databse.helpers.Transaction(connectionName);
	}

	public static QueryInterface transaction() {
		return new nosi.core.webapp.databse.helpers.Transaction(Core.defaultConnection());
	}
	
	/**
	 * Queey insert
	 * 
	 * @param connectionName
	 * @param tableName
	 * @return {@code new QueryInsert(connectionName).insert(tableName);}
	 */
	public static BaseQueryInterface insert(String connectionName, String tableName) {
		return new QueryInsert(connectionName).insert(tableName);
	}

	public static BaseQueryInterface insert(String connectionName, String schemaName, String tableName) {
		return new QueryInsert(connectionName).insert(schemaName, tableName);
	}

	public static BaseQueryInterface insert(String tableName,boolean displayError,boolean tracingError ) {
		return new QueryInsert(Core.defaultConnection(),displayError,tracingError).insert(tableName);
	}

	/**
	 * Queey insert
	 * 
	 * @param connectionName
	 * @param tableName
	 * @return {@code new QueryInsert(connectionName).insert(tableName);}
	 */
	public static BaseQueryInterface insert(String connectionName, String tableName,boolean displayError,boolean tracingError) {
		return new QueryInsert(connectionName,displayError,tracingError).insert(tableName);
	}

	public static BaseQueryInterface insert(String connectionName, String schemaName, String tableName,boolean displayError,boolean tracingError) {
		return new QueryInsert(connectionName,displayError,tracingError).insert(schemaName, tableName);
	}
	
	public static boolean isDouble(Object value) {
		if (isNotNull(value)) {
			try {
				double v = Double.parseDouble(String.valueOf(value));
				return !((v == Math.floor(v)) && !Double.isInfinite(v));
			} catch (NumberFormatException e) {
				return false;
			}
		}
		return false;
	}
	
	public static boolean isFloat(Object value) {
		if (isNotNull(value)) {
			try {
				float v = Float.parseFloat(String.valueOf(value));
				return !((v == Math.floor(v)) && !Float.isInfinite(v));
			} catch (NumberFormatException e) {
				return false;
			}
		}
		return false;
	}

	/**
	 * Checks if it's a int First {@code isNotNull(value)} than a try catch
	 * numberFormatException
	 * 
	 * @param value
	 * @return {@code double v = Integer.parseInt(value.toString());
				return ((v == Math.floor(v)) && !Double.isInfinite(v));}
	 */
	public static boolean isInt(Object value) {
		if (isNotNull(value)) {
			try {
				double v = Integer.parseInt(String.valueOf(value));
				return ((v == Math.floor(v)) && !Double.isInfinite(v));
			} catch (NumberFormatException e) {
				return false;
			}
		}
		return false;
	}

	/**
	 * Checks if it's not null or ""
	 * 
	 * @param value
	 * @return {@code value!=null && !value.equals("");}
	 */
	public static boolean isNotNull(Object value) {
		return (value instanceof String) ? value != null && !value.equals("") : value != null;
	}

	/**
	 * Checks if it's not null or "" for multiple values
	 * 
	 * @param values
	 * @return {@code value!=null && !value.equals("");}
	 */
	
	public static boolean isNotNullMultiple(Object... values) {
		boolean r = false;
		if(values!=null) {
			for(Object value:values) {
				r = Core.isNotNull(value);
				if(r==false)
					break;
			}
		}
		return r;
	}

	/**
	 * Checks if it's not null or not 0 First {@code Core.isNotNull(value)}
	 * 
	 * @param value
	 * @return {@code new Integer(value.toString())!=0;}
	 */
	public static boolean isNotNullOrZero(Object value) {
		if (!(value instanceof Number)) {
			return Core.isNotNull(value);
		}
		return (Core.isNotNull(value)) ? new Integer(String.valueOf(value)) != 0 : false;
	}

	/**
	 * Checks if it's null or ""
	 * 
	 * @param value
	 * @return {@code value==null || value.equals("");}
	 */
	public static boolean isNull(Object value) {
		return (value instanceof String) ? value == null || value.equals("") : value == null;
	}

	/**
	 * Checks if it's null or 0
	 * 
	 * @param value
	 * @return {@code if(value instanceof Number) return value ==null || new Integer(value.toString()) ==0;}
	 */
	public static boolean isNullOrZero(Object value) {
		return (value instanceof Number) ? value == null || new Integer(String.valueOf(value)) == 0
				: value == null || value.equals("");
	}
	
	/**
	 * This method is used to add a message log
	 * 
	 * @param msg This is the message
	 * 
	 */
	public static void log(String msg) {

		Igrp.getInstance().getLog().addMessage(msg);
	}

	/**
	 * send a simple email ...
	 * 
	 * @param from
	 * @param to
	 * @param subject
	 * @param msg
	 * @param charset  UTF-8,
	 * @param mimetype text/html, plaintext
	 * @param attachs
	 * @param replyTo
	 * @return true or false
	 */
	public static boolean mail(String from, String to, String subject, String msg, String charset, String mimetype,
			File[] attachs, String replyTo) {
		EmailMessage sender = EmailMessage.newInstance();
		boolean result = false;
		try {
			sender.setFrom(from).setTo(to).setSubject(subject).setMsg(msg, charset, mimetype).replyTo(replyTo);
			if (attachs != null)
				for (File f : attachs)
					sender.attach(f);
			result = sender.send();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static Map<Object, Object> mapArray(Object[] array1, Object[] array2) {
		if (array1 != null && array1.length > 0 && array2 != null && array2.length > 0)
			return (Map<Object, Object>) IntStream.range(0, array1.length).boxed()
					.collect(Collectors.toMap(i -> array1[i], i -> array2[i]));
		return null;
	}

	public static Map<Object, Object> mapArray(Object[] array1, Object[] array2, Predicate<? super Integer> filter) {
		if (array1 != null && array1.length > 0 && array2 != null && array2.length > 0)
			return (Map<Object, Object>) IntStream.range(0, array1.length).boxed().filter(filter)
					.collect(Collectors.toMap(i -> array1[i], i -> array2[i]));
		return null;
	}

	/**
	 * Maps source to destination - 
	 *  http://modelmapper.org/getting-started/
	 * Example here: http://modelmapper.org/examples/flattening/
	 * 
	 * @param source
	 * @param destination
	 */
	public static void mapper(Object source, Object destination) {
		ModelMapper mapper = new ModelMapper();
		mapper.map(source, destination);
	}
	/**
	 * Example input = "Tĥïŝ ĩš â fůňķŷ Šťŕĭńġ" will return This is a funky String
	 * 
	 * @param input
	 * @return a normalize text
	 */
	public static String normalizeText(String input) {
		return Normalizer .normalize(input, Normalizer.Form.NFD) .replaceAll("[^\\p{ASCII}]", "");
	}
	

	private static ServiceSerach processRequestBiztalkClientService(GenericServiceResponse response,
			ServiceSerach service) {
		if (response.getStatus().equals("true")) {
			String xml = response.getResult();
			StringReader input = new StringReader(xml);
			nosi.core.webapp.webservices.biztalk.dao.Response r = JAXB.unmarshal(input,
					nosi.core.webapp.webservices.biztalk.dao.Response.class);
			if (r.getRow() != null) {
				if (r.getRow().isStatus()) {
					xml = xml.replaceAll("lista_nifs", "lista");
					xml = xml.substring(xml.indexOf("<lista>"), xml.indexOf("</lista>") + "</lista>".length());
					input = new StringReader(xml);
					service = JAXB.unmarshal(input, service.getClass());
					return service;
				}
			}
		}
		return null;
	}

	public static QueryInterface query(String sql) {		
			return new QuerySelect(Core.defaultConnection()).select(sql);
	}

	public static QueryInterface query(String sql, Config_env config_env) {
		return new QuerySelect(config_env).select(sql);
	}

	public static QueryInterface query(String connectionName, String sql) {
		return new QuerySelect(connectionName).select(sql);
	}

	public static QueryInterface query(String connectionName, String sql, Class<?> className) {
		return new QuerySelect(connectionName).select(sql, className);
	}

	public static QueryInterface query(String sql,boolean displayError,boolean tracingError) {		
		return new QuerySelect(Core.defaultConnection(),displayError,tracingError).select(sql);
	}
	
	public static QueryInterface query(String sql, Config_env config_env,boolean displayError,boolean tracingError) {
		return new QuerySelect(config_env,displayError,tracingError).select(sql);
	}
	
	public static QueryInterface query(String connectionName, String sql,boolean displayError,boolean tracingError) {
		return new QuerySelect(connectionName,displayError,tracingError).select(sql);
	}
	
	public static QueryInterface query(String connectionName, String sql, Class<?> className,boolean displayError,boolean tracingError) {
		return new QuerySelect(connectionName,displayError,tracingError).select(sql, className);
	}

	/**
	 * @param query    Usually the result of Core.query(null,"(SELECT 'id' as
	 *                 ID,'name' as NAME) ")
	 * @param selected A list selected values
	 * @param prompt   The comboBox prompt
	 * @return A xml result
	 */
	public static String remoteComboBoxXml(BaseQueryInterface query, String[] selected, String prompt) {
		Map<Object, Object> map = new LinkedHashMap<>();
		String xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
		xml += "<list>";
		if (prompt != null) {
			xml += "<option><text>" + prompt + "</text><value></value></option>";
		}
		List<Tuple> list = query.getResultList();
		if (list != null && !list.isEmpty()) {
			for (Tuple t : list) {
				try {
					map.put(t.get(0), t.get(1));
				} catch (IllegalArgumentException e) {

				}
			}
		}
		for (Object k : map.keySet()) {
			Object v = map.get(k);
			xml += "<option ";

			if (selected != null)
				for (String obj : selected) {
					if (obj.equals(k)) {
						xml += " selected=\"selected\" ";
						break;
					}
				}
			xml += ">";
			xml += "<text>" + v + "</text><value>" + k + "</value></option>";
		}
		xml += "</list>";
		return xml;
	}

	public static void removeAttribute(String name) {
		Igrp.getInstance().getRequest().removeAttribute(name);
	}

	/**
	 * Insert a file to the Igrp core DataBase and return an Id ...
	 * 
	 * @param content   byte[]
	 * @param name
	 * @param mime_type
	 * @return in ID
	 */
	public static int saveFile(byte[] content, String name, String mime_type) {
		try {
			String aux[] = name.trim().split("\\.");
			String extension = aux[aux.length - 1];
			return saveFile(content, name, "." + extension, mime_type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	

	/**
	 * Insert a file to the Igrp core DataBase and return an Id ...
	 * 
	 * @param content   byte[]
	 * @param name
	 * @param extension - must have dot ".txt"
	 * @param mime_type
	 * @return in ID
	 */
	public static int saveFile(byte[] content, String name, String extension, String mime_type) {
		try {
			if (!extension.startsWith("."))
				throw new IllegalArgumentException("Extension of file is invalid.");
			File file = File.createTempFile(name, extension);
			FileOutputStream out = new FileOutputStream(file);
			out.write(content);
			out.flush();
			out.close();
			return saveFile(file, name, mime_type);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return -1;
	}

	/**
	 * Insert a file to the Igrp core DataBase and return an Id ...
	 * 
	 * @param file
	 * @return in ID
	 */
	public static int saveFile(File file) {
		return saveFile(file, null, null);
	}

	/**
	 * Insert a file to the Igrp core DataBase and return an Id ...
	 * 
	 * @param file
	 * @param name
	 * @param mime_type
	 * @return int ID
	 */
	public static int saveFile(File file, String name, String mime_type) {
		int lastInsertedId = 0;
		if(file!=null) {
			String igrpCoreConnection = new ConfigApp().getBaseConnection();
			java.sql.Connection conn = new Connection().getConnection(igrpCoreConnection);
			file.deleteOnExit(); // Throws SecurityException if dont have permission to delete
			if (conn != null) {
				name = (name == null || name.trim().isEmpty() ? file.getName() : name);
				FileNameMap fileNameMap = URLConnection.getFileNameMap();
				mime_type = (mime_type == null || mime_type.trim().isEmpty() ? fileNameMap.getContentTypeFor(file.getPath())
						: mime_type);
				// String sysdate = LocalDate.parse(LocalDate.now().toString(),
				// DateTimeFormatter.ofPattern("yyyy-MM-dd")).toString();
				String standardSql = "insert into tbl_clob(c_lob_content, dt_created, mime_type, name) values(?, ?, ?, ?)";
				try {
					conn.setAutoCommit(false);
					java.sql.PreparedStatement ps = conn.prepareStatement(standardSql,
							java.sql.PreparedStatement.RETURN_GENERATED_KEYS);
					ps.setBinaryStream(1, new FileInputStream(file));
					// ps.setString(2, sysdate);
					ps.setDate(2, new Date(System.currentTimeMillis()));
					ps.setString(3, mime_type);
					ps.setString(4, name);
					if (ps.executeUpdate() > 0) {
						try (java.sql.ResultSet rs = ps.getGeneratedKeys()) {
							if (rs.next()) {
								lastInsertedId = rs.getInt(1);
							}
						}
						ps.close();
					}
					conn.commit();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			try {
				file.delete();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return lastInsertedId;
	}

	public static int saveFile(String parameterName) throws Exception {
		if(Core.isNotNull(parameterName))
			return saveFile(Core.getFile(parameterName), Core.getFile(parameterName).getSubmittedFileName());
		throw new Exception(gt("Parâmetro invalido"));
	}
	
	public static int saveFile(String parameterName,String description) throws Exception {
		if(Core.isNotNull(parameterName))
			return saveFile(Core.getFile(parameterName), description);
		throw new Exception(gt("Parâmetro invalido"));
	}
	/**
	 * Insert a file to the Igrp core DataBase and return an Id ...
	 * 
	 * @param file
	 * @param name
	 * @return in ID
	 */
	public static int saveFile(Part file, String name) {
		int lastInsertedId = 0;
		if(file!=null) {
			String igrpCoreConnection = new ConfigApp().getBaseConnection();
			java.sql.Connection conn = new Connection().getConnection(igrpCoreConnection);
			if (conn != null) {
				name = (name == null || name.trim().isEmpty() ? file.getName() : name);
				// String sysdate = LocalDate.parse(LocalDate.now().toString(),
				// DateTimeFormatter.ofPattern("yyyy-MM-dd")).toString();
				String standardSql = "insert into tbl_clob(c_lob_content, dt_created, mime_type, name) values(?, ?, ?, ?)";
				try {
					conn.setAutoCommit(false);
					java.sql.PreparedStatement ps = conn.prepareStatement(standardSql,
							java.sql.PreparedStatement.RETURN_GENERATED_KEYS);
					ps.setBinaryStream(1, file.getInputStream());
					// ps.setString(2, sysdate);
					ps.setDate(2, new Date(System.currentTimeMillis()));
					ps.setString(3, file.getContentType());
					ps.setString(4, name);
					if (ps.executeUpdate() > 0) {
						try (java.sql.ResultSet rs = ps.getGeneratedKeys()) {
							if (rs.next()) {
								lastInsertedId = rs.getInt(1);
							}
						}
						ps.close();
					}
					conn.commit();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			try {
				file.delete();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return lastInsertedId;
	}

	public static void setAttribute(String name, Object value) {
		Igrp.getInstance().getRequest().setAttribute(name, value);
	}

	/**
	 * Shows a error flash message "Falha ao tentar efetuar esta operação!"
	 */
	public static void setMessageError() {
		nosi.core.servlet.IgrpServlet.LOGGER.error(FlashMessage.MESSAGE_ERROR);
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt(FlashMessage.MESSAGE_ERROR));
	}

	/**
	 * Shows a custom error flash message
	 * 
	 * @param msg Custom message string
	 */
	public static void setMessageError(String msg) {
		nosi.core.servlet.IgrpServlet.LOGGER.error(gt(msg));

		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt(msg));
	}

	/**
	 * Add Message Info
	 * 
	 * @param msg custom message
	 */
	public static void setMessageInfo(String msg) {
		nosi.core.servlet.IgrpServlet.LOGGER.info(gt(msg));
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO, gt(msg));
	}

	/**
	 * Add Message Info With Link
	 * 
	 * @param msg  custom message
	 * @param link set a link to show
	 */
	public static void setMessageInfoLink(String msg, String link) {
		nosi.core.servlet.IgrpServlet.LOGGER.info(gt(msg) + "/#RESERVE#/" + link);
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO_LINK, gt(msg) + "/#RESERVE#/" + link);
	}

	/**
	 * Add Message Info With Link
	 * 
	 * @param msg    custom message
	 * @param app    for the created link
	 * @param page   for the created link
	 * @param action for the created link
	 */
	public static void setMessageInfoLink(String msg, String app, String page, String action) {
		nosi.core.servlet.IgrpServlet.LOGGER
				.info(gt(msg) + "/#RESERVE#/" + new Config().getResolveUrl(app, page, action));
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO_LINK,
				gt(msg) + "/#RESERVE#/" + new Config().getResolveUrl(app, page, action));
	}

	/**
	 * Shows a success flash message "Operação efetuada com sucesso!"
	 */
	public static void setMessageSuccess() {
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, gt(FlashMessage.MESSAGE_SUCCESS));
	}

	/**
	 * Shows a custom success flash message
	 * 
	 * @param msg Custom message string
	 */
	public static void setMessageSuccess(String msg) {
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, gt(msg));
	}

	/**
	 * Shows a custom confirm flash message
	 * 
	 * @param msg Custom message string
	 */
	public static void setMessageConfirm(String msg) {
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.CONFIRM, gt(msg));
	}
	
	/**
	 * Shows a confirm flash message "Deseja realmente realizar esta operação?"
	 * 
	 */
	public static void setMessageConfirm() {
		Core.setMessageConfirm(FlashMessage.MSG_CONFIRM);
	}
	
	/**
	 * Add Message Warning
	 * 
	 * @param msg custom message
	 */
	public static void setMessageWarning(String msg) {
		nosi.core.servlet.IgrpServlet.LOGGER.warn(gt(msg));
		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING, gt(msg));
	}

	public static void setTaskVariableString(String variableName, String value) {
		setTaskVariable(variableName,"global","string", value);
	}
	public static void setTaskVariableInt(String variableName, Integer value) {
		setTaskVariable(variableName,"global","integer", value);
	}
	
	public static void setTaskVariableShort(String variableName, Short value) {
		setTaskVariable(variableName,"global","short", value);
	}
	
	public static void setTaskVariableLong(String variableName, Long value) {
		setTaskVariable(variableName,"global","long", value);
	}
	
	public static void setTaskVariableDouble(String variableName, Double value) {
		setTaskVariable(variableName,"global","double", value);
	}
	
	public static void setTaskVariableBoolean(String variableName, boolean value) {
		setTaskVariable(variableName,"global","boolean", value);
	}
	
	public static void setTaskVariableDate(String variableName, java.util.Date value) {
		setTaskVariable(variableName,"global","date", value);
	}

	public static void setTaskVariableBinary(String variableName, Byte[] value) {
		setTaskVariable(variableName,"global","binary", value);
	}
	
	public static void setTaskVariableSerializable(String variableName, Object value) {
		setTaskVariable(variableName,"global","serializable", value);
	}
	
	public static void setTaskVariableString(String variableName,String scope, String value) {
		setTaskVariable(variableName,"global",scope, value);
	}
	public static void setTaskVariableInt(String variableName, String scope, Integer value) {
		setTaskVariable(variableName,scope,"integer", value);
	}
	
	public static void setTaskVariableShort(String variableName, String scope, Short value) {
		setTaskVariable(variableName,scope,"short", value);
	}
	
	public static void setTaskVariableLong(String variableName, String scope, Long value) {
		setTaskVariable(variableName,scope,"long", value);
	}
	
	public static void setTaskVariableDouble(String variableName, String scope, Double value) {
		setTaskVariable(variableName,scope,"double", value);
	}
	
	public static void setTaskVariableBoolean(String variableName, String scope, boolean value) {
		setTaskVariable(variableName,scope,"boolean", value);
	}
	
	public static void setTaskVariableDate(String variableName, String scope, java.util.Date value) {
		setTaskVariable(variableName,scope,"date", value);
	}

	public static void setTaskVariableBinary(String variableName, String scope, Byte[] value) {
		setTaskVariable(variableName,scope,"binary", value);
	}
	
	public static void setTaskVariableSerializable(String variableName, String scope, Object value) {
		setTaskVariable(variableName,scope,"serializable", value);
	}

	public static void setTaskVariable(String variableName, String scope, String type, Object value) {
		String taskId = Core.getParamTaskId();
		TaskService task = new TaskService().getTask(taskId);
		if (task != null) {
			if (scope.equalsIgnoreCase("global"))
				task.deleteVariable(variableName);
			task.addVariable(variableName, scope, type, value);
			task.submitVariables();
		}
	}

	public static String getTaskVariable(String variableName) {
		if (Core.isNull(variableName))
			return "";
		String id = getParamTaskId();
		TaskService task = new TaskService().getTask(id);
		List<TaskVariables> vars = Core.getTaskVariables(task.getTaskDefinitionKey());
		if (vars != null) {
			List<TaskVariables> var = vars.stream()
					.filter(v -> v.getName().equalsIgnoreCase(task.getTaskDefinitionKey() + "_" + variableName))
					.collect(Collectors.toList());
			return (var != null && var.size() > 0) ? (String) var.get(var.size() - 1).getValue() : "";
		}
		return "";
	}

	public static String getTaskVariable(String taskDefinitionKey, String variableName) {
		List<TaskVariables> vars = Core.getTaskVariables(taskDefinitionKey);
		if (vars != null) {
			List<TaskVariables> var = vars.stream()
					.filter(v -> v.getName().equalsIgnoreCase(taskDefinitionKey + "_" + variableName))
					.collect(Collectors.toList());
			return (var != null && var.size() > 0) ? (String) var.get(var.size() - 1).getValue() : "";
		}
		return "";
	}
	
	public static String getTaskVariableString(String variableName) {
		return Core.getTaskVariable(variableName);
	}
	
	public static String getTaskVariableString(String taskDefinitionKey,String variableName) {
		return Core.getTaskVariable(taskDefinitionKey,variableName);
	}
	
	public static Boolean getTaskVariableBoolean(String variableName) {
		String v = Core.getTaskVariable(variableName);
		return Core.isNotNull(v) ? true : false;
	}

	public static Boolean getTaskVariableBoolean(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.isNotNull(v) ? true : false;
	}

	public static Double getTaskVariableDouble(String variableName) {
		String v = Core.getTaskVariable(variableName);
		return Core.isNotNull(v) ? Core.toDouble(v) : 0;
	}

	public static Double getTaskVariableDouble(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.isNotNull(v) ? Core.toDouble(v) : 0;
	}

	public static Integer getTaskVariableInt(String variableName) {
		String v = Core.getTaskVariable(variableName);
		return Core.isNotNull(v) ? Core.toInt(v) : 0;
	}

	public static Integer getTaskVariableInt(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.isNotNull(v) ? Core.toInt(v) : 0;
	}
	
	public static Short getTaskVariableShort(String variableName) {
		String v = Core.getTaskVariable(variableName);
		return Core.isNotNull(v) ? Core.toShort(v) : 0;
	}

	public static Short getTaskVariableShort(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.isNotNull(v) ? Core.toShort(v) : 0;
	}
	public static Long getTaskVariableLong(String variableName) {
		String v = Core.getTaskVariable(variableName);
		return Core.isNotNull(v) ? Core.toLong(v) : 0;
	}

	public static Long getTaskVariableLong(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.isNotNull(v) ? Core.toLong(v) : 0;
	}

	public static java.util.Date getTaskVariableDate(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.ToDate(v, "yyyy-mm-dd");
	}

	public static java.util.Date getTaskVariableDate(String taskDefinitionKey, String variableName,String format) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.ToDate(v, format);
	}
	
	public static java.util.Date getTaskVariableDate(String variableName) {
		String v = Core.getTaskVariable(variableName);
		return Core.ToDate(v, "yyyy-mm-dd");
	}
	
	public static byte[] getTaskVariableByte(String variableName) {
		String v = Core.getTaskVariable(variableName);
		return v.getBytes();
	}
	
	public static byte[] getTaskVariableByte(String taskDefinitionKey,String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey,variableName);
		return v.getBytes();
	}

	public static Object getTaskVariableSerializable(String variableName) {
		if (Core.isNull(variableName))
			return null;
		String id = getParamTaskId();
		TaskService task = new TaskService().getTask(id);
		List<TaskVariables> vars = Core.getTaskVariables(task.getTaskDefinitionKey());
		if (vars != null) {
			List<TaskVariables> var = vars.stream()
					.filter(v -> v.getName().equalsIgnoreCase(task.getTaskDefinitionKey() + "_" + variableName))
					.collect(Collectors.toList());
			return (var != null && var.size() > 0) ? (String) var.get(var.size() - 1).getValue() : null;
		}
		return null;
	}
	
	public static Object getTaskVariableSerializable(String taskDefinitionKey,String variableName) {
		List<TaskVariables> vars = Core.getTaskVariables(taskDefinitionKey);
		if (vars != null) {
			List<TaskVariables> var = vars.stream()
					.filter(v -> v.getName().equalsIgnoreCase(taskDefinitionKey + "_" + variableName))
					.collect(Collectors.toList());
			return (var != null && var.size() > 0) ? (String) var.get(var.size() - 1).getValue() : null;
		}
		return null;
	}
	
	public static String getTaskVariableId(String taskDefinitionKey) {
		List<TaskVariables> vars = Core.getTaskVariables(taskDefinitionKey);
		if (vars != null) {
			List<TaskVariables> var = vars.stream()
					.filter(v -> v.getName().equalsIgnoreCase(taskDefinitionKey + "_" + "p_task_id"))
					.collect(Collectors.toList());
			return (var != null && var.size() > 0) ? (String) var.get(var.size() - 1).getValue() : "";
		}
		return "";
	}
	public static List<TaskVariables> getTaskVariables(String taskDefinitionKey) {
		String id = Core.getExecutionId();
		if (Core.isNotNull(id)) {
			List<HistoricTaskService> task1 = new HistoricTaskService().getHistory(taskDefinitionKey, id);
			if (task1 != null && task1.size() > 0) {
				return task1.get(task1.size() - 1).getVariables();
			}
		}
		return null;
	}

	
	/**
	 * @param wsdlUrl     The webservice description language url
	 * @param namespaces  A Map of all required namespaces
	 * @param headers     A Map of soap request headers
	 * @param bodyContent A Map of request content that will be converted to xml
	 * @return SoapClient object
	 */
	public static SoapClient soapClient(String wsdlUrl, Map<String, String> namespaces, Map<String, String> headers,
			Map<String, Object> bodyContent) {
		SoapClient sc = new SoapClient(wsdlUrl);
		sc.setHeaders(headers);
		sc.doRequest(namespaces, bodyContent);
		sc.call();
		return sc;
	}

	/**
	 * @param soapEnvelopeName The custom soap tag name envelope
	 * @param soapNamespaceEnvelope custom namespace for custom tag name envelope
	 * @param wsdlUrl     The webservice description language url
	 * @param namespaces  A Map of all required namespaces
	 * @param headers     A Map of soap request headers
	 * @param bodyContent A Map of request content that will be converted to xml
	 * @return SoapClient object
	 */
	public static SoapClient soapClient(String wsdlUrl, Map<String, String> namespaces, Map<String, String> headers,
			Map<String, Object> bodyContent,String soapEnvelopeName,String soapNamespaceEnvelope) {
		SoapClient sc = new SoapClient(wsdlUrl);
		sc.setPrintInConsole(false);
		sc.setHeaders(headers);
		sc.setSoapEnvelopeName(soapEnvelopeName);
		sc.setSoapNamespaceEnvelope(soapNamespaceEnvelope);
		sc.doRequest(namespaces, bodyContent);
		sc.call();
		return sc;
	}
	
	/**
	 * @param wsdlUrl     The webservice description language url
	 * @param headers     A Map of soap request headers
	 * @param rawEnvelope String of raw request envelope
	 * 
	 * @return SoapClient object
	 */
	public static SoapClient soapClient(String wsdlUrl, Map<String, String> headers, String rawEnvelope) {
		SoapClient sc = new SoapClient(wsdlUrl);
		sc.setHeaders(headers);
		sc.doRequest(rawEnvelope);
		sc.call();
		return sc;
	}

	public static String ToChar(java.sql.Date date, String formatIn) {
		return DateHelper.convertDateToString(date, formatIn);
	}

	public static String ToChar(String date, String formatOut) {
		return DateHelper.convertDate(date, "yyyy-MM-dd", formatOut);
	}

	

	public static String ToChar(String date, String formatIn, String formatOut) {
		return DateHelper.convertDate(date, formatIn, formatOut);
	}

	public static java.sql.Date ToDate(String date, String formatIn) {
		return DateHelper.convertStringToDate(date, formatIn);
	}

	public static java.sql.Date ToDate(String date, String formatIn, String formatOut) {
		return DateHelper.formatDate(date, formatIn, formatOut);
	}

	public static String convertTimeStampToDate(String date,String format) {
		return DateHelper.convertTimeStampToDate(date, format);
	}
	/**
	 * Verifies if the Core.isBigDecimal and if true, than returns BigDecimal parse of it,
	 * else returns 0
	 * 
	 * @param value
	 * @return new BigDecimal(value) or 0
	 * 
	 */
	public static BigDecimal toBigDecimal(String value) {
		return toBigDecimal(value,new BigDecimal(0.0));
	}
	
	public static BigDecimal toBigDecimal(String value,BigDecimal defaultValue) {
		if (Core.isNotNull(value)) {
			try {
				return new BigDecimal(value.toString());
			}catch(NumberFormatException e) {
				
			}
		}
		return defaultValue;
	}
	
	/**
	 * Verifies if the Core.isBigInteger and if true, than returns BigInteger parse of it,
	 * else returns 0
	 * 
	 * @param value
	 * @return new BigInteger(value) or 0
	 * 
	 */
	public static BigInteger toBigInteger(String value) {
		return toBigInteger(value,new BigInteger("0"));
	}
	
	public static BigInteger toBigInteger(String value,BigInteger defaultValue) {
		if (Core.isNotNull(value)) {
			try {
				return new BigInteger(value.toString());
			}catch(NumberFormatException e) {
				return defaultValue;
			}
		}
		return defaultValue;
	}
	
	/**
	 * Verifies if the Core.isDouble and if true, than returns double parse of it,
	 * else returns 0
	 * 
	 * @param value
	 * @return Double.parseDouble(value) or 0
	 * 
	 */
	public static Double toDouble(String value) {
		return toDouble(value, 0.0);
	}

	public static Double toDouble(String value, double defaultValue) {
		if (Core.isNotNull(value)) {
			try {
				return Double.parseDouble(value);
			}catch(NumberFormatException e) {
				return defaultValue;
			}
		}
		return defaultValue;
	}

	/**
	 * Verifies if the String is a Float, than returns the parse of it, else returns
	 * 0
	 * 
	 * @param value
	 * @return Float.parseFloat(value) or 0
	 * 
	 */
	public static Float toFloat(String value) {
		return toFloat(value,0);
	}
	
	public static Float toFloat(String value, float defaultValue) {
		if (Core.isNotNull(value)) {
			try {
				return Float.parseFloat(value);
			}catch(NumberFormatException e) {
				return defaultValue;
			}
		}
		return defaultValue;
	}

	/**
	 * Verifies if Core.isInt and if true, than returns integer parse of it, else
	 * returns 0
	 * 
	 * @param value
	 * @return Integer.parseInt(value) or 0
	 * 
	 */
	public static Integer toInt(String value) {
		return toInt(value,0);
	}

	/**
	 * Verifies if Core.isInt and if true, than returns integer parse of it else
	 * returns defaultValue
	 * 
	 * @param value
	 * @param defaultValue
	 * @return Integer.parseInt(value) or defaultValue
	 * 
	 */
	public static Integer toInt(String value, int defaultValue) {
		if (Core.isNotNull(value)) {
			try{
				return Integer.parseInt(value);
			}catch(NumberFormatException e) {
				return defaultValue;
			}
		}
		return defaultValue;
	}
	
	public static String toJson(Object appP) {
		if(appP!=null)
			return new Gson().toJson(appP);
		return "";
	}

	public static String toJsonWithJsonBuilder(Object appP) {
		if(appP!=null)
			return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(appP);
		return "";
	}

	public static Long toLong(String value) {
		return toLong(value,0);
	}

	public static Long toLong(String value, long defaultValue) {
		if (Core.isNotNull(value)) {
			try {
				return Long.parseLong(value);
			}catch(NumberFormatException e) {
				return defaultValue;
			}
		}
		return defaultValue;
	}

	/**
	 * Example of use
	 * {@code final Map<Object, Object> map = Core.toMap(new Modulo().getModuloByApp(Core.toInt(model.getApplication())), "name",
	+				"descricao");}
	 * 
	 * @param values
	 * @param keyField
	 * @param valueField
	 * @return {@code Map<?, ?>}
	 */
	public static Map<?, ?> toMap(List<?> values, String keyField, String valueField) {
		return IgrpHelper.toMap(values, keyField, valueField);
	}

	/**
	 * Example of use
	 * {@code final Map<Object, Object> map = Core.toMap(new Modulo().getModuloByApp(Core.toInt(model.getApplication())), "name",
	+				"descricao", "-- Selecionar --");}
	 * 
	 * @param values
	 * @param keyField
	 * @param valueField
	 * @param prompt     - use -- Selecionar --
	 * @return {@code Map<Object, Object>}
	 */
	public static Map<Object, Object> toMap(List<?> values, String keyField, String valueField, String prompt) {
		return IgrpHelper.toMap(values, keyField, valueField, prompt);
	}

	public static Short toShort(String value) {
		if (Core.isInt(value))
			return Short.parseShort(value);
		return 0;
	}

	public static Short toShort(String value, short defaultValue) {
		if (Core.isInt(value))
			return Short.parseShort(value);
		return defaultValue;
	}

	public static Object unnserializeFromTask(Object obj, String json)
			throws IllegalArgumentException, IllegalAccessException {
		CustomVariableIGRP rows = new Gson().fromJson(json, CustomVariableIGRP.class);
		for (java.lang.reflect.Field f : obj.getClass().getDeclaredFields()) {
			f.setAccessible(true);
			rows.getRows().stream().filter(r -> r.getName().equalsIgnoreCase("p_" + f.getName())).forEach(r -> {
				IgrpHelper.setField(obj, f, r.getValue());
			});
		}
		return (Object) obj;
	}
	
	public static BaseQueryInterface update(String tableName) {
		return new QueryUpdate(Core.defaultConnection()).update(tableName);
	}

	public static BaseQueryInterface update(String connectionName, String tableName) {
		return new QueryUpdate(connectionName).update(tableName);
	}

	public static BaseQueryInterface update(String connectionName, String schemaName, String tableName) {
		return new QueryUpdate(connectionName).update(schemaName, tableName);
	}
	
	public static BaseQueryInterface update(String tableName,boolean displayError,boolean tracingError) {
		return new QueryUpdate(Core.defaultConnection(),displayError,tracingError).update(tableName);
	}

	public static BaseQueryInterface update(String connectionName, String tableName,boolean displayError,boolean tracingError) {
		return new QueryUpdate(connectionName,displayError,tracingError).update(tableName);
	}

	public static BaseQueryInterface update(String connectionName, String schemaName, String tableName,boolean displayError,boolean tracingError) {
		return new QueryUpdate(connectionName,displayError,tracingError).update(schemaName, tableName);
	}
	
	/**
	 * Upload a file from a upload field with the tag given
	 * 
	 * @param tag p_file
	 * @return class UploadedFile
	 */
	public static UploadedFile upload(String tag) {
		UploadedFile uF = UploadedFile.getInstance(tag);
		return uF;
	}
	
	/**
	 * Upload all files from a all the upload field
	 * 
	 * 
	 * @return {@code List<UploadedFile>}
	 */
	public static List<UploadedFile> uploadMultiple() {
		List<UploadedFile> uF = UploadedFile.getInstances();
		return uF;
	}

	/**
	 * Upload multiple files from a multiple upload field with the tag given
	 * 
	 * @param tag p_file
	 * @return {@code List<UploadedFile>}
	 */
	public static List<UploadedFile> uploadMultiple(String tag) {
		List<UploadedFile> uF = UploadedFile.getInstances(tag);
		return uF;
	}
	public static boolean validateQuery(Config_env config_env, String query) {
		return new QuerySelect().validateQuery(config_env, query);
	}
	
	/**
	 * Return the link to use in IGRP
	 * 
	 * @param app
	 * @param page
	 * @param action
	 * @return
	 */
	public static String getIGRPLink(String app,String page,String action) {
		return new Config().getResolveUrl(app,page,action);
	}
	

	/**
	 *Convert int array to String array
	 *Example: {@code convertArrayIntToArrayString(new int[]{1,2,3}); -> String[]{"1","2","3"};}
	 * @param array
	 * @return
	 */
	public static String[] convertArrayIntToArrayString(int[] array) {
		Function<int[], String[]> intToString = x -> {
			String[] a = new String[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] =""+x[i];
			}
			return a;
		};
		return intToString.apply(array);
	}
	
	/**
	 *Convert float array to String array
	 *Example: {@code convertArrayFloatToArrayString(new float[]{1.0,2,3}); -> String[]{"1.0","2","3"};}
	 * @param array
	 * @return
	 */
	public static String[] convertArrayFloatToArrayString(float[] array) {
		Function<float[], String[]> intToString = x -> {
			String[] a = new String[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] =""+x[i];
			}
			return a;
		};
		return intToString.apply(array);
	}
	
	
	/**
	 *Convert double array to String array
	 *Example: {@code convertArrayDoubleToArrayString(new double[]{1,2,3}); -> String[]{"1","2","3"};}
	 * @param array
	 * @return
	 */
	public static String[] convertArrayDoubleToArrayString(double[] array) {
		Function<double[], String[]> intToString = x -> {
			String[] a = new String[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] =""+x[i];
			}
			return a;
		};
		return intToString.apply(array);
	}
	
	/**
	 *Convert short array to String array
	 *Example: {@code convertArrayShortToArrayString(new short[]{1,2,3}); -> String[]{"1","2","3"};}
	 * @param array
	 * @return
	 */
	public static String[] convertArrayShortToArrayString(short[] array) {
		Function<short[], String[]> intToString = x -> {
			String[] a = new String[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] =""+x[i];
			}
			return a;
		};
		return intToString.apply(array);
	}
	
	
	/**
	 *Convert Object array to String array
	 *Example: {@code convertArrayObjectToArrayString(new Integer[]{1,2,3}); -> String[]{"1","2","3"};}
	 * @param array
	 * @return
	 */
	public static <N> String[] convertArrayObjectToArrayString(N[] array) {
		Function<N[], String[]> intToString = x -> {
			String[] a = new String[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] =""+x[i];
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 *Convert Object array to primitive int array
	 *Example: {@code convertArrayObjectToArrayInt(new String[]{"1","2","3"}); -> int[]{1,2,3};}
	 * @param array
	 * @return
	 */
	public static <N> int[] convertArrayObjectToArrayInt(N[] array) {
		Function<N[], int[]> intToString = x -> {
			int[] a = new int[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] = Core.toInt((String) x[i]);
			}
			return a;
		};
		return intToString.apply(array);
	}
	
	/**
	 *Convert Object array to primitive short array
	 *Example: {@code convertArrayObjectToArrayPShort(new String[]{"1","2","3"}); -> short[]{1,2,3};}
	 * @param array
	 * @return
	 */
	public static <N> short[] convertArrayObjectToArrayPShort(N[] array) {
		Function<N[], short[]> intToString = x -> {
			short[] a = new short[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] = Core.toShort((String) x[i]);
			}
			return a;
		};
		return intToString.apply(array);
	}
	
	/**
	 *Convert Object array to primitive float array
	 *Example: {@code convertArrayObjectToArrayPFloat(new String[]{"1","2","3"}); -> float[]{1,2,3};}
	 * @param array
	 * @return
	 */
	public static <N> float[] convertArrayObjectToArrayPFloat(N[] array) {
		Function<N[], float[]> intToString = x -> {
			float[] a = new float[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] = Core.toFloat((String) x[i]);
			}
			return a;
		};
		return intToString.apply(array);
	}
	
	/**
	 *Convert Object array to primitive double array
	 * Example: {@code convertArrayObjectToArrayPDouble(new String[]{"1","2","3"}); -> double[]{1,2,3};}
	 * @param array
	 * @return
	 */
	public static <N> double[] convertArrayObjectToArrayPDouble(N[] array) {
		Function<N[], double[]> intToString = x -> {
			double[] a = new double[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] = Core.toDouble((String) x[i]);
			}
			return a;
		};
		return intToString.apply(array);
	}
	
	/**
	 *Convert Object array to Integer array
	 * Example: {@code convertArrayObjectToArrayInteger(new String[]{"1","2","3"}); -> Integer[]{1,2,3};}
	 * @param array
	 * @return
	 */
	public static <N> Integer[] convertArrayObjectToArrayInteger(N[] array) {
		Function<N[], Integer[]> intToString = x -> {
			Integer[] a = new Integer[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] = Core.toInt((String) x[i]);
			}
			return a;
		};
		return intToString.apply(array);
	}
	
	/**
	 * Convert Object array to Float array
	 * Example: {@code convertArrayObjectToArrayFloat(new String[]{"1","2","3"}); -> Float[]{1.0,2.0,3.0};}
	 * @param array
	 * @return
	 */
	public static <N> Float[] convertArrayObjectToArrayFloat(N[] array) {
		Function<N[], Float[]> intToString = x -> {
			Float[] a = new Float[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] = Core.toFloat((String) x[i]);
			}
			return a;
		};
		return intToString.apply(array);
	}
	
	/**
	 *Convert Object array to Double array
	 *Example: {@code convertArrayObjectToArrayDouble(new String[]{"1","2","3"}); -> Double[]{1,2,3};}
	 * @param array
	 * @return
	 */
	public static <N> Double[] convertArrayObjectToArrayDouble(N[] array) {
		Function<N[], Double[]> intToString = x -> {
			Double[] a = new Double[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] = Core.toDouble((String) x[i]);
			}
			return a;
		};
		return intToString.apply(array);
	}
	
	/**
	 * Convert Object array to Short array
	 * Example: {@code convertArrayObjectToArrayShort(new String[]{"1","2","3"}); -> String[]{1,2,3};}
	 * @param array
	 * @return
	 */
	public static <N> Short[] convertArrayObjectToArrayShort(N[] array) {
		Function<N[], Short[]> intToString = x -> {
			Short[] a = new Short[x.length];
			for(int i=0;i<x.length;i++) {
				a[i] = Core.toShort((String) x[i]);
			}
			return a;
		};
		return intToString.apply(array);
	}
	
	/**
	 * Compare 2 arrays if there are the same size
	 * 
	 * @param array1
	 * @param array2
	 * @return {@code
	 *  if(Core.isNotNullMultiple(array1,array2))
			r = array1.length==array2.length;
		 return r;}
	 */
	public static boolean isArraySameSize(Object[]array1,Object[]array2) {
		boolean r = false;
		if(Core.isNotNullMultiple(array1,array2)) {
			r = array1.length==array2.length;
		}
		return r;
	}
	/**
	 * Extracts from a list of checkboxs, the checked and unchecked
	 * 
	 * Example import nosi.core.webapp.helpers.CheckBoxHelper; 
	 * {@code CheckBoxHelper cb = Core.extractCheckBox(Core.getParamArray("p_menu"), Core.getParamArray("p_menu_check"));
	 * cb.getUncheckedIds();
	 * cb.getChekedIds()
	 * 
	 * }
	 * @param array_checks - list of the id of the checkbox
	 * @param array__checks_checked - list of the checked checkbox
	 * @return
	 */
	public static CheckBoxHelper extractCheckBox(String[] array_checks,String[] array__checks_checked) {
		return new CheckBoxHelper(array_checks, array__checks_checked);
	}
	
	/**
	 * Get Session to programming custom CRUD
	 * @param connectionName
	 * @return
	 */
	public static Session getSession(String connectionName) {	
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory(connectionName,null);
		if(sessionFactory!=null)
			return sessionFactory.getCurrentSession();
		throw new HibernateException(Core.gt("Problema de conexão. Por favor verifica o seu ficheiro hibernate."));
	}
}
