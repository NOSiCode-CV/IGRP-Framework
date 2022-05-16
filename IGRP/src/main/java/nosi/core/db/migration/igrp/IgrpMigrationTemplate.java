package nosi.core.db.migration.igrp;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.cxf.jaxrs.ext.multipart.Attachment;
import org.apache.cxf.jaxrs.ext.multipart.ContentDisposition;
import org.apache.cxf.jaxrs.ext.multipart.MultipartBody;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.flywaydb.core.api.migration.BaseJavaMigration;
import org.flywaydb.core.api.migration.Context;

import nosi.core.db.migration.api.IgrpMigrationAPI;
import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.Domain;
import nosi.webapps.igrp.dao.Modulo;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateSource;
import nosi.webapps.igrp.dao.RepTemplateSourceParam;
import nosi.webapps.igrp.dao.TipoDocumento;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;
import nosi.webapps.igrp.dao.Transaction;

/**
 * Iekiny Marcel
 * Jun 20, 2021
 */
public abstract class IgrpMigrationTemplate extends BaseJavaMigration{
	
	private static final Logger LOGGER = LogManager.getLogger(IgrpMigrationTemplate.class); 
	
	protected Application app; 
	protected List<Action> actions = new ArrayList<>();
	protected List<Transaction> transactions = new ArrayList<>();
	protected List<Domain> domains = new ArrayList<>(); 
	protected List<Config_env> configs = new ArrayList<>(); 
	protected List<RepTemplate> reports = new ArrayList<>(); 
	protected List<RepSource> repDataSources = new ArrayList<>(); 
	protected List<Modulo> modules = new ArrayList<>(); 
	protected List<TipoDocumentoEtapa> tipoDocumentoEtapas = new ArrayList<>(); 
	protected List<TipoDocumento> tipoDocumentos = new ArrayList<>(); 
	protected List<String> bpmns = new ArrayList<>();
	
	private static final String REPORT_BPMN_FILE_PATH_NAME = "nosi/core/db/migration/igrp";
	private final String ACTIVITI_ENDPOINT_NAME = "url_ativiti_connection";
	private final String ACTIVITI_USERNAME_PARAM_NAME = "ativiti_user";
	private final String ACTIVITI_PASSWORD_PARAM_NAME = "ativiti_password";
	
	private boolean isAppExists = true;
	protected String dbEngineName;
	
	protected abstract void app();
	protected abstract void pages();
	protected abstract void domains();
	protected abstract void dbConnections();
	protected abstract void reports();
	protected abstract void bpmns();
	protected abstract void documentTypes();
	protected abstract void transactions();
	
	public IgrpMigrationTemplate() {
		super();
		app();
		pages();
		domains();
		dbConnections();
		reports();
		bpmns();
		documentTypes();
		transactions();
	}
	
	@Override
	public void migrate(Context context) throws Exception {
		this.setDbEngineName(context);
		this.migrateApp(context);
		this.createDefaultAccessRights(context);
		this.migrateModules(context);
		this.migratePages(context);
		this.migrateTransactions(context);
		this.migrateDomains(context);
		this.migrateDataSources(context);
		this.migrateReports(context);
		this.migrateBPMN(context);
	}
	
	// app externo ??
	private void migrateApp(Context context) throws SQLException {
		PreparedStatement psQuery = null;
		PreparedStatement psInsertOrUpdate = null;
		try {
			psQuery = context.getConnection().prepareStatement("select * from tbl_env where dad = ?"); 
			psQuery.setString(1, this.app.getDad());
			ResultSet rs = psQuery.executeQuery(); 
			if(rs.next()) {
				this.app.setId(rs.getInt("id"));
				rs.close();
				psInsertOrUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_env SET description=?, externo=?, img_src=?, name=?, status=?, template=? WHERE dad = ?"); 
				psInsertOrUpdate.setString(1,this.app.getDescription());
				psInsertOrUpdate.setInt(2, 0);
				psInsertOrUpdate.setString(3, this.app.getImg_src());
				psInsertOrUpdate.setString(4, this.app.getName());
				psInsertOrUpdate.setInt(5, this.app.getStatus());
				psInsertOrUpdate.setString(6, this.app.getTemplate());
				psInsertOrUpdate.setString(7, this.app.getDad());
				psInsertOrUpdate.executeUpdate(); 
			}else {
				isAppExists = false;
				psInsertOrUpdate = context.getConnection().prepareStatement("INSERT INTO public.tbl_env(description, externo, img_src, name, status, template, dad) VALUES (?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS); 
				psInsertOrUpdate.setString(1,this.app.getDescription());
				psInsertOrUpdate.setInt(2, 0);
				psInsertOrUpdate.setString(3, this.app.getImg_src());
				psInsertOrUpdate.setString(4, this.app.getName());
				psInsertOrUpdate.setInt(5, this.app.getStatus());
				psInsertOrUpdate.setString(6, this.app.getTemplate());
				psInsertOrUpdate.setString(7, this.app.getDad());
				psInsertOrUpdate.executeUpdate(); 
				ResultSet resultSetPk = psInsertOrUpdate.getGeneratedKeys(); 
				while(resultSetPk.next()) 
					this.app.setId(resultSetPk.getInt(1));
				resultSetPk.close();
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
				if(psInsertOrUpdate != null)
					psInsertOrUpdate.close();
			} catch (SQLException e) {
				LOGGER.error(e.getMessage(), e);
			}
		}
	}
	
	private void migrateModules(Context context) throws SQLException {
		for(Modulo module : this.modules) {
			PreparedStatement psQuery = null;
			PreparedStatement psInsertOrUpdate = null;
			try {
					psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_modulo WHERE name=? and env_fk=?"); 
					psQuery.setString(1, module.getName());
					psQuery.setObject(2, app.getId());
					ResultSet rs = psQuery.executeQuery(); 
					if(rs.next()) {
						rs.close();
						psInsertOrUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_modulo SET descricao=? WHERE name=? and env_fk=?"); 
						psInsertOrUpdate.setString(1, module.getDescricao() != null && !module.getDescricao().equals("null") ?  module.getDescricao() : null);
						psInsertOrUpdate.setString(2, module.getName());
						psInsertOrUpdate.setObject(3, this.app.getId());
						psInsertOrUpdate.executeUpdate();
					}else {
						psInsertOrUpdate = context.getConnection().prepareStatement("INSERT INTO public.tbl_modulo(descricao, name, env_fk) VALUES (?, ?, ?)"); 
						psInsertOrUpdate.setString(1, module.getDescricao() != null && !module.getDescricao().equals("null") ?  module.getDescricao() : null);
						psInsertOrUpdate.setString(2, module.getName());
						psInsertOrUpdate.setObject(3, this.app.getId());
						psInsertOrUpdate.executeUpdate();
					}
			}finally {
				try {
					if(psQuery != null)
						psQuery.close();
					if(psInsertOrUpdate != null)
						psInsertOrUpdate.close();
				} catch (SQLException e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}
	}
	
	private void migratePages(Context context) throws SQLException {
		for(Action action : this.actions) {
			PreparedStatement psQuery = null;
			PreparedStatement psInsertOrUpdate = null;
			try {
				psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_action WHERE env_fk = ? and page = ?"); 
				psQuery.setInt(1, this.app.getId());
				psQuery.setString(2, action.getPage());
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					rs.close();
					psInsertOrUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_action SET action=?, action_descr=?, iscomponent=?, nomemodulo=?, package_name=?, page_descr=?, processkey=?, status=?, tipo=?, versao=?, xsl_src=? WHERE env_fk = ? and page = ?"); 
					psInsertOrUpdate.setString(1, action.getAction());
					psInsertOrUpdate.setString(2, action.getAction_descr());
					psInsertOrUpdate.setInt(3, action.getIsComponent());
					psInsertOrUpdate.setString(4, action.getNomeModulo());
					psInsertOrUpdate.setString(5, action.getPackage_name());
					psInsertOrUpdate.setString(6, action.getPage_descr());
					psInsertOrUpdate.setString(7, action.getProcessKey());
					psInsertOrUpdate.setInt(8, action.getStatus());
					psInsertOrUpdate.setInt(9, action.getTipo());
					psInsertOrUpdate.setString(10, action.getVersion());
					psInsertOrUpdate.setString(11, action.getXsl_src());
					psInsertOrUpdate.setInt(12, this.app.getId());
					psInsertOrUpdate.setString(13, action.getPage());
					psInsertOrUpdate.executeUpdate();
				}else {
					psInsertOrUpdate = context.getConnection().prepareStatement("INSERT INTO public.tbl_action(action, action_descr, iscomponent, nomemodulo, package_name, page, page_descr, processkey, status, tipo, versao, xsl_src, env_fk) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) "); 
					psInsertOrUpdate.setString(1, action.getAction());
					psInsertOrUpdate.setString(2, action.getAction_descr());
					psInsertOrUpdate.setInt(3, action.getIsComponent());
					psInsertOrUpdate.setString(4, action.getNomeModulo());
					psInsertOrUpdate.setString(5, action.getPackage_name());
					psInsertOrUpdate.setString(6, action.getPage());
					psInsertOrUpdate.setString(7, action.getPage_descr());
					psInsertOrUpdate.setString(8, action.getProcessKey());
					psInsertOrUpdate.setInt(9, action.getStatus());
					psInsertOrUpdate.setInt(10, action.getTipo());
					psInsertOrUpdate.setString(11, action.getVersion());
					psInsertOrUpdate.setString(12, action.getXsl_src());
					psInsertOrUpdate.setInt(13, this.app.getId());
					psInsertOrUpdate.executeUpdate();
				}
			}finally {
				try {
					if(psQuery != null)
						psQuery.close();
					if(psInsertOrUpdate != null)
						psInsertOrUpdate.close();
				} catch (SQLException e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}
	}
	
	private void migrateTransactions(Context context) throws SQLException {
		for(Transaction transaction : this.transactions) {
			PreparedStatement psQuery = null;
			PreparedStatement psInsertOrUpdate = null;
			try {
				psQuery = context.getConnection().prepareStatement("select * from tbl_transaction where code = ?"); 
				psQuery.setString(1, transaction.getCode());
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					rs.close();
					psInsertOrUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_transaction SET descr=?, external=?, status=?, env_fk=? WHERE code=?"); 
					psInsertOrUpdate.setString(1, transaction.getDescr());
					psInsertOrUpdate.setObject(2, transaction.getExternal());
					psInsertOrUpdate.setInt(3, transaction.getStatus());
					psInsertOrUpdate.setObject(4, this.app.getId());
					psInsertOrUpdate.setString(5, transaction.getCode());
					psInsertOrUpdate.executeUpdate();
				}else {
					psInsertOrUpdate = context.getConnection().prepareStatement("INSERT INTO public.tbl_transaction(descr, external, status, env_fk, code) VALUES (?, ?, ?, ?, ?)"); 
					psInsertOrUpdate.setString(1, transaction.getDescr());
					psInsertOrUpdate.setObject(2, transaction.getExternal());
					psInsertOrUpdate.setInt(3, transaction.getStatus());
					psInsertOrUpdate.setObject(4, this.app.getId());
					psInsertOrUpdate.setString(5, transaction.getCode());
					psInsertOrUpdate.executeUpdate();
				}
			}finally {
				try {
					if(psQuery != null)
						psQuery.close();
					if(psInsertOrUpdate != null)
						psInsertOrUpdate.close();
				} catch (SQLException e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}
	}
	
	private void migrateDomains(Context context) throws SQLException {
		for(Domain domain : this.domains) {
			PreparedStatement psQuery = null;
			PreparedStatement psInsertOrUpdate = null;
			try {
				psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_domain WHERE env_fk=? and dominio=?"); 
				psQuery.setInt(1, this.app.getId());
				psQuery.setString(2, domain.getDominio());
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					rs.close();
					psInsertOrUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_domain SET description=?, domain_type=?, ordem=?, status=?, valor=? WHERE env_fk=? and dominio=?"); 
					psInsertOrUpdate.setString(1, domain.getDescription());
					psInsertOrUpdate.setString(2, domain.getDomainType().name());
					psInsertOrUpdate.setInt(3, domain.getordem());
					psInsertOrUpdate.setString(4, domain.getStatus());
					psInsertOrUpdate.setString(5, domain.getValor());
					psInsertOrUpdate.setInt(6, this.app.getId());
					psInsertOrUpdate.setString(7, domain.getDominio());
					psInsertOrUpdate.executeUpdate(); 
				}else {
					psInsertOrUpdate = context.getConnection().prepareStatement("INSERT INTO public.tbl_domain(description, domain_type, ordem, status, valor, env_fk, dominio) VALUES (?, ?, ?, ?, ?, ?, ?)"); 
					psInsertOrUpdate.setString(1, domain.getDescription());
					psInsertOrUpdate.setString(2, domain.getDomainType().name());
					psInsertOrUpdate.setInt(3, domain.getordem());
					psInsertOrUpdate.setString(4, domain.getStatus());
					psInsertOrUpdate.setString(5, domain.getValor());
					psInsertOrUpdate.setInt(6, this.app.getId());
					psInsertOrUpdate.setString(7, domain.getDominio());
					psInsertOrUpdate.executeUpdate(); 
				}
			}finally {
				try {
					if(psQuery != null)
						psQuery.close();
					if(psInsertOrUpdate != null)
						psInsertOrUpdate.close();
				} catch (SQLException e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}
	}
	
	private void migrateDataSources(Context context) throws SQLException {
		for(Config_env config : this.configs) {
			PreparedStatement psQuery = null;
			PreparedStatement psInsertOrUpdate = null;
			try {
				psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_config_env WHERE name = ?"); 
				psQuery.setString(1, config.getName());
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					rs.close();
					psInsertOrUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_config_env SET charset=?, connection_identify=?, driver_connection=?, isdefault=?, password=?, type_db=?, url_connection=?, username=?, env_fk=? WHERE name = ?"); 
					psInsertOrUpdate.setString(1, config.getCharset());
					psInsertOrUpdate.setString(2, config.getConnection_identify());
					psInsertOrUpdate.setString(3, config.getDriver_connection());
					psInsertOrUpdate.setInt(4, config.getIsDefault());
					psInsertOrUpdate.setString(5, config.getPassword());
					psInsertOrUpdate.setString(6, config.getType_db());
					psInsertOrUpdate.setString(7, config.getUrl_connection());
					psInsertOrUpdate.setString(8, config.getUsername());
					psInsertOrUpdate.setObject(9, this.app.getId());
					psInsertOrUpdate.setString(10, config.getName());
					psInsertOrUpdate.executeUpdate();
				}else {
					psInsertOrUpdate = context.getConnection().prepareStatement("INSERT INTO public.tbl_config_env(charset, connection_identify, driver_connection, isdefault, password, type_db, url_connection, username, env_fk, name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"); 
					psInsertOrUpdate.setString(1, config.getCharset());
					psInsertOrUpdate.setString(2, config.getConnection_identify());
					psInsertOrUpdate.setString(3, config.getDriver_connection());
					psInsertOrUpdate.setInt(4, config.getIsDefault());
					psInsertOrUpdate.setString(5, config.getPassword());
					psInsertOrUpdate.setString(6, config.getType_db());
					psInsertOrUpdate.setString(7, config.getUrl_connection());
					psInsertOrUpdate.setString(8, config.getUsername());
					psInsertOrUpdate.setObject(9, this.app.getId());
					psInsertOrUpdate.setString(10, config.getName());
					psInsertOrUpdate.executeUpdate();
				}
			}finally {
				try {
					if(psQuery != null)
						psQuery.close();
					if(psInsertOrUpdate != null)
						psInsertOrUpdate.close();
				} catch (SQLException e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}
	} 
	
	private void migrateReports(Context context) throws SQLException {
		for(RepTemplate report : this.reports) {
			PreparedStatement psQuery = null;
			PreparedStatement psInsertOrUpdate = null;
			try {
					int userCreatedId = loadUserIdByUid(context, report.getUser_created().getUser_name());
					int userUpdatedId = loadUserIdByUid(context, report.getUser_updated().getUser_name()); 
					if(report.getXml_content().getName() == null || report.getXml_content().getName().equals("null")) 
						report.getXml_content().setName(report.getCode() + ".json");
					if(report.getXsl_content().getName() == null || report.getXsl_content().getName().equals("null"))
						report.getXsl_content().setName(report.getCode() + ".xsl");
					psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_rep_template WHERE env_fk=? and code=?"); 
					psQuery.setInt(1, this.app.getId());
					psQuery.setString(2, report.getCode());
					ResultSet rs = psQuery.executeQuery(); 
					if(rs.next()) {
						rs.close();
						psInsertOrUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_rep_template SET dt_updated=?, name=?, report_identify=?, status=?, user_updated_fk=?, xml_content_fk=?, xsl_content_fk=? WHERE code=? and env_fk=?"); 
						psInsertOrUpdate.setDate(1, Core.getCurrentDateSql()); 
						psInsertOrUpdate.setString(2, report.getName());
						psInsertOrUpdate.setString(3, report.getReport_identify() != null && !report.getReport_identify().equals("null") ? report.getReport_identify() : null);
						psInsertOrUpdate.setInt(4, report.getStatus());
						psInsertOrUpdate.setInt(5, userUpdatedId);
						psInsertOrUpdate.setInt(6, migrateReportClobsNReturnId(context, report.getXml_content(), userCreatedId));
						psInsertOrUpdate.setInt(7,  migrateReportClobsNReturnId(context, report.getXsl_content(), userCreatedId));
						psInsertOrUpdate.setString(8, report.getCode() != null && !report.getCode().equals("null") ? report.getCode() : null);
						psInsertOrUpdate.setInt(9, app.getId());
						psInsertOrUpdate.executeUpdate(); 
					}else {
						psInsertOrUpdate = context.getConnection().prepareStatement("INSERT INTO public.tbl_rep_template(dt_created, dt_updated, name, report_identify, status, user_created_fk, user_updated_fk, xml_content_fk, xsl_content_fk, code, env_fk) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS); 
						psInsertOrUpdate.setDate(1, Core.getCurrentDateSql()); 
						psInsertOrUpdate.setDate(2, Core.getCurrentDateSql()); 
						psInsertOrUpdate.setString(3, report.getName());
						psInsertOrUpdate.setString(4, report.getReport_identify() != null && !report.getReport_identify().equals("null") ? report.getReport_identify() : null);
						psInsertOrUpdate.setInt(5, report.getStatus());
						psInsertOrUpdate.setInt(6, userCreatedId);
						psInsertOrUpdate.setInt(7, userUpdatedId);
						psInsertOrUpdate.setInt(8, migrateReportClobsNReturnId(context, report.getXml_content(), userCreatedId));
						psInsertOrUpdate.setInt(9,  migrateReportClobsNReturnId(context, report.getXsl_content(), userCreatedId));
						psInsertOrUpdate.setString(10, report.getCode() != null && !report.getCode().equals("null") ? report.getCode() : null);
						psInsertOrUpdate.setInt(11, app.getId());
						psInsertOrUpdate.executeUpdate(); 
					}
					this.migrateReportDataSources(context, this.repDataSources);
					this.migrateReportTemplateDataSources(context, report.getReptemplatesources());
			}finally {
				try {
					if(psQuery != null)
						psQuery.close();
					if(psInsertOrUpdate != null)
						psInsertOrUpdate.close();
				} catch (SQLException e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}
	}
	
	private void migrateReportDataSources(Context context, List<RepSource> reportSources) throws SQLException {
		for(RepSource reportSource : reportSources) {
			PreparedStatement psQuery = null;
			PreparedStatement psInsertOrUpdate = null;
			try {
				psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_rep_source WHERE source_identify = ?"); 
				psQuery.setString(1, reportSource.getSource_identify());
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					rs.close();
					psInsertOrUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_rep_source SET dt_updated=?, formkey=?, name=?, processid=?, status=?, taskid=?, type=?, type_fk=?, type_name=?, type_query=?, env_fk=?, env_source_fk=?, config_env_fk=?, user_created_fk=?, user_updated_fk=? WHERE source_identify = ?"); 
					psInsertOrUpdate.setDate(1, Core.getCurrentDateSql()); 
					psInsertOrUpdate.setString(2, reportSource.getFormkey() != null && !reportSource.getFormkey().equals("null") ? reportSource.getFormkey() : null);
					psInsertOrUpdate.setString(3, reportSource.getName() != null && !reportSource.getName().equals("null") ? reportSource.getName() : null);
					psInsertOrUpdate.setString(4, reportSource.getProcessid() != null && !reportSource.getProcessid().equals("null") ? reportSource.getProcessid() : null);
					psInsertOrUpdate.setInt(5, reportSource.getStatus());
					psInsertOrUpdate.setString(6, reportSource.getTaskid() != null && !reportSource.getTaskid().equals("null") ? reportSource.getTaskid() : null);
					psInsertOrUpdate.setString(7, reportSource.getType() != null && !reportSource.getType().equals("null") ? reportSource.getType() : null);
					psInsertOrUpdate.setObject(8, reportSource.getType_fk());
					psInsertOrUpdate.setString(9, reportSource.getType_name() != null && !reportSource.getType_name().equals("null") ? reportSource.getType_name() : null);
					psInsertOrUpdate.setString(10, reportSource.getType_query() != null && !reportSource.getType_query().equals("null") ? reportSource.getType_query() : null);
					psInsertOrUpdate.setObject(11, app.getId());
					psInsertOrUpdate.setObject(12, app.getId());// env_source_fk 
					psInsertOrUpdate.setObject(13, loadIdByConnectionNameIdentify(context, reportSource.getConfig_env().getConnection_identify()));
					psInsertOrUpdate.setInt(14, this.loadUserIdByUid(context, reportSource.getUser_created().getUser_name()));
					psInsertOrUpdate.setInt(15, this.loadUserIdByUid(context, reportSource.getUser_updated().getUser_name()));
					psInsertOrUpdate.setString(16, reportSource.getSource_identify());
					psInsertOrUpdate.executeUpdate(); 
				}else {
					psInsertOrUpdate = context.getConnection().prepareStatement("INSERT INTO public.tbl_rep_source(dt_created, dt_updated, formkey, name, processid, status, taskid, type, type_fk, type_name, type_query, env_fk, env_source_fk, config_env_fk, user_created_fk, user_updated_fk, source_identify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS); 
					psInsertOrUpdate.setDate(1, Core.getCurrentDateSql()); 
					psInsertOrUpdate.setDate(2, Core.getCurrentDateSql()); 
					psInsertOrUpdate.setString(3, reportSource.getFormkey() != null && !reportSource.getFormkey().equals("null") ? reportSource.getFormkey() : null);
					psInsertOrUpdate.setString(4, reportSource.getName() != null && !reportSource.getName().equals("null") ? reportSource.getName() : null);
					psInsertOrUpdate.setString(5, reportSource.getProcessid() != null && !reportSource.getProcessid().equals("null") ? reportSource.getProcessid() : null);
					psInsertOrUpdate.setInt(6, reportSource.getStatus());
					psInsertOrUpdate.setString(7, reportSource.getTaskid() != null && !reportSource.getTaskid().equals("null") ? reportSource.getTaskid() : null);
					psInsertOrUpdate.setString(8, reportSource.getType() != null && !reportSource.getType().equals("null") ? reportSource.getType() : null);
					psInsertOrUpdate.setObject(9, reportSource.getType_fk());
					psInsertOrUpdate.setString(10, reportSource.getType_name() != null && !reportSource.getType_name().equals("null") ? reportSource.getType_name() : null);
					psInsertOrUpdate.setString(11, reportSource.getType_query() != null && !reportSource.getType_query().equals("null") ? reportSource.getType_query() : null);
					psInsertOrUpdate.setObject(12, app.getId());
					psInsertOrUpdate.setObject(13, app.getId());// env_source_fk 
					psInsertOrUpdate.setObject(14, loadIdByConnectionNameIdentify(context, reportSource.getConfig_env().getConnection_identify()));
					psInsertOrUpdate.setInt(15, this.loadUserIdByUid(context, reportSource.getUser_created().getUser_name()));
					psInsertOrUpdate.setInt(16, this.loadUserIdByUid(context, reportSource.getUser_updated().getUser_name()));
					psInsertOrUpdate.setString(17, reportSource.getSource_identify() != null && !reportSource.getSource_identify().equals(null) ? reportSource.getSource_identify() : null);
					psInsertOrUpdate.executeUpdate(); 
				}
			}finally {
				try {
					if(psQuery != null)
						psQuery.close();
					if(psInsertOrUpdate != null)
						psInsertOrUpdate.close();
				} catch (SQLException e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}
	}
	
	private void migrateReportTemplateDataSources(Context context, Set<RepTemplateSource> repTemplateSources) throws SQLException {
		for(RepTemplateSource repTemplateSource : repTemplateSources) {
			PreparedStatement psQuery = null;
			PreparedStatement psInsert = null;
			try {
					int repTemplateFk = this.loadReportTemplateIdByIdentifier(context, repTemplateSource.getRepTemplate().getReport_identify());
					int repSourceFk = this.loadReportDataSourceIdByIdentifier(context, repTemplateSource.getRepSource().getSource_identify()); 
					psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_rep_template_source WHERE rep_source_fk = ? and rep_template_fk = ?"); 
					psQuery.setInt(1, repSourceFk);
					psQuery.setInt(2, repTemplateFk);
					ResultSet rs = psQuery.executeQuery(); 
					if(!rs.next()) {
						rs.close();
						psInsert = context.getConnection().prepareStatement("INSERT INTO public.tbl_rep_template_source(rep_source_fk, rep_template_fk) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS); 
						psInsert.setInt(1, repSourceFk);
						psInsert.setInt(2, repTemplateFk);
						psInsert.executeUpdate(); 
						ResultSet resultSetPk = psInsert.getGeneratedKeys(); 
						int generatedId = 0; 
						while(resultSetPk.next()) generatedId = resultSetPk.getInt(1);
						resultSetPk.close();
						migrateReportDataSourcesParameters(context, generatedId, repTemplateSource.getParameters());
					}
			}finally {
				try {
					if(psQuery != null)
						psQuery.close();
					if(psInsert != null)
						psInsert.close();
				} catch (SQLException e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}
	}
	
	private void migrateReportDataSourcesParameters(Context context, int repTemplateSourceId, List<RepTemplateSourceParam> parameters) throws SQLException {
		for(RepTemplateSourceParam parameter : parameters) {
			PreparedStatement psQuery = null;
			PreparedStatement psInsertOrUpdate = null;
			try {
					psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_rep_template_source_param WHERE parameter = ? and rep_template_source_fk = ?"); 
					psQuery.setString(1, parameter.getParameter());
					psQuery.setInt(2, repTemplateSourceId);
					ResultSet rs = psQuery.executeQuery(); 
					if(rs.next()) {
						int id = rs.getInt("id"); 
						rs.close();
						psInsertOrUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_rep_template_source_param SET parameter_type=? WHERE id = ?"); 
						psInsertOrUpdate.setString(1, parameter.getParameter_type()); 
						psInsertOrUpdate.setInt(2, id); 
						psInsertOrUpdate.executeUpdate(); 
					}else {
						psInsertOrUpdate = context.getConnection().prepareStatement("INSERT INTO public.tbl_rep_template_source_param(parameter, parameter_type, rep_template_source_fk) VALUES (?, ?, ?)"); 
						psInsertOrUpdate.setString(1, parameter.getParameter());
						psInsertOrUpdate.setString(2, parameter.getParameter_type());
						psInsertOrUpdate.setInt(3, repTemplateSourceId);
						psInsertOrUpdate.executeUpdate(); 
					}
			}finally {
				try {
					if(psQuery != null)
						psQuery.close();
					if(psInsertOrUpdate != null)
						psInsertOrUpdate.close();
				} catch (SQLException e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}
	}
	
	private int migrateReportClobsNReturnId(Context context, CLob lob, int userCreatedId) throws SQLException {
		PreparedStatement psQuery = null;
		PreparedStatement psInsertOrUpdate = null;
		int id = 0;
		try {
			psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_clob WHERE uuid = ? and estado = ?"); 
			psQuery.setString(1, lob.getUuid());
			psQuery.setString(2, "A");
			ResultSet rs = psQuery.executeQuery(); 
			if(rs.next()) {
				id = rs.getInt("id"); 
				rs.close();
				psInsertOrUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_clob SET c_lob_content=?, dt_updated=?, mime_type=?, name=?, updatedatetime=? WHERE uuid=?"); 
				psInsertOrUpdate.setBinaryStream(1, loadReportOrBpmnFile(app.getDad(), lob.getName())); 
				psInsertOrUpdate.setDate(2, Core.getCurrentDateSql());
				psInsertOrUpdate.setString(3, lob.getMime_type() != null && !lob.getMime_type().equals("null") ? lob.getMime_type() : null);
				psInsertOrUpdate.setString(4, lob.getName() != null && !lob.getName().equals("null") ? lob.getName() : null);
				psInsertOrUpdate.setTimestamp(5, new Timestamp(Core.getCurrentDateUtil().getTime()));
				psInsertOrUpdate.setString(6, lob.getUuid());
				psInsertOrUpdate.executeUpdate(); 
			}else {
				psInsertOrUpdate = context.getConnection().prepareStatement("INSERT INTO public.tbl_clob(c_lob_content, createdatetime, dt_created, dt_updated, estado, mime_type, name, updatedatetime, uuid, env_fk, user_created_fk) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS); 
				psInsertOrUpdate.setBinaryStream(1, loadReportOrBpmnFile(app.getDad(), lob.getName())); 
				psInsertOrUpdate.setTimestamp(2, new Timestamp(Core.getCurrentDateUtil().getTime()));
				psInsertOrUpdate.setDate(3, Core.getCurrentDateSql());
				psInsertOrUpdate.setDate(4, Core.getCurrentDateSql());
				psInsertOrUpdate.setString(5, "A");
				psInsertOrUpdate.setString(6, lob.getMime_type() != null && !lob.getMime_type().equals("null") ? lob.getMime_type() : null);
				psInsertOrUpdate.setString(7, lob.getName() != null && !lob.getName().equals("null") ? lob.getName() : null);
				psInsertOrUpdate.setTimestamp(8, new Timestamp(Core.getCurrentDateUtil().getTime()));
				psInsertOrUpdate.setString(9, lob.getUuid() != null && !lob.getUuid().equals("null") ? lob.getUuid() : null);
				psInsertOrUpdate.setInt(10, this.app.getId());
				psInsertOrUpdate.setInt(11, userCreatedId);
				psInsertOrUpdate.executeUpdate(); 
				ResultSet resultSetPk = psInsertOrUpdate.getGeneratedKeys(); 
				while(resultSetPk.next()) id = resultSetPk.getInt(1);
				resultSetPk.close();
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
				if(psInsertOrUpdate != null)
					psInsertOrUpdate.close();
			} catch (SQLException e) {
				LOGGER.error(e.getMessage(), e);
			}
		}
		return id;
	}
	
	private void migrateBPMN(Context context) throws SQLException, IOException{ 
		this.migrateTipoDocumentos(context);
		if(!this.bpmns.isEmpty()) { 
			Properties activitiSettings = loadActivitiSettings(context);
			String endpoint = activitiSettings.getProperty(ACTIVITI_ENDPOINT_NAME);
			String httpAuthorizationHeaderValue = "Basic " + Base64.getEncoder().encodeToString((activitiSettings.getProperty(ACTIVITI_USERNAME_PARAM_NAME) + ":" + activitiSettings.getProperty(ACTIVITI_PASSWORD_PARAM_NAME)).getBytes());  
			for(String bpmn : this.bpmns) {
				InputStream inputStream = loadReportOrBpmnFile(this.app.getDad(), bpmn);
				if(inputStream == null) throw new FileNotFoundException("The deployment file " + bpmn + "was not found."); 
				if(this.deployBPMNToEngine(endpoint, httpAuthorizationHeaderValue, bpmn, inputStream)) 
					this.migrateTipoDocumentoEtapas(context);
			}
		}
	}
	
	private void migrateTipoDocumentoEtapas(Context context) throws SQLException {
		for(TipoDocumentoEtapa documentoEtapa : this.tipoDocumentoEtapas) {
			PreparedStatement psQuery = null;
			PreparedStatement psInsertOrUpdate = null;
			try { 
					String sql = "SELECT * FROM public.tbl_tipo_documento_etapa WHERE processid = ? and taskid = ? and tipo = ? and tipo_documento_fk = ?"; 
					Integer idRepTemplate = null;
					Integer idTipoDocumento = null; 
					if(documentoEtapa.getRepTemplate() != null) {
						idRepTemplate = this.loadRepTemplateByCodeAndEnv(context, documentoEtapa.getRepTemplate().getCode(), this.app.getId());
						sql = "SELECT * FROM public.tbl_tipo_documento_etapa WHERE processid = ? and taskid = ? and tipo = ? and report_fk = ?";
					}else
						idTipoDocumento = this.loadTipoDocumentoIdByCodeAndEnv(context, documentoEtapa.getTipoDocumento().getCodigo(), this.app.getId());
					psQuery = context.getConnection().prepareStatement(sql); 
					psQuery.setString(1, documentoEtapa.getProcessId());
					psQuery.setString(2, documentoEtapa.getTaskId());
					psQuery.setString(3, documentoEtapa.getTipo());
					psQuery.setObject(4, idRepTemplate != null ? idRepTemplate : idTipoDocumento);
					ResultSet rs = psQuery.executeQuery(); 
					if(rs.next()) {
						int idTipoDocumentoEtapa = rs.getInt("id");
						rs.close();
						psInsertOrUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_tipo_documento_etapa SET processid=?, required=?, status=?, taskid=?, tipo_documento_fk=?, tipo=?, report_fk=? WHERE id = ?"); 
						psInsertOrUpdate.setString(1, documentoEtapa.getProcessId());
						psInsertOrUpdate.setInt(2, documentoEtapa.getRequired());
						psInsertOrUpdate.setInt(3, documentoEtapa.getStatus());
						psInsertOrUpdate.setString(4, documentoEtapa.getTaskId());
						psInsertOrUpdate.setObject(5, idTipoDocumento != null ? idTipoDocumento : null);
						psInsertOrUpdate.setString(6, documentoEtapa.getTipo());
						psInsertOrUpdate.setObject(7, idRepTemplate != null ?  idRepTemplate : null);
						psInsertOrUpdate.setInt(8, idTipoDocumentoEtapa);
						psInsertOrUpdate.executeUpdate();
					}else {
						psInsertOrUpdate = context.getConnection().prepareStatement("INSERT INTO public.tbl_tipo_documento_etapa(processid, required, status, taskid, tipo_documento_fk, tipo, report_fk) VALUES (?, ?, ?, ?, ?, ?, ?)"); 
						psInsertOrUpdate.setString(1, documentoEtapa.getProcessId());
						psInsertOrUpdate.setInt(2, documentoEtapa.getRequired());
						psInsertOrUpdate.setInt(3, documentoEtapa.getStatus());
						psInsertOrUpdate.setString(4, documentoEtapa.getTaskId());
						psInsertOrUpdate.setObject(5, idTipoDocumento != null ? idTipoDocumento : null);
						psInsertOrUpdate.setString(6, documentoEtapa.getTipo());
						psInsertOrUpdate.setObject(7, idRepTemplate != null ?  idRepTemplate : null);
						psInsertOrUpdate.executeUpdate();
					}
			}finally {
				try {
					if(psQuery != null)
						psQuery.close();
					if(psInsertOrUpdate != null)
						psInsertOrUpdate.close();
				} catch (SQLException e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}
	}
	
	private void migrateTipoDocumentos(Context context) throws SQLException {
		for(TipoDocumento documento : this.tipoDocumentos) {
			PreparedStatement psQuery = null;
			PreparedStatement psInsertOrUpdate = null;
			try {
				psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_tipo_documento WHERE codigo=? and env_fk=?"); 
				psQuery.setString(1, documento.getCodigo());
				psQuery.setObject(2, app.getId());
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					rs.close();
					psInsertOrUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_tipo_documento SET descricao=?, nome=?, status=? WHERE codigo=? and env_fk=?"); 
					psInsertOrUpdate.setString(1, documento.getDescricao() != null &&  !documento.getDescricao().equals("null") ? documento.getDescricao() : null);
					psInsertOrUpdate.setString(2, documento.getNome());
					psInsertOrUpdate.setInt(3, documento.getStatus());
					psInsertOrUpdate.setString(4, documento.getCodigo());
					psInsertOrUpdate.setObject(5, documento.getApplication().getId());
					psInsertOrUpdate.executeUpdate();
				}else {
					psInsertOrUpdate = context.getConnection().prepareStatement("INSERT INTO public.tbl_tipo_documento(descricao, nome, status, codigo, env_fk) VALUES (?, ?, ?, ?, ?)"); 
					psInsertOrUpdate.setString(1,  documento.getDescricao() != null &&  !documento.getDescricao().equals("null") ? documento.getDescricao() : null);
					psInsertOrUpdate.setString(2, documento.getNome());
					psInsertOrUpdate.setInt(3, documento.getStatus());
					psInsertOrUpdate.setString(4, documento.getCodigo());
					psInsertOrUpdate.setObject(5, documento.getApplication().getId());
					psInsertOrUpdate.executeUpdate();
				}
			}finally {
				try {
					if(psQuery != null)
						psQuery.close();
					if(psInsertOrUpdate != null)
						psInsertOrUpdate.close();
				} catch (SQLException e) {
					LOGGER.error(e.getMessage(), e);
				}
			}
		}
	}
	
	private boolean deployBPMNToEngine(String endpoint, String httpAuthorizationHeaderValue, String fileName, InputStream inputStream) {
		boolean success = false; 
		Client client = ClientBuilder.newClient();
		try {
			WebTarget webTarget = client.target(endpoint).path("repository/deployments").queryParam("tenantId", this.app.getDad()); 
			Invocation.Builder invocationBuilder  = webTarget.request(MediaType.APPLICATION_JSON).header(HttpHeaders.AUTHORIZATION, httpAuthorizationHeaderValue); 
			ContentDisposition contentDisposition = new ContentDisposition("form-data; name=\"file\";filename=\"" + fileName + "\"; Content-Type=\"" + MediaType.APPLICATION_OCTET_STREAM + "\"");
			List<Attachment> attachments = new LinkedList<Attachment>();
			attachments.add(new Attachment("file", inputStream, contentDisposition));
			MultipartBody body = new MultipartBody(attachments);
			Response response  = invocationBuilder.post(Entity.entity(body, MediaType.MULTIPART_FORM_DATA));
			success = response.getStatus() == 201;
		} finally {
			client.close();
		}
		return success;
	}
	
	private int loadUserIdByUid(Context context, String uid) throws SQLException {
		PreparedStatement psQuery = null;
		int userId = 2; // Default user 
		try {
			psQuery = context.getConnection().prepareStatement("SELECT id FROM public.tbl_user WHERE user_name = ?"); 
			psQuery.setString(1, uid);
			ResultSet rs = psQuery.executeQuery(); 
			if(rs.next()) {
				userId = rs.getInt("id"); 
				rs.close();
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
			} catch (SQLException e) {
				LOGGER.error(e.getMessage(), e);
			}
		}
		return userId;
	}
	
	private Integer loadIdByConnectionNameIdentify(Context context, String identifier) throws SQLException {
		PreparedStatement psQuery = null;
		Integer id = null;  
		try {
			psQuery = context.getConnection().prepareStatement("SELECT id FROM public.tbl_config_env WHERE connection_identify = ?"); 
			psQuery.setString(1, identifier);
			ResultSet rs = psQuery.executeQuery(); 
			if(rs.next()) {
				id = rs.getInt("id"); 
				rs.close();
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
			} catch (SQLException e) {
				LOGGER.error(e.getMessage(), e);
			}
		}
		return id;
	}
	
	private int loadReportTemplateIdByIdentifier(Context context, String identifier) throws SQLException {
		PreparedStatement psQuery = null;
		int id = 0;
		try {
			psQuery = context.getConnection().prepareStatement("SELECT id FROM public.tbl_rep_template WHERE report_identify = ?"); 
			psQuery.setString(1, identifier);
			ResultSet rs = psQuery.executeQuery(); 
			if(rs.next()) {
				id = rs.getInt("id"); 
				rs.close();
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
			} catch (SQLException e) {
				LOGGER.error(e.getMessage(), e);
			}
		} 
		return id;
	}
	
	private int loadReportDataSourceIdByIdentifier(Context context, String identifier) throws SQLException {
		PreparedStatement psQuery = null;
		int id = 0;
		try {
			psQuery = context.getConnection().prepareStatement("SELECT id FROM public.tbl_rep_source WHERE source_identify = ?"); 
			psQuery.setString(1, identifier);
			ResultSet rs = psQuery.executeQuery(); 
			if(rs.next()) {
				id = rs.getInt("id"); 
				rs.close();
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
			} catch (SQLException e) {
				LOGGER.error(e.getMessage(), e);
			}
		} 
		return id;
	}
	
	private Integer loadTipoDocumentoIdByCodeAndEnv(Context context, String code, Integer envId) throws SQLException {
		PreparedStatement psQuery = null;
		Integer id = null;
		try {
			psQuery = context.getConnection().prepareStatement("SELECT id FROM public.tbl_tipo_documento WHERE codigo = ? and env_fk = ?"); 
			psQuery.setString(1, code);
			psQuery.setObject(2, envId);
			ResultSet rs = psQuery.executeQuery(); 
			if(rs.next()) {
				id = rs.getInt("id"); 
				rs.close();
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
			} catch (SQLException e) {
				LOGGER.error(e.getMessage(), e);
			}
		} 
		return id;
	}
	
	private Integer loadRepTemplateByCodeAndEnv(Context context, String code, Integer envId) throws SQLException {
		PreparedStatement psQuery = null;
		Integer id = null;
		try {
			psQuery = context.getConnection().prepareStatement("SELECT id FROM public.tbl_rep_template WHERE code = ? and env_fk = ?"); 
			psQuery.setString(1, code);
			psQuery.setObject(2, envId);
			ResultSet rs = psQuery.executeQuery(); 
			if(rs.next()) {
				id = rs.getInt("id"); 
				rs.close();
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
			} catch (SQLException e) {
				LOGGER.error(e.getMessage(), e);
			}
		} 
		return id;
	}
	
	private void setDbEngineName(Context context) {
		try {
			dbEngineName = IgrpMigrationAPI.getDbEngineNameFromDsn(context.getConnection().getMetaData().getURL());
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
		}
	}
	
	private InputStream loadReportOrBpmnFile(String appDad, String filename) { 
		return this.getClass().getClassLoader().getResourceAsStream(Paths.get(REPORT_BPMN_FILE_PATH_NAME, dbEngineName, appDad, filename).toString());
	}
	
	private Properties loadActivitiSettings(Context context) throws SQLException { 
		Properties settings = new Properties(); 
		PreparedStatement psQuery = null;
		try {
			psQuery = context.getConnection().prepareStatement("select (SELECT value FROM public.tbl_config WHERE name = ?) as url_ativiti_connection, (SELECT value FROM public.tbl_config WHERE name = ?) as ativiti_user, (SELECT value FROM public.tbl_config WHERE name = ?) as ativiti_password"); 
			psQuery.setString(1, ACTIVITI_ENDPOINT_NAME);
			psQuery.setString(2, ACTIVITI_USERNAME_PARAM_NAME);
			psQuery.setString(3, ACTIVITI_PASSWORD_PARAM_NAME);
			ResultSet rs = psQuery.executeQuery(); 
			if(rs.next()) {
				settings.setProperty(ACTIVITI_ENDPOINT_NAME, rs.getString(ACTIVITI_ENDPOINT_NAME)); 
				settings.setProperty(ACTIVITI_USERNAME_PARAM_NAME, rs.getString(ACTIVITI_USERNAME_PARAM_NAME)); 
				settings.setProperty(ACTIVITI_PASSWORD_PARAM_NAME, rs.getString(ACTIVITI_PASSWORD_PARAM_NAME)); 
				rs.close();
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
			} catch (SQLException e) {
				LOGGER.error(e.getMessage(), e);
			}
		} 
		return settings;
	}
	
	private int createDefaultOrganica(Context context) throws SQLException {
		int id = 0;
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = context.getConnection().prepareStatement("INSERT INTO public.tbl_organization(code, name, status, env_fk, user_created_fk) VALUES (?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS); 
			preparedStatement.setString(1, String.format("%s.%s", "org", this.app.getDad()));
			preparedStatement.setString(2, "IGRP");
			preparedStatement.setInt(3, 1);
			preparedStatement.setInt(4, this.app.getId());
			preparedStatement.setInt(5, 1);
			preparedStatement.executeUpdate();
			ResultSet resultSetPk = preparedStatement.getGeneratedKeys(); 
			while(resultSetPk.next()) 
				id = resultSetPk.getInt(1);
			resultSetPk.close();
		}finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} catch (SQLException e) {
				LOGGER.error(e.getMessage(), e);
			}
		}
		return id;
	}
	
	private int[] createDefaultProfileTypes(Context context, int organicaId) throws SQLException{
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = context.getConnection().prepareStatement("INSERT INTO public.tbl_profile_type(code, descr, status, env_fk, org_fk) VALUES (?, ?, ?, ?, ?);", Statement.RETURN_GENERATED_KEYS); 
			// First record 
			preparedStatement.setString(1, String.format("%s.%s", "admin", this.app.getDad()));
			preparedStatement.setString(2, "Admin");
			preparedStatement.setInt(3, 1);
			preparedStatement.setInt(4, this.app.getId());
			preparedStatement.setInt(5, organicaId);
			preparedStatement.addBatch();
			// Second record 
			preparedStatement.setString(1, String.format("%s.%s", "user", this.app.getDad()));
			preparedStatement.setString(2, "User");
			preparedStatement.setInt(3, 1);
			preparedStatement.setInt(4, this.app.getId());
			preparedStatement.setInt(5, organicaId);
			preparedStatement.addBatch();
			// Execute batch 
			preparedStatement.executeBatch();
			ResultSet resultSetPk = preparedStatement.getGeneratedKeys(); 
			if(resultSetPk.isBeforeFirst()) {
				int[] ids = new int[2];
				for(int i=0; i<ids.length; i++) {
					resultSetPk.next();
					ids[i] = resultSetPk.getInt(1);
				}
				resultSetPk.close();
				return ids;
			}
		}finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} catch (SQLException e) {
				LOGGER.error(e.getMessage(), e);
			}
		}
		return null;
	}
	
	private void createDefaultProfiles(Context context, int organicaId, int[] profileTypeIds) throws SQLException {
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = context.getConnection().prepareStatement("INSERT INTO public.tbl_profile(type, type_fk, org_fk, prof_type_fk, user_fk) VALUES (?, ?, ?, ?, ?)"); 
			// First record 
			preparedStatement.setString(1, "ENV");
			preparedStatement.setInt(2, this.app.getId());
			preparedStatement.setInt(3, organicaId);
			preparedStatement.setInt(4, profileTypeIds[0]);
			preparedStatement.setInt(5, 1);
			preparedStatement.addBatch();
			// Second record 
			preparedStatement.setString(1, "PROF");
			preparedStatement.setInt(2, profileTypeIds[0]);
			preparedStatement.setInt(3, organicaId);
			preparedStatement.setInt(4, profileTypeIds[0]);
			preparedStatement.setInt(5, 1);
			preparedStatement.addBatch();
			// Third record 
			preparedStatement.setString(1, "PROF");
			preparedStatement.setInt(2, profileTypeIds[1]);
			preparedStatement.setInt(3, organicaId);
			preparedStatement.setInt(4, profileTypeIds[1]);
			preparedStatement.setInt(5, 1);
			preparedStatement.addBatch();
			// Fourth record 
			preparedStatement.setString(1, "MEN");
			preparedStatement.setInt(2, 10);
			preparedStatement.setInt(3, organicaId);
			preparedStatement.setInt(4, 1);
			preparedStatement.setInt(5, 1);
			preparedStatement.addBatch();
			// Execute batch 
			preparedStatement.executeBatch();
		}finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} catch (SQLException e) {
				LOGGER.error(e.getMessage(), e);
			}
		}
	}
	
	private void createDefaultAccessRights(Context context) throws SQLException {
		if(!isAppExists) {
			int organicaId = createDefaultOrganica(context);
			createDefaultProfiles(context, organicaId, createDefaultProfileTypes(context, organicaId));
		}
	}
	
}
