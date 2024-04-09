package nosi.core.db.migration.api;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.MigrationInfo;
import org.flywaydb.core.api.configuration.FluentConfiguration;
import org.flywaydb.core.api.output.MigrateResult;
/**
 * Iekiny Marcel
 * Jul 7, 2021
 */
public class IgrpMigrationAPI {
	
	private static final Logger LOGGER = LogManager.getLogger(IgrpMigrationAPI.class);
	
	private Flyway migrationEngine; 
	
	private final String dsn;
	private final String username;
	private final String password;
	private boolean baselineOnMigrate; 
	private String[] locations;
	
	public static final String DEFAULT_LOCATION_BASE_PATH = "classpath:nosi/core/db/migration/igrp"; 
	
	public IgrpMigrationAPI(String dsn, String username, String password) {
		super();
		this.dsn = dsn; 
		this.username = username;
		this.password = password; 
		baselineOnMigrate = true;
	}
	
	public IgrpMigrationAPI(String dsn, String username, String password, boolean baselineOnMigrate) {
		this(dsn, username, password);
		this.baselineOnMigrate = baselineOnMigrate;
	}
	
	public IgrpMigrationAPI(String dsn, String username, String password, boolean baselineOnMigrate, String []locations) {
		this(dsn, username, password, baselineOnMigrate);
		this.locations = locations; 
	}
	
	public IgrpMigrationAPI configureNLoad() {
		FluentConfiguration fluentConfiguration = Flyway.configure().dataSource(dsn, username, password).baselineOnMigrate(baselineOnMigrate);
		if(locations != null && locations.length > 0)
			fluentConfiguration.locations(locations); 
		else 
			fluentConfiguration.locations(defaultLocation()); 
		migrationEngine = fluentConfiguration.load();
		return this;
	}
	
	public MigrateResult migrate() {
		if(migrationEngine == null) throw new IllegalStateException();
		MigrateResult migrateResult = null;
		MigrationInfo []info = migrationEngine.info().pending(); 
	    try {
	    	if(info != null && info.length > 0)
		    	migrateResult = migrationEngine.migrate(); 
		} catch (org.flywaydb.core.internal.command.DbMigrate.FlywayMigrateException e) { // if schema already exist does not execute <baseline> command 
			LOGGER.error(e.getMessage(), e);
		}
	    return migrateResult;
	}
	
	public Flyway unwrapMigrationEngine() {
		return this.migrationEngine; 
	}
	
	private String defaultLocation() {
		StringBuilder location = new StringBuilder(DEFAULT_LOCATION_BASE_PATH);
		String folder = getDbEngineNameFromDsn(dsn);
		if(folder != null) {
			location.append("/");
			location.append(folder);
		}
		return location.toString();
	}
	
	public static String getDbEngineNameFromDsn(String dsn) {
		String dbEngineName = null;
		if(dsn != null) {
			if(dsn.startsWith("jdbc:h2"))
				dbEngineName = "h2";
			else if(dsn.startsWith("jdbc:postgresql"))
				dbEngineName = "postgres";
			else if(dsn.startsWith("jdbc:mariadb") || dsn.startsWith("jdbc:mysql"))
				dbEngineName = "mysql";
			else if(dsn.startsWith("jdbc:oracle"))
				dbEngineName = "oracle";
		}
		return dbEngineName;
	}
}
