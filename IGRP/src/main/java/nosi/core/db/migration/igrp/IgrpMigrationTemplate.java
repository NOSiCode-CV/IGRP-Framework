package nosi.core.db.migration.igrp;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.flywaydb.core.api.migration.BaseJavaMigration;
import org.flywaydb.core.api.migration.Context;

import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.Config_env;
import nosi.webapps.igrp.dao.Domain;
import nosi.webapps.igrp.dao.RepSource;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.RepTemplateSource;
import nosi.webapps.igrp.dao.RepTemplateSourceParam;
import nosi.webapps.igrp.dao.Transaction;

/**
 * Iekiny Marcel
 * Jun 20, 2021
 */
public abstract class IgrpMigrationTemplate extends BaseJavaMigration{

	protected Application app; 
	protected List<Action> actions = new ArrayList<>();
	protected List<Transaction> transactions = new ArrayList<>();
	protected List<Domain> domains = new ArrayList<>(); 
	protected List<Config_env> configs = new ArrayList<>(); 
	protected List<RepTemplate> reports = new ArrayList<>(); 
	protected List<RepSource> repDataSources = new ArrayList<>(); 
	
	private final String REPORT_FILE_PATH_NAME = "src" + File.separator + "main" + File.separator + "resources" + File.separator + "nosi" + File.separator + "core" + File.separator + "db" + File.separator + "migration" + File.separator + "igrp"; 
	
	@Override
	public void migrate(Context context) throws Exception {
		this.migrateApp(context);
		this.migratePages(context);
		this.migrateTransactions(context);
		this.migrateDomains(context);
		this.migrateDataSources(context);
		this.migrateReports(context);
	}
	
	private void migrateApp(Context context) throws SQLException {
		PreparedStatement psQuery = null;
		PreparedStatement psUpdate = null;
		PreparedStatement psInsert = null;
		try {
			psQuery = context.getConnection().prepareStatement("select * from tbl_env where dad = ?"); 
			psQuery.setString(1, this.app.getDad());
			ResultSet rs = psQuery.executeQuery(); 
			if(rs.next()) {
				this.app.setId(rs.getInt("id"));
				rs.close();
				psUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_env SET description=?, externo=?, img_src=?, name=?, status=?, template=? WHERE dad = ?"); 
				psUpdate.setString(1,this.app.getDescription());
				psUpdate.setInt(2, 0);
				psUpdate.setString(3, this.app.getImg_src());
				psUpdate.setString(4, this.app.getName());
				psUpdate.setInt(5, this.app.getStatus());
				psUpdate.setString(6, this.app.getTemplate());
				psUpdate.setString(7, this.app.getDad());
				psUpdate.executeUpdate(); 
			}else {
				psInsert = context.getConnection().prepareStatement("INSERT INTO public.tbl_env(description, externo, img_src, name, status, template, dad) VALUES (?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS); 
				psInsert.setString(1,this.app.getDescription());
				psInsert.setInt(2, 0);
				psInsert.setString(3, this.app.getImg_src());
				psInsert.setString(4, this.app.getName());
				psInsert.setInt(5, this.app.getStatus());
				psInsert.setString(6, this.app.getTemplate());
				psInsert.setString(7, this.app.getDad());
				psInsert.executeUpdate(); 
				ResultSet resultSetPk = psInsert.getGeneratedKeys(); 
				while(resultSetPk.next()) 
					this.app.setId(resultSetPk.getInt(1));
				resultSetPk.close();
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
				if(psUpdate != null)
					psUpdate.close();
				if(psInsert != null)
					psInsert.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void migratePages(Context context) throws SQLException {
		PreparedStatement psQuery = null;
		PreparedStatement psUpdate = null;
		PreparedStatement psInsert = null;
		try {
			for(Action action : this.actions) {
				psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_action WHERE env_fk = ? and page = ?"); 
				psQuery.setInt(1, this.app.getId());
				psQuery.setString(2, action.getPage());
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					rs.close();
					psUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_action SET action=?, action_descr=?, iscomponent=?, nomemodulo=?, package_name=?, page_descr=?, processkey=?, status=?, tipo=?, versao=?, xsl_src=? WHERE env_fk = ? and page = ?"); 
					psUpdate.setString(1, action.getAction());
					psUpdate.setString(2, action.getAction_descr());
					psUpdate.setInt(3, action.getIsComponent());
					psUpdate.setString(4, action.getNomeModulo());
					psUpdate.setString(5, action.getPackage_name());
					psUpdate.setString(6, action.getPage_descr());
					psUpdate.setString(7, action.getProcessKey());
					psUpdate.setInt(8, action.getStatus());
					psUpdate.setInt(9, action.getTipo());
					psUpdate.setString(10, action.getVersion());
					psUpdate.setString(11, action.getXsl_src());
					psUpdate.setInt(12, this.app.getId());
					psUpdate.setString(13, action.getPage());
					psUpdate.executeUpdate();
				}else {
					psInsert = context.getConnection().prepareStatement("INSERT INTO public.tbl_action(action, action_descr, iscomponent, nomemodulo, package_name, page, page_descr, processkey, status, tipo, versao, xsl_src, env_fk) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) "); 
					psInsert.setString(1, action.getAction());
					psInsert.setString(2, action.getAction_descr());
					psInsert.setInt(3, action.getIsComponent());
					psInsert.setString(4, action.getNomeModulo());
					psInsert.setString(5, action.getPackage_name());
					psInsert.setString(6, action.getPage());
					psInsert.setString(7, action.getPage_descr());
					psInsert.setString(8, action.getProcessKey());
					psInsert.setInt(9, action.getStatus());
					psInsert.setInt(10, action.getTipo());
					psInsert.setString(11, action.getVersion());
					psInsert.setString(12, action.getXsl_src());
					psInsert.setInt(13, this.app.getId());
					psInsert.executeUpdate();
				}
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
				if(psUpdate != null)
					psUpdate.close();
				if(psInsert != null)
					psInsert.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void migrateTransactions(Context context) throws SQLException {
		PreparedStatement psQuery = null;
		PreparedStatement psUpdate = null;
		PreparedStatement psInsert = null;
		try {
			for(Transaction transaction : this.transactions) {
				psQuery = context.getConnection().prepareStatement("select * from tbl_transaction where code = ?"); 
				psQuery.setString(1, transaction.getCode());
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					rs.close();
					psUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_transaction SET descr=?, external=?, status=?, env_fk=? WHERE code=?"); 
					psUpdate.setString(1, transaction.getDescr());
					psUpdate.setObject(2, transaction.getExternal());
					psUpdate.setInt(3, transaction.getStatus());
					psUpdate.setObject(4, this.app.getId());
					psUpdate.setString(5, transaction.getCode());
					psUpdate.executeUpdate();
				}else {
					psInsert = context.getConnection().prepareStatement("INSERT INTO public.tbl_transaction(descr, external, status, env_fk, code) VALUES (?, ?, ?, ?, ?)"); 
					psInsert.setString(1, transaction.getDescr());
					psInsert.setObject(2, transaction.getExternal());
					psInsert.setInt(3, transaction.getStatus());
					psInsert.setObject(4, this.app.getId());
					psInsert.setString(5, transaction.getCode());
					psInsert.executeUpdate();
				}
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
				if(psUpdate != null)
					psUpdate.close();
				if(psInsert != null)
					psInsert.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void migrateDomains(Context context) throws SQLException {
		PreparedStatement psQuery = null;
		PreparedStatement psUpdate = null;
		PreparedStatement psInsert = null;
		try {
			for(Domain domain : this.domains) {
				psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_domain WHERE env_fk=? and dominio=?"); 
				psQuery.setInt(1, this.app.getId());
				psQuery.setString(2, domain.getDominio());
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					rs.close();
					psUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_domain SET description=?, domain_type=?, ordem=?, status=?, valor=? WHERE env_fk=? and dominio=?"); 
					psUpdate.setString(1, domain.getDescription());
					psUpdate.setString(2, domain.getDomainType().name());
					psUpdate.setInt(3, domain.getordem());
					psUpdate.setString(4, domain.getStatus());
					psUpdate.setString(5, domain.getValor());
					psUpdate.setInt(6, this.app.getId());
					psUpdate.setString(7, domain.getDominio());
					psUpdate.executeUpdate(); 
				}else {
					psInsert = context.getConnection().prepareStatement("INSERT INTO public.tbl_domain(description, domain_type, ordem, status, valor, env_fk, dominio) VALUES (?, ?, ?, ?, ?, ?, ?)"); 
					psInsert.setString(1, domain.getDescription());
					psInsert.setString(2, domain.getDomainType().name());
					psInsert.setInt(3, domain.getordem());
					psInsert.setString(4, domain.getStatus());
					psInsert.setString(5, domain.getValor());
					psInsert.setInt(6, this.app.getId());
					psInsert.setString(7, domain.getDominio());
					psInsert.executeUpdate(); 
				}
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
				if(psUpdate != null)
					psUpdate.close();
				if(psInsert != null)
					psInsert.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void migrateDataSources(Context context) throws SQLException {
		PreparedStatement psQuery = null;
		PreparedStatement psUpdate = null;
		PreparedStatement psInsert = null;
		try {
			for(Config_env config : this.configs) {
				psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_config_env WHERE name = ?"); 
				psQuery.setString(1, config.getName());
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					rs.close();
					psUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_config_env SET charset=?, connection_identify=?, driver_connection=?, isdefault=?, password=?, type_db=?, url_connection=?, username=?, env_fk=? WHERE name = ?"); 
					psUpdate.setString(1, config.getCharset());
					psUpdate.setString(2, config.getConnection_identify());
					psUpdate.setString(3, config.getDriver_connection());
					psUpdate.setInt(4, config.getIsDefault());
					psUpdate.setString(5, config.getPassword());
					psUpdate.setString(6, config.getType_db());
					psUpdate.setString(7, config.getUrl_connection());
					psUpdate.setString(8, config.getUsername());
					psUpdate.setObject(9, this.app.getId());
					psUpdate.setString(10, config.getName());
					psUpdate.executeUpdate();
				}else {
					psInsert = context.getConnection().prepareStatement("INSERT INTO public.tbl_config_env(charset, connection_identify, driver_connection, isdefault, password, type_db, url_connection, username, env_fk, name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"); 
					psInsert.setString(1, config.getCharset());
					psInsert.setString(2, config.getConnection_identify());
					psInsert.setString(3, config.getDriver_connection());
					psInsert.setInt(4, config.getIsDefault());
					psInsert.setString(5, config.getPassword());
					psInsert.setString(6, config.getType_db());
					psInsert.setString(7, config.getUrl_connection());
					psInsert.setString(8, config.getUsername());
					psInsert.setObject(9, this.app.getId());
					psInsert.setString(10, config.getName());
					psInsert.executeUpdate();
				}
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
				if(psUpdate != null)
					psUpdate.close();
				if(psInsert != null)
					psInsert.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} 
	
	private void migrateReports(Context context) throws SQLException {
		PreparedStatement psQuery = null;
		PreparedStatement psUpdate = null;
		PreparedStatement psInsert = null;
		try {
			for(RepTemplate report : this.reports) {
				
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
					psUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_rep_template SET dt_updated=?, name=?, report_identify=?, status=?, user_updated_fk=?, xml_content_fk=?, xsl_content_fk=? WHERE code=? and env_fk=?"); 
					psUpdate.setDate(1, Core.getCurrentDateSql()); 
					psUpdate.setString(2, report.getName());
					psUpdate.setString(3, report.getReport_identify() != null && !report.getReport_identify().equals("null") ? report.getReport_identify() : null);
					psUpdate.setInt(4, report.getStatus());
					psUpdate.setInt(5, userUpdatedId);
					psUpdate.setInt(6, migrateReportClobsNReturnId(context, report.getXml_content(), userCreatedId));
					psUpdate.setInt(7,  migrateReportClobsNReturnId(context, report.getXsl_content(), userCreatedId));
					psUpdate.setString(8, report.getCode() != null && !report.getCode().equals("null") ? report.getCode() : null);
					psUpdate.setInt(9, app.getId());
					psUpdate.executeUpdate(); 
				}else {
					psInsert = context.getConnection().prepareStatement("INSERT INTO public.tbl_rep_template(dt_created, dt_updated, name, report_identify, status, user_created_fk, user_updated_fk, xml_content_fk, xsl_content_fk, code, env_fk) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS); 
					psInsert.setDate(1, Core.getCurrentDateSql()); 
					psInsert.setDate(2, Core.getCurrentDateSql()); 
					psInsert.setString(3, report.getName());
					psInsert.setString(4, report.getReport_identify() != null && !report.getReport_identify().equals("null") ? report.getReport_identify() : null);
					psInsert.setInt(5, report.getStatus());
					psInsert.setInt(6, userCreatedId);
					psInsert.setInt(7, userUpdatedId);
					psInsert.setInt(8, migrateReportClobsNReturnId(context, report.getXml_content(), userCreatedId));
					psInsert.setInt(9,  migrateReportClobsNReturnId(context, report.getXsl_content(), userCreatedId));
					psInsert.setString(10, report.getCode() != null && !report.getCode().equals("null") ? report.getCode() : null);
					psInsert.setInt(11, app.getId());
					psInsert.executeUpdate(); 
				}
				this.migrateReportDataSources(context, this.repDataSources);
				this.migrateReportTemplateDataSources(context, report.getReptemplatesources());
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
				if(psUpdate != null)
					psUpdate.close();
				if(psInsert != null)
					psInsert.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void migrateReportDataSources(Context context, List<RepSource> reportSources) throws SQLException {
		PreparedStatement psQuery = null;
		PreparedStatement psUpdate = null;
		PreparedStatement psInsert = null;
		try {
			for(RepSource reportSource : reportSources) {
				psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_rep_source WHERE source_identify = ?"); 
				psQuery.setString(1, reportSource.getSource_identify());
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					rs.close();
					psUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_rep_source SET dt_updated=?, formkey=?, name=?, processid=?, status=?, taskid=?, type=?, type_fk=?, type_name=?, type_query=?, env_fk=?, env_source_fk=?, config_env_fk=?, user_created_fk=?, user_updated_fk=? WHERE source_identify = ?"); 
					psUpdate.setDate(1, Core.getCurrentDateSql()); 
					psUpdate.setString(2, reportSource.getFormkey() != null && !reportSource.getFormkey().equals("null") ? reportSource.getFormkey() : null);
					psUpdate.setString(3, reportSource.getName() != null && !reportSource.getName().equals("null") ? reportSource.getName() : null);
					psUpdate.setString(4, reportSource.getProcessid() != null && !reportSource.getProcessid().equals("null") ? reportSource.getProcessid() : null);
					psUpdate.setInt(5, reportSource.getStatus());
					psUpdate.setString(6, reportSource.getTaskid() != null && !reportSource.getTaskid().equals("null") ? reportSource.getTaskid() : null);
					psUpdate.setString(7, reportSource.getType() != null && !reportSource.getType().equals("null") ? reportSource.getType() : null);
					psUpdate.setObject(8, reportSource.getType_fk());
					psUpdate.setString(9, reportSource.getType_name() != null && !reportSource.getType_name().equals("null") ? reportSource.getType_name() : null);
					psUpdate.setString(10, reportSource.getType_query() != null && !reportSource.getType_query().equals("null") ? reportSource.getType_query() : null);
					psUpdate.setObject(11, app.getId());
					psUpdate.setObject(12, app.getId());// env_source_fk 
					psUpdate.setObject(13, loadIdByConnectionNameIdentify(context, reportSource.getConfig_env().getConnection_identify()));
					psUpdate.setInt(14, this.loadUserIdByUid(context, reportSource.getUser_created().getUser_name()));
					psUpdate.setInt(15, this.loadUserIdByUid(context, reportSource.getUser_updated().getUser_name()));
					psUpdate.setString(16, reportSource.getSource_identify());
					psUpdate.executeUpdate(); 
				}else {
					psInsert = context.getConnection().prepareStatement("INSERT INTO public.tbl_rep_source(dt_created, dt_updated, formkey, name, processid, status, taskid, type, type_fk, type_name, type_query, env_fk, env_source_fk, config_env_fk, user_created_fk, user_updated_fk, source_identify) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS); 
					psInsert.setDate(1, Core.getCurrentDateSql()); 
					psInsert.setDate(2, Core.getCurrentDateSql()); 
					psInsert.setString(3, reportSource.getFormkey() != null && !reportSource.getFormkey().equals("null") ? reportSource.getFormkey() : null);
					psInsert.setString(4, reportSource.getName() != null && !reportSource.getName().equals("null") ? reportSource.getName() : null);
					psInsert.setString(5, reportSource.getProcessid() != null && !reportSource.getProcessid().equals("null") ? reportSource.getProcessid() : null);
					psInsert.setInt(6, reportSource.getStatus());
					psInsert.setString(7, reportSource.getTaskid() != null && !reportSource.getTaskid().equals("null") ? reportSource.getTaskid() : null);
					psInsert.setString(8, reportSource.getType() != null && !reportSource.getType().equals("null") ? reportSource.getType() : null);
					psInsert.setObject(9, reportSource.getType_fk());
					psInsert.setString(10, reportSource.getType_name() != null && !reportSource.getType_name().equals("null") ? reportSource.getType_name() : null);
					psInsert.setString(11, reportSource.getType_query() != null && !reportSource.getType_query().equals("null") ? reportSource.getType_query() : null);
					psInsert.setObject(12, app.getId());
					psInsert.setObject(13, app.getId());// env_source_fk 
					psInsert.setObject(14, loadIdByConnectionNameIdentify(context, reportSource.getConfig_env().getConnection_identify()));
					psInsert.setInt(15, this.loadUserIdByUid(context, reportSource.getUser_created().getUser_name()));
					psInsert.setInt(16, this.loadUserIdByUid(context, reportSource.getUser_updated().getUser_name()));
					psInsert.setString(17, reportSource.getSource_identify() != null && !reportSource.getSource_identify().equals(null) ? reportSource.getSource_identify() : null);
					psInsert.executeUpdate(); 
				}
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
				if(psUpdate != null)
					psUpdate.close();
				if(psInsert != null)
					psInsert.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void migrateReportTemplateDataSources(Context context, Set<RepTemplateSource> repTemplateSources) throws SQLException {
		PreparedStatement psQuery = null;
		PreparedStatement psInsert = null;
		try {
			for(RepTemplateSource repTemplateSource : repTemplateSources) {
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
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
				if(psInsert != null)
					psInsert.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void migrateReportDataSourcesParameters(Context context, int repTemplateSourceId, List<RepTemplateSourceParam> parameters) throws SQLException {
		PreparedStatement psQuery = null;
		PreparedStatement psUpdate = null;
		PreparedStatement psInsert = null;
		try {
			for(RepTemplateSourceParam parameter : parameters) {
				psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_rep_template_source_param WHERE parameter = ? and rep_template_source_fk = ?"); 
				psQuery.setString(1, parameter.getParameter());
				psQuery.setInt(2, repTemplateSourceId);
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					int id = rs.getInt("id"); 
					rs.close();
					psUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_rep_template_source_param SET parameter_type=? WHERE id = ?"); 
					psUpdate.setString(1, parameter.getParameter_type()); 
					psUpdate.setInt(2, id); 
					psUpdate.executeUpdate(); 
				}else {
					psInsert = context.getConnection().prepareStatement("INSERT INTO public.tbl_rep_template_source_param(parameter, parameter_type, rep_template_source_fk) VALUES (?, ?, ?)"); 
					psInsert.setString(1, parameter.getParameter());
					psInsert.setString(2, parameter.getParameter_type());
					psInsert.setInt(3, repTemplateSourceId);
					psInsert.executeUpdate(); 
				}
			}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
				if(psUpdate != null)
					psUpdate.close();
				if(psInsert != null)
					psInsert.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
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
				e.printStackTrace();
			}
		}
		return userId;
	}
	
	private Integer loadIdByConnectionNameIdentify(Context context, String identifier) throws SQLException {
		PreparedStatement psQuery = null;
		Integer id = null;  
		try {
			psQuery = context.getConnection().prepareStatement("SELECT id FROM public.tbl_config_env WHERE name = ?"); 
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
				e.printStackTrace();
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
				e.printStackTrace();
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
				e.printStackTrace();
			}
		} 
		return id;
	}
	
	private int migrateReportClobsNReturnId(Context context, CLob lob, int userCreatedId) throws SQLException {
		PreparedStatement psQuery = null;
		PreparedStatement psUpdate = null;
		PreparedStatement psInsert = null;
		int id = 0;
		try {
				psQuery = context.getConnection().prepareStatement("SELECT * FROM public.tbl_clob WHERE uuid = ? and estado = ?"); 
				psQuery.setString(1, lob.getUuid());
				psQuery.setString(2, "A");
				ResultSet rs = psQuery.executeQuery(); 
				if(rs.next()) {
					id = rs.getInt("id"); 
					rs.close();
					psUpdate = context.getConnection().prepareStatement("UPDATE public.tbl_clob SET c_lob_content=?, dt_updated=?, mime_type=?, name=?, updatedatetime=? WHERE uuid=?"); 
					psUpdate.setBinaryStream(1, loadReportFile(app.getDad(), lob.getName())); 
					psUpdate.setDate(2, Core.getCurrentDateSql());
					psUpdate.setString(3, lob.getMime_type() != null && !lob.getMime_type().equals("null") ? lob.getMime_type() : null);
					psUpdate.setString(4, lob.getName() != null && !lob.getName().equals("null") ? lob.getName() : null);
					psUpdate.setTimestamp(5, new Timestamp(Core.getCurrentDateUtil().getTime()));
					psQuery.setString(6, lob.getUuid());
					psUpdate.executeUpdate(); 
				}else {
					psInsert = context.getConnection().prepareStatement("INSERT INTO public.tbl_clob(c_lob_content, createdatetime, dt_created, dt_updated, estado, mime_type, name, updatedatetime, uuid, env_fk, user_created_fk) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS); 
					psInsert.setBinaryStream(1, loadReportFile(app.getDad(), lob.getName())); 
					psInsert.setTimestamp(2, new Timestamp(Core.getCurrentDateUtil().getTime()));
					psInsert.setDate(3, Core.getCurrentDateSql());
					psInsert.setDate(4, Core.getCurrentDateSql());
					psInsert.setString(5, "A");
					psInsert.setString(6, lob.getMime_type() != null && !lob.getMime_type().equals("null") ? lob.getMime_type() : null);
					psInsert.setString(7, lob.getName() != null && !lob.getName().equals("null") ? lob.getName() : null);
					psInsert.setTimestamp(8, new Timestamp(Core.getCurrentDateUtil().getTime()));
					psInsert.setString(9, lob.getUuid() != null && !lob.getUuid().equals("null") ? lob.getUuid() : null);
					psInsert.setInt(10, this.app.getId());
					psInsert.setInt(11, userCreatedId);
					psInsert.executeUpdate(); 
					ResultSet resultSetPk = psInsert.getGeneratedKeys(); 
					while(resultSetPk.next()) id = resultSetPk.getInt(1);
					resultSetPk.close();
				}
		}finally {
			try {
				if(psQuery != null)
					psQuery.close();
				if(psUpdate != null)
					psUpdate.close();
				if(psInsert != null)
					psInsert.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return id;
	}
	
	private InputStream loadReportFile(String appDad, String filename) { 
		InputStream inStream = null;
		try {
			Path path = Paths.get(this.REPORT_FILE_PATH_NAME + File.separator  + appDad, filename);
			if(Files.exists(path)) 
				inStream = Files.newInputStream(path);
		} catch (Exception e) {}
		return inStream;
	}
}
