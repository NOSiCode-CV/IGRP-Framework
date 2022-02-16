package nosi.core.db.migration.igrp;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.MigrationInfo;
import org.flywaydb.core.api.configuration.FluentConfiguration;
import org.flywaydb.core.api.output.MigrateResult;
/**
 * Iekiny Marcel
 * Jul 7, 2021
 */
public class IgrpMigrationAPI { 
	
	private Flyway migrationEngine; 
	
	private String dsn; 
	private String username; 
	private String password; 
	private boolean baselineOnMigrate; 
	private String []locations;
	
	public static final String DEFAULT_LOCATION = "classpath:nosi/core/db/migration/igrp"; 
	public static final String MIGRATION_FILE_PATTERN = "/*IGRP*.sql"; 
	
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
			fluentConfiguration.locations(DEFAULT_LOCATION + MIGRATION_FILE_PATTERN); 
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
			e.printStackTrace();
		}
	    return migrateResult;
	}
	
	public Flyway unwrapMigrationEngine() {
		return this.migrationEngine; 
	}
}
