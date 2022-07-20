package nosi.core.db.migration.api;

/**
 * @author: Emanuel Pereira
 * 30 Jun 2017
 */

import java.util.Map;
import nosi.base.ActiveRecord.HibernateUtils;

import org.hibernate.cfg.AvailableSettings;

public class MigrationIGRPInitConfig {
	
	 private MigrationIGRPInitConfig() {
		    throw new IllegalStateException("Utility class");
	 }
	public static void start() {
		Map<String, Object> configs = HibernateUtils.REGISTRY_BUILDER_IGRP.getAggregatedCfgXml().getConfigurationValues();
		new IgrpMigrationAPI((String) configs.get(AvailableSettings.URL), (String) configs.get(AvailableSettings.USER), (String) configs.get(AvailableSettings.PASS))
			.configureNLoad()
			.migrate();
	}
}
