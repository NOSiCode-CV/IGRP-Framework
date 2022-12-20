package nosi.core.webapp;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.config.ConfigApp;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPLink;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.HiddenField;
import nosi.core.integration.pdex.email.PdexEmailGateway;
import nosi.core.integration.pdex.email.PdexEmailGatewayPayloadDTO;
import nosi.core.mail.EmailMessage;
import nosi.core.mail.EmailMessage.Attachment;
import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.activit.rest.business.TaskServiceIGRP;
import nosi.core.webapp.activit.rest.entities.*;
import nosi.core.webapp.activit.rest.services.ProcessInstanceServiceRest;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import nosi.core.webapp.bpmn.BPMNConstants;
import nosi.core.webapp.bpmn.BPMNExecution;
import nosi.core.webapp.bpmn.BPMNHelper;
import nosi.core.webapp.databse.helpers.*;
import nosi.core.webapp.helpers.*;
import nosi.core.webapp.helpers.datehelper.IGRPDateFromTo;
import nosi.core.webapp.helpers.datehelper.IGRPDaysOff;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.core.webapp.security.Permission;
import nosi.core.webapp.uploadfile.UploadFile;
import nosi.core.webapp.webservices.rest.Geografia;
import nosi.core.webapp.webservices.soap.SoapClient;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Transaction;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.modelmapper.ModelMapper;

import javax.persistence.Tuple;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.xml.transform.TransformerFactoryConfigurationError;
import java.io.*;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.FileNameMap;
import java.net.URLConnection;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.Normalizer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.Temporal;
import java.util.*;
import java.util.Map.Entry;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * The core of the IGRP, here you can find all the main functions and helper
 * function useful like toInt, parceInt, isNotNull...
 * 
 * @author: Emanuel Pereira 13 Nov 2017 
 */
public final class Core {

	private Core() {
	}

	public static class MimeType extends nosi.core.webapp.helpers.mime_type.MimeType {
	}

	public enum Cons {

		DATE_SEPARATOR(" / "), DATE_FORMAT("dd-MM-yyyy");

		private final String value;

		private Cons(String value) {
			this.value = value;
		}

		public String getValue() {
			return value;
		}
	}

	public static final String NO_PERMITION_MSG = "No permission";
	public static final String DD_MM_YYYY = "dd-MM-yyyy";
	public static final String YYYY_MM_DD = "yyyy-MM-dd";

	/**
	 * Add Hidden field to form
	 * 
	 * @param name
	 *            parameter name
	 * @param value
	 *            value of parameter
	 */
	public static void addHiddenField(String name, Object value) {
		Field f = new HiddenField(null, name);
		f.propertie().add("value", value).add("name", "p_" + name).add("type", "hidden").add("maxlength", "250")
				.add("java-type", "").add("tag", name);
		f.setValue(value);
		IGRPForm.hiddenFields.add(f);
	}

	/**
	 * set attibute in session
	 * {@code Igrp.getInstance().getRequest().getSession().setAttribute(key, value);}
	 * 
	 * @param key
	 * @param value
	 */
	public static void addToSession(String key, Object value) {
		Igrp.getInstance().getRequest().getSession().setAttribute(key, value);
	}

	/**
	 * Returns the applications host + /IGRP/app/webapps Example:
	 * "http://<hostname>/<warName>/app/webapps"
	 * 
	 * @return "http://<hostname>/<warName>/app/webapps"
	 */

	public static String getHostName() {
		HttpServletRequest req = Igrp.getInstance().getRequest();
		return req.getRequestURL().toString();
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
	 * Format a date string and return to the formatOut another date String Example
	 * of use
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
	 * 
	 * @param date
	 * @param formatIn
	 * @return
	 */
	public static Timestamp ToTimestamp(String date, String formatIn) {
		return DateHelper.convertStringToTimestamp(date, formatIn);
	}

	public static User addUser(String name, String password, String email, String username) {

		User usrEmail = Core.findUserByEmail(email);// verificar email
		User usrName = Core.findUserByUsername(username);// verificar username
		if (usrEmail != null || usrName != null) {
			Core.setMessageWarning("Email/Username já existe!");
			return usrEmail;
		} else {
			User user = new User();
			user.setName(name);
			user.setPass_hash(nosi.core.webapp.User.encryptToHash(username + "" + password, "SHA-256"));
			user.setEmail(email.toLowerCase().trim());
			user.setUser_name(username);
			user.setStatus(1);
			user.setCreated_at(System.currentTimeMillis());
			user.setUpdated_at(System.currentTimeMillis());
			user.setAuth_key(nosi.core.webapp.User.generateAuthenticationKey());
			user.setActivation_key(nosi.core.webapp.User.generateActivationKey());
			user.setUpdated_at(System.currentTimeMillis());
			user.insert();
			return user;
		}
	}

	public static boolean inviteUserInProfile(User user, Organization organization, ProfileType profiletype, Application app) {
		boolean ok = true;
		if (app.getDad().equals(profiletype.getApplication().getDad())) {
			if (Core.isNotNull(new Profile().find().andWhere("type", "=", "PROF").andWhere("type_fk", "=", profiletype)
					.andWhere("organization.id", "=", organization.getId()).andWhere("profileType.id", "=", profiletype)
					.andWhere("user.id", "=", user.getId()).one())) {
				// Already invited
				Core.setMessageWarning(user.getUser_name() + " está convidado para este perfil.");
				ok = false;
			} else {
				// Will insert profile
				Profile p = new Profile(profiletype.getId(), "PROF", profiletype, user, organization).insert();
				if (!p.hasError()) {
					// Check if exists already a ENV
					if (Core.isNull(new Profile().find().andWhere("type", "=", "ENV")
							.andWhere("type_fk", "=", profiletype.getApplication().getId())
							.andWhere("organization.id", "=", organization.getId())
							.andWhere("profileType.id", "=", profiletype.getId()).andWhere("user.id", "=", user.getId())
							.one())) {
						// ENV not added, so must be inserted the application
						p = new Profile(profiletype.getApplication().getId(), "ENV", profiletype, user, organization)
								.insert();
						if (p.hasError()) {
							Core.setMessageError();
							ok = false;
						}
					}
					if (ok)
						Core.setMessageSuccess(user.getEmail() + " convidado para o perfil " + profiletype.getDescr());
				} else {
					Core.setMessageError(user.getUser_name() + " está convidado para este perfil.");
					ok = false;
				}
			}
		} else {
			Core.setMessageError("Não pode convidar para a aplicação " + profiletype.getApplication().getDad());
			ok = false;
		}
		return ok;
	}

	/**
	 * @deprecated Use ToTimestamp Convert string date into Timestamp
	 * 
	 * @param date
	 * @param formatIn
	 * @return
	 */
	@Deprecated
	public static Timestamp stringToTimestamp(String date, String formatIn) {
		return DateHelper.convertStringToTimestamp(date, formatIn);
	}

	public static String decrypt(String content) {
		return EncrypDecrypt.decrypt(content);
	}

	/**
	 * Decrypt string based on secret key
	 * 
	 * @param content
	 *            content of string to decrypt
	 * @param secretKey
	 *            secret key used to decrypt
	 */
	public static String decrypt(String content, String secretKey) {
		return EncrypDecrypt.decrypt(content, secretKey);
	}

	public static String decryptPublicPage(String content) {
		return EncrypDecrypt.decryptPublicPage(content);
	}

	/**
	 * Encrypt a string
	 * 
	 * @param content
	 */
	public static String encrypt(String content) {
		return EncrypDecrypt.encrypt(content);
	}

	public static String encryptPublicPage(String content) {
		return EncrypDecrypt.encryptPublicPage(content);
	}

	/**
	 * Encrypt a string with a secret key
	 * 
	 * @param content
	 *            string content
	 * @param secretKey
	 *            string secret key
	 */
	public static String encrypt(String content, String secretKey) {
		return EncrypDecrypt.encrypt(content, secretKey);
	}

	/**
	 * @return Return the default connection name of the current application
	 */
	public static String defaultConnection() {
		return defaultConnection(Core.getCurrentDadParam());
	}

	/**
	 * Return default connection string related to dad
	 * 
	 * @param dad
	 *            application code
	 */
	public static String defaultConnection(String dad) {
		return new Connection().defaultConnection(dad);
	}

	/**
	 * Return Query of type BaseQueryInterface
	 * 
	 * @param tableName
	 * @return BaseQueryInterface nosi.core.webapp.databse.helpers.QueryDelete
	 */
	public static BaseQueryInterface delete(String tableName) {
		return new QueryDelete(Core.defaultConnection()).delete(tableName);
	}

	/**
	 * Return Query of type BaseQueryInterface from a specific connection
	 * 
	 * @param connectionName
	 *            connection name
	 * @param tableName
	 *            table name
	 * @return BaseQueryInterface nosi.core.webapp.databse.helpers.QueryDelete
	 */
	public static BaseQueryInterface delete(String connectionName, String tableName) {
		return new QueryDelete(connectionName).delete(tableName);
	}

	/**
	 * Return Query of type BaseQueryInterface from a specific connection and schema
	 * 
	 * @param connectionName
	 *            connection name
	 * @param schemaName
	 *            schema name
	 * @param tableName
	 *            table name
	 * @return BaseQueryInterface nosi.core.webapp.databse.helpers.QueryDelete
	 */
	public static BaseQueryInterface delete(String connectionName, String schemaName, String tableName) {
		return new QueryDelete(connectionName).delete(schemaName, tableName);
	}

	/**
	 * Return Query of type BaseQueryInterface
	 * 
	 * @param tableName
	 * @param displayError
	 *            display error if true
	 * @param tracingError
	 *            tracing error if true
	 * @return BaseQueryInterface nosi.core.webapp.databse.helpers.QueryDelete
	 */
	public static BaseQueryInterface delete(String tableName, boolean displayError, boolean tracingError) {
		return new QueryDelete(Core.defaultConnection(), displayError, tracingError).delete(tableName);
	}

	/**
	 * Return Query of type BaseQueryInterface from a specific connection
	 * 
	 * @param connectionName
	 *            connection name
	 * @param tableName
	 *            table name
	 * @param displayError
	 *            display error if true
	 * @param tracingError
	 *            tracing error if true
	 * @return BaseQueryInterface nosi.core.webapp.databse.helpers.QueryDelete
	 */
	public static BaseQueryInterface delete(String connectionName, String tableName, boolean displayError,
			boolean tracingError) {
		return new QueryDelete(connectionName, displayError, tracingError).delete(tableName);
	}

	/**
	 * Return Query of type BaseQueryInterface from a specific connection and schema
	 * 
	 * @param connectionName
	 *            connection name
	 * @param schemaName
	 *            schema name
	 * @param tableName
	 *            table name
	 * @param displayError
	 *            display error if true
	 * @param tracingError
	 *            tracing error if true
	 * @return BaseQueryInterface nosi.core.webapp.databse.helpers.QueryDelete
	 */
	public static BaseQueryInterface delete(String connectionName, String schemaName, String tableName,
			boolean displayError, boolean tracingError) {
		return new QueryDelete(connectionName, displayError, tracingError).delete(schemaName, tableName);
	}

	public static nosi.core.webapp.databse.helpers.ResultSet executeQuery(Config_env env, String sql) {
		QuerySelect q = new QuerySelect();
		q.setSql(sql);
		return q.executeQuery(env);
	}

	public static nosi.core.webapp.databse.helpers.ResultSet executeQuery(String connectionName, String sql) {
		QuerySelect q = new QuerySelect();
		q.setSql(sql);
		return q.executeQuery(Connection.getConnection(connectionName));
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
	 * List all Application that user has access
	 * 
	 */
	public static Map<Object, Object> getListApps() {
		return new Application().getListApps();
	}

	/**
	 * List pages By id_application
	 * 
	 * @param appId
	 * 
	 */
	public static HashMap<Integer, String> getListActions(int appId) {

		List<Action> actions = new Action().find().andWhere("application", "=", appId).andWhere("status", "=", 1)
				.andWhere("isComponent", "<>", (short) 2).all();

		HashMap<Integer, String> pages = new HashMap<>();
		pages.put(null, gt("-- Selecionar --"));

		if (Core.isNotNull(actions)) {
			for (Action ac : actions)
				pages.put(ac.getId(), Core.isNotNull(ac.getPage_descr()) ? ac.getPage_descr() : ac.getPage());
		}
		return pages;
	}

	/**
	 * find page By id_page
	 * 
	 * @param pageId
	 * 
	 */
	public static Action getInfoPage(int pageId) {
		if (Core.isNotNull(pageId)) {
			Action action = new Action().findOne(pageId);
			action.setReadOnly(true);
			return action;
		}
		return null;
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
	 * @return {@code java.sql.Date DateHelper.formatDate(data,inputFormat,outputFormat);}
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
	public static Object fromJsonWithJsonBuilder(String json, Type type) {
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(json, type);
	}

	public static String getAmberColor() {
		return "2";
	}

	/**
	 * 
	 * @param name
	 * @param isRemoved
	 *            - true removesAttribute after requested
	 * @return
	 */
	public static String getAttribute(String name, boolean isRemoved) {
		if (Igrp.getInstance() != null && Igrp.getInstance().getRequest().getAttribute(name) != null) {
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
		final Object attribute = Igrp.getInstance().getRequest().getAttribute(name);
		if (attribute instanceof Object[]) {
			Object[] valueO = (Object[]) attribute;
			Igrp.getInstance().getRequest().removeAttribute(name);
			return Arrays.copyOf(valueO, valueO.length, String[].class);
		}
		return null;
	}

	public static Object getAttributeObject(String name, boolean isRemoved) {
		Object v = Igrp.getInstance().getRequest().getAttribute(name);
		if (isRemoved)
			Igrp.getInstance().getRequest().removeAttribute(name);
		return v;
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
	 * @param name
	 *            of the config property
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
		return new Permission().getCurrentEnv();
	}

	/**
	 * Get Current Application Dad on the URL Example: dad/app/action
	 * 
	 * @return {@code new Permission().getCurrentEnv();}
	 */
	public static String getCurrentDadParam() {
		String current_app_conn = Core.getParam("current_app_conn", false);
		if (Core.isNotNull(current_app_conn)) {
			return current_app_conn;
		}
		Integer isPublic = Core.getParamInt("isPublic", false);
		String r = Core.getParam("r");
		
		switch (isPublic.intValue()) {
			case 1:			
				break;
			case 2:
				r = Core.decryptPublicPage(r);
				break;
			default:
				r = Core.decrypt(r);
				break;		
		}
		String[] r_split = Core.isNotNull(r) ? r.split("/") : null;
		return r_split != null ? r_split[0] : "igrp";
	}

	public static String getCurrentPage() {
		String current_app_conn = Core.getParam("current_app_conn", false);
		if (Core.isNotNull(current_app_conn)) {
			return current_app_conn;
		}
		Integer isPublic = Core.getParamInt("isPublic", false);
		String r = Core.getParam("r");
		
		switch (isPublic.intValue()) {
			case 1:			
				break;
			case 2:
				r = Core.decryptPublicPage(r);
				break;
			default:
				r = Core.decrypt(r);
				break;		
		}
			
		String[] r_split = Core.isNotNull(r) ? r.split("/") : null;
		return r_split != null ? r_split[1] : "igrp";
	}

	/**
	 * Get Current Datetime (dd/MM/yyyy HH:mm:ss)
	 * 
	 * @return dd/MM/yyyy HH:mm:ss
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

	@Deprecated
	/*
	 * @Deprecated use getCurrentDateSql
	 */
	public static Date getCurrentDate1() {
		return DateHelper.getCurrentDate();
	}

	/**
	 * Return the current time in java.sql.Date format
	 * 
	 * @return new java.sql.Date(System.currentTimeMillis())
	 */
	public static Date getCurrentDateSql() {
		return DateHelper.getCurrentDate();
	}

	/**
	 * Use getCurrentDateCalendar Return the current time in java.util.Date format
	 * 
	 * @return new java.util.Date(System.currentTimeMillis())
	 */

	public static java.util.Date getCurrentDateUtil() {
		return DateHelper.getCurrentDateUtil();
	}

	/**
	 * Calendar calendar = getCurrentDateCalendar() {@code
	 *  "Current Calendar's Year: calendar.get(Calendar.YEAR)); 
	    "Current Calendar's Day: calendar.get(Calendar.DATE)); 
	    "Current MINUTE: " calendar.get(Calendar.MINUTE)); 
	    "Current SECOND: " calendar.get(Calendar.SECOND)); }
	 * 
	 * @return java.util.Calendar.getInstance()
	 */
	public static java.util.Calendar getCurrentDateCalendar() {
		return DateHelper.getCurrentDateCalendar();
	}

	/**
	 * Get current Year calendar.get(Calendar.YEAR));
	 */
	public static Integer getCurrentYear() {
		return Core.getCurrentDateCalendar().get(Calendar.YEAR);
	}

	/**
	 * Get Day from a Date
	 */
	public static Integer getDayFromDate(Date date) {
		LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		return localDate.getDayOfMonth();
	}

	/**
	 * Get Month from a Date
	 */
	public static Integer getMonthFromDate(Date date) {
		LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		return localDate.getMonthValue();
	}

	/**
	 * Get Year from a Date
	 */
	public static Integer getYearFromDate(Date date) {
		LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		return localDate.getYear();
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
	 * Get current App ID
	 * 
	 * @return App integer ID
	 */
	public static Integer getCurrentAppId() {
		return new Permission().getCurrentEnvId();
	}

	/**
	 * Get current Profile Code
	 * 
	 * @return Profile String Code
	 */

	public static String getCurrentProfileCode() {
		return new Permission().getCurrentPerfilCode();
	}

	/**
	 * Get current Organization Code
	 * 
	 * @return {@code Organization String Code}
	 */
	public static String getCurrentOrganizationCode() {
		return new Permission().getCurrentOrganizationCode();
	}

	/**
	 * Get current user and than use then .getName() or getEmail or getUser_name;
	 * 
	 * @return {@code (User) Igrp.getInstance().getUser().getIdentity();}
	 */
	public static nosi.webapps.igrp.dao.User getCurrentUser() {
		if (null == Igrp.getInstance() || null == Igrp.getInstance().getUser())
			return null;
		nosi.webapps.igrp.dao.User user = (nosi.webapps.igrp.dao.User) Igrp.getInstance().getUser().getIdentity();
		if (user != null)
			user.setReadOnly(true);
		return user;
	}

	public static String getUsernameById(Integer id) {
		User user = new User().findOne(id);
		if (user != null)
			return user.getName();
		else
			return "";
	}

	/**
	 * @category DOMAIN
	 *           <p>
	 *           Find Active Domains by domain code name and app is null
	 * 
	 * @param domainsName
	 *            domain code name
	 * @return {@code List< of Domains> }
	 */
	public static List<nosi.webapps.igrp.dao.Domain> findDomainByCode(String domainsName) {
		nosi.webapps.igrp.dao.Domain domain = new nosi.webapps.igrp.dao.Domain();
		domain.setReadOnly(true);
		return domain.find().where("valor !=''").andWhere("dominio", "=", domainsName).andWhere("application", "isnull")
				.andWhere("status", "=", "ATIVE").orderBy("ordem").all();
	}

	/**
	 * @category DOMAIN
	 *           <p>
	 *           Find Active Domains by domain code name and app
	 * 
	 * @param domainName
	 *            domain code name
	 * @param applicationCode
	 *            dad/code of the application
	 * @return {@code List< of Domains> }
	 */
	public static List<nosi.webapps.igrp.dao.Domain> findDomainByCode(String domainName, String applicationCode) {
		nosi.webapps.igrp.dao.Domain domain = new nosi.webapps.igrp.dao.Domain();
		domain.setReadOnly(true);
		if (isNullOrZero(applicationCode))
			return domain.find().where("valor !=''").andWhere("dominio", "=", domainName)
					.andWhere("status", "=", "ATIVE").andWhere("application", "isnull").orderBy("ordem").all();
		return domain.find().where("valor !=''").andWhere("dominio", "=", domainName).andWhere("status", "=", "ATIVE")
				.andWhere("application.dad", "=", applicationCode).orderBy("ordem").all();
	}

	/**
	 * @category DOMAIN
	 *           <p>
	 *           Find Active Domains by domain code name and app id
	 * 
	 * @param domainName
	 *            domain code name
	 * @param applicationId
	 *            id of the application
	 * @return {@code List< of Domains> }
	 */
	public static List<nosi.webapps.igrp.dao.Domain> findDomainByCode(String domainName, Integer applicationId) {
		nosi.webapps.igrp.dao.Domain domain = new nosi.webapps.igrp.dao.Domain();
		domain.setReadOnly(true);
		return domain.find().where("valor !=''").andWhere("dominio", "=", domainName).andWhere("status", "=", "ATIVE")
				.andWhere("application.id", "=", applicationId).orderBy("ordem").all();
	}

	/**
	 * @category DOMAIN
	 *           <p>
	 *           Returns the domain whose domainName = {@code domainName}, belonging
	 *           to the current aplication and whose state is active, or an empty
	 *           map if the domain is not found. An empty map is returned also if
	 *           the domain exists and does not have values.
	 * 
	 * @param domainName
	 *            domain/code name
	 * @return a {@code Map<String, String>} of this domain with key as
	 *         {@code valor} and value as {@code description}
	 */
	public static Map<String, String> getDomainByCodeAsMap(String domainName) {
		return getDomainByCodeAsMap(domainName, Core.getCurrentDad());
	}

	/**
	 * @category DOMAIN
	 *           <p>
	 *           Returns the domain whose domainName = {@code domainName}, belonging
	 *           to the application with code = {@code applicationCode} and whose
	 *           state is active, or an empty map if the domain is not found. An
	 *           empty map is returned also if the domain exists and does not have
	 *           values.
	 * 
	 * @param domainName
	 *            domain/code name
	 * @param applicationCode
	 *            code of the application
	 * @return a {@code Map<String, String>} of this domain with key as
	 *         {@code valor} and value as {@code description}
	 */
	public static Map<String, String> getDomainByCodeAsMap(String domainName, String dad) {
		Map<String, String> domainMap = new LinkedHashMap<>();
		List<Domain> domains = findDomainByCode(domainName, dad);
		if (null != domains && !domains.isEmpty())
			domains.forEach(domain -> domainMap.put(domain.getValor(), domain.getDescription()));
		return domainMap;
	}

	/**
	 * @category DOMAIN
	 *           <p>
	 *           Returns the domain whose domainName = {@code domainName}, belonging
	 *           to the application with id = {@code applicationId} and whose state
	 *           is active or an empty map if the domain is not found. An empty map
	 *           is returned also if the domain exists and does not have values.
	 * 
	 * @param domainName
	 *            domain/code name
	 * @param applicationId
	 *            id of the application
	 * @return a {@code Map<String, String>} of this domain with key as
	 *         {@code valor} and value as {@code description}
	 */
	public static Map<String, String> getDomainByCodeAsMap(String domainName, Integer applicationId) {
		Map<String, String> domainMap = new LinkedHashMap<>();
		List<Domain> domains = findDomainByCode(domainName, applicationId);
		if (null != domains && !domains.isEmpty())
			domains.forEach(domain -> domainMap.put(domain.getValor(), domain.getDescription()));
		return domainMap;
	}

	/**
	 * @category DOMAIN
	 *           <p>
	 *           Find the Value/Decription ok a domay key
	 * 
	 * @param domainsName
	 *            domain code name
	 * @param key
	 * @return value/description
	 */
	public static String findDomainDescByKey(String domainsName, String key) {

		if (!Core.isNotNullMultiple(domainsName, key))
			return "";

		nosi.webapps.igrp.dao.Domain domain = new nosi.webapps.igrp.dao.Domain();
		domain.setReadOnly(true);
		final Domain oneDomain = domain.find().where("valor !=''")
				.andWhere("lower(dominio)", "dominio", "=", domainsName.toLowerCase())
				.andWhere("lower(valor)", "valor", "=", key.toLowerCase()).one();
		return oneDomain != null ? oneDomain.getDescription() : "";

	}

	/**
	 * @category DOMAIN
	 *           <p>
	 *           Find the Value/Decription ok a domay key
	 * 
	 * @param domainsName
	 *            domain code name
	 * @param key
	 * @param codeApp
	 *            the dad/code of the application
	 * @return value/description
	 */
	public static String findDomainDescByKey(String domainsName, String key, String codeApp) {

		if (!Core.isNotNullMultiple(domainsName, key))
			return "";
		nosi.webapps.igrp.dao.Domain domain = new nosi.webapps.igrp.dao.Domain();
		domain.setReadOnly(true);
		final Domain oneDomain = domain.find().where("valor !=''")
				.andWhere("lower(dominio)", "dominio", "=", domainsName.toLowerCase())
				.andWhere("lower(valor)", "valor", "=", key.toLowerCase()).andWhere("application.dad", "=", codeApp)
				.one();
		return oneDomain != null ? oneDomain.getDescription() : "";
	}

	/**
	 * @category DOMAIN
	 *           <p>
	 *           Find the Value/Decription ok a domay key
	 * 
	 * @param domainsName
	 *            domain code name
	 * @param key
	 * @param idApp
	 *            the id of the application
	 * @return value/description
	 */
	public static String findDomainDescByKey(String domainsName, String key, Integer idApp) {

		if (!Core.isNotNullMultiple(domainsName, key))
			return "";
		nosi.webapps.igrp.dao.Domain domain = new nosi.webapps.igrp.dao.Domain();
		domain.setReadOnly(true);
		final Domain oneDomain = domain.find().where("valor !=''")
				.andWhere("lower(dominio)", "dominio", "=", domainsName.toLowerCase())
				.andWhere("lower(valor)", "valor", "=", key.toLowerCase()).andWhere("application.id", "=", idApp).one();
		return oneDomain != null ? oneDomain.getDescription() : "";

	}

	public static String getDeepPurpleColor() {
		return "9";
	}

	/**
	 * @deprecated Use getFileByUuid(
	 * 
	 * @param fileId
	 * @return
	 */
	@Deprecated
	public static CLob getFile(int fileId) {
		return new CLob().findOne(fileId);
	}

	/**
	 * Retrieve the file
	 * 
	 * @param uuid
	 *            Uuid
	 * @return nosi.webapps.igrp.dao.Clob
	 */
	public static CLob getFileByUuid(String uuid) {
		return new CLob().find().andWhere("uuid", "=", uuid).one();
	}

	/**
	 * Returns the filename saved
	 * 
	 * @param uuid
	 *            Uuid
	 * @return FileName
	 */
	public static String getFileNameByUuid(String uuid) {
		String fileName = "";
		Map<String, Object> file = new CLob().find().andWhere("uuid", "=", uuid).oneColumns("name");
		if (file != null) {
			fileName = "" + file.get("name");
		}
		return fileName;
	}

	/**
	 * @param fileId
	 *            Id do ficheiro a ser descartado
	 * @return boolean {@code true -> Success | false -> Failure  }
	 */
	public static boolean invalidateFile(Integer fileId) {
		boolean r = false;
		CLob file = new CLob().findOne(fileId);
		if (file != null) {
			file.invalidate();
			file = file.update();
			r = file != null && !file.hasError();
		}
		return r;
	}

	/**
	 * @param uuid
	 *            Uuid do ficheiro a ser descartado
	 * @return boolean {@code true -> Success | false -> Failure  }
	 */
	public static boolean invalidateFile(String uuid) {
		boolean r = false;
		CLob file = new CLob().find().andWhere("uuid", "=", uuid).one();
		if (file != null) {
			file.invalidate();
			file = file.update();
			r = file != null && !file.hasError();
		}
		return r;
	}

	public static Part getFile(String name) throws IOException, ServletException {
		if (Core.isUploadedFiles()) {
			Part part = Igrp.getInstance().getRequest().getPart(name);
			if (part != null) {
				return part;
			}
		}
		return null;
	}

	public static boolean isUploadedFiles() {
		try {
			return Core.isNotNull(Igrp.getInstance().getRequest().getHeader("content-type"))
					&& !Igrp.getInstance().getRequest().getParts().isEmpty();
		} catch (IOException | ServletException e) {
			return false;
		}
	}

	/**
	 * @throws ServletException
	 * @throws IOException
	 **/
	public static List<Part> getFiles() throws IOException, ServletException {
		if (Core.isUploadedFiles()) {
			try {
				Collection<Part> parts = Igrp.getInstance().getRequest().getParts();
				if (parts != null) {
					return parts.stream().filter(file -> Core.isNotNull(file.getSubmittedFileName()))
							.filter(file -> Core.isNotNull(file.getName())).collect(Collectors.toList());
				}
			} catch (javax.servlet.ServletException e) {
				e.printStackTrace();
			}
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

	@Deprecated
	/**
	 * Use getLinkFileByUuid() Link to get file
	 * 
	 * 
	 * @param p_id
	 *            Unique file id
	 * @return
	 */
	public static String getLinkFile(String p_id) {
		if (Core.isNullOrZero(p_id))
			return "";
		if (Igrp.getInstance().getUser() != null && Igrp.getInstance().getUser().isAuthenticated()) {
			return Route.getResolveUrl("igrp", "File", "get-file&p_id=" + p_id);
		} else
			return Route.getResolveUrl("igrp", "File", "getPublicFile&p_id=" + p_id);

	}

	/**
	 * Link to a get file
	 * 
	 * 
	 * @param uuid
	 *            Unique file id
	 * @return link
	 */
	public static String getLinkFileByUuid(String uuid) {
		if (Core.isNull(uuid))
			return "";
		if (uuid.startsWith("webapps"))
			return uuid;
		if (Igrp.getInstance().getUser() != null && Igrp.getInstance().getUser().isAuthenticated()) {
			return Route.getResolveUrl("igrp", "File", "get-file&uuid=" + uuid);
		} else
			return Route.getResolveUrl("igrp", "File", "getPublicFile&uuid=" + uuid);

	}

	@Deprecated
	/**
	 * Use getLinkFileByUuid()
	 * 
	 * @param p_id
	 * @return
	 */
	public static String getLinkFile(int id) {
		return getLinkFile("" + id);
	}

	public static String getLinkTempFile(String uuid) {
		if (Core.isNull(uuid))
			return "";
		if (uuid.startsWith("webapps")) {
			return uuid;
		}
		return Route.getResolveUrl("igrp", "File", "get-temp-file&p_uuid=" + uuid);
	}

	/**
	 * This method you can invoking using Link or Button.
	 * 
	 * Example with filter id=2:
	 * {@code model.setLink(Core.getLinkReport("rep_persons").addParam("p_id", 2))}
	 * 
	 * @param reportCode
	 *            The unique code that identifies Report
	 * @return
	 */
	public static Report getLinkReport(String reportCode) {
		return new Report().getLinkReport(reportCode);
	}

	/**
	 * This method you can invoking using Link or Button.
	 * 
	 * Example with filter id=2:
	 * {@code model.setLink(Core.getLinkReport("rep_persons").addParam("p_id", 2))}
	 * 
	 * @param reportCode
	 *            The unique code that identifies Report
	 * @param isPublic
	 *            For Public Report Link purpose
	 * @return
	 */
	public static Report getLinkReport(String reportCode, boolean isPublic) {
		return new Report().getLinkReport(reportCode, isPublic);
	}

	/**
	 * Get Report for Response redirect {@code .addParam } for filtering
	 * 
	 * @param reportCode
	 *            The unique code that identifies Report
	 * @param report
	 *            use filter {@code new Report().addParam("id",1) } OR
	 *            this.loadQueryString()
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Response getLinkReport(String reportCode, Object report) {
		Report rep = new Report();
		if (report instanceof QueryString) {
			((QueryString<String, Object>) report).getQueryString().entrySet().stream().forEach(q -> {
				rep.addParam(q.getKey(), q.getValue());
			});
		} else if (report instanceof Report) {
			return new Report().invokeReport(reportCode, (Report) report);
		}
		return new Report().invokeReport(reportCode, rep);
	}

	@SuppressWarnings("unchecked")
	public static Response getLinkReportPDF(String reportCode, Object report) {
		Report rep = new Report();
		if (report instanceof QueryString) {
			((QueryString<String, Object>) report).getQueryString().entrySet().stream().forEach(q -> {
				rep.addParam(q.getKey(), q.getValue());
			});
		} else if (report instanceof Report) {
			return new Report().invokeReportPDF(reportCode, (Report) report);
		}
		return new Report().invokeReportPDF(reportCode, rep);

	}

	/**
	 * @param partial
	 *            nosi.core.gui.components.IGRPLink object
	 * @return A Public or Private URL that point to Report
	 */
	public static String getFullUrl(IGRPLink partial) {
		return new String(Igrp.getInstance().getRequest().getRequestURL()).replace("webapps", "") + ""
				+ partial.getLink();
	}

	/**
	 * @param partial
	 *            String
	 * @return A Public or Private URL that point to Report
	 */
	public static String getFullUrl(String partial) {
		return new String(Igrp.getInstance().getRequest().getRequestURL()).replace("webapps", "") + "" + partial;
	}

	/**
	 * 
	 * @param contraProva
	 *            - code of proof of the document report
	 * @return link with hostname to see the document report
	 */
	public static String getLinkContraProva(String contraProva) {
		return new Report().getLinkContraProva(contraProva);
	}

	/**
	 * 
	 * @param contraProva
	 *            - code of proof of the document report
	 * @param appID
	 *            - id of the application (id) o null
	 * @param pdfToDownload
	 *            - if you want a preview or direct download. Default is false
	 * @return link with hostname to see the document report
	 */
	public static String getLinkContraProvaPDF(String contraProva, String appID, Boolean pdfToDownload) {
		return new Report().getLinkContraProva(contraProva, appID, Report.PDF_PRV, pdfToDownload);
	}

	public static Response getRepContraProvaPDF(String contraProva, String appID, Boolean pdfToDownload)
			throws TransformerFactoryConfigurationError, IOException {
		return new Report().getRepContraProvaPDF(contraProva, appID, pdfToDownload);
	}

	/**
	 * {@code Object v = Igrp.getInstance().getRequest().getParameter(name);}
	 * 
	 * @param name
	 *            of the string name remove the attribute after get it
	 * @return {@code v!=null?v.toString():"";}
	 */
	public static String getParam(String name) {
		Object v = Igrp.getInstance() != null ? Igrp.getInstance().getRequest().getParameter(name) : null;
		if (Core.isNull(v))
			v = Core.getAttribute(name, true);
		return (v != null && !v.equals("null")) ? v + "" : "";
	}

	/**
	 * {@code Object v = Igrp.getInstance().getRequest().getParameter(name);}
	 * 
	 * @param name
	 *            of the string name
	 * @param isRemoved
	 *            - (default) true removesAttribute after requested
	 * @return {@code v!=null?v.toString():"";}
	 */
	public static String getParam(String name, boolean isRemoved) {
		Object v = Igrp.getInstance() != null ? Igrp.getInstance().getRequest().getParameter(name) : null;
		if (Core.isNull(v))
			v = Core.getAttribute(name, isRemoved);
		return v != null && !v.equals("null") ? v.toString() : "";
	}

	/**
	 * @param name
	 *            The name of parameter in queryString
	 * @return The value of parameter as String
	 */
	public static String getReportParam(String name) {
		String[] name_array = Core.getParamArray("name_array");
		String[] value_array = Core.getParamArray("value_array");
		if (name_array == null || value_array == null)
			return "";
		for (int i = 0; i < name_array.length; i++) {
			if (name_array[i].equals(name))
				return value_array[i];
		}
		return "";
	}

	/**
	 * {@code String[] value = Igrp.getInstance().getRequest().getParameterValues(name);}
	 * 
	 * @param name
	 *            of the string label
	 * @return value
	 */
	public static String[] getParamArray(String name) {
		String[] value = Igrp.getInstance() != null ? Igrp.getInstance().getRequest().getParameterValues(name) : null;
		if (value == null)
			value = Core.getAttributeArray(name);

		return value != null ? Arrays.stream(value).filter(Core::isNotNull).distinct().toArray(String[]::new) : null;
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @param isRemoved
	 *            - (default) if true, removesAttribute after requested
	 * @return {@code Core.isNotNull(x)?Core.toDouble(x):0;}
	 */
	public static Double getParamDouble(String name, boolean isRemoved) {
		String x = Core.getParam(name, isRemoved);
		if (Core.isNull(x))
			x = Core.getAttribute(name, isRemoved);
		return Core.isNotNull(x) ? Core.toDouble(x) : Double.valueOf(0);
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @return {@code Core.isNotNull(x)?Core.toDouble(x):0;}
	 */
	public static Double getParamDouble(String name) {
		return getParamDouble(name, true);
	}

	/**
	 * 
	 * @return {@code Map<String, String[]>}
	 */
	public static Map<String, String[]> getParameters() {
		return Igrp.getInstance().getRequest().getParameterMap();
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @param isRemoved
	 *            - (default) if true, removesAttribute after requested
	 * @return {@code Core.isNotNull(x)?Core.toFloat(x):0;}
	 */
	public static Float getParamFloat(String name, boolean isRemoved) {
		String x = Core.getParam(name, isRemoved);
		if (Core.isNull(x))
			x = Core.getAttribute(name, isRemoved);
		return Core.isNotNull(x) ? Core.toFloat(x) : Float.valueOf(0);
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @return {@code Core.isNotNull(x)?Core.toFloat(x):0;}
	 */
	public static Float getParamFloat(String name) {
		return getParamFloat(name, true);
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @param isRemoved
	 *            - (default) if true, removesAttribute after requested
	 * @return {@code Core.isNotNull(x)?Core.toInt(x):0;}
	 */
	public static Integer getParamInt(String name, boolean isRemoved) {
		String x = Core.getParam(name, isRemoved);
		if (Core.isNull(x))
			x = Core.getAttribute(name, isRemoved);
		return Core.isNotNull(x) ? Core.toInt(x) : Integer.valueOf(0);
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @return {@code Core.isNotNull(x)?Core.toInt(x):0;}
	 */
	public static Integer getParamInt(String name) {
		return getParamInt(name, true);
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @param isRemoved
	 *            - (default) if true, removesAttribute after requested
	 * @return {@code  Core.isNotNull(x)?Core.toLong(x):0;}
	 */
	public static Long getParamLong(String name, boolean isRemoved) {
		String x = Core.getParam(name, isRemoved);
		if (Core.isNull(x))
			x = Core.getAttribute(name, isRemoved);
		return Core.isNotNull(x) ? Core.toLong(x) : Long.valueOf(0);
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @return {@code  Core.isNotNull(x)?Core.toLong(x):0;}
	 */
	public static Long getParamLong(String name) {
		return getParamLong(name, true);
	}

	/**
	 * 
	 * @param name
	 *            of the string label
	 * @param isRemoved
	 *            - (default) if true, removesAttribute after requested
	 * @return {@code Core.getAttribute(name, true);}
	 */
	public static Object getParamObject(String name, boolean isRemoved) {
		Object x = Core.getAttribute(name, isRemoved);
		return x;
	}

	/**
	 * 
	 * @param name
	 *            of the string label
	 * @return {@code Core.getAttribute(name, true);}
	 */
	public static Object getParamObject(String name) {
		Object x = Core.getAttribute(name, true);
		return x;
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @param isRemoved
	 *            - (default) if true, removesAttribute after requested
	 * @return {@code Core.isNotNull(x)?Core.toShort(x):0;}
	 */
	public static Short getParamShort(String name, boolean isRemoved) {
		String x = Core.getParam(name, isRemoved);
		if (Core.isNull(x))
			x = Core.getAttribute(name, isRemoved);
		return Core.isNotNull(x) ? Core.toShort(x) : Short.valueOf((short) 0);
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @return {@code Core.isNotNull(x)?Core.toShort(x):0;}
	 */
	public static Short getParamShort(String name) {
		return getParamShort(name, true);
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @param isRemoved
	 *            - (default) if true, removes Attribute after requested
	 * @return {@code Core.isNotNull(x)?Core.toBigDecimal(x):BigDecimal.ZERO;}
	 */
	public static BigDecimal getParamBigDecimal(String name, boolean isRemoved) {
		String x = Core.getParam(name, isRemoved);
		if (Core.isNull(x))
			x = Core.getAttribute(name, isRemoved);
		return Core.isNotNull(x) ? Core.toBigDecimal(x) : BigDecimal.ZERO;
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @return {@code Core.isNotNull(x)?Core.toBigDecimal(x):BigDecimal.ZERO;}
	 */
	public static BigDecimal getParamBigDecimal(String name) {
		return getParamBigDecimal(name, true);
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @param isRemoved
	 *            - (default) if true, removes Attribute after requested
	 * @return {@code Core.isNotNull(x)?Core.toBigInteger(x):BigInteger.ZERO;}
	 */
	public static BigInteger getParamBigInteger(String name, boolean isRemoved) {
		String x = Core.getParam(name, isRemoved);
		if (Core.isNull(x))
			x = Core.getAttribute(name, isRemoved);
		return Core.isNotNull(x) ? Core.toBigInteger(x) : BigInteger.ZERO;
	}

	/**
	 * Core.getParam first
	 * 
	 * @param name
	 *            of the string label
	 * @return {@code Core.isNotNull(x)?Core.toBigInteger(x):BigInteger.ZERO;}
	 */
	public static BigInteger getParamBigInteger(String name) {
		return getParamBigInteger(name, true);
	}

	public static String getParamTaskId() {
		String taskId = Core.getParam(BPMNConstants.PRM_TASK_ID);
		Core.setAttribute(BPMNConstants.PRM_TASK_ID, taskId);
		return taskId;
	}

	public static String getPinkColor() {
		return "1";
	}

	public static String getPurpleColor() {
		return "6";
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
		} else if (strings.length == 1 && Core.isNotNull(strings[0])){
				return strings[0];
		}
		return "";
	}

	/**
	 * Get UUID
	 * 
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
	 * Consume a REST API Json using get
	 * 
	 * @param <T>
	 * @param url
	 * @param result
	 * @return {@code httpGet(url, mediaType, null, result);}
	 */
	public static <T> T httpGet(String url, Class<T> result) {
		return httpGet(url, new String[] {}, null, result);
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

	public static BaseQueryInterface insert(String tableName, boolean displayError, boolean tracingError) {
		return new QueryInsert(Core.defaultConnection(), displayError, tracingError).insert(tableName);
	}

	/**
	 * Queey insert
	 * 
	 * @param connectionName
	 * @param tableName
	 * @return {@code new QueryInsert(connectionName).insert(tableName);}
	 */
	public static BaseQueryInterface insert(String connectionName, String tableName, boolean displayError,
			boolean tracingError) {
		return new QueryInsert(connectionName, displayError, tracingError).insert(tableName);
	}

	public static BaseQueryInterface insert(String connectionName, String schemaName, String tableName,
			boolean displayError, boolean tracingError) {
		return new QueryInsert(connectionName, displayError, tracingError).insert(schemaName, tableName);
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
		return !isNull(value);
	}

	/**
	 * Checks if it's not null or "" for multiple values
	 * Core.isNotNullMultiple(a,b,c,d)
	 * 
	 * @param values
	 * @return {@code value!=null && !value.equals("");}
	 */

	public static boolean isNotNullMultiple(Object... values) {
		boolean r = false;
		if (values != null) {
			for (Object value : values) {
				r = Core.isNotNull(value);
				if (r == false)
					break;
			}
		}
		return r;
	}

	/**
	 * Checks if it's not null or not 0 First {@code Core.isNotNull(value)}
	 * 
	 * @param value
	 * @return {@code Integer.valueOf(value.toString())!=0;}
	 */
	public static boolean isNotNullOrZero(Object value) {
		return !isNullOrZero(value);
	}

	/**
	 * Checks if it's null or ""
	 * 
	 * @param value
	 * @return {@code value==null || value.equals("");}
	 */
	public static boolean isNull(Object value) {
		return (value instanceof String) ? value.equals("") : value == null;
	}

	/**
	 * Checks if it's empty for string values or null otherwise.
	 * 
	 * @param values
	 *            The values to be checked
	 * @return {@code true} if all elements are null, or empty for string values.
	 *         Otherwise {@code false}
	 * @see #isNull(Object)
	 */
	public static boolean isNullMultiple(Object... values) {
		if (values == null)
			return Boolean.TRUE;
		return Arrays.stream(values).allMatch(Core::isNull);
	}

	/**
	 * Checks if it's null or 0
	 * 
	 * @param value
	 * @return {@code if(value instanceof Number) return new BigDecimal(String.valueOf(value)).compareTo(BigDecimal.ZERO) == 0}<br>
	 *         {@code else isNull(value)}
	 */
	public static boolean isNullOrZero(Object value) {
		return (value instanceof Number) ? new BigDecimal(String.valueOf(value)).compareTo(BigDecimal.ZERO) == 0
				: isNull(value);
	}

	/**
	 * This method is used to add a message log
	 * 
	 * @param msg
	 *            This is the message
	 * 
	 */
	public static void log(String msg) {
		if (Igrp.getInstance() != null && Igrp.getInstance().getLog() != null)
			Igrp.getInstance().getLog().addMessage(msg);
	}

	/**
	 * send a simple email with charset UTF-8 and mimetype html...
	 * 
	 * @param from
	 * @param to
	 * @param subject
	 * @param msg
	 * @param replyTo
	 * @return true or false
	 */
	public static boolean mail(String from, String to, String subject, String msg, String replyTo) {
		return mail(from, to, subject, msg, "utf-8", "html", null, replyTo, null);
	}

	/**
	 * send a simple email ...
	 * 
	 * @param from
	 * @param to
	 * @param subject
	 * @param msg
	 * @param charset
	 *            UTF-8,
	 * @param mimetype
	 *            text/html, plaintext
	 * @param attachs
	 * @param replyTo
	 * @return true or false
	 */
	public static boolean mail(String from, String to, String subject, String msg, String charset, String mimetype,
			File[] attachs, String replyTo) {
		return mail(from, to, subject, msg, charset, mimetype, attachs, replyTo, null);
	}

	/**
	 * @param from
	 * @param to
	 * @param subject
	 * @param msg
	 * @param charset
	 *            UTF-8,
	 * @param mimetype
	 *            text/html, plaintext
	 * @param attachs
	 * @param replyTo
	 * @return
	 */
	public static boolean mail_v2(String from, String to, String subject, String msg, String charset, String mimetype,
			Attachment[] attachs, String replyTo) {
		return mail_v2(from, to, subject, msg, charset, mimetype, attachs, replyTo, null);
	}

	/**
	 * Send mail with default email of igrp
	 * 
	 * @param to
	 * @param subject
	 * @param msg
	 * @param charset
	 *            UTF-8,
	 * @param mimetype
	 *            text/html, plaintext
	 * @param attachs
	 * @param replyTo
	 * @return
	 */
	public static boolean mail(String to, String subject, String msg, String charset, String mimetype, File[] attachs,
			String replyTo) {
		Properties setting = ConfigApp.getInstance().getMainSettings();
		String email = setting.getProperty("mail.user");
		return mail(email, to, subject, msg, charset, mimetype, attachs, replyTo, null);
	}

	/**
	 * Send mail with default email of igrp
	 * 
	 * @param to
	 * @param subject
	 * @param msg
	 * @param charset
	 *            UTF-8,
	 * @param mimetype
	 *            text/html, plaintext
	 * @param attachs
	 * @param replyTo
	 * @return
	 */
	public static boolean mail_v2(String to, String subject, String msg, String charset, String mimetype,
			Attachment[] attachs, String replyTo) {
		Properties setting = ConfigApp.getInstance().getMainSettings();
		String email = setting.getProperty("mail.user");
		return mail_v2(email, to, subject, msg, charset, mimetype, attachs, replyTo, null);
	}

	/**
	 * @param from
	 * @param to
	 * @param subject
	 * @param msg
	 * @param charset
	 *            UTF-8,
	 * @param mimetype
	 *            text/html, plaintext
	 * @param attachs
	 * @param replyTo
	 * @param multiplerecepients
	 * @param customConfig
	 * @return
	 */
	public static boolean mail(String from, String to, String subject, String msg, String charset, String mimetype,
			File[] attachs, String replyTo, boolean multiplerecepients, Properties customConfig) {
		EmailMessage sender = EmailMessage.newInstance();
		boolean result = false;
		try {
			sender.setFrom(from).setTo(to).multipleRecipients(multiplerecepients).setSubject(subject)
					.setMsg(msg, charset, mimetype).replyTo(replyTo);
			if (Core.isNotNull(attachs))
				for (File f : attachs)
					sender.attach(f);
			if (customConfig != null) {
				Enumeration<Object> i = customConfig.keys();
				while (i.hasMoreElements()) {
					String key = (String) i.nextElement();
					sender.getSettings().setProperty(key, customConfig.getProperty(key));
				}
			}
			result = sender.send();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * @param from
	 * @param to
	 * @param subject
	 * @param msg
	 * @param charset
	 *            UTF-8,
	 * @param mimetype
	 *            text/html, plaintext
	 * @param attachs
	 * @param replyTo
	 * @param multiplerecepients
	 * @param customConfig
	 * @return
	 */
	public static boolean mail_v2(String from, String to, String subject, String msg, String charset, String mimetype,
			Attachment[] attachs, String replyTo, boolean multiplerecepients, Properties customConfig) {
		EmailMessage sender = EmailMessage.newInstance();
		boolean result = false;
		try {
			sender.setFrom(from).setTo(to).multipleRecipients(multiplerecepients).setSubject(subject)
					.setMsg(msg, charset, mimetype).replyTo(replyTo);
			if (Core.isNotNull(attachs))
				for (Attachment f : attachs)
					sender.attach(f);
			if (customConfig != null) {
				Enumeration<Object> i = customConfig.keys();
				while (i.hasMoreElements()) {
					String key = (String) i.nextElement();
					sender.getSettings().setProperty(key, customConfig.getProperty(key));
				}
			}
			result = sender.send();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * @param from
	 * @param to
	 * @param subject
	 * @param msg
	 * @param charset
	 *            UTF-8,
	 * @param mimetype
	 *            text/html, plaintext
	 * @param attachs
	 * @param replyTo
	 * @param customConfig
	 * @return
	 */
	public static boolean mail(String from, String to, String subject, String msg, String charset, String mimetype,
			File[] attachs, String replyTo, Properties customConfig) {
		EmailMessage sender = EmailMessage.newInstance();
		boolean result = false;
		try {
			sender.setFrom(from).setTo(to).setSubject(subject).setMsg(msg, charset, mimetype).replyTo(replyTo);
			if (Core.isNotNull(attachs))
				for (File f : attachs)
					sender.attach(f);
			if (customConfig != null) {
				Enumeration<Object> i = customConfig.keys();
				while (i.hasMoreElements()) {
					String key = (String) i.nextElement();
					sender.getSettings().setProperty(key, customConfig.getProperty(key));
				}
			}
			result = sender.send();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * @param from
	 * @param to
	 * @param subject
	 * @param msg
	 * @param charset
	 *            UTF-8,
	 * @param mimetype
	 *            text/html, plaintext
	 * @param attachs
	 * @param replyTo
	 * @param customConfig
	 * @return
	 */
	public static boolean mail_v2(String from, String to, String subject, String msg, String charset, String mimetype,
			Attachment[] attachs, String replyTo, Properties customConfig) {
		EmailMessage sender = EmailMessage.newInstance();
		boolean result = false;
		try {
			sender.setFrom(from).setTo(to).setSubject(subject).setMsg(msg, charset, mimetype).replyTo(replyTo);
			if (Core.isNotNull(attachs))
				for (Attachment f : attachs)
					sender.attach(f);
			if (customConfig != null) {
				Enumeration<Object> i = customConfig.keys();
				while (i.hasMoreElements()) {
					String key = (String) i.nextElement();
					sender.getSettings().setProperty(key, customConfig.getProperty(key));
				}
			}
			result = sender.send();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * @param endpoint PDEX Email Gateway URL 
	 * @param httpAuthorizationHeaderValue PDEX Email Gateway "Bearer TOKEN" 
	 * @param payload The Message 
	 * @return boolean success true|false
	 */
	public static boolean mailGatewayPdex(String endpoint, String httpAuthorizationHeaderValue, PdexEmailGatewayPayloadDTO payload) {
		return new PdexEmailGateway(endpoint, httpAuthorizationHeaderValue, payload).send();
	}
	
	/**
	 * @param endpoint PDEX Email Gateway URL 
	 * @param httpAuthorizationHeaderValue PDEX Email Gateway "Bearer TOKEN" 
	 * @param payload The Message 
	 * @param errors A List of errors if occurs 
	 * @return boolean success true|false
	 */
	public static boolean mailGatewayPdex(String endpoint, String httpAuthorizationHeaderValue, PdexEmailGatewayPayloadDTO payload, List<String> errors) {
		boolean success = false;
		PdexEmailGateway sender = new PdexEmailGateway(endpoint, httpAuthorizationHeaderValue); 
		sender.setPayload(payload); 
		if(!(success = sender.send()) && errors != null) 
			errors.addAll(sender.getErrors()); 
		return success;
	}

	public static Map<Object, Object> mapArray(Object[] array1, Object[] array2) {
		if (array1 != null && array1.length > 0 && array2 != null && array2.length > 0)
			return IntStream.range(0, array1.length).boxed().collect(Collectors
					.toMap(i -> array1[Core.toInt("" + i).intValue()], i -> array2[Core.toInt("" + i).intValue()]));
		return null;
	}

	public static Map<Object, Object> mapArray(Object[] array1, Object[] array2, Predicate<? super Integer> filter) {
		if (array1 != null && array1.length > 0 && array2 != null && array2.length > 0)
			return IntStream.range(0, array1.length).boxed().filter(filter).collect(Collectors
					.toMap(i -> array1[Core.toInt("" + i).intValue()], i -> array2[Core.toInt("" + i).intValue()]));
		return null;
	}

	/**
	 * Maps source to destination - http://modelmapper.org/getting-started/ Example
	 * here: http://modelmapper.org/examples/flattening/
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
		return Normalizer.normalize(input, Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]", "");
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

	public static QueryInterface query(String sql, boolean displayError, boolean tracingError) {
		return new QuerySelect(Core.defaultConnection(), displayError, tracingError).select(sql);
	}

	public static QueryInterface query(String sql, Config_env config_env, boolean displayError, boolean tracingError) {
		return new QuerySelect(config_env, displayError, tracingError).select(sql);
	}

	public static QueryInterface query(String connectionName, String sql, boolean displayError, boolean tracingError) {
		return new QuerySelect(connectionName, displayError, tracingError).select(sql);
	}

	public static QueryInterface query(String connectionName, String sql, Class<?> className, boolean displayError,
			boolean tracingError) {
		return new QuerySelect(connectionName, displayError, tracingError).select(sql, className);
	}

	/**
	 * @param query
	 *            Usually the result of Core.query(null,"(SELECT 'id' as ID,'name'
	 *            as NAME) ")
	 * @param selected
	 *            A list selected values
	 * @param prompt
	 *            The comboBox prompt
	 * @return A xml result
	 */
	public static String remoteComboBoxXml(BaseQueryInterface query, String tag_name, String[] selected,
			String prompt) {
		Map<Object, Object> map = new LinkedHashMap<>();
		String xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
		xml += "<" + tag_name + ">";
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
		xml += "</" + tag_name + ">";
		return xml;
	}

	public static RemoteXML remoteXml() {
		return new RemoteXML();
	}

	public static String remoteComboBoxXml(Map<?, ?> map, Field field, String[] selected) {
		return remoteComboBoxXml(map, field, selected, null);
	}

	public static String remoteComboBoxXml(Map<?, ?> map, Field field, String[] selected, String prompt) {
		XMLWritter xml = new XMLWritter();
		xml.startElement(field.getTagName());
		xml.startElement("list");
		if (prompt != null) {
			xml.startElement("option");
			xml.setElement("text", prompt);
			xml.emptyTag("value");
			xml.endElement();
		}
		for (Entry<?, ?> m : map.entrySet()) {
			xml.startElement("option");
			if (selected != null)
				for (String s : selected) {
					if (s.equals("" + m.getKey())) {
						xml.writeAttribute("selected", "selected");
						break;
					}
				}
			xml.setElement("text", m.getValue());
			xml.setElement("value", m.getKey());
			xml.endElement();
		}
		xml.endElement();
		xml.endElement();
		return xml.toString();
	}

	public static void removeAttribute(String name) {
		Igrp.getInstance().getRequest().removeAttribute(name);
	}

	/**
	 * @deprecated Deprecated use updateFile with uuid
	 * 
	 * @param content
	 * @param name
	 * @param mime_type
	 * @param id
	 * @return
	 */
	@Deprecated
	public static boolean updateFile(byte[] content, String name, String mime_type, Integer id) {
		try {
			if (Core.isNotNull(name)) {
				String extension = name.substring(name.lastIndexOf("."));
				File file = File.createTempFile(name, extension);
				try (FileOutputStream out = new FileOutputStream(file)) {
					out.write(content);
					out.flush();
				}
				return updateFile(file, name, mime_type, Core.getCurrentDad(), id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * update a file to the Igrp core DataBase and return true or false ...
	 * 
	 * @param content
	 * @param name
	 * @param mime_type
	 * @param uuid
	 * @return true|false
	 */

	public static boolean updateFile(byte[] content, String name, String mime_type, String uuid) {
		try {
			if (Core.isNotNull(name)) {
				String extension = name.substring(name.lastIndexOf("."));
				File file = File.createTempFile(name, extension);
				try (FileOutputStream out = new FileOutputStream(file)) {
					out.write(content);
					out.flush();
					return updateFile(file, name, mime_type, Core.getCurrentDad(), uuid);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * @deprecated Deprecated use updateFile with uuid
	 * @param file
	 * @param id
	 * @return
	 */
	@Deprecated
	public static boolean updateFile(File file, Integer id) {
		return updateFile(file, null, null, id);
	}

	/**
	 * update a file to the Igrp core DataBase and return true or false ...
	 * 
	 * @param file
	 * @param uuid
	 * @return true|false
	 */
	public static boolean updateFile(File file, String uuid) {
		return updateFile(file, null, null, uuid);
	}

	/**
	 * @deprecated Deprecated use updateFile with uuid
	 * @param parameterName
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@Deprecated
	public static boolean updateFile(String parameterName, Integer id) throws Exception {
		if (Core.isNotNull(parameterName))
			return updateFile(Core.getFile(parameterName), Core.getFile(parameterName).getSubmittedFileName(), id);
		throw new Exception(gt("Parâmetro invalido"));
	}

	/**
	 * by UUID - update a file to the Igrp core DataBase and return true or false
	 * ...
	 * 
	 * @param parameterName
	 * @param uuid
	 * @return
	 * @throws Exception
	 */
	public static boolean updateFile(String parameterName, String uuid) throws Exception {
		if (Core.isNotNull(parameterName))
			return updateFile(Core.getFile(parameterName), Core.getFile(parameterName).getSubmittedFileName(), uuid);
		throw new Exception(gt("Parâmetro invalido"));
	}

	/**
	 * by UUID - update a file to the Igrp core DataBase and return true or false
	 * ...
	 * 
	 * @param upFile
	 *            UploadFile
	 * @param uuid
	 * @return
	 * @throws Exception
	 */
	public static boolean updateFile(UploadFile upFile, String uuid) throws Exception {
		if (Core.isNotNull(upFile) && upFile.isUploaded())
			return updateFile(upFile.getBytes(), upFile.getSubmittedFileName(), null, uuid);
		throw new Exception(gt("UploadFile invalido"));
	}

	@Deprecated
	/**
	 * Deprecated use updateFile with uuid
	 * 
	 * @param parameterName
	 * @param description
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static boolean updateFile(String parameterName, String description, Integer id) throws Exception {
		if (Core.isNotNull(parameterName))
			return updateFile(Core.getFile(parameterName), description, id);
		throw new Exception(gt("Parâmetro invalido"));
	}

	/**
	 * by UUID - update a file to the Igrp core DataBase and return true or false
	 * ...
	 * 
	 * @param parameterName
	 * @param description
	 * @param uuid
	 * @return
	 * @throws Exception
	 */
	public static boolean updateFile(String parameterName, String description, String uuid) throws Exception {
		if (Core.isNotNull(parameterName))
			return updateFile(Core.getFile(parameterName), description, uuid);
		throw new Exception(gt("Parâmetro invalido"));
	}

	@Deprecated
	/**
	 * Deprecated use updateFile with uuid
	 * 
	 * @param file
	 * @param name
	 * @param mime_type
	 * @param id
	 * @return
	 */
	public static boolean updateFile(File file, String name, String mime_type, Integer id) {
		return updateFile(file, name, mime_type, Core.getCurrentDad(), id);
	}

	/**
	 * by UUID - update a file to the Igrp core DataBase and return true or false
	 * ...
	 * 
	 * @param file
	 * @param name
	 * @param mime_type
	 * @param uuid
	 * @return
	 */
	public static boolean updateFile(File file, String name, String mime_type, String uuid) {
		return updateFile(file, name, mime_type, Core.getCurrentDad(), uuid);
	}

	@Deprecated
	/**
	 * Deprecated use updateFile with uuid
	 * 
	 * @param bytes
	 * @param name
	 * @param mime_type
	 * @param dad
	 * @param id
	 * @return
	 */
	public static boolean updateFile(byte[] bytes, String name, String mime_type, String dad, Integer id) {
		CLob clob = getFile(id);
		if (Core.isNotNullMultiple(clob, bytes, name) && id.intValue() > 0) {
			clob.setC_lob_content(bytes);
			clob.setDt_updated(new Date(System.currentTimeMillis()));
			clob.setApplication_updated(Core.findApplicationByDad(Core.getCurrentDad()));
			clob.setName(name);
			clob.setMime_type(mime_type);
			if (Core.isNull(clob.getUuid()))
				clob.generateUid();
			if (!(Igrp.getInstance().getUser() != null && Igrp.getInstance().getUser().isAuthenticated())) {
				clob.setEstado("AP");
			}
			clob = clob.update();
			clob.showMessage();
			return !clob.hasError();
		}
		return false;
	}

	/**
	 * update a file to the Igrp core DataBase and return true or false ...
	 * 
	 * @param bytes
	 * @param name
	 * @param mime_type
	 * @param dad
	 * @param uuid
	 * @return true|false
	 */
	public static boolean updateFile(byte[] bytes, String name, String mime_type, String dad, String uuid) {
		CLob clob = getFileByUuid(uuid);
		if (Core.isNotNullMultiple(clob, bytes, name, uuid)) {
			clob.setC_lob_content(bytes);
			clob.setDt_updated(new Date(System.currentTimeMillis()));
			clob.setApplication_updated(new Application().findByDad(Core.getCurrentDadParam()));
			clob.setName(name);
			clob.setMime_type(mime_type);
			if (!(Igrp.getInstance().getUser() != null && Igrp.getInstance().getUser().isAuthenticated())) {
				clob.setEstado("AP");
			}
			clob = clob.update();
			clob.showMessage();
			return !clob.hasError();
		}
		return false;
	}

	@Deprecated
	/**
	 * Deprecated use updateFile with uuid
	 * 
	 * @param file
	 * @param name
	 * @param mime_type
	 * @param dad
	 * @param id
	 * @return
	 */
	public static boolean updateFile(File file, String name, String mime_type, String dad, Integer id) {
		if (Core.isNotNullMultiple(file, name, dad)) {
			FileNameMap fileNameMap = URLConnection.getFileNameMap();
			String mime_type_ = (mime_type == null || mime_type.trim().isEmpty()
					? fileNameMap.getContentTypeFor(file.getPath())
					: mime_type);
			try (FileInputStream in = new FileInputStream(file)) {
				return updateFile(FileHelper.convertInputStreamToByte(in), name, mime_type_, dad, id);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	/**
	 * update a file to the Igrp core DataBase and return true or false ...
	 * 
	 * @param file
	 * @param name
	 * @param mime_type
	 * @param dad
	 * @param uuid
	 * @return true|false
	 */
	public static boolean updateFile(File file, String name, String mime_type, String dad, String uuid) {
		if (Core.isNotNullMultiple(file, name, dad)) {
			FileNameMap fileNameMap = URLConnection.getFileNameMap();
			String mime_type_ = (mime_type == null || mime_type.trim().isEmpty()
					? fileNameMap.getContentTypeFor(file.getPath())
					: mime_type);
			try (FileInputStream in = new FileInputStream(file)) {
				return updateFile(FileHelper.convertInputStreamToByte(in), name, mime_type_, dad, uuid);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	@Deprecated
	/**
	 * Deprecated use updateFile with uuid
	 * 
	 * @param part
	 * @param name
	 * @param id
	 * @return
	 */
	public static boolean updateFile(Part part, String name, Integer id) {
		boolean result = false;
		if (Core.isNotNullMultiple(part, name)) {
			try {
				result = updateFile(FileHelper.convertInputStreamToByte(part.getInputStream()), name,
						part.getContentType(), id);
			} catch (IOException e) {
				result = false;
				e.printStackTrace();
			} finally {
				try {
					part.delete();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	/**
	 * update a Part of file to the Igrp core DataBase and return true or false ...
	 * 
	 * @param part
	 * @param name
	 * @param uuid
	 * @return true|false
	 */

	public static boolean updateFile(Part part, String name, String uuid) {
		boolean result = false;
		if (Core.isNotNullMultiple(part, name)) {
			try {
				result = updateFile(FileHelper.convertInputStreamToByte(part.getInputStream()), name,
						part.getContentType(), uuid);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					part.delete();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	/**
	 * @deprecated Use saveFileNGetUuid
	 * 
	 *             Insert a file to the Igrp core DataBase and return an Id ...
	 * 
	 * @param content
	 *            byte[]
	 * @param name
	 * @param mime_type
	 * @return in ID
	 */
	@Deprecated
	public static Integer saveFile(byte[] content, String name, String mime_type) {
		Integer id = Integer.valueOf(0);
		try {
			if (Core.isNotNull(name)) {
				String extension = name.substring(name.lastIndexOf("."));
				File file = File.createTempFile(name, extension);
				try (FileOutputStream out = new FileOutputStream(file)) {
					out.write(content);
					out.flush();
				}
				String uuid = Core.saveFileNGetUuid(file, name, mime_type, Core.getCurrentDad());
				if (Core.isNull(uuid)) {
					Core.setMessageError("Error saving file.");
				} else {
					id = new CLob().find().andWhere("uuid", "=", uuid).one().getId();
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	/**
	 * Insert a file to the Igrp core DataBase and return an UUId ...
	 * 
	 * @param content
	 *            byte[]
	 * @param name
	 * @param mime_type
	 * @return String UUID
	 */
	public static String saveFileNGetUuid(byte[] content, String name, String mime_type) {
		try {
			if (Core.isNotNull(name)) {
				String extension = name.substring(name.lastIndexOf("."));
				File file = File.createTempFile(name, extension);
				try (FileOutputStream out = new FileOutputStream(file)) {
					out.write(content);
					out.flush();
				}
				return Core.saveFileNGetUuid(file, name, mime_type,
						(Core.isNotNull(Core.getCurrentDad()) && !Core.getCurrentDad().equalsIgnoreCase("igrp")
								? Core.getCurrentDad()
								: Core.getCurrentDadParam()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * @deprecated Use saveFileNGetUuid() Insert a Part to the Igrp core DataBase
	 *             and return an Id ...
	 * 
	 *             {@code  	 
				try {
				List<Part> parts = Core.getFiles();
				for(int i=0;i<parts.size();i++) { String desription = ""; int fileId
	 *             = Core.saveFile(parts.get(i)); } } catch (ServletException e) {
	 *             e.printStackTrace(); }}
	 * 
	 * @param part
	 * @return {@code saveFile(part,part.getSubmittedFileName());}
	 */
	@Deprecated
	public static Integer saveFile(Part part) {
		if (part != null)
			return Core.saveFile(part, part.getSubmittedFileName());
		return Integer.valueOf(0);
	}

	/**
	 * Insert a Part to the Igrp core DataBase and return an UUId ...
	 * 
	 * {@code  	 
				try {
				List<Part> parts = Core.getFiles();
				for(int i=0;i<parts.size();i++) { String desription = ""; int fileId
	 * = Core.saveFile(parts.get(i)); } } catch (ServletException e) {
	 * e.printStackTrace(); }}
	 * 
	 * @param part
	 * @return {@code saveFile(part,part.getSubmittedFileName());}
	 */
	public static String saveFileNGetUuid(Part part) {
		if (part != null)
			return Core.saveFileNGetUuid(part, part.getSubmittedFileName());
		return "";
	}

	/**
	 * @deprecated Use saveFileNGetUuid() Insert a file to the Igrp core DataBase
	 *             and return an Id ...
	 * 
	 * @param file
	 * @return in ID
	 */
	@Deprecated
	public static Integer saveFile(File file) {
		return Core.saveFile(file, null, null);
	}

	/**
	 * Insert a file to the Igrp core DataBase and return an Id ...
	 * 
	 * @param file
	 * @return String UUID
	 */
	public static String saveFileNGetUuid(File file) {
		return Core.saveFileNGetUuid(file, null, null);
	}

	@Deprecated
	/**
	 * Use saveFileNGetUuid()
	 * 
	 * @param parameterName
	 * @return
	 * @throws Exception
	 */
	public static Integer saveFile(String parameterName) throws Exception {
		if (Core.isNotNull(parameterName))
			return Core.saveFile(Core.getFile(parameterName), Core.getFile(parameterName).getSubmittedFileName());
		throw new Exception(gt("Parâmetro invalido"));
	}

	public static String saveFileNGetUuid(String parameterName) throws Exception {
		if (Core.isNotNull(parameterName))
			return Core.saveFileNGetUuid(Core.getFile(parameterName),
					Core.getFile(parameterName).getSubmittedFileName());
		throw new Exception(gt("Parâmetro invalido"));
	}

	public static String saveFileNGetUuid(UploadFile upFile) throws Exception {
		if (Core.isNotNull(upFile) && upFile.isUploaded())
			return Core.saveFileNGetUuid(upFile.getBytes(), upFile.getSubmittedFileName(), null);
		throw new Exception(gt("UploadFile invalido"));
	}

	@Deprecated
	/**
	 * Use saveFileNGetUuid()
	 * 
	 * @param parameterName
	 * @param description
	 * @return
	 * @throws Exception
	 */
	public static Integer saveFile(String parameterName, String description) throws Exception {
		if (Core.isNotNull(parameterName))
			return Core.saveFile(Core.getFile(parameterName), description);
		throw new Exception(gt("Parâmetro invalido"));
	}

	public static String saveFileNGetUuid(String parameterName, String description) throws Exception {
		if (Core.isNotNull(parameterName))
			return Core.saveFileNGetUuid(Core.getFile(parameterName), description);
		throw new Exception(gt("Parâmetro invalido"));
	}

	@Deprecated
	/**
	 * Use saveFileNGetUuid()
	 * 
	 * @param file
	 * @param name
	 * @param mime_type
	 * @return
	 */
	public static Integer saveFile(File file, String name, String mime_type) {
		return Core.saveFile(file, name, mime_type, Core.getCurrentDadParam());
	}

	public static String saveFileNGetUuid(File file, String name, String mime_type) {
		return Core.saveFileNGetUuid(file, name, mime_type, Core.getCurrentDadParam());
	}

	@Deprecated
	/**
	 * Use saveFileNGetUuid()
	 * 
	 * @param bytes
	 * @param name
	 * @param mime_type
	 * @param dad
	 * @return
	 */
	public static Integer saveFile(byte[] bytes, String name, String mime_type, String dad) {
		Application app = new Application().findByDad(dad);
		if (Core.isNotNullMultiple(bytes, name, dad) && app != null) {
			CLob clob = new CLob(name, mime_type, bytes, new Date(System.currentTimeMillis()), app);
			clob.generateUid();
			clob = clob.insert();
			clob.showMessage();
			if (!clob.hasError()) {
				if (!(Igrp.getInstance().getUser() != null && Igrp.getInstance().getUser().isAuthenticated())) {
					clob.setEstado("AP");
					clob.update();
				}
				return clob.getId();
			}

		}
		return Integer.valueOf(0);
	}

	public static String saveFileNGetUuid(byte[] bytes, String name, String mime_type, String dad) {
		Application app = new Application().findByDad(dad);
		if (Core.isNotNullMultiple(bytes, name, dad) && app != null) {
			CLob clob = new CLob(name, mime_type, bytes, new Date(System.currentTimeMillis()), app);
			clob.generateUid();
			clob = clob.insert();
			clob.showMessage();
			if (!clob.hasError() && !(Igrp.getInstance().getUser() != null && Igrp.getInstance().getUser().isAuthenticated())) {
					clob.setEstado("AP");
					clob.update();
				
			}
			return clob.getUuid();
		}
		return null;
	}

	@Deprecated
	/**
	 * Use saveFileNGetUuid() Insert a file to the Igrp core DataBase and return an
	 * Id ...
	 * 
	 * @param file
	 * @param name
	 * @param mime_type
	 * @return int ID
	 */
	public static Integer saveFile(File file, String name, String mime_type, String dad) {
		if (Core.isNotNullMultiple(file, name, dad)) {
			FileNameMap fileNameMap = URLConnection.getFileNameMap();
			String mime_type_ = (mime_type == null || mime_type.trim().isEmpty()
					? fileNameMap.getContentTypeFor(file.getPath())
					: mime_type);
			try (FileInputStream in = new FileInputStream(file)) {
				return Core.saveFile(FileHelper.convertInputStreamToByte(in), name, mime_type_, dad);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return Integer.valueOf(0);
	}

	/**
	 * Insert a file to the Igrp core DataBase and return an Id ...
	 * 
	 * @param file
	 * @param name
	 * @param mime_type
	 * @return String UUID
	 */
	public static String saveFileNGetUuid(File file, String name, String mime_type, String dad) {
		if (Core.isNotNullMultiple(file, name, dad)) {
			FileNameMap fileNameMap = URLConnection.getFileNameMap();
			String mime_type_ = (mime_type == null || mime_type.trim().isEmpty()
					? fileNameMap.getContentTypeFor(file.getPath())
					: mime_type);
			try (FileInputStream in = new FileInputStream(file)) {
				return Core.saveFileNGetUuid(FileHelper.convertInputStreamToByte(in), name, mime_type_, dad);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "";
	}

	@Deprecated
	/**
	 * Use saveFileNGetUuid() Insert a Part file to the Igrp core DataBase and
	 * return an Id ...
	 * 
	 * @param part
	 * @param name
	 * @return in ID
	 */
	public static Integer saveFile(Part part, String name) {
		Integer result = Integer.valueOf(0);
		if (Core.isNotNullMultiple(part, name)) {
			try {
				result = Core.saveFile(FileHelper.convertInputStreamToByte(part.getInputStream()), name,
						part.getContentType());
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					part.delete();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	/**
	 * Insert a Part file to the Igrp core DataBase and return an Id ...
	 * 
	 * @param part
	 * @param name
	 * @return String UUID
	 */
	public static String saveFileNGetUuid(Part part, String name) {
		String result = "";
		if (Core.isNotNullMultiple(part, name)) {
			try {
				result = Core.saveFileNGetUuid(FileHelper.convertInputStreamToByte(part.getInputStream()), name,
						part.getContentType());
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					part.delete();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	public static void setAttribute(String name, Object value) {
		Igrp.getInstance().getRequest().setAttribute(name, value);
	}

	/**
	 * Shows a error flash message "Falha ao tentar efetuar esta operação!"
	 */
	public static void setMessageError() {
		if(Igrp.getInstance() != null)
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt(FlashMessage.MESSAGE_ERROR));
	}

	/**
	 * Shows a custom error flash message
	 * 
	 * @param msg
	 *            Custom message string
	 */
	public static void setMessageError(String msg) {
		if(Igrp.getInstance() != null)
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt(msg));
		else
			System.out.print("[ERROR] "+ gt(msg));
	}

	/**
	 * Add Message Info
	 * 
	 * @param msg
	 *            custom message
	 */
	public static void setMessageInfo(String msg) {
		if(Igrp.getInstance() != null)
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO, gt(msg));
		else
			System.out.print("[INFO] "+ gt(msg));
	}

	/**
	 * Add Message Info With Link
	 * 
	 * @param msg
	 *            custom message
	 * @param link
	 *            set a link to show
	 */
	public static void setMessageInfoLink(String msg, String link) {
		if(Igrp.getInstance() != null)
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO_LINK, gt(msg) + "/#RESERVE#/" + link);
	}

	/**
	 * Add Message Info With Link
	 * 
	 * @param msg
	 *            custom message
	 * @param app
	 *            for the created link
	 * @param page
	 *            for the created link
	 * @param action
	 *            for the created link
	 */
	public static void setMessageInfoLink(String msg, String app, String page, String action) {
		if(Igrp.getInstance() != null)
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.INFO_LINK,
				gt(msg) + "/#RESERVE#/" + Route.getResolveUrl(app, page, action));
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
	 * @param msg
	 *            Custom message string
	 */
	public static void setMessageSuccess(String msg) {
		if(Igrp.getInstance() != null)
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, gt(msg));
		else
			System.out.print("[SUCCESS] "+ gt(msg));
	}

	/**
	 * Shows a custom confirm flash message
	 * 
	 * @param msg
	 *            Custom message string
	 */
	public static void setMessageConfirm(String msg) {
		if(Igrp.getInstance() != null)
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.CONFIRM, gt(msg));
		else
			System.out.print("[CONFIRM] "+ gt(msg));
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
	 * @param msg
	 *            custom message
	 */
	public static void setMessageWarning(String msg) {
		if(Igrp.getInstance() != null)
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING, gt(msg));
		else
			System.out.print("[WARNING] "+ gt(msg));
	}

	/**
	 * For activiti integration
	 *
	 */
	public static String getExecutionId() {
		String taskId = Core.getParamTaskId();
		String taskExecutionId = Core.getParam(BPMNConstants.PRM_TASK_EXECUTION_ID);
		if (Core.isNull(taskExecutionId)) {
			List<HistoricTaskService> task = new TaskServiceIGRP().getTaskServiceRest().getHistory(taskId);
			taskExecutionId = (task != null && !task.isEmpty()) ? task.get(task.size() - 1).getExecutionId()
					: taskExecutionId;
		}
		Core.setAttribute(BPMNConstants.PRM_TASK_EXECUTION_ID, taskExecutionId);
		return taskExecutionId;
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
					row.setValue(p.getValue());
					customV.add(row);
				});
		String json = gson.toJson(customV);
		return json;
	}

	public static String getProcessVariable(String processDefinitionKey, String variableName) {
		List<TaskVariables> vars = Core.getProcessVariables(processDefinitionKey);
		if (vars != null) {
			List<TaskVariables> variav = vars.stream().filter(v -> v.getName().equalsIgnoreCase(variableName))
					.collect(Collectors.toList());
			return (variav != null && !variav.isEmpty()) ? (String) variav.get(variav.size() - 1).getValue() : "";
		}
		return "";
	}

	public static String getProcessVariable(String processDefinitionKey, String processInstanceId,
			String variableName) {
		List<TaskVariables> vars = Core.getProcessVariables(processDefinitionKey, processInstanceId);
		if (vars != null) {
			List<TaskVariables> variav = vars.stream().filter(v -> v.getName().equalsIgnoreCase(variableName))
					.collect(Collectors.toList());
			return (variav != null && !variav.isEmpty()) ? (String) variav.get(variav.size() - 1).getValue() : "";
		}
		return "";
	}

	public static String getProcessVariableId(String processDefinitionKey) {
		String processInstanceId = Core.getProcessInstaceByTask();
		List<TaskVariables> vars = Core.getProcessVariables(processDefinitionKey, processInstanceId);
		if (vars != null) {
			List<TaskVariables> variav = vars.stream()
					.filter(v -> v.getName().equalsIgnoreCase(BPMNConstants.PRM_PROCESS_ID))
					.collect(Collectors.toList());
			return (variav != null && !variav.isEmpty()) ? (String) variav.get(variav.size() - 1).getValue() : "";
		}
		return "";
	}

	private static String getProcessInstaceByTask() {
		return Core.getProcessInstaceByTask(Core.getParam(BPMNConstants.PRM_TASK_ID));
	}

	private static String getProcessInstaceByTask(String taskId) {
		TaskServiceRest taskRest = new TaskServiceRest();
		taskRest.addFilterUrl("taskId", taskId);
		taskRest.addFilterUrl("includeTaskLocalVariables", "true");
		taskRest.addFilterUrl("includeProcessVariables", "true");
		List<HistoricTaskService> taskHistory = taskRest.getHistory();
		if (taskHistory != null && !taskHistory.isEmpty()) {
			return taskHistory.get(0).getProcessInstanceId();
		}
		return null;
	}

	/**
	 * @category BPMN
	 * 
	 * @param processDefinitionKey
	 * @param processInstanceId
	 * @return List of TaskVariables
	 */
	private static List<TaskVariables> getProcessVariables(String processDefinitionKey, String processInstanceId) {
		List<HistoricProcessInstance> task1 = new ProcessInstanceServiceRest()
				.getHistoryOfProccessInstanceId(processDefinitionKey, processInstanceId, false);
		if (task1 != null && !task1.isEmpty()) {
			return task1.get(task1.size() - 1).getVariables();
		}
		return null;
	}

	/**
	 * @category BPMN
	 * @param processDefinitionKey
	 * @return List of TaskVariables
	 */
	private static List<TaskVariables> getProcessVariables(String processDefinitionKey) {
		List<HistoricProcessInstance> task1 = new ProcessInstanceServiceRest()
				.getHistoryOfProccessInstanceId(processDefinitionKey);
		if (task1 != null && !task1.isEmpty()) {
			return task1.get(task1.size() - 1).getVariables();
		}
		return null;
	}

	/**
	 * @category BPMN
	 * @param taskDefinitionKey
	 * @return class HistoricTaskService
	 */
	public static HistoricTaskService getTaskHistory(String taskDefinitionKey) {
		String id = Core.getExecutionId();
		if (Core.isNotNull(id)) {
			List<HistoricTaskService> task1 = new TaskServiceRest().getHistory(taskDefinitionKey, id);
			if (task1 != null && !task1.isEmpty()) {
				return task1.get(task1.size() - 1);
			}
		}
		return null;
	}

	/**
	 * @category BPMN
	 * 
	 * @param obj
	 * @param json
	 * @return
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static Object unnserializeFromTask(Object obj, String json)
			throws IllegalArgumentException, IllegalAccessException {
		CustomVariableIGRP rows = new Gson().fromJson(json, CustomVariableIGRP.class);
		for (java.lang.reflect.Field f : obj.getClass().getDeclaredFields()) {
			f.setAccessible(true);
			rows.getRows().stream().filter(r -> r.getName().equalsIgnoreCase("p_" + f.getName())).forEach(r -> {
				IgrpHelper.setField(obj, f, r.getValue());
			});
		}
		return obj;
	}

	/**
	 * @category BPMN
	 * 
	 * @param variableName
	 * @param scope
	 * @param type
	 * @param value
	 */
	public static void setTaskVariable(String variableName, String scope, String type, Object value) {
		String taskId = Core.getParamTaskId();
		TaskServiceRest taskRest = new TaskServiceRest();
		TaskService task = taskRest.getTask(taskId);
		if (task != null) {
			if (scope.equalsIgnoreCase("global"))
				new ProcessInstanceServiceRest().deleteVariable(task.getProcessInstanceId(),
						task.getTaskDefinitionKey() + "_" + variableName);
			taskRest.addVariable(task.getTaskDefinitionKey() + "_" + variableName, scope, type, value);
			taskRest.submitVariables(taskId);
		}
	}

	/**
	 * @category BPMN
	 * 
	 * @param variableName
	 * @return
	 */
	public static String getTaskVariable(String variableName) {
		if (Core.isNull(variableName))
			return "";
		String id = getParamTaskId();
		TaskService task = new TaskServiceRest().getTask(id);
		List<TaskVariables> vars = Core.getTaskVariables(task.getTaskDefinitionKey());
		if (vars != null) {
			List<TaskVariables> variav = vars.stream()
					.filter(v -> v.getName().equalsIgnoreCase(task.getTaskDefinitionKey() + "_" + variableName))
					.collect(Collectors.toList());
			return (variav != null && !variav.isEmpty()) ? "" + variav.get(variav.size() - 1).getValue() : "";
		}
		return "";
	}

	/**
	 * @category BPMN
	 * 
	 * @param taskDefinitionKey
	 * @param variableName
	 * @return
	 */
	public static String getTaskVariable(String taskDefinitionKey, String variableName) {
		List<TaskVariables> vars = Core.getTaskVariables(taskDefinitionKey);
		if (vars != null) {
			List<TaskVariables> variav = vars.stream()
					.filter(v -> v.getName().equalsIgnoreCase(taskDefinitionKey + "_" + variableName))
					.collect(Collectors.toList());
			return (variav != null && !variav.isEmpty()) ? "" + variav.get(variav.size() - 1).getValue() : "";
		}
		return "";
	}

	/**
	 * @category BPMN
	 * 
	 * @param variableName
	 * @param value
	 */
	public static void setTaskVariableString(String variableName, String value) {
		Core.setTaskVariable(variableName, "global", "string", value);
	}

	/**
	 * @category BPMN
	 * 
	 * @param variableName
	 * @param value
	 */
	public static void setTaskVariableInt(String variableName, Integer value) {
		Core.setTaskVariable(variableName, "global", "integer", value);
	}

	public static void setTaskVariableShort(String variableName, Short value) {
		Core.setTaskVariable(variableName, "global", "short", value);
	}

	public static void setTaskVariableLong(String variableName, Long value) {
		Core.setTaskVariable(variableName, "global", "long", value);
	}

	public static void setTaskVariableDouble(String variableName, Double value) {
		Core.setTaskVariable(variableName, "global", "double", value);
	}

	public static void setTaskVariableBoolean(String variableName, boolean value) {
		Core.setTaskVariable(variableName, "global", "boolean", Boolean.valueOf(value));
	}

	public static void setTaskVariableDate(String variableName, java.util.Date value) {
		Core.setTaskVariable(variableName, "global", "date", value);
	}

	public static void setTaskVariableBinary(String variableName, Byte[] value) {
		Core.setTaskVariable(variableName, "global", "binary", value);
	}

	public static void setTaskVariableSerializable(String variableName, Object value) {
		Core.setTaskVariable(variableName, "global", "serializable", value);
	}

	public static void setTaskVariableString(String variableName, String scope, String value) {
		Core.setTaskVariable(variableName, scope, "string", value);
	}

	public static void setTaskVariableInt(String variableName, String scope, Integer value) {
		Core.setTaskVariable(variableName, scope, "integer", value);
	}

	public static void setTaskVariableShort(String variableName, String scope, Short value) {
		Core.setTaskVariable(variableName, scope, "short", value);
	}

	public static void setTaskVariableLong(String variableName, String scope, Long value) {
		Core.setTaskVariable(variableName, scope, "long", value);
	}

	public static void setTaskVariableDouble(String variableName, String scope, Double value) {
		Core.setTaskVariable(variableName, scope, "double", value);
	}

	public static void setTaskVariableBoolean(String variableName, String scope, boolean value) {
		Core.setTaskVariable(variableName, scope, "boolean", Boolean.valueOf(value));
	}

	public static void setTaskVariableDate(String variableName, String scope, java.util.Date value) {
		Core.setTaskVariable(variableName, scope, "date", value);
	}

	public static void setTaskVariableBinary(String variableName, String scope, Byte[] value) {
		Core.setTaskVariable(variableName, scope, "binary", value);
	}

	public static void setTaskVariableSerializable(String variableName, String scope, Object value) {
		Core.setTaskVariable(variableName, scope, "serializable", value);
	}

	public static String getTaskVariableString(String variableName) {
		return Core.getTaskVariable(variableName);
	}

	/**
	 * @category BPMN
	 * 
	 * @param taskDefinitionKey
	 * @param variableName
	 * @return
	 */
	public static String getTaskVariableString(String taskDefinitionKey, String variableName) {
		return Core.getTaskVariable(taskDefinitionKey, variableName);
	}

	public static Boolean getTaskVariableBoolean(String variableName) {
		String v = Core.getTaskVariable(variableName);
		return Core.isNotNull(v) ? Boolean.valueOf(true) : Boolean.valueOf(false);
	}

	public static Boolean getTaskVariableBoolean(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.isNotNull(v) ? Boolean.valueOf(true) : Boolean.valueOf(false);
	}

	public static Double getTaskVariableDouble(String variableName) {
		String v = Core.getTaskVariable(variableName);
		return Core.isNotNull(v) ? Core.toDouble(v) : Double.valueOf(0);
	}

	public static Double getTaskVariableDouble(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.isNotNull(v) ? Core.toDouble(v) : Double.valueOf(0);
	}

	public static Integer getTaskVariableInt(String variableName) {
		String v = Core.getTaskVariable(variableName);
		return Core.isNotNull(v) ? Core.toInt(v) : Integer.valueOf(0);
	}

	public static Integer getTaskVariableInt(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.isNotNull(v) ? Core.toInt(v) : Integer.valueOf(0);
	}

	public static Short getTaskVariableShort(String variableName) {
		String v = Core.getTaskVariable(variableName);
		return Core.isNotNull(v) ? Core.toShort(v) : Short.valueOf((short) 0);
	}

	public static Short getTaskVariableShort(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.isNotNull(v) ? Core.toShort(v) : Short.valueOf((short) 0);
	}

	public static Long getTaskVariableLong(String variableName) {
		String v = Core.getTaskVariable(variableName);
		return Core.isNotNull(v) ? Core.toLong(v) : Long.valueOf(0);
	}

	public static Long getTaskVariableLong(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.isNotNull(v) ? Core.toLong(v) : Long.valueOf(0);
	}

	public static java.util.Date getTaskVariableDate(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return Core.ToDate(v, "yyyy-mm-dd");
	}

	public static java.util.Date getTaskVariableDate(String taskDefinitionKey, String variableName, String format) {
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

	public static byte[] getTaskVariableByte(String taskDefinitionKey, String variableName) {
		String v = Core.getTaskVariable(taskDefinitionKey, variableName);
		return v.getBytes();
	}

	public static Object getTaskVariableSerializable(String variableName) {
		if (Core.isNull(variableName))
			return null;
		String id = getParamTaskId();
		TaskService task = new TaskServiceRest().getTask(id);
		List<TaskVariables> vars = Core.getTaskVariables(task.getTaskDefinitionKey());
		if (vars != null) {
			List<TaskVariables> variav = vars.stream()
					.filter(v -> v.getName().equalsIgnoreCase(task.getTaskDefinitionKey() + "_" + variableName))
					.collect(Collectors.toList());
			return (variav != null && !variav.isEmpty()) ? (String) variav.get(variav.size() - 1).getValue() : null;
		}
		return null;
	}

	public static Object getTaskVariableSerializable(String taskDefinitionKey, String variableName) {
		List<TaskVariables> vars = Core.getTaskVariables(taskDefinitionKey);
		if (vars != null) {
			List<TaskVariables> variav = vars.stream()
					.filter(v -> v.getName().equalsIgnoreCase(taskDefinitionKey + "_" + variableName))
					.collect(Collectors.toList());
			return (variav != null && !variav.isEmpty()) ? (String) variav.get(variav.size() - 1).getValue() : null;
		}
		return null;
	}

	public static String getTaskVariableId(String taskDefinitionKey) {
		List<TaskVariables> vars = Core.getTaskVariables(taskDefinitionKey);
		if (vars != null) {
			List<TaskVariables> variav = vars.stream()
					.filter(v -> v.getName().equalsIgnoreCase(taskDefinitionKey + "_" + "p_task_id"))
					.collect(Collectors.toList());
			return (variav != null && !variav.isEmpty()) ? (String) variav.get(variav.size() - 1).getValue() : "";
		}
		return "";
	}

	public static List<TaskVariables> getTaskVariables(String taskDefinitionKey) {
		String id = Core.getExecutionId();
		if (Core.isNotNull(id)) {
			List<HistoricTaskService> task1 = new TaskServiceRest().getHistory(taskDefinitionKey, id);
			if (task1 != null && !task1.isEmpty()) {
				return task1.get(task1.size() - 1).getVariables();
			}
		}
		return null;
	}

	/**
	 * Add variable of type long to the process task
	 * 
	 * @param taskDefinitionKey
	 *            identification of task
	 * @param variableName
	 *            name of parameter
	 * @param value
	 *            value of parameter
	 */
	public static void addTaskVariableLong(String taskDefinitionKey, String variableName, Object value) {
		String taskId = Igrp.getInstance().getRequest().getParameter("taskId");
		if (Core.isNotNull(taskId)) {
			TaskServiceRest taskRest = new TaskServiceRest();
			TaskService task = taskRest.getTask(taskId);
			task.setId(taskId);
			taskRest.addVariable(task.getTaskDefinitionKey() + "_" + variableName, "local", "string", value.toString());
			taskRest.submitVariables(taskId);
			ProcessInstanceServiceRest processInstance = new ProcessInstanceServiceRest();
			processInstance.addVariable(task.getTaskDefinitionKey() + "_" + variableName, "local", "string",
					value.toString());
			processInstance.submitVariables(task.getProcessInstanceId());
		}
	}

	/**
	 * @param wsdlUrl
	 *            The webservice description language url
	 * @param namespaces
	 *            A Map of all required namespaces
	 * @param headers
	 *            A Map of soap request headers
	 * @param bodyContent
	 *            A Map of request content that will be converted to xml
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
	 * @param wsdlUrl
	 *            The webservice description language url
	 * @param namespaces
	 *            A Map of all required namespaces
	 * @param headers
	 *            A Map of soap request headers
	 * @param bodyContent
	 *            A Map of request content that will be converted to xml
	 * @param soapProtocolVersion
	 *            javax.xml.soap.SOAPConstants.(SOAP_1_2_PROTOCOL |
	 *            SOAPConstants.SOAP_1_1_PROTOCOL)
	 * @return SoapClient object
	 */
	public static SoapClient soapClient(String wsdlUrl, Map<String, String> namespaces, Map<String, String> headers,
			Map<String, Object> bodyContent, String soapProtocolVersion) {
		SoapClient sc = new SoapClient(wsdlUrl);
		sc.setHeaders(headers);
		sc.setSoapProtocolVersion(soapProtocolVersion);
		sc.doRequest(namespaces, bodyContent);
		sc.call();
		return sc;
	}

	/**
	 * @param soapNameSpace
	 *            The custom soap tag name envelope
	 * @param soapNamespaceEnvelope
	 *            custom namespace for custom tag name envelope
	 * @param wsdlUrl
	 *            The webservice description language url
	 * @param namespaces
	 *            A Map of all required namespaces
	 * @param headers
	 *            A Map of soap request headers
	 * @param bodyContent
	 *            A Map of request content that will be converted to xml
	 * @return SoapClient object
	 */
	public static SoapClient soapClient(String wsdlUrl, Map<String, String> namespaces, Map<String, String> headers,
			Map<String, Object> bodyContent, String soapNameSpace, String soapProtocolVersion) {
		SoapClient sc = new SoapClient(wsdlUrl);
		sc.setHeaders(headers);
		sc.setSoapNameSpace(soapNameSpace);
		sc.setSoapProtocolVersion(soapProtocolVersion);
		sc.doRequest(namespaces, bodyContent);
		sc.call();
		return sc;
	}

	/**
	 * @param wsdlUrl
	 *            The webservice description language url
	 * @param headers
	 *            A Map of soap request headers
	 * @param rawEnvelope
	 *            String of raw request envelope
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

	/**
	 * use dateToString
	 * 
	 * @param date
	 * @param formatOut
	 * @return
	 */
	@Deprecated
	public static String ToChar(java.sql.Date date, String formatOut) {
		return DateHelper.convertDateToString(date, formatOut);
	}

	/**
	 * Please use dateToString
	 * 
	 * @param date
	 * @param formatOut
	 * @return
	 */
	@Deprecated
	public static String ToChar(java.util.Date date, String formatOut) {
		return dateToString(date, formatOut);
	}

	/**
	 * Please use dateToString
	 * 
	 * @param date
	 * @param formatOut
	 * @return
	 */
	@Deprecated
	public static String ToChar(String date, String formatOut) {
		return DateHelper.convertDate(date, "yyyy-MM-dd", formatOut);
	}

	/**
	 * 
	 * @param date
	 * @param formatIn
	 * @param formatOut
	 * @return DateHelper.convertDate
	 */
	public static String ToChar(String date, String formatIn, String formatOut) {
		return DateHelper.convertDate(date, formatIn, formatOut);
	}

	/**
	 * 
	 * @param date
	 * @param formatIn
	 * @return DateHelper.convertStringToDate
	 */
	public static java.sql.Date ToDate(String date, String formatIn) {
		return DateHelper.convertStringToDate(date, formatIn);
	}

	/**
	 * FormatIn is dd-MM-yyyy
	 * 
	 * @param date
	 * 
	 * @return DateHelper.convertStringToDate
	 */
	public static java.sql.Date ToDate(String date) {
		return DateHelper.convertStringToDate(date, Core.DD_MM_YYYY);
	}

	/**
	 * 
	 * @param date
	 * @param formatIn
	 * @param formatOut
	 * @return DateHelper.formatDate
	 */
	public static java.sql.Date ToDate(String date, String formatIn, String formatOut) {
		return DateHelper.formatDate(date, formatIn, formatOut);
	}

	/**
	 * 
	 * @param timeStampDate
	 * @param formatOut
	 * @return return convertDate(date, "yyyy-MM-dd'T'HH:mm:ss.SSSXXX", formatOut);
	 */
	public static String convertTimeStampToDateString(String timeStampDate, String formatOut) {
		return DateHelper.convertTimeStampToDateString(timeStampDate, formatOut);
	}

	/**
	 * Deprecated use convertTimeStampToDateString
	 * 
	 * @param timeStampDate
	 * @param formatOut
	 * @return return convertDate(date, "yyyy-MM-dd'T'HH:mm:ss.SSSXXX", formatOut);
	 */
	@Deprecated
	public static String convertTimeStampToDate(String timeStampDate, String formatOut) {
		return DateHelper.convertTimeStampToDateString(timeStampDate, formatOut);
	}

	/**
	 * 
	 * @param timeStampDate
	 * @param formatOut
	 * @return return formattDate(date, "yyyy-MM-dd'T'HH:mm:ss.SSSXXX", formatOut);
	 */
	public static java.sql.Date convertTimeStampToDateSQL(String timeStampDate, String formatOut) {
		return DateHelper.convertTimeStampToDate(timeStampDate, formatOut);
	}

	// DATES Functions by Ivone Tavares and Venceslau:
	// _____________________________________________________________________
	/**
	 * Receives java.sql.Date and returns it as utilDate
	 * 
	 * @param sqlDate
	 * @return a java.util.Date
	 */
	public static java.util.Date dateToDateUtil(java.sql.Date sqlDate) {

		return new java.util.Date(sqlDate.getTime());

	}

	/**
	 * Receives java.util.Date and returns it as java.sql.Date
	 * 
	 * @param utilDate
	 * @return a java.sql.Date
	 */
	public static java.sql.Date dateUtilToDate(java.util.Date utilDate) {
		return DateHelper.utilDateToSqlDate(utilDate);
	}

	/**
	 * Receives java.util.Date and returns it as string
	 * 
	 * @param date
	 * @return strDate with a format declared in the class Cons
	 */
	public static String dateToString(java.sql.Date date) {
		return DateHelper.convertDateToString(date, Cons.DATE_FORMAT.getValue());
	}

	/**
	 * Receives a java.util.Date with a sent format
	 *
	 * @param date
	 * @param formatOut
	 * @return a strDate with a the specified format
	 */
	public static String dateToString(java.util.Date date, String formatOut) {
		DateFormat df = new SimpleDateFormat(formatOut);
		return df.format(date);
	}

	/**
	 * 
	 * Generic method intended to use with The Date Time API from java 8. Please
	 * ensure the correct {@link DateTimeFormatter} is provided for the date type
	 * passes as argument.
	 * <p>
	 * Types Suported:
	 * <ul>
	 * <li>{@link LocalDate}
	 * <li>{@link LocalDateTime}
	 * <li>{@link OffsetDateTime}
	 * <li>{@link ZonedDateTime}
	 * <li>{@link Instant}
	 * </ul>
	 * 
	 * @param <T>
	 * @param date
	 *            the date object to parse as a string
	 * @param formatter
	 *            the formatter to parse the date object
	 * @return string representation of the date or an empty string if the date is
	 *         null or of an unsupported type.
	 * @category DateUtils
	 */
	public static <T extends Temporal> String parseDateToString(T date, DateTimeFormatter formatter) {
		if (Objects.isNull(date))
			return "";
		if (date instanceof LocalDate)
			return LocalDate.from(date).format(formatter);
		else if (date instanceof LocalDateTime)
			return LocalDateTime.from(date).format(formatter);
		else if (date instanceof ZonedDateTime)
			return ZonedDateTime.from(date).format(formatter);
		else if (date instanceof OffsetDateTime)
			return OffsetDateTime.from(date).format(formatter);
		else if (date instanceof Instant) {
			final LocalDateTime dateTime = LocalDateTime.ofInstant((Instant) date, ZoneId.systemDefault());
			return dateTime.format(formatter);
		}
		return "";
	}

	/**
	 * Obtains an instance of {@code IGRPDaysOff}. Provide methods to add dates and
	 * build a string from those dates.
	 * 
	 * @return {@code IGRPDaysOff}, not null
	 * @category DateUtils
	 */
	public static IGRPDaysOff buildDaysOffString() {
		return new IGRPDaysOff();
	}

	/**
	 * Obtains an instance of {@code IGRPDateFromTo} from a text string such as
	 * {@code 02-06-2021 / 30-06-2021}.
	 * <p>
	 * Intended to use with the Igrp field Date when property fromTo is active, to
	 * get the start and end dates.
	 * <p>
	 * Use case example:
	 * 
	 * <pre>
	 * IGRPDateFromTo dateFromTo = Core.dateFromTo("02-06-2021 / 30-06-2021");
	 * 
	 * {@link Optional}<{@link LocalDateTime}> from = dateFromTo.from();
	 * {@link Optional}<{@link LocalDateTime}> to = dateFromTo.to();
	 * 	
	 * if(from.isPresent()) 
	 *	{@link LocalDateTime} from = from.get();
	 *	
	 * if(to.isPresent()) 
	 *	{@link LocalDateTime} to = to.get();
	 * </pre>
	 * 
	 * @param dateFromTo
	 *            the string representation from which the start and end dates are
	 *            obtained.
	 * 
	 * @return {@code IGRPDateFromTo}, not null
	 * @category DateUtils
	 */
	public static IGRPDateFromTo dateFromTo(String dateFromTo) {
		return IGRPDateFromTo.of(dateFromTo);
	}

	public static String convertLocalDateTimeToString(LocalDateTime ldt, String outputFormatter) {
		if (Core.isNull(ldt)) {
			return "";
		} else {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern(outputFormatter);
			return ldt.format(formatter);
		}

	}

	public static String convertLocalDateToString(LocalDate ldt, String outputFormatter) {
		if (Core.isNull(ldt)) {
			return "";
		} else {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern(outputFormatter);
			return ldt.format(formatter);
		}
	}

	public static LocalDate convertStringToLocalDate(String strDate, String outputFormatter) {
		if (Core.isNull(strDate)) {
			return null;
		} else {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern(outputFormatter);
			return LocalDate.parse(strDate, formatter);
		}
	}

	public static LocalDateTime convertStringToLocalDateTime(String stringDate, String formatter) {
		if (Core.isNull(stringDate)) {
			return null;
		} else {
			DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(formatter);
			return LocalDate.parse(stringDate, dateTimeFormatter).atStartOfDay();
		}
	}

	public static LocalTime convertStringToLocalTime(String time) {
		if (Core.isNull(time)) {
			return null;
		} else {
			String[] splitedTime = time.split(":");
			int hour = Core.toInt(splitedTime[0]);
			int minute = Core.toInt(splitedTime[1]);
			return LocalTime.of(hour, minute);
		}
	}

	/**
	 * Receives a date in a default string format dd-MM-yyy and converts it to
	 * java.util.Date
	 *
	 * @param strDate
	 * @return a java.util.Date with a format declared in the class Cons
	 */
	public static java.util.Date ToDateUtil(String strDate) {
		return ToDateUtil(strDate, Cons.DATE_FORMAT.getValue());
	}

	/**
	 * Receives a date in a default string with a sent format
	 * 
	 * @param strDate
	 * @param formatIn
	 * @return a java.util.Date with a specified format
	 */
	public static java.util.Date ToDateUtil(String strDate, String formatIn) {
		java.util.Date date;
		DateFormat df = new SimpleDateFormat(formatIn);
		try {
			date = df.parse(strDate);
		} catch (ParseException e) {
			date = null;
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * Receives two java.util.Date and returns them as a concatenated string whit
	 * the default separator
	 * 
	 * @param beginDate
	 * @param endDate
	 * @return two strDates separated by a separator and each one in a format
	 *         declared in the class Cons
	 */
	public static String dateUtilToDateFromToStr(java.util.Date beginDate, java.util.Date endDate) {
		return dateBeginEndStrToDateFromToStr(dateToString(beginDate, Cons.DATE_FORMAT.getValue()),
				dateToString(endDate, Cons.DATE_FORMAT.getValue()), Cons.DATE_SEPARATOR.getValue());
	}

	/**
	 * Receives two java.util.Date with a sent separator and returns them as a
	 * concatenated string
	 *
	 * @param beginDate
	 * @param endDate
	 * @param separator
	 * @return two strDates separated by a specified separator and each one in a
	 *         format declared in the class Cons
	 */
	public static String dateBeginEndUtilToDateFromToStr(java.util.Date beginDate, java.util.Date endDate,
			String separator) {
		return dateBeginEndStrToDateFromToStr(dateToString(beginDate, Cons.DATE_FORMAT.getValue()),
				dateToString(endDate, Cons.DATE_FORMAT.getValue()), separator);
	}

	/**
	 * Receives two dates in a default string format with the default separator
	 * 
	 * @param beginDateStr
	 * @param endDateStr
	 * @return a string date from/to format
	 */
	public static String dateBeginEndStrToDateFromToStr(String beginDateStr, String endDateStr) {
		return dateBeginEndStrToDateFromToStr(beginDateStr, endDateStr, Cons.DATE_SEPARATOR.getValue());
	}

	/**
	 * Receives two dates in a default string format with a specified separator
	 * 
	 * @param beginDateStr
	 * @param endDateStr
	 * @param separator
	 * @return a string date from/to format
	 */
	public static String dateBeginEndStrToDateFromToStr(String beginDateStr, String endDateStr, String separator) {
		return beginDateStr + separator + endDateStr;
	}

	/**
	 * Receives a date from/to in a default string format and converts the 1º date
	 * to java.util.Date
	 *
	 * @param dateFromToStr
	 * @return a java.util.Date with a format declared in the class Cons
	 *         (dd-MM-yyyy)
	 */
	public static java.util.Date dateFromTo2DateBeginUtil(String dateFromToStr) {
		return ToDateUtil(dateFromTo2DateBeginStr(dateFromToStr));
	}

	/**
	 * Receives a date from/to in a default string format with separator /
	 *
	 * @param dateFromToStr
	 * @return the substring or the first date of the date from/to
	 */
	public static String dateFromTo2DateBeginStr(String dateFromToStr) {
		return dateFromTo2DateBeginStr(dateFromToStr, Cons.DATE_SEPARATOR.getValue());
	}

	/**
	 * Receives a date from/to in a default model string format with a separator
	 * param
	 * 
	 * @param dateFromToStr
	 * @param separator
	 * @return the substring or the first date of the date from/to
	 */
	public static String dateFromTo2DateBeginStr(String dateFromToStr, String separator) {
		return dateFromToStr.substring(0, dateFromToStr.indexOf(separator));
	}

	/**
	 * Receives a date from/to in a default model string format and converts it to
	 * java.util.Date
	 *
	 * @param dateFromToStr
	 * @return a java.util.Date with a format declared in the class Cons
	 */
	public static java.util.Date dateFromTo2EndDateUtil(String dateFromToStr) {
		return ToDateUtil(dateFromTo2EndDateStr(dateFromToStr));
	}

	/**
	 * Receives a date from/to in a default string format separated whit the default
	 * separator
	 * 
	 * @param dateFromToStr
	 * @return the substring or the end date of the date from/to
	 */
	public static String dateFromTo2EndDateStr(String dateFromToStr) {
		return dateFromTo2EndDateStr(dateFromToStr, Cons.DATE_SEPARATOR.getValue());
	}

	/**
	 * Receives a date from/to in a default string format with a separator
	 *
	 * @param dateStr
	 * @param separator
	 * @return the substring or the end date of the date from/to
	 */
	public static String dateFromTo2EndDateStr(String dateStr, String separator) {
		if (isNotNullMultiple(dateStr, separator))
			return dateStr.substring(dateStr.indexOf(separator) + separator.length(), dateStr.length());
		return "";
	}

	/**
	 * Receives a String with special characters and returns it as a normalized
	 * string {@code Core.normalizeText(string).replaceAll("[^-a-zA-Z0-9\\s]", "")}
	 * 
	 * @param string
	 * @return normalizedString
	 */
	public static String normalizeName(String string) {
		return (Core.normalizeText(string).replaceAll("[^-a-zA-Z0-9\\s]", ""));
	}

	// ------------------------------------------------------------
	// END### DATES Funciotn by Ivone Tavares and Venceslau:
	// __________________________________________________-----------------

	/**
	 * Verifies if the Core.isBigDecimal and if true, than returns BigDecimal parse
	 * of it, else returns 0
	 * 
	 * @param value
	 * @return new BigDecimal(value) or 0
	 * 
	 */
	public static BigDecimal toBigDecimal(String value) {
		return toBigDecimal(value, new BigDecimal(0.0));
	}

	public static BigDecimal toBigDecimal(String value, BigDecimal defaultValue) {
		if (Core.isNotNull(value)) {
			try {
				return new BigDecimal(value.toString());
			} catch (NumberFormatException e) {

			}
		}
		return defaultValue;
	}

	/**
	 * Verifies if the Core.isBigInteger and if true, than returns BigInteger parse
	 * of it, else returns 0
	 * 
	 * @param value
	 * @return new BigInteger(value) or 0
	 * 
	 */
	public static BigInteger toBigInteger(String value) {
		return toBigInteger(value, new BigInteger("0"));
	}

	public static BigInteger toBigInteger(String value, BigInteger defaultValue) {
		if (Core.isNotNull(value)) {
			try {
				return new BigInteger(value.toString());
			} catch (NumberFormatException e) {
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
				return Double.valueOf(Double.parseDouble(value));
			} catch (NumberFormatException e) {
				
			}
		}
		return Double.valueOf(defaultValue);
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
		return toFloat(value, 0);
	}

	public static Float toFloat(String value, float defaultValue) {
		if (Core.isNotNull(value)) {
			try {
				return Float.valueOf(Float.parseFloat(value));
			} catch (NumberFormatException e) {

			}
		}
		return Float.valueOf(defaultValue);
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
		return toInt(value, 0);
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
			try {
				return Integer.valueOf(Integer.parseInt(value));
			} catch (NumberFormatException e) {

			}
		}
		return Integer.valueOf(defaultValue);
	}

	public static String toJson(Object appP) {
		if (appP != null)
			return new Gson().toJson(appP);
		return "";
	}

	public static String toJsonWithJsonBuilder(Object appP) {
		if (appP != null)
			return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(appP);
		return "";
	}

	public static Long toLong(String value) {
		return toLong(value, 0);
	}

	public static Long toLong(String value, long defaultValue) {
		if (Core.isNotNull(value)) {
			try {
				return Long.parseLong(value);
			} catch (NumberFormatException e) {
				
			}
		}
		return Long.valueOf(defaultValue);
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
	 * @param prompt
	 *            - use -- Selecionar --
	 * @return {@code Map<Object, Object>}
	 */
	public static Map<Object, Object> toMap(List<?> values, String keyField, String valueField, String prompt) {
		return IgrpHelper.toMap(values, keyField, valueField, prompt);
	}

	public static Short toShort(String value) {
		return Core.toShort(value, (short) 0);
	}

	public static Short toShort(String value, short defaultValue) {
		if (Core.isInt(value))
			return Short.valueOf(Short.parseShort(value));
		return Short.valueOf(defaultValue);
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

	public static BaseQueryInterface update(String tableName, boolean displayError, boolean tracingError) {
		return new QueryUpdate(Core.defaultConnection(), displayError, tracingError).update(tableName);
	}

	public static BaseQueryInterface update(String connectionName, String tableName, boolean displayError,
			boolean tracingError) {
		return new QueryUpdate(connectionName, displayError, tracingError).update(tableName);
	}

	public static BaseQueryInterface update(String connectionName, String schemaName, String tableName,
			boolean displayError, boolean tracingError) {
		return new QueryUpdate(connectionName, displayError, tracingError).update(schemaName, tableName);
	}

	/**
	 * Upload a file from a upload field with the tag given
	 * 
	 * @param tag
	 *            p_file
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
	 * @param tag
	 *            p_file
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
	public static String getIGRPLink(String app, String page, String action) {
		return Route.getResolveUrl(app, page, action);
	}

	/**
	 * Convert int array to String array Example:
	 * {@code convertArrayIntToArrayString(new int[]{1,2,3}); ->
	 * String[]{"1","2","3"};}
	 * 
	 * @param array
	 * @return
	 */
	public static String[] convertArrayIntToArrayString(int[] array) {
		Function<int[], String[]> intToString = x -> {
			String[] a = new String[x.length];
			for (int i = 0; i < x.length; i++) {
				a[i] = "" + x[i];
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 * Convert float array to String array Example:
	 * {@code convertArrayFloatToArrayString(new float[]{1.0,2,3}); ->
	 * String[]{"1.0","2","3"};}
	 * 
	 * @param array
	 * @return
	 */
	public static String[] convertArrayFloatToArrayString(float[] array) {
		Function<float[], String[]> intToString = x -> {
			String[] a = new String[x.length];
			for (int i = 0; i < x.length; i++) {
				a[i] = "" + x[i];
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 * Convert double array to String array Example:
	 * {@code convertArrayDoubleToArrayString(new double[]{1,2,3}); ->
	 * String[]{"1","2","3"};}
	 * 
	 * @param array
	 * @return
	 */
	public static String[] convertArrayDoubleToArrayString(double[] array) {
		Function<double[], String[]> intToString = x -> {
			String[] a = new String[x.length];
			for (int i = 0; i < x.length; i++) {
				a[i] = "" + x[i];
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 * Convert short array to String array Example:
	 * {@code convertArrayShortToArrayString(new short[]{1,2,3}); ->
	 * String[]{"1","2","3"};}
	 * 
	 * @param array
	 * @return
	 */
	public static String[] convertArrayShortToArrayString(short[] array) {
		Function<short[], String[]> intToString = x -> {
			String[] a = new String[x.length];
			for (int i = 0; i < x.length; i++) {
				a[i] = "" + x[i];
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 * Convert Object array to String array Example:
	 * {@code convertArrayObjectToArrayString(new Integer[]{1,2,3}); ->
	 * String[]{"1","2","3"};}
	 * 
	 * @param array
	 * @return
	 */
	public static <N> String[] convertArrayObjectToArrayString(N[] array) {
		Function<N[], String[]> intToString = x -> {
			String[] a = new String[x.length];
			for (int i = 0; i < x.length; i++) {
				a[i] = "" + x[i];
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 * Convert Object array to primitive int array Example:
	 * {@code convertArrayObjectToArrayInt(new String[]{"1","2","3"}); ->
	 * int[]{1,2,3};}
	 * 
	 * @param array
	 * @return
	 */
	public static <N> int[] convertArrayObjectToArrayInt(N[] array) {
		Function<N[], int[]> intToString = x -> {
			int[] a = new int[x.length];
			for (int i = 0; i < x.length; i++) {
				a[i] = Core.toInt((String) x[i]).intValue();
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 * Convert Object array to primitive short array Example:
	 * {@code convertArrayObjectToArrayPShort(new String[]{"1","2","3"}); ->
	 * short[]{1,2,3};}
	 * 
	 * @param array
	 * @return
	 */
	public static <N> short[] convertArrayObjectToArrayPShort(N[] array) {
		Function<N[], short[]> intToString = x -> {
			short[] a = new short[x.length];
			for (int i = 0; i < x.length; i++) {
				a[i] = Core.toShort((String) x[i]).shortValue();
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 * Convert Object array to primitive float array Example:
	 * {@code convertArrayObjectToArrayPFloat(new String[]{"1","2","3"}); ->
	 * float[]{1,2,3};}
	 * 
	 * @param array
	 * @return
	 */
	public static <N> float[] convertArrayObjectToArrayPFloat(N[] array) {
		Function<N[], float[]> intToString = x -> {
			float[] a = new float[x.length];
			for (int i = 0; i < x.length; i++) {
				a[i] = Core.toFloat((String) x[i]).floatValue();
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 * Convert Object array to primitive double array Example:
	 * {@code convertArrayObjectToArrayPDouble(new String[]{"1","2","3"}); ->
	 * double[]{1,2,3};}
	 * 
	 * @param array
	 * @return
	 */
	public static <N> double[] convertArrayObjectToArrayPDouble(N[] array) {
		Function<N[], double[]> intToString = x -> {
			double[] a = new double[x.length];
			for (int i = 0; i < x.length; i++) {
				a[i] = Core.toDouble((String) x[i]).doubleValue();
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 * Convert Object array to Integer array Example:
	 * {@code convertArrayObjectToArrayInteger(new String[]{"1","2","3"}); ->
	 * Integer[]{1,2,3};}
	 * 
	 * @param array
	 * @return
	 */
	public static <N> Integer[] convertArrayObjectToArrayInteger(N[] array) {
		Function<N[], Integer[]> intToString = x -> {
			Integer[] a = new Integer[x.length];
			for (int i = 0; i < x.length; i++) {
				a[i] = Core.toInt((String) x[i]);
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 * Convert Object array to Float array Example:
	 * {@code convertArrayObjectToArrayFloat(new String[]{"1","2","3"}); ->
	 * Float[]{1.0,2.0,3.0};}
	 * 
	 * @param array
	 * @return
	 */
	public static <N> Float[] convertArrayObjectToArrayFloat(N[] array) {
		Function<N[], Float[]> intToString = x -> {
			Float[] a = new Float[x.length];
			for (int i = 0; i < x.length; i++) {
				a[i] = Core.toFloat((String) x[i]);
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 * Convert Object array to Double array Example:
	 * {@code convertArrayObjectToArrayDouble(new String[]{"1","2","3"}); ->
	 * Double[]{1,2,3};}
	 * 
	 * @param array
	 * @return
	 */
	public static <N> Double[] convertArrayObjectToArrayDouble(N[] array) {
		Function<N[], Double[]> intToString = x -> {
			Double[] a = new Double[x.length];
			for (int i = 0; i < x.length; i++) {
				a[i] = Core.toDouble((String) x[i]);
			}
			return a;
		};
		return intToString.apply(array);
	}

	/**
	 * Convert Object array to Short array Example:
	 * {@code convertArrayObjectToArrayShort(new String[]{"1","2","3"}); ->
	 * String[]{1,2,3};}
	 * 
	 * @param array
	 * @return
	 */
	public static <N> Short[] convertArrayObjectToArrayShort(N[] array) {
		Function<N[], Short[]> intToString = x -> {
			Short[] a = new Short[x.length];
			for (int i = 0; i < x.length; i++) {
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
	public static boolean isArraySameSize(Object[] array1, Object[] array2) {
		boolean r = false;
		if (Core.isNotNullMultiple(array1, array2)) {
			r = array1.length == array2.length;
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
	 * 
	 * @param allValues
	 *            list of the values of all values
	 * @param checkedValues
	 *            list of the checked values
	 * @return
	 */
	public static CheckBoxHelper extractCheckBox(String[] allValues, String[] checkedValues) {
		return CheckBoxHelper.of(allValues, checkedValues);
	}

	/**
	 * This method is intended to get the values checked and unchecked from a
	 * checkbox field in a table.
	 * 
	 * @param field
	 *            checkbox field
	 * @return a CheckBoxHelper object that contains the checked/Unchecked values
	 */
	public static CheckBoxHelper extractCheckBox(Field field) {
		return CheckBoxHelper.of(field);
	}

	/**
	 * @param id
	 * @param level
	 *            {@code level (6 -> zona, 5 -> cidade, 4 -> freguesia, 3 -> concelho, 2 -> ilha, 1 -> pais)}
	 * @return keys: zona_id, zona, freguesia_id, freguesia, cidade, cidade_id,
	 *         concelho, concelho_id, pais, pais_id, ...
	 */
	public static Map<String, Object> geoGetParentsById(String id, String level) {
		return new Geografia().geoGetParentsById(id, level);
	}

	/**
	 * Get Session to programming custom CRUD
	 * 
	 * @param connectionName
	 * @return
	 */
	public static Session getSession(String connectionName) {
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory(connectionName);
		if (sessionFactory != null) {
			Session s = null;
			if (sessionFactory.isOpen() && sessionFactory.getCurrentSession() != null
					&& sessionFactory.getCurrentSession().isOpen()) {
				s = sessionFactory.getCurrentSession();
				return s;
			}
			sessionFactory.close();
			HibernateUtils.removeSessionFactory(connectionName);
			sessionFactory = HibernateUtils.getSessionFactory(connectionName);
			if (sessionFactory != null) {
				s = sessionFactory.getCurrentSession();
				return s;
			}
		}
		throw new HibernateException(Core.gt("Problema de conexão. Por favor verifica o seu ficheiro hibernate."));
	}

	public static SessionFactory getSessionFactory(String connectionName) {
		return HibernateUtils.getSessionFactory(connectionName);
	}

	public static Session getSession() {
		return Core.getSession(Core.defaultConnection());
	}

	public static SessionFactory getSessionFactory() {
		return Core.getSessionFactory(Core.defaultConnection());
	}

	public static void lockProccess(String codeOrg, String codeProf, String userName, String procId, String taskId) {
		nosi.webapps.igrp.dao.User user = new nosi.webapps.igrp.dao.User().findIdentityByUsername(userName);
		Organization org = new Organization().findByCode(codeOrg);
		ProfileType prof = new ProfileType().findByCode(codeProf);
		ActivityExecute a = new ActivityExecute(procId, taskId, Core.getCurrentApp(), org, prof, user,
				ActivityExecuteType.LOCK, null);
		a.insert();
	}

	public static void lockProccess(String codeOrg, String codeProf, String procId, String taskId) {
		Organization org = new Organization().findByCode(codeOrg);
		ProfileType prof = new ProfileType().findByCode(codeProf);
		ActivityExecute a = new ActivityExecute(procId, taskId, Core.getCurrentApp(), org, prof, null,
				ActivityExecuteType.LOCK, null);
		a.insert();
	}

	public static List<TipoDocumento> findDocumentTypeByApp(String dad) {
		return new TipoDocumento().find().where("application.dad", "=", dad).all();
	}

	public static List<TipoDocumento> findDocumentTypeByApp() {
		return new TipoDocumento().find().where("application.dad", "=", Core.getCurrentDadParam()).all();
	}

	public static boolean isHttpPost() {
		return Igrp.getInstance().getRequest().getMethod().equals(HttpMethod.POST.toString());
	}

	public static boolean isHttpGet() {
		return Igrp.getInstance().getRequest().getMethod().equals(HttpMethod.GET.toString());
	}

	public static boolean isHttpPut() {
		return Igrp.getInstance().getRequest().getMethod().equals(HttpMethod.PUT.toString());
	}

	public static boolean isHttpDelete() {
		return Igrp.getInstance().getRequest().getMethod().equals(HttpMethod.DELETE.toString());
	}

	public static long calculateYears(String data) {
		return DateHelper.calculateYears(data);
	}

	public static long calculateYears(String data, String formatIn) {
		return DateHelper.calculateYears(data, formatIn);
	}

	public static long calculateMonths(String data) {
		return DateHelper.calculateMonths(data);
	}

	public static long calculateMonths(String data, String formatIn) {
		return DateHelper.calculateMonths(data, formatIn);
	}

	public static long calculateDays(String data) {
		return DateHelper.calculateDays(data);
	}

	public static long calculateDays(String data, String formatIn) {
		return DateHelper.calculateDays(data, formatIn);
	}

	public static String convertInputStreamToBase64(byte[] bytes) throws IOException {
		return FileHelper.convertInputStreamToBase64(bytes);
	}

	public static String convertInputStreamToBase64(InputStream inputStream) throws IOException {
		return FileHelper.convertInputStreamToBase64(inputStream);
	}

	public static byte[] convertInputStreamToByte(InputStream inputStream) throws IOException {
		return FileHelper.convertInputStreamToByte(inputStream);
	}

	public static InputStream convertStringToInputStream(String content) throws IOException {
		return FileHelper.convertStringToInputStream(content);
	}

	public static String convertPartToString(Part file) throws IOException {
		return FileHelper.convertToString(file);
	}

	public static String convertInputStreamToString(InputStream inputStream) throws IOException {
		return FileHelper.convertToString(inputStream);
	}

	public static boolean createDiretory(String path) throws IOException {
		return FileHelper.createDiretory(path);
	}

	public static void deletePartFile(Collection<Part> files) throws IOException {
		FileHelper.deletePartFile(files);
	}

	public static void deletePartFile(Part file) throws IOException {
		FileHelper.deletePartFile(file);
	}

	public static boolean dirExists(String dirName) throws IOException {
		return FileHelper.dirExists(dirName);
	}

	public static boolean fileExists(String fileName) throws IOException {
		return FileHelper.fileExists(fileName);
	}

	public static String readFileToString(String fileName) throws IOException {
		return FileHelper.readFile(fileName, null);
	}

	public static String readFileToString(String path, String fileName) throws IOException {
		return FileHelper.readFile(path, fileName);
	}

	public static boolean writeFile(String path, String fileName, Part file) throws IOException {
		return FileHelper.save(path, fileName, file);
	}

	public static boolean writeFile(String path, String fileName, String content) throws IOException {
		return FileHelper.save(path, fileName, content);
	}

	public static void forceDelete(String fileNameOrDirectory) {
		FileHelper.forceDelete(fileNameOrDirectory);
	}

	public static int digits(Number number) {
		return String.valueOf(number).length();
	}

	public static int digits(String number) {
		return String.valueOf(number).length();
	}

	public static String generateXmlForCalendar(String tagName, List<?> data) {
		return IGRPTable.generateXmlForCalendar(tagName, data);
	}

	/**
	 * @category BPMN
	 * @param processKey
	 *            the processKey from the process to start. See the process
	 *            information {@code Process Id} from your process at IGRP BPMN
	 *            Designer
	 * @return response
	 */
	public static Response startProcess(String processKey) {
		return startProcess(processKey, new HashMap<>());
	}

	/**
	 * @category BPMN
	 * @param processKey
	 *            the processKey from the process to start. See the process
	 *            information {@code Process Id} from your process at IGRP BPMN
	 *            Designer
	 * @param params
	 *            the parameters to send to the process. They should start with
	 *            {@code x_}
	 * @return response
	 */
	public static Response startProcess(String processKey, Map<String, String> params) {
		ProcessDefinitionService processDefinitionService = Core.getProcessDefinitionByProcessKey(processKey);
		if (processDefinitionService == null)
			return null;
		return startProcess(processKey, processDefinitionService.getId(), params);
	}

	/**
	 * @category BPMN
	 * @param processKey
	 *            the processKey from the process to start. See the process
	 *            information {@code Process Id} from your process at IGRP BPMN
	 *            Designer
	 * @param processDefinitionId
	 *            processDefinitionId of the process to start.
	 *            <p>
	 *            Example to get the processDefinitionId:
	 *            <p>
	 *            {@code ProcessDefinitionService obj = Core.getProcessDefinitionByProcessKey(processKey);
	 *  String processDefinitionId = obj.getId();}
	 * @return response
	 */
	public static Response startProcess(String processKey, String processDefinitionId) {
		try {
			if (Core.isNotNullMultiple(processDefinitionId, processKey)) {
				BPMNExecution bpmn = new BPMNExecution();
				return bpmn.startProcess(processKey, processDefinitionId);
			}
		} catch (Exception e) {
		}
		return null;
	}

	/**
	 * @category BPMN
	 * @param processKey
	 *            the processKey from the process to start. See the process
	 *            information {@code Process Id} from your process at IGRP BPMN
	 *            Designer
	 * @param processDefinitionId
	 *            processDefinitionId of the process to start.
	 * @param params
	 *            the parameters to send to the process. They should start with
	 *            {@code x_}
	 *            <p>
	 *            Example to get the processDefinitionId:
	 *            <p>
	 *            {@code ProcessDefinitionService obj = Core.getProcessDefinitionByProcessKey(processKey);
	 *  String processDefinitionId = obj.getId();}
	 * @return response
	 */
	public static Response startProcess(String processKey, String processDefinitionId, Map<String, String> params) {
		if (params != null) {
			try {
				BPMNExecution bpmn = new BPMNExecution();
				return bpmn.startProcess(processKey, processDefinitionId, params);
			} catch (Exception e) {
			}
		}
		return startProcess(processKey, processDefinitionId);
	}

	/**
	 * @param taskId
	 *            (Ex: 35834)
	 * @return
	 */
	public static Response startTask(String taskId) {
		try {
			if (Core.isNotNull(taskId)) {
				BPMNExecution bpmn = new BPMNExecution();
				return bpmn.openTask(taskId);
			}
		} catch (Exception e) {
			Core.log(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @param appDad
	 *            (Ex: igrp)
	 * @param processId
	 *            (Ex: Processo_pedido_compra)
	 * @return List<TipoDocumentoEtapa> package nosi.webapps.igrp.dao
	 */
	public static List<TipoDocumentoEtapa> getOutputFilesByProcessId(String appDad, String processId) {
		return getFilesByProcessIdNTaskId(appDad, processId, null);
	}

	/**
	 * @param appDad
	 *            (Ex: igrp)
	 * @param processId
	 *            (Ex: Processo_pedido_compra)
	 * @param taskId
	 *            (Ex: Pedido)
	 * @return List<TipoDocumentoEtapa> package nosi.webapps.igrp.dao
	 */
	public static List<TipoDocumentoEtapa> getFilesByProcessIdNTaskId(String appDad, String processId, String taskId) {
		return BPMNHelper.getFilesByProcessIdNTaskId(appDad, processId, taskId);
	}

	/**
	 * @return The deployed war name
	 */
	public static String getDeployedWarName() {
		return new File(Igrp.getInstance().getRequest().getServletContext().getRealPath("/")).getName();
	}

	/**
	 * @param processNr
	 * @return
	 */
	public static TaskService getCurrentTaskByProcessNr(String processNr) {
		return new TaskServiceIGRP().getCurrentTaskByProcessNr(processNr);
	}

	/**
	 * 
	 * @param processKey
	 * @return
	 */
	public static ProcessDefinitionService getProcessDefinitionByProcessKey(String processKey) {
		ProcessDefinitionService pDefinitionService = null;
		List<ProcessDefinitionService> l = new ProcessDefinitionIGRP().getMyProcessDefinitions();
		if (l != null) {
			Optional<ProcessDefinitionService> obj = l.stream().filter(p -> p.getKey().equals(processKey)).findFirst();
			if (obj.isPresent())
				pDefinitionService = obj.get();
		}
		return pDefinitionService;
	}

	/**
	 * @param task
	 *            The current Task of the Proccess
	 * @param parts
	 *            The input files
	 * @param myCustomPermission
	 *            (Ex: organicaCode)
	 * @return startProcess if success or null when failure
	 */
	public static StartProcess nextTask(TaskService task, List<Part> parts, String myCustomPermission) {
		BPMNExecution bpmnExecuteValidacao = new BPMNExecution();
		StartProcess startProcess = bpmnExecuteValidacao.exeuteTask(task, parts, myCustomPermission);
		return startProcess;
	}

	/**
	 * @param tipo
	 *            ENV|PAGE|ACTI
	 * @param id
	 *            The identifier of tipo parameter
	 * @param appDad
	 * @param orgCode
	 * @param profCode
	 * @param params
	 * @return stateValue
	 */
	public static String buildStateValueForSsoAutentika(String tipo, String id, String appDad, String orgCode,
			String profCode, Map<String, String> params) {
		String stateValue = "<TIPO>/<ID>/<APP>;<ORG>;<PROF>/<PARAM=VALUE>";
		if (tipo != null && !tipo.isEmpty() && id != null && !id.isEmpty()) {
			stateValue = stateValue.replace("<TIPO>", tipo).replace("<ID>", id);
			if (appDad != null && !appDad.isEmpty()) {
				stateValue = stateValue.replace("<APP>", appDad);
				if (orgCode != null && !orgCode.isEmpty()) {
					stateValue = stateValue.replace("<ORG>", orgCode);
					if (profCode != null && !profCode.isEmpty())
						stateValue = stateValue.replace("<PROF>", profCode);
				}
			}
			if (params != null) {
				String r = params.entrySet().stream()
						.filter(p -> p.getKey() != null && !p.getKey().isEmpty() && p.getValue() != null
								&& !p.getValue().isEmpty())
						.map(m -> m.getKey() + "=" + m.getValue()).collect(Collectors.joining(";"));
				stateValue = stateValue.replace("<PARAM=VALUE>", r);
			}
		}
		stateValue = stateValue.replaceAll("<[A-Z]*(=[A-Z]+)?>", "");
		return stateValue;
	}

	/**
	 * @param page
	 * @param appDad
	 * @param orgCode
	 * @param profCode
	 * @param params
	 * @return
	 */
	public static String buildStateValueForSsoAutentikaWhenPage(String page, String appDad, String orgCode,
			String profCode, Map<String, String> params) {
		Action action = Core.loadPageInfo(appDad, page);
		if (action != null)
			return Core.buildStateValueForSsoAutentika("PAGE", action.getId() + "", appDad, orgCode, profCode, params);
		return null;
	}

	/**
	 * @param env
	 *            The Application
	 * @param stateValue
	 *            A String that will be sent to autentika for sso
	 * @return
	 */
	public static String buildAppUrlUsingAutentikaForSSO(Application env, String stateValue) {
		String url = null;
		ConfigApp configApp = ConfigApp.getInstance();
		String contextName = Core.getDeployedWarName();
		if (env != null && env.getUrl() != null && !env.getUrl().isEmpty()
				&& !contextName.equalsIgnoreCase(env.getUrl())) {
			url = configApp.getAutentikaUrlForSso();
			if (stateValue != null && !stateValue.isEmpty())
				url = url.replace("state=igrp", "state=" + stateValue);
			url = url.replace("/IGRP/", "/" + env.getUrl() + "/");
		}
		return url;
	}

	/**
	 * @param dad
	 *            Application unique code
	 * @param stateValue
	 *            A String that will be sent to autentika for sso
	 * @return
	 */
	public static String buildAppUrlUsingAutentikaForSSO(String dad, String stateValue) {
		return buildAppUrlUsingAutentikaForSSO(Core.findApplicationByDad(dad), stateValue);
	}

	/**
	 * @param dad
	 * @param appOwner
	 * @param action
	 * @return
	 */
	public static boolean isSharedPage(String dad, String appOwner, Integer action) {
		return new Share().getPermissionPage(dad, appOwner, action);
	}

	/**
	 * @param dad
	 * @param appOwner
	 * @param action
	 * @return
	 */
	public static boolean isSharedPage(String dad, String appOwner, String page) {
		Action action = loadPageInfo(appOwner, page);
		return new Share().getPermissionPage(dad, appOwner, action != null ? action.getId() : null);
	}

	/**
	 * @param app
	 * @param page
	 * @return
	 */
	public static Action loadPageInfo(String app, String page) {
		return new Action().find().andWhere("application.dad", "=", app).andWhere("page", "=", page).one();
	}

	/**
	 * @param appDad
	 * @return Returns a List<User> otherwise returns null if no record is found
	 */
	public static List<User> getUsersByApplication(String appDad) {
		return new Application().getAllUsers(appDad);
	}

	/**
	 * @param appDad
	 * @param ids
	 * @return Returns a List<User> that match the array of ids, otherwise returns
	 *         null if no record is found
	 */
	public static List<User> getUsersByApplicationAndIds(String appDad, Integer[] ids) {
		return new Application().getUsersByIds(appDad, ids);
	}

	public static Integer getProfileIdByCode(String codeProfile) {
		ProfileType idProfile = null;
		if (codeProfile != null) {
			idProfile = new ProfileType().find().where("code", "=", codeProfile).one();
		}
		return idProfile != null ? idProfile.getId() : null;
	}

	public static List<Profile> getUsersByProfileId(Integer idProfile) {
		List<Profile> users = null;
		if (idProfile != null) {
			users = new Profile().find().where("type_fk", "=", idProfile).andWhere("type", "=", "PROF").all();
		}
		return users != null && !users.isEmpty() ? users : null;
	}

	/**
	 * @param url
	 * @param tipo
	 * @param tipoId
	 * @param dad
	 * @param params
	 * @return
	 */
	public static String getValidAutentikaUrlForSso(String url, String tipo, String tipoId, String dad,
			Map<String, String> params) {
		if (url == null || url.isEmpty())
			return null;
		String orgCode = Core.getCurrentOrganizationCode();
		String profCode = Core.getCurrentProfileCode();
		String stateValue = Core.buildStateValueForSsoAutentika(tipo, tipoId, dad, orgCode, profCode, params);
		url = url.replace("state=igrp", "state=" + stateValue);
		return url;
	}

	/**
	 * @param url
	 *            Usually url = this.configApp.getAutentikaUrlForSso() where this =
	 *            Controller
	 * @param tipo
	 * @param tipoId
	 * @param dad
	 * @param orgCode
	 * @param profCode
	 * @param params
	 * @return
	 */
	public static String getValidAutentikaUrlForSso(String url, String tipo, String tipoId, String dad, String orgCode,
			String profCode, Map<String, String> params) {
		if (url == null || url.isEmpty())
			return null;
		String stateValue = Core.buildStateValueForSsoAutentika(tipo, tipoId, dad, orgCode, profCode, params);
		url = url.replace("state=igrp", "state=" + stateValue);
		return url;
	}

	public static String getLastSessionId(String userName) {
		String sessionId = null;
		String host = Igrp.getInstance().getRequest().getRemoteHost();
		String ip = Igrp.getInstance().getRequest().getRemoteAddr();
		nosi.webapps.igrp.dao.Session s = new nosi.webapps.igrp.dao.Session().find().andWhere("host", "=", host)
				.andWhere("hostName", "=", host).andWhere("ipAddress", "=", ip).andWhere("userName", "=", userName)
				.orderByDesc("id").one();
		if (s != null)
			sessionId = s.getSessionId();
		return sessionId;
	}
	
	/**
	 * Link to a Certificate file
	 * 
	 * 
	 * @param uuid
	 *            Unique signature id
	 * @return link
	 */
	public static String getLinkCertificateByUuid(String uuid) {
		if (Core.isNullOrZero(uuid))
			return "";
		else
			return Route.getResolveUrl("igrp", "DigitalSignature", "downloadCertificate&uuid=" + uuid);

	}

	/**
	 * Link to a Signed data file
	 * 
	 * 
	 * @param uuid
	 *            Unique signature id
	 * @return link
	 */
	public static String getLinkSignedDataByUuid(String uuid) {
		if (Core.isNullOrZero(uuid))
			return "";
		else
			return Route.getResolveUrl("igrp", "DigitalSignature", "downloadData&uuid=" + uuid);

	}
}
